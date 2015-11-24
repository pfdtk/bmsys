<?php

/**
 * 加载小组件，传入的名字会以目录和类名区别。
 * 如Home.Common就代表Widget目录下的Home/Common.php这个widget。
 *
 * @param string $widgetName
 * @return object 返回这个widget的对象
 */
if( ! function_exists('widget'))
{
    function widget($widgetName)
    {
        $widgetNameEx = explode('.', $widgetName);
        if( ! isset($widgetNameEx[1])) return false;
        $widgetClass = 'App\\Widget\\'.$widgetNameEx[0].'\\'.$widgetNameEx[1];
        if(app()->bound($widgetName)) return app()->make($widgetName);
        app()->singleton($widgetName, function() use ($widgetClass)
        {
            return new $widgetClass();
        });
        return app()->make($widgetName);
    }
}

/**
 * 返回json
 *
 * @param string｜array $msg 返回的消息
 * @param boolean $status 是否成功
 */
if( ! function_exists('responseJson'))
{
    function responseJson($msg, $status = false)
    {
        $status = $status ? 'success' : 'error';
        $arr = array('result' => $status, 'message' => $msg);
        return Response::json($arr);
    }
}

/**
 * 加载静态资源
 *
 * @param string $file 所要加载的资源
 */
if ( ! function_exists('loadStatic'))
{
    function loadStatic($file)
    {
        $realFile = public_path().$file;
        if( ! file_exists($realFile)) return '';
        $filemtime = filemtime($realFile);
        return Request::root().$file.'?v='.$filemtime;
    }
}

/**
 * 适用于url的base64加密
 */
if( ! function_exists('base64url_encode') )
{
    function base64url_encode($data)
    {
        return rtrim(strtr(base64_encode($data), '+/', '-_'), '='); 
    } 
}

/**
 * 适用于url的base64解密
 */
if( ! function_exists('base64url_decode') )
{
    function base64url_decode($data)
    {
        return base64_decode(str_pad(strtr($data, '-_', '+/'), strlen($data) % 4, '=', STR_PAD_RIGHT)); 
    }
}

/**
 * 转化 \ 为 /
 * 
 * @param    string  $path   路径
 * @return   string  路径
 */
if( ! function_exists('dir_path') )
{
    function dir_path($path)
    {
        $path = str_replace('\\', '/', $path);
        if(substr($path, -1) != '/') $path = $path.'/';
        return $path;
    }

}

/**
 * 创建目录
 * 
 * @param    string  $path   路径
 * @param    string  $mode   属性
 * @return   string  如果已经存在则返回true，否则为flase
 */
if( ! function_exists('dir_create') )
{
    function dir_create($path, $mode = 0777)
    {
        if(is_dir($path)) return TRUE;
        $ftp_enable = 0;
        $path = dir_path($path);
        $temp = explode('/', $path);
        $cur_dir = '';
        $max = count($temp) - 1;
        for($i=0; $i<$max; $i++)
        {
            $cur_dir .= $temp[$i].'/';
            if (@is_dir($cur_dir)) continue;
            @mkdir($cur_dir, 0777,true);
            @chmod($cur_dir, 0777);
        }
        return is_dir($path);
    }
}

/**
 * 根据后缀来简单的判断是不是图片
 * 
 * @return boolean
 */
if( ! function_exists('isImage') )
{
    function isImage($ext)
    {
        $imageExt = 'jpg|gif|png|bmp|jpeg';
        if( ! in_array($ext, explode('|', $imageExt))) return false;
        return true;
    }
}

/**
 * 加密函数
 *
 * @param string $string 所要加密的字符
 * @param string $operation 加密还是解密
 * @param string $key 加密所要的key
 * @param string $expiry 生存时间
 */
if( ! function_exists('cryptcode'))
{
    function cryptcode($string, $operation = 'DECODE', $key = '', $expiry = 0)
    {
        return App\Libraries\Crypt::cryptcode($string, $operation, $key, $expiry);
    }
}

/**
 * 主要用于url参数的加密
 *
 * @param string $string 所要加密的字符
 */
if( ! function_exists('url_param_encode'))
{
    function url_param_encode($string)
    {
        return base64url_encode(cryptcode($string, 'ENCODE'));
    }
}

/**
 * 主要用于url参数的解密
 *
 * @param string $string 所要解密的字符
 */
if( ! function_exists('url_param_decode'))
{
    function url_param_decode($string)
    {
        return cryptcode(base64url_decode($string), 'DECODE');
    }
}

/**
 * 主要用于防止表单篡改
 *
 * @param void $data 所要验证的数据，必须以最后提交的数据的数据结构一致。
 */
if( ! function_exists('form_hash'))
{
    function form_hash($data)
    {
        return (new App\Services\Formhash())->hash($data);
    }
}