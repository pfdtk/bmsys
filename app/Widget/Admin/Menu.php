<?php

namespace App\Widget\Admin;

use App\Services\Admin\SC;
use App\Services\Admin\Tree;

/**
 * 菜单小组件
 *
 * @author jiang <mylampblog@163.com>
 */
class Menu
{
    /**
     * 菜单信息
     * 
     * @var array
     */
    protected $list;

    /**
     * 菜单信息
     * 
     * @var array
     */
    protected $menuTree;

    /**
     * 标志菜单不显示
     */
    CONST DISABLE_NONE = 0;

    /**
     * 处理左边的菜单
     */
    public function leftMenu()
    {
        $this->generalData();
        return view('admin.widget.leftmenu', ['menu' => $this->menuTree]);
    }

    /**
     * 返回ztree插件所需的结点，目前只支持到三级
     */
    public function ztreeNode()
    {
        $this->list = SC::getUserPermissionSession();
        $result = [];
        foreach($this->list as $key => $value) {
            if($value['display'] == self::DISABLE_NONE or $value['level'] == 4) continue;
            $url = R('common', $value['module'].'.'.$value['class'].'.'.$value['action']);
            if($value['pid'] == 0 or $this->isSecondFatherNode($value)) $url = 'javascript:;';
            $arr = ['id' => $value['id'], 'pId' => $value['pid'], 'name' => $value['name'], 'url' => $url, 'target' => '_self'];
            $arr['open'] = true;
            $result[] = $arr;
        }
        return json_encode($result);
    }

    /**
     * 是不是第二级父菜单
     * 
     * @return boolean
     */
    private function isSecondFatherNode($currentNode)
    {
        if($currentNode['level'] != 2) return false;
        foreach($this->list as $key => $value) {
            if($value['pid'] == $currentNode['id']) return true;
        }
        return false;
    }

    /**
     * 取回登录所保存的权限信息并生成树形结构
     */
    protected function generalData()
    {
        $this->list = SC::getUserPermissionSession();
        foreach($this->list as $key => $value) {
            if($value['display'] == self::DISABLE_NONE) unset($this->list[$key]);
        }
        $this->menuTree = (array) Tree::genTree($this->list);
        return $this;
    }

}