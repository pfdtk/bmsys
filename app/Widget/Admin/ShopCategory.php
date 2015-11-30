<?php

namespace App\Widget\Admin;

use App\Widget\Admin\AbstractBase;
use App\Services\Admin\Acl\Acl;

/**
 * 店铺分类小组件
 *
 * @author jiang <mylampblog@163.com>
 */
class ShopCategory extends AbstractBase
{
    /**
     * 编辑操作
     *
     * @access public
     */
    public function edit($data)
    {
        $this->setCurrentAction('category', 'edit', 'shop')->setData($data)->checkPermission();
        $url = route($this->module.'.'.$this->class.'.'.$this->function, ['id' => $data['id'] ]);
        $html = $this->hasPermission ?
                    '<a title="编辑" href="'.$url.'"><i class="icon-pencil"></i></a>'
                        : '';
        $result = ['show' => $this->hasPermission, 'html' => $html];
        return $result;
    }

    /**
     * 删除操作
     *
     * @access public
     */
    public function delete($data)
    {
        $this->setCurrentAction('category', 'delete', 'shop')->setData($data)->checkPermission();
        $url = route($this->module.'.'.$this->class.'.'.$this->function, ['id' => $data['id']]);
        $html = $this->hasPermission ?
                    '<a title="删除" href="javascript:rc.ajaxDelete(\''.$url.'\', \'sys-list\', \'确定吗？\');"><i class="icon-trash"></i></a>'
                        : '';
        $result = ['show' => $this->hasPermission, 'html' => $html];
        return $result;
    }

    /**
     * 增加分类按钮
     *
     * @access public
     */
    public function addShopCategory()
    {
        $this->setCurrentAction('category', 'add', 'shop')->checkPermission();
        $url = route($this->module.'.'.$this->class.'.'.$this->function);
        $html = $this->hasPermission ?
                    '<span class="pull-right margin-bottom-5"><a class="btn btn-info btn-small" href="'.$url.'" role="button" ><i class="icon-plus icon-white"></i> 添加分类</a></span>'
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
        $this->setCurrentAction('category', 'sort', 'shop')->checkPermission();
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
     * 递归处理列表显示
     * 
     * @param  array $datas 数据源
     * @param  mixed $prefix 下拉表单的线，只能传false
     * @return html 返回组装好的代码
     */
    public function categoryList(array $datas, $pid, $prefix = false)
    {
        $html = '';

        if( ! $this->son) $this->son = \App\Services\Admin\Tree::getSonKey();
        
        foreach($datas as $key => $value) {
            if($prefix === false) {
                if($pid != $value['id'] && $pid != 'all') continue;
            }

            $line = ($prefix === false ? '' : $prefix).'┆┄';
            $html .= view('admin.shopcategory.list', compact('value', 'prefix'));

            if(isset($value[$this->son]) && is_array($value[$this->son])) {
                $html .= $this->categoryList($value[$this->son], $pid, $line);
            }
        }

        return $html;
    }

}