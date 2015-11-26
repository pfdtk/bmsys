<?php

namespace App\Widget\Admin;

use App\Widget\Admin\AbstractBase;
use App\Services\Admin\Acl\Acl as AclManager;

/**
 * 权限列表小组件
 *
 * @author jiang <mylampblog@163.com>
 */
class Acl extends AbstractBase
{
    /**
     * 权限列表编辑操作
     *
     * @access public
     */
    public function edit($data)
    {
        $this->setCurrentAction('acl', 'edit', 'foundation')->checkPermission();
        $url = route($this->module.'.'.$this->class.'.'.$this->function, ['id' => url_param_encode($data['id'])]);
        $html = $this->hasPermission ?
                    '<a title="编辑" href="'.$url.'"><i class="icon-pencil"></i></a>'
                        : '';
        $html = ['show' => $this->hasPermission, 'html' => $html];
        return $html;
    }

    /**
     * 权限列表删除操作
     *
     * @access public
     */
    public function delete($data)
    {
        $this->setCurrentAction('acl', 'delete', 'foundation')->checkPermission();
        $url = route($this->module.'.'.$this->class.'.'.$this->function, ['id' => url_param_encode($data['id'])]);
        $html = $this->hasPermission ?
                    '<a title="删除" href="javascript:rc.ajaxDelete(\''.$url.'\', \'sys-list\', \'确定吗？\');"><i class="icon-trash"></i></a>'
                        : '';
        $html = ['show' => $this->hasPermission, 'html' => $html];
        return $html;
    }

    /**
     * 面包屑中的按钮
     *
     * @access public
     */
    public function addAcl()
    {
        $this->setCurrentAction('acl', 'add', 'foundation')->checkPermission();
        $url = route($this->module.'.'.$this->class.'.'.$this->function);
        $html = $this->hasPermission ?
                    '<span class="pull-right margin-bottom-5"><a class="btn btn-info btn-small" href="'.$url.'" role="button" ><i class="icon-plus icon-white"></i> 添加功能</a></span>'
                        : '';
        return $html;
    }

    /**
     * 排序的按钮
     *
     * @access public
     */
    public function sort()
    {
        $this->setCurrentAction('acl', 'sort', 'foundation')->checkPermission();
        $html = $this->hasPermission ?
                    '<input type="submit" value="排序" class="btn btn-info  " style="width:80px;" />'
                        : '';
        return $html;
    }

    /**
     * 子项目用到的key
     * 
     * @var string
     */
    private $son;

    /**
     * 递归select中的option下拉表单，用于权限增加和编辑
     * 
     * @param  array $datas 数据源
     * @param  mixed $prefix 下拉表单的线，只能传false
     * @return html 返回组装好的option代码
     */
    public function acllist(array $datas, $pid, $prefix = false)
    {
        $html = '';

        if( ! $this->son) $this->son = \App\Services\Admin\Tree::getSonKey();
        
        foreach($datas as $key => $value)
        {
            if($prefix === false)
            {
                if($pid != $value['id'] && $pid != 'all') continue;
            }
            $line = ($prefix === false ? '' : $prefix).'┆┄';
            $html .= view('admin.acl.list', compact('value', 'prefix'));
            if(isset($value[$this->son]) && is_array($value[$this->son]))
            {
                $html .= $this->acllist($value[$this->son], $pid, $line);
            }
        }
        return $html;
    }

}