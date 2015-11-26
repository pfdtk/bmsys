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
     */
    public function index()
    {
        $parpams = Request::only('args', 'authkey');
        $args = @ unserialize(base64url_decode($parpams['args']));
        $uploadObject = new UploadManager();

        if( ! $uploadObject->setParam($args)->checkUploadToken($parpams['authkey'])) {
            return abort(500);
        }

        return view('admin.upload.index',
            compact('parpams', 'args')
        );
    }

    /**
     * 处理上传
     */
    public function process()
    {
        $parpams = Request::only('authkey', 'args');
        $config = @ unserialize(base64url_decode($parpams['args']));

        $uploadObject = new UploadManager();
        if( ! $uploadObject->setParam($config)->checkUploadToken($parpams['authkey'])) {
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
     * 保存一些文件的信息到数据库中
     */
    private function saveFile($files, $file)
    {
        $uploadFileName = $file->getClientOriginalName();
        $fileSize = $file->getClientSize();
        $fileExt = $file->getClientOriginalExtension();
        $isImage = isImage($fileExt);
        $time = time();
        $datas = [];

        foreach ($files as $key => $value) {
            $data['filename'] = strpos($value, 'thumb') !== false ? $uploadFileName . ' 缩略图' : $uploadFileName;
            $data['filepath'] = $value;
            $data['filesize'] = $fileSize / 1024;
            $data['fileext'] = $fileExt;
            $data['isimage'] = $isImage ? Attachment::IS_IMAGE_YES : Attachment::IS_IMAGE_NO;
            $data['isthumb'] = strpos($value, 'thumb') !== false ? Attachment::IS_THUMB_YES : Attachment::IS_THUMB_NO;
            $data['uploadtime'] = $time;
            $data['status'] = Attachment::STATUS_YES;
            $datas[] = $data;
        }
        with(new Attachment())->addFile($datas);
    }

    /**
     * 图库
     */
    public function imagelist()
    {
        $model = new Attachment();
        $data['keyword'] = strip_tags(Request::input('keyword'));
        $data['time'] = strip_tags(Request::input('time'));
        
        $list = $model->getAllByPage($data);
        $page = $list->setPath('')->appends(Request::all())->render();
        return view('admin.upload.imagelist',
            compact('list', 'page', 'data')
        );
    }

}