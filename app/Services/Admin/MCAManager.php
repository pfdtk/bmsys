<?php namespace App\Services\Admin;

use App\Services\Admin\SC;

/**
 * 主要用来储存当前请求的模块、类、函数
 *
 * @author jiang <mylampblog@163.com>
 */
class MCAManager {

    /**
     * 当前类绑定到容器中的标识
     *
     * @var string
     */
    CONST MAC_BIND_NAME = 'mac';

    /**
     * 当前请求的模块
     * 
     * @var string
     */
    private $module;

    /**
     * 当前请求的类
     * 
     * @var string
     */
    private $class;

    /**
     * 当前请求的函数
     * 
     * @var string
     */
    private $action;

    /**
     * 当前请求所对应的详细的功能信息
     * 
     * @var array
     */
    private $currentMCA;

    /**
     * 当前登录用户的所有权限信息
     * 
     * @var array
     */
    private $userPermission;

    /**
     * set current module
     * 
     * @param string $module
     */
    public function setModule($module)
    {
        $this->module = $module;
        return $this;
    }

    /**
     * set current action
     * 
     * @param string $action
     */
    public function setAction($action)
    {
        $this->action = $action;
        return $this;
    }

    /**
     * set current class
     * 
     * @param string $class
     */
    public function setClass($class)
    {
        $this->class = $class;
        return $this;
    }

    /**
     * get current module
     */
    public function getModule()
    {
        return $this->module;
    }

    /**
     * get current action
     */
    public function getAction()
    {
        return $this->action;
    }

    /**
     * get current class
     */
    public function getClass()
    {
        return $this->class;
    }

    /**
     * 取得当前的操作的功能信息
     * 
     * @return array 功能信息
     */
    public function getCurrentMCAInfo()
    {
        return $this->currentMCAInfo();
    }

    /**
     * get crubms
     */
    public function getCrubms()
    {
        $currentMCAInfo = $this->currentMCAInfo();
        return $this->getCurrentMCAfatherMenuInfo($currentMCAInfo);
    }

    /**
     * 根据当前的请求查找符合要求的权限信息
     * 
     * @param int $level 几级菜单但不是一级菜单
     * @return array
     */
    private function getCurrentMCAfatherMenuInfo($currentMCAInfo)
    {
        $userPermission = $this->getUserPermission();
        $parentMCA = [];
        foreach($userPermission as $key => $value) {
            if($currentMCAInfo['pid'] == $value['id'] and ! empty($value['id'])) {
                $parentMCA[] = $value;
                if($value['pid'] != 0) {
                    $parentMCA = array_merge($this->getCurrentMCAfatherMenuInfo($value), $parentMCA);
                }
            }
        }
        return $parentMCA;
    }

    /**
     * 当前请求所对应的功能信息
     * 
     * @return array
     */
    private function currentMCAInfo()
    {
        if( ! $this->currentMCA) {
            $userPermission = $this->getUserPermission();
            foreach($userPermission as $key => $value) {
                if($this->matchCurrentMCA($value)) {
                    $this->currentMCA = $value;
                    break;
                }
            }
        }
        return $this->currentMCA;
    }

    /**
     * find match mca
     */
    private function matchCurrentMCA($value)
    {
        if($this->getModule() == $value['module']
            and $this->getClass() == $value['class']
                and $this->getAction() == $value['action'])
            return true;
        return false;
    }

    /**
     * return user permission
     */
    private function getUserPermission()
    {
        if( ! $this->userPermission)
            $this->userPermission = SC::getUserPermissionSession();
        return $this->userPermission;
    }

}