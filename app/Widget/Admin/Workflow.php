<?php

namespace App\Widget\Admin;

use App\Widget\Admin\AbstractBase;
use App\Services\Admin\Acl\Acl;

/**
 * 工作流小组件
 *
 * @author jiang <mylampblog@163.com>
 */
class Workflow extends AbstractBase
{
    /**
     * 面包屑中的按钮
     *
     * @access public
     */
    public function addWorkflow()
    {
        $this->setCurrentAction('index', 'add', 'workflow')->checkPermission();
        $url = route($this->module.'.'.$this->class.'.'.$this->function);
        $html = $this->hasPermission ?
                    '<span class="pull-right margin-bottom-5"><a class="btn btn-info btn-small" href="'.$url.'" role="button" ><i class="icon-plus icon-white"></i> 添加工作流</a></span>'
                        : '';
        return $html;
    }

    /**
     * 工作流管理列表编辑操作
     *
     * @access public
     */
    public function edit($data)
    {
        $this->setCurrentAction('index', 'edit', 'workflow')->checkPermission();
        $url = route($this->module.'.'.$this->class.'.'.$this->function, ['id' => $data['id']]);
        $html = $this->hasPermission ?
                    '<a title="编辑" href="'.$url.'"><i class="icon-pencil"></i></a>'
                        : '<i class="icon-pencil" title="没有权限"></i>';
        return $html;
    }

    /**
     * 工作流管理列表删除操作
     *
     * @access public
     */
    public function delete($data)
    {
        $this->setCurrentAction('index', 'delete', 'workflow')->checkPermission();
        $url = route($this->module.'.'.$this->class.'.'.$this->function, ['id' => $data['id']]);
        $html = $this->hasPermission ?
                    '<a title="删除" href="javascript:rc.ajaxDelete(\''.$url.'\', \'sys-list\', \'确定吗？\');"><i class="icon-trash"></i></a>'
                        : '<i class="icon-trash" title="没有权限"></i>';
        return $html;
    }

    /**
     * 工作流管理列表详情
     *
     * @access public
     */
    public function detail($data)
    {
        $this->setCurrentAction('step', 'index', 'workflow')->checkPermission();
        $url = route($this->module.'.'.$this->class.'.'.$this->function, ['id' => $data['id']]);
        $html = $this->hasPermission ?
                    '<a title="详情" href="'.$url.'"><i class="icon-list"></i></a>'
                        : '<i class="icon-list" title="没有权限"></i>';
        return $html;
    }

}