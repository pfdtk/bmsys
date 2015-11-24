<?php namespace App\Http\Controllers\Admin\Foundation;

use App\Models\Admin\Group;
use App\Models\Admin\User;
use Request, Lang, Session;
use App\Services\Admin\SC;
use App\Services\Admin\User\Process as UserProcess;
use App\Libraries\Js;
use App\Services\Admin\Acl\Acl;
use App\Http\Controllers\Admin\Controller;
use App\Services\Admin\User\Param\UserSave;
use App\Services\Admin\Login\Process as LoginProcess;
use App\Services\Admin\User\Param\UserModifyPassword;
use App\Services\Admin\User\Validate\User as UserValidate;

/**
 * 用户相关
 *
 * @author jiang <mylampblog@163.com>
 */
class UserController extends Controller
{
    /**
     * 用户管理列表
     *
     * @access public
     */
    public function index(User $userModel, Group $groupModel)
    {
        Session::flashInput(['http_referer' => Request::fullUrl()]);
        $userList = $userModel->getAllUser(['group_id' => Request::input('gid')]);
        $page = $userList->setPath('')->appends(Request::all())->render();
        $groupList = $groupModel->getAllGroup();
        return view('admin.user.index', compact(
            'userList', 'groupList', 'page'
        ));
    }
    
    /**
     * 增加一个用户
     *
     * @access public
     */
    public function add(Group $groupModel, Acl $acl)
    {
        if(Request::method() == 'POST') return $this->addUserInfo();
        $groupId = SC::getLoginSession()->group_id;
        $groupInfo = $groupModel->getOneGroupById($groupId);
        $isSuperSystemManager = $acl->isSuperSystemManager();
        if($isSuperSystemManager) $groupInfo['level'] = 0;
        $groupList = $groupModel->getGroupLevelLessThenCurrentUser($groupInfo['level']);
        $formUrl = route('foundation.user.add');
        return view('admin.user.add', compact(
            'groupList', 'formUrl'
        ));
    }
    
    /**
     * 保存数据到数据库
     *
     * @access private
     */
    private function addUserInfo()
    {
        $data = (array) Request::input('data');
        $data['add_time'] = time();
        $manager = new UserProcess();
        if( ! $manager->addUser($manager->userSaveParams($data))) {
            return Js::error($manager->getErrorMessage());
        }
        $this->setActionLog();
        return Js::locate(
            route('foundation.user.index'),
            'parent'
        );
    }
    
    /**
     * 编辑用户的资料
     *
     * @access public
     */
    public function edit(User $userModel, Acl $acl, Group $groupModel)
    {
        if(Request::method() == 'POST') return $this->updateUserInfo();

        Session::flashInput(['http_referer' => Session::getOldInput('http_referer')]);
        $id = Request::input('id');
        $userId = url_param_decode($id);

        if( ! $userId or ! is_numeric($userId)) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }
        
        $userInfo = $userModel->getOneUserById($userId);
        if(empty($userInfo)) {
            return Js::error(Lang::get('user.user_not_found'), true);
        }

        if( ! $acl->checkGroupLevelPermission($userId, Acl::GROUP_LEVEL_TYPE_USER)) {
            return Js::error(Lang::get('common.account_level_deny'), true);
        }

        $groupInfo = $groupModel->getOneGroupById(SC::getLoginSession()->group_id);

        if($acl->isSuperSystemManager()) {
            $groupInfo['level'] = 0;
        }

        $groupList = $groupModel->getGroupLevelLessThenCurrentUser($groupInfo['level']);

        $formUrl = route('foundation.user.edit');

        return view('admin.user.add', compact(
            'userInfo', 'formUrl', 'id', 'groupList'
        ));
    }
    
    /**
     * 更新用户信息到数据库
     *
     * @access private
     */
    private function updateUserInfo()
    {
        $httpReferer = Session::getOldInput('http_referer');
        $data = (array) Request::input('data');
        $manager = new UserProcess();
        if( ! $manager->editUser($manager->userSaveParams($data))) {
            return Js::error($manager->getErrorMessage());
        }
        $this->setActionLog();
        return Js::locate( ( ! empty($httpReferer)) ?
            $httpReferer :
            route('foundation.user.index'),
            'parent'
        );
    }

    /**
     * 删除用户
     *
     * @access public
     */
    public function delete(UserValidate $userValidate, User $userModel, UserProcess $manager)
    {
        $id = $userValidate->deleteIds((array) Request::input('id'));

        if( ! $id or ! is_array($id)) {
            return responseJson(Lang::get('common.action_error'));
        }

        $userInfos = $userModel->getUserInIds($id);

        if( ! $manager->detele($id)) {
            return responseJson($manager->getErrorMessage());
        }

        $this->setActionLog(['userInfos' => $userInfos]);
        return responseJson(
            Lang::get('common.action_success'),
            true
        );
    }

    /**
     * 修改自己的密码
     */
    public function mpassword(UserModifyPassword $params, UserProcess $manager, LoginProcess $loginManager)
    {
        $params->setOldPassword(Request::input('old_password'))
               ->setNewPassword(Request::input('new_password'))
               ->setNewPasswordRepeat(Request::input('new_password_repeat'));
               
        if( ! $manager->modifyPassword($params)) {
            return responseJson($manager->getErrorMessage());
        }

        $loginManager->getProcess()->logout();
        return responseJson(
            Lang::get('common.action_success'),
            true
        );
    }
    
}