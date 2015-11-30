<?php namespace App\Services\Admin\Upload;

use App\Services\BaseProcess;

/**
 * 上传处理
 *
 * @author jiang <mylampblog@163.com>
 */
class Process extends BaseProcess
{
    /**
     * 用于上传的加密密钥
     * 
     * @var string
     */
    private $uploadToken = 'jiang';

    /**
     * 文件上传表单的名字
     * 
     * @var string
     */
    private $fileFormName = 'file';

    /**
     * 上传的文件对象
     * 
     * @var object
     */
    private $file;

    /**
     * 上传需要的参数
     * 
     * @var array
     */
    private $params;

    /**
     * 所要保存的文件名
     * 
     * @var string
     */
    private $saveFileName;

    /**
     * 配置文件中所定的文件保存的路径
     * 
     * @var string
     */
    private $configSavePath;

    /**
     * 设置上传需要的参数
     */
    public function setParam($params)
    {
        $this->params = $params;
        return $this;
    }

    /**
     * 文件上传的对象
     */
    public function setFile($file)
    {
        $this->file = $file;
        return $this;
    }

    /**
     * 生成上传附件验证，防止表单修改
     */
    public function uploadKey()
    {
        $uploadToken = md5($this->uploadToken.$_SERVER['HTTP_USER_AGENT']);
        $authkey = md5(serialize($this->params).$uploadToken);
        return $authkey;
    }

    /**
     * 检测token是否匹配
     * 
     * @return boolean
     */
    public function checkUploadToken($uploadToken)
    {
        if($this->uploadKey() != $uploadToken) return false;
        return true;
    }

    /**
     * 开始处理上传
     *
     * @return false|array
     */
    public function upload()
    {
        if ( ! $this->file->isValid() or $this->file->getError() != UPLOAD_ERR_OK) return false;

        $saveFileName = $this->getSaveFileName().'.'.$this->file->getClientOriginalExtension();
        $savePath = $this->setSavePath();
        $this->file->move($savePath, $saveFileName);
        $realFile = $savePath . $saveFileName;

        if( ! file_exists($realFile)) return false;

        $this->doWaterImage($realFile);

        $realFileUrl[] = substr(str_replace($this->getConfigSavePath(), '', $realFile), 1);

        $thumbRealFileUrl = $this->doCutImage($realFile, $savePath);

        return array_merge(
            $realFileUrl,
            $thumbRealFileUrl
        );
    }

    /**
     * 加水印
     *
     * @param string $realFile 文件
     */
    private function doWaterImage($realFile)
    {
        //是否加上水印
        if(isset($this->params['waterSetting']) and $this->params['waterSetting'] === true) {
            $waterImage = $this->params['waterImage'];
            if( ! isset($this->params['waterImage']) or empty($this->params['waterImage'])) {
                $waterImage = $this->getWaterFile();
            }
            $this->waterImage($realFile, $waterImage);
        }
    }

    /**
     * 裁剪
     *
     * @param string $realFile 文件
     * @param string $savePath 保存的路径
     */
    private function doCutImage($realFile, $savePath)
    {
        $thumbRealFileUrl = [];
        if(isset($this->params['thumbSetting']) and ! empty($this->params['thumbSetting'])) {
            $thumbRealFileUrl = $this->cutImage($realFile, $savePath);
        }
        return $thumbRealFileUrl;
    }

    /**
     * 开始处理裁剪
     *
     * @param  string $realFile 所要处理的图片的位置
     * @param  string $savePath 所要保存的位置
     * @return string           处理后的图片
     */
    private function cutImage($realFile, $savePath)
    {
        if( ! isImage( strtolower($this->file->getClientOriginalExtension()) ) ) {
            return [];
        }

        $imagine = new \Imagine\Gd\Imagine();
        $mode = \Imagine\Image\ImageInterface::THUMBNAIL_INSET;
        $result = [];

        foreach($this->params['thumbSetting'] as $key => $value) {
            if(isset($value['width'], $value['height']) and is_numeric($value['width']) and is_numeric($value['height'])) {
                $size = new \Imagine\Image\Box($value['width'], $value['height']);
                $saveName = $this->getCutImageSaveName($savePath, $value['width'], $value['height']);
                $imagine->open($realFile)->thumbnail($size, $mode)->save($saveName);
                $result[] = substr(str_replace($this->getConfigSavePath(), '', $saveName), 1);
            }
        }
        
        return $result;
    }

    /**
     * 加上水印
     * 
     * @param  string $realFile 所要处理的图片的位置
     * @param string $waterImage 所要加上的水印图
     * @return void
     */
    private function waterImage($realFile, $waterImage)
    {
        $imagine = new \Imagine\Gd\Imagine();
        $watermark = $imagine->open($waterImage);
        $image = $imagine->open($realFile);

        $size = $image->getSize();
        $wSize = $watermark->getSize();

        $bottomRight = new \Imagine\Image\Point(
            $size->getWidth() - $wSize->getWidth(),
            $size->getHeight() - $wSize->getHeight()
        );

        $image->paste($watermark, $bottomRight);
        $image->save($realFile);
    }

    /**
     * 生成缩略图的保存文件名
     *
     * @param string $savePath 保存的路径
     * @param int $width 宽
     * @param int $height 高
     * @return string
     */
    private function getCutImageSaveName($savePath, $width, $height)
    {
        return $savePath.$this->getSaveFileName().'_'.$width.'_'.$height.'_thumb.'.$this->file->getClientOriginalExtension();
    }

    /**
     * 设置保存的路径
     *
     * @access private
     */
    private function setSavePath()
    {
        $savePath = base64url_decode($this->params['uploadPath']) . date('Ymd') . '/' ;
        if( ! is_dir($savePath)) {
            dir_create($savePath);
        }
        return $savePath;
    }

    /**
     * 所要保存的文件名
     * 
     * @return string
     */
    private function getSaveFileName()
    {
        if( ! $this->saveFileName) {
            $this->saveFileName = md5(uniqid('pre', TRUE).mt_rand(1000000,9999999));
        }
        return $this->saveFileName;
    }

    /**
     * 配置文件中的图片所保存的路径
     * 
     * @return string
     */
    private function getConfigSavePath()
    {
        if( ! $this->configSavePath) {
            $this->configSavePath = \Config::get('sys.sys_upload_path');
        }
        return $this->configSavePath;
    }

    /**
     * 取得要加水印的图片
     */
    private function getWaterFile()
    {
        return \Config::get('sys.sys_water_file');
    }

}