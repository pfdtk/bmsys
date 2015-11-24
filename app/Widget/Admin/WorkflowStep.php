<?php

namespace App\Widget\Admin;

use App\Widget\Admin\AbstractBase;
use App\Services\Admin\Acl\Acl;

/**
 * 工作流小组件
 *
 * @author jiang <mylampblog@163.com>
 */
class WorkflowStep extends AbstractBase
{
    /**
     * 面包屑中的按钮
     *
     * @access public
     */
    public function addWorkflowStep()
    {
        $this->setCurrentAction('step', 'add', 'workflow')->checkPermission();
        $url = route($this->module.'.'.$this->class.'.'.$this->function, ['id' => \Request::input('id') ]);
        $html = $this->hasPermission ?
                    '<span class="pull-right margin-bottom-5"><a class="btn btn-info btn-small" href="'.$url.'" role="button" ><i class="icon-plus icon-white"></i> 添加步骤</a></span>'
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
        $this->setCurrentAction('step', 'edit', 'workflow')->checkPermission();
        $url = route($this->module.'.'.$this->class.'.'.$this->function, ['stepid' => $data['id'], 'workflow_id' => \Request::input('id') ] );
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
        $this->setCurrentAction('step', 'delete', 'workflow')->checkPermission();
        $url = route($this->module.'.'.$this->class.'.'.$this->function, ['id' => $data['id']]);
        $html = $this->hasPermission ?
                    '<a title="删除" href="javascript:rc.ajaxDelete(\''.$url.'\', \'sys-list\', \'确定吗？\');"><i class="icon-trash"></i></a>'
                        : '<i class="icon-trash" title="没有权限"></i>';
        return $html;
    }

    /**
     * 设置工作流步骤的关联人员
     * 
     * @return string
     */
    public function relation($data)
    {
        $this->setCurrentAction('step', 'relation', 'workflow')->checkPermission();
        $url = route($this->module.'.'.$this->class.'.'.$this->function, ['stepid' => $data['id'], 'workflow_id' => \Request::input('id') ] );
        $html = $this->hasPermission ?
                    '<a title="设置关联人员" class="step-relation" href="'.$url.'"><i class="icon-user"></i></a>'
                        : '<i class="icon-user" title="没有权限"></i>';
        return $html;
    }

    /**
     * 保存关联的按钮
     *
     * @access public
     */
    public function selected()
    {
        $this->setCurrentAction('step', 'relation', 'workflow')->checkPermission();
        $html = $this->hasPermission ?
                    '<input type="submit" value="关联" class="btn btn-info " style="width:80px;" />'
                        : '';
        return $html;
    }

}