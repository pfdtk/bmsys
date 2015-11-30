<?php

namespace App\Widget\Admin;

use App\Services\Admin\SC;
use Request, Config;

/**
 * 菜单小组件
 *
 * @author jiang <mylampblog@163.com>
 */
class Common
{
    /**
     * header
     */
    public function header(array $widgetHeaderConfig = array())
    {
        $domain['domain'] = Request::root();
        $domain['img_domain'] = Config::get('sys.sys_images_domain');
        return view('admin.widget.header', compact('widgetHeaderConfig', 'domain'));
    }

    public function headerContent()
    {
        return view('admin.widget.headercontent');
    }

    public function footer()
    {
        return view('admin.widget.footer');
    }

    public function goBack($url)
    {
        $html = '<input type="button" value="返回" onclick="javascript:window.location.href=\''.$url.'\'" class="btn btn-info  " style="width:80px;" />';
        return $html;
    }

    /**
     * top
     */
    public function top()
    {
        $username = SC::getLoginSession()->name;
        return view('admin.widget.top', compact('username'));
    }

    /**
     * crumbs
     */
    public function crumbs()
    {
        $mcaName = \App\Services\Admin\MCAManager::MAC_BIND_NAME;
        $MCA = app()->make($mcaName);
        $currentMCAinfo = $MCA->getCurrentMCAInfo();
        $topMenu = $MCA->getCrubms();
        return view('admin.widget.crumbs',
            compact('currentMCAinfo', 'topMenu')
        );
    }

    /**
     * htmlend
     */
    public function htmlend()
    {
        return '</body></html>';
    }

    /**
     * 修改密码
     */
    public function mpassword()
    {
        return view('admin.widget.mpassword');
    }

}