<?php

namespace App\Http\Controllers\Admin\Foundation;

use App\Http\Controllers\Admin\Controller;
use App\Models\Admin\Group as GroupModel;
use Request, Lang, Session;
use App\Services\Admin\Group\Process as GroupProcess;
use App\Services\Admin\Group\Validate\Group as GroupValidate;
use App\Services\Admin\Group\Param\GroupSave;
use App\Libraries\Js;
use App\Services\Admin\Acl\Acl;

/**
 * 用户组管理
 *
 * @author jiang <mylampblog@163.com>
 */
class GroupController extends Controller
{
    /**
     * 显示用户组列表
     *
     * @access public
     */
    public function index(GroupModel $groupModel)
    {
        Session::flashInput(['http_referer' => Request::fullUrl()]);
        $grouplist = $groupModel->getAllGroupByPage();
        $page = $grouplist->setPath('')->appends(Request::all())->render();
        return view('admin.group.index', compact('grouplist', 'page'));
    }
    
    /**
     * 增加用户组
     *
     * @access public
     */
    public function add()
    {
        if(Request::method() == 'POST') return $this->addGroup();
        $formUrl = route('foundation.group.add');
        return view('admin.group.add', compact('formUrl'));
    }
    
    /**
     * 增加用户组
     *
     * @access private
     */
    private function addGroup()
    {
        $params = new GroupSave();
        $manager = new GroupProcess();
        $params->setAttributes((array) Request::input('data'));
        if($manager->addGroup($params) === false) {
            return Js::error($manager->getErrorMessage());
        }
        $this->setActionLog();
        return Js::locate(route(
            'foundation.group.index'
        ), 'parent');
    }

    /**
     * 编辑用户组
     *
     * @access public
     */
    public function edit(GroupModel $groupModel, Acl $acl)
    {
        if(Request::method() == 'POST') return $this->updateGroup();

        Session::flashInput(['http_referer' => Session::getOldInput('http_referer')]);
        $id = Request::input('id');
        $groupId = url_param_decode($id);

        if( ! $groupId or ! is_numeric($groupId)) {
            return Js::error(Lang::get('common.illegal_operation'));
        }

        $groupInfo = $groupModel->getOneGroupById($groupId);

        if(empty($groupInfo)) {
            return Js::error(Lang::get('group.group_not_found'));
        }

        if( ! $acl->checkGroupLevelPermission($groupId, Acl::GROUP_LEVEL_TYPE_GROUP)) {
            return Js::error(Lang::get('common.account_level_deny'), true);
        }
        
        $formUrl = route('foundation.group.edit');

        return view('admin.group.add', compact(
            'groupInfo', 'formUrl', 'id'
        ));
    }
    
    /**
     * 编辑用户组
     *
     * @access private
     */
    private function updateGroup()
    {
        $params = new GroupSave();
        $manager = new GroupProcess();

        $httpReferer = Session::getOldInput('http_referer');
        $params->setAttributes((array) Request::input('data'));
        
        if( ! $manager->editGroup($params)) {
            return Js::error($manager->getErrorMessage());
        }
        $this->setActionLog();
        return Js::locate(( ! empty($httpReferer)) ?
            $httpReferer :
            route('foundation.group.index'),
            'parent'
        );
    }

    /**
     * 删除用户组
     *
     * @access public
     */
    public function delete(GroupValidate $groupValidate, GroupModel $groupModel, GroupProcess $manager)
    {
        $id = $groupValidate->deleteIds( (array) Request::input('id'));
        if( ! $id or ! is_array($id)) {
            return responseJson(Lang::get('common.action_error'));
        }

        $groupInfos = $groupModel->getGroupInIds($id);

        if( ! $manager->detele($id)) {
            return responseJson($manager->getErrorMessage());
        }

        $this->setActionLog(['groupInfos' => $groupInfos]);
        return responseJson(
            Lang::get('common.action_success'),
            true
        );
    }

}