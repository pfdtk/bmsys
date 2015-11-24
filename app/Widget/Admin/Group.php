<?php

namespace App\Widget\Admin;

use App\Widget\Admin\AbstractBase;
use App\Services\Admin\Acl\Acl;

/**
 * 用户组列表小组件
 *
 * @author jiang <mylampblog@163.com>
 */
class Group extends AbstractBase
{
    /**
     * 用户组列表编辑操作
     *
     * @access public
     */
    public function edit($data)
    {
        $this->setCurrentAction('group', 'edit', 'foundation')->setData($data)->checkPermission(Acl::GROUP_LEVEL_TYPE_GROUP);
        $url = route($this->module.'.'.$this->class.'.'.$this->function, ['id' => url_param_encode($data['id'])]);
        $html = $this->hasPermission ?
                    '<a title="编辑" href="'.$url.'"><i class="icon-pencil"></i></a>'
                        : '<i class="icon-pencil" title="没有权限"></i>';
        return $html;
    }

    /**
     * 用户组列表删除操作
     *
     * @access public
     */
    public function delete($data)
    {
        $this->setCurrentAction('group', 'delete', 'foundation')->setData($data)->checkPermission(Acl::GROUP_LEVEL_TYPE_GROUP);
        $url = route($this->module.'.'.$this->class.'.'.$this->function, ['id' => url_param_encode($data['id'])]);
        $html = $this->hasPermission ?
                    '<a title="删除" href="javascript:rc.ajaxDelete(\''.$url.'\', \'sys-list\', \'确定吗？\');"><i class="icon-trash"></i></a>'
                        : '<i class="icon-trash" title="没有权限"></i>';
        return $html;
    }

    /**
     * 用户组列表删除操作
     *
     * @access public
     */
    public function acl($data)
    {
        $this->setCurrentAction('acl', 'group', 'foundation')->setData($data)->checkPermission(Acl::GROUP_LEVEL_TYPE_GROUP);
        $url = route($this->module.'.'.$this->class.'.'.$this->function, ['id' => url_param_encode($data['id'])]);
        $html = $this->hasPermission ?
                    '<a title="权限管理" href="'.$url.'"><i class="icon-user"></i></a>'
                        : '<i class="icon-user" title="没有权限"></i>';
        return $html;
    }

    /**
     * 面包屑中的按钮
     *
     * @access public
     */
    public function addGroup()
    {
        $this->setCurrentAction('group', 'add', 'foundation')->checkPermission(Acl::GROUP_LEVEL_TYPE_GROUP);
        $url = route($this->module.'.'.$this->class.'.'.$this->function);
        $html = $this->hasPermission ?
                    '<span class="pull-right margin-bottom-5"><a class="btn btn-info btn-small" href="'.$url.'" role="button" ><i class="icon-plus icon-white"></i> 添加用户组</a></span>'
                        : '';
        return $html;
    }

}