<?php

namespace App\Http\Controllers\Admin\Foundation;

use Request, Config, Lang;
use App\Services\Admin\Upload\Process as UploadManager;
use App\Http\Controllers\Admin\Controller;
use App\Models\Admin\Attachment;

/**
 * 弹出窗口上传
 *
 * @author jiang <mylampblog@163.com>
 */
class UploadController extends Controller
{
    /**
     * 上传弹出窗口
     *
     * @access public
     */
    public function index()
    {
        $param = Request::only('args', 'authkey');
        $args = @ unserialize(base64url_decode($param['args']));
        $uploadObject = new UploadManager();

        if( ! $uploadObject->setParam($args)->checkUploadToken($param['authkey'])) {
            return abort(500);
        }

        return view('admin.upload.index',
            compact('param', 'args')
        );
    }

    /**
     * 处理上传
     *
     * @access public
     */
    public function process()
    {
        $param = Request::only('authkey', 'args');
        $config = @ unserialize(base64url_decode($param['args']));

        $uploadObject = new UploadManager();
        if( ! $uploadObject->setParam($config)->checkUploadToken($param['authkey'])) {
            return abort(500);
        }

        $file = Request::file('file');
        $returnFileUrl = $uploadObject->setFile($file)->upload();

        if( ! $returnFileUrl) {
            return abort(500);
        }

        $this->saveFile($returnFileUrl, $file);

        return response()->json([
            'file' => implode('|', $returnFileUrl)
        ]);
    }

    /**
     * 图库
     *
     * @access public
     */
    public function imagelist()
    {
        $data['keyword'] = strip_tags(Request::input('keyword'));
        $data['time'] = strip_tags(Request::input('time'));
        
        $list = with(new Attachment())->getAllByPage($data);
        $page = $list->setPath('')->appends(Request::all())->render();
        return view('admin.upload.imagelist',
            compact('list', 'page', 'data')
        );
    }

    /**
     * 保存一些文件的信息到数据库中
     *
     * @access private
     */
    private function saveFile($files, $file)
    {
        $fileExt = $file->getClientOriginalExtension();
        $isImage = isImage($fileExt) ? Attachment::IS_IMAGE_YES : Attachment::IS_IMAGE_NO;
        $datas = $this->generDatas($files, $file, $fileExt, $isImage);
        with(new Attachment())->addFile($datas);
    }

    /**
     * gener datas
     *
     * @access private
     */
    private function generDatas($files, $file, $fileExt, $isImage)
    {
        $datas = [];
        foreach ($files as $key => $value) {
            $data['filename'] = $this->getFileName($value, $file->getClientOriginalName());
            $data['filepath'] = $value;
            $data['filesize'] = $file->getClientSize() / 1024;
            $data['fileext'] = $fileExt;
            $data['isimage'] = $isImage;
            $data['isthumb'] = $this->isThumb($value);
            $data['uploadtime'] = time();
            $data['status'] = Attachment::STATUS_YES;
            $datas[] = $data;
        }
        return $datas;
    }

    /**
     * get file name
     *
     * @access private
     */
    private function getFileName($file, $uploadFileName)
    {
        return strpos($file, 'thumb') !== false ?
            $uploadFileName . ' ' . Lang::get('common.thumb') :
            $uploadFileName;
    }

    /**
     * is thumb
     *
     * @access private
     */
    private function isThumb($file)
    {
        return strpos($file, 'thumb') !== false ?
            Attachment::IS_THUMB_YES :
            Attachment::IS_THUMB_NO;
    }

}