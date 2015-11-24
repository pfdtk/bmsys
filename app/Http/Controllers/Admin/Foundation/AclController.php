<?php

namespace App\Http\Controllers\Admin\Foundation;

use App\Http\Controllers\Admin\Controller;
use App\Models\Admin\Permission as PermissionModel;
use App\Models\Admin\Access as AccessModel;
use App\Models\Admin\User as UserModel;
use App\Models\Admin\Group as GroupModel;
use Request, Lang, Session;
use App\Services\Admin\Acl\Process as AclProcess;
use App\Libraries\Js;
use App\Services\Admin\Acl\Acl;
use App\Services\Admin\Tree;
use App\Services\Admin\SC;
use App\Services\Admin\Acl\Param\AclSave;
use App\Services\Admin\Acl\Param\AclSet;

/**
 * 权限菜单相关
 *
 * @author jiang <mylampblog@163.com>
 */
class AclController extends Controller
{
    /**
     * 显示权限列表
     *
     * @access public
     */
    public function index(PermissionModel $pModel)
    {
        Session::flashInput(['http_referer' => Request::fullUrl()]);
        $pid = (int) Request::input('pid', 'all');
        $list = $pModel->getAllAccessPermission();
        $list = Tree::genTree($list);
        return view('admin.acl.index', compact('list', 'pid'));
    }

    /**
     * 增加权限功能
     *
     * @access public
     */
    public function add(PermissionModel $pModel)
    {
        if(Request::method() == 'POST') return $this->addPermission();

        $formUrl = route('foundation.acl.add');
        $list = $pModel->getAllAccessPermission();
        $select = Tree::dropDownSelect(Tree::genTree($list));

        return view('admin.acl.add', compact('select', 'formUrl'));
    }

    /**
     * 增加功能权限入库处理
     *
     * @access private
     */
    private function addPermission()
    {
        $params = new AclSave();
        $manager = new AclProcess();

        $data = (array) Request::input('data');
        $data['add_time'] = time();
        $params->setAttributes($data);

        if($manager->addAcl($params) !== false) {
            return Js::locate(route('foundation.acl.index'), 'parent');
        }

        return Js::error($manager->getErrorMessage());
    }
    
    /**
     * 删除权限功能
     *
     * @access public
     */
    public function delete(AclProcess $manager)
    {
        $permissionId = (array) Request::input('id');

        if($manager->detele($permissionId) !== false) {
            return responseJson(Lang::get('common.action_success'), true);
        }

        return responseJson($manager->getErrorMessage());
    }

    /**
     * 排序权限功能
     *
     * @access public
     */
    public function sort(PermissionModel $permissionModel)
    {
        $sort = (array) Request::input('sort');
        foreach($sort as $key => $value) {
            if($permissionModel->sortPermission($key, $value) === false) $err = true;
        }
        if(isset($err)) {
            return Js::error(Lang::get('common.action_error'));
        }
        return Js::locate(
            route('foundation.acl.index'),
            'parent'
        );
    }
    
    /**
     * 编辑权限功能
     *
     * @access public
     */
    public function edit(PermissionModel $permissionModel)
    {
        if(Request::method() == 'POST') return $this->updatePermission();
        
        Session::flashInput(['http_referer' => Session::getOldInput('http_referer')]);
        $id = Request::input('id');
        $permissionId = url_param_decode($id);

        if( ! $permissionId or ! is_numeric($permissionId)) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        $list = (array) Tree::genTree($permissionModel->getAllAccessPermission());
        $permissionInfo = $permissionModel->getOnePermissionById(intval($permissionId));

        if(empty($permissionInfo)) {
            return Js::error(Lang::get('common.acl_not_found'), true);
        }

        $select = Tree::dropDownSelect($list, $permissionInfo['pid']);
        $formUrl = route('foundation.acl.edit');

        return view('admin.acl.add', compact(
            'select', 'permissionInfo', 'formUrl', 'id'
        ));
    }
    
    /**
     * 编辑功能权限入库
     *
     * @access private
     */
    private function updatePermission()
    {
        $params = new AclSave();
        $manager = new AclProcess();
        $httpReferer = Session::getOldInput('http_referer');
        $params->setAttributes((array) Request::input('data'));
        
        if($manager->editAcl($params) !== false) {
            $backUrl = ( ! empty($httpReferer)) ? $httpReferer : route('foundation.acl.index'); 
            return Js::locate($backUrl, 'parent');
        }

        return Js::error($manager->getErrorMessage());
    }
    
    /**
     * 对用户进行权限设置
     * 
     * @access public
     */
    public function user(UserModel $userModel, Acl $acl, AclProcess $process)
    {
        if(Request::method() == 'POST') return $this->saveUserPermission();

        $id = url_param_decode(Request::input('id'));

        if( ! $id or ! is_numeric($id)) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        $info = $userModel->getOneUserById(intval($id));

        if(empty($info)) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        if( ! $acl->checkGroupLevelPermission($id, Acl::GROUP_LEVEL_TYPE_USER)) {
            return Js::error(Lang::get('common.account_level_deny'), true);
        }

        $zTree = $process->prepareDataForZtree($process->getUserAccessPermissionIds($id));
        $all = $process->prepareUserPermissionIds();

        $router = 'user';

        return view('admin.acl.setpermission', compact(
            'zTree', 'id', 'info', 'router', 'all'
        ));
    }

    /**
     * 用户权限入库
     * 
     * @return boolean true|false
     */
    private function saveUserPermission()
    {
        $this->checkFormHash();

        $permissions = (array) Request::input('permission');
        $id = (int) Request::input('id');
        $all = Request::input('all');

        if( ! (new Acl())->checkGroupLevelPermission($id, Acl::GROUP_LEVEL_TYPE_USER)) {
            return Js::error(Lang::get('common.account_level_deny'), true);
        }

        $params = new AclSet();
        $manager = new AclProcess();

        $params->setPermission($permissions)->setAll($all)->setId($id);
        
        if( ! $manager->setUserAcl($params)) {
            return responseJson($manager->getErrorMessage());
        }

        $this->setActionLog();
        return responseJson(
            Lang::get('common.action_success')
        );
        
    }
    
    /**
     * 对用户组进行权限设置
     * 
     * @access public
     */
    public function group(GroupModel $groupModel, Acl $acl, AclProcess $process)
    {
        if(Request::method() == 'POST') return $this->saveGroupPermission();

        $id = url_param_decode(Request::input('id'));

        if( ! $id or ! is_numeric($id)) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        $info = $groupModel->getOneGroupById(intval($id));

        if(empty($info)) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        if( ! $acl->checkGroupLevelPermission($id, Acl::GROUP_LEVEL_TYPE_GROUP)) {
            return Js::error(Lang::get('common.account_level_deny'), true);
        }

        $zTree = $process->prepareDataForZtree($process->getGroupAccessPermissionIds($id));
        $all = $process->prepareUserPermissionIds();

        $router = 'group';
        return view('admin.acl.setpermission', compact(
            'zTree', 'id', 'info', 'router', 'all'
        ));
    }

    /**
     * 用户组权限入库
     * 
     * @return boolean true|false
     */
    private function saveGroupPermission()
    {
        $this->checkFormHash();

        $permissions = (array) Request::input('permission');
        $id = (int) Request::input('id');
        $all = Request::input('all');

        if( ! (new Acl())->checkGroupLevelPermission($id, Acl::GROUP_LEVEL_TYPE_GROUP)) {
            return responseJson(Lang::get('common.account_level_deny'));
        }

        $params = new AclSet();
        $manager = new AclProcess();

        $params->setPermission($permissions)->setAll($all)->setId($id);
        if( ! $manager->setGroupAcl($params)) {
            return responseJson($manager->getErrorMessage());
        }

        $this->setActionLog();
        return responseJson(
            Lang::get('common.action_success')
        );
    }

}