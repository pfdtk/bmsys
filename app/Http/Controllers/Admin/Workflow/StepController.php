<?php namespace App\Http\Controllers\Admin\Workflow;

use App\Http\Controllers\Admin\Controller;
use App\Services\Admin\Workflow\Process;
use App\Services\Admin\Workflow\Param\WorkflowStepSave;
use App\Libraries\Js;
use Request, Lang;

/**
 * 工作流步骤
 *
 * @author jiang <mylampblog@163.com>
 */
class StepController extends Controller
{
    /**
     * 工作流步骤管理
     */
    public function index(Process $manger)
    {
        $workflowId = (int) Request::input('id');
        $workflowInfo = $manger->workflowInfo(['id' => $workflowId]);

        if(empty($workflowInfo)) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        $list = $manger->workflowStepInfos(['workflow_id' => $workflowId, 'join_user' => true ]);
        $page = $list->setPath('')->appends(Request::all())->render();

        return view('admin.workflow_step.detail',
            compact('workflowInfo', 'list', 'page')
        );
    }

    /**
     * 增加新的工作流
     */
    public function add(Process $manger)
    {
        if(Request::method() == 'POST') return $this->addWorkflowStep();

        $workflowId = (int) Request::input('id');
        $workflowInfo = $manger->workflowInfo(['id' => $workflowId]);

        if(empty($workflowInfo)) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        $stepList = $manger->workflowStepLevelList();
        $formUrl = route('workflow.step.add');

        return view('admin.workflow_step.add', compact(
            'formUrl', 'workflowId', 'stepList', 'workflowInfo'
        ));
    }

    /**
     * 增加工作流入库处理
     *
     * @access private
     */
    private function addWorkflowStep()
    {
        $this->checkFormHash();

        $data = (array) Request::input('data');
        $workflowId = (int) Request::input('workflow_id');
        $data['workflow_id'] = $workflowId;
        $data['addtime'] = time();

        $params = new WorkflowStepSave();
        $manager = new Process();
        $params->setAttributes($data);
        
        if($manager->addWorkflowStep($params) === false) {
            return Js::error($manager->getErrorMessage());
        }
        $this->setActionLog();
        return Js::locate(
            route('workflow.step.index', ['id' => $workflowId]),
            'parent'
        );
    }

    /**
     * 编辑工作流步骤
     *
     * @access public
     */
    public function edit(Process $manger)
    {
        if(Request::method() == 'POST') {
            return $this->updateWorkflowStep();
        }

        $stepId = (int) Request::input('stepid');
        $workflow_Id = (int) Request::input('workflow_id');
        if( ! $stepId) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        $workflowInfo = $manger->workflowInfo(['id' => $workflow_Id]);

        if(empty($workflowInfo)) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        $stepList = $manger->workflowStepLevelList();
        $info = $manger->workflowStepInfo(['id' => $stepId]);

        if(empty($info)) {
            return Js::error(Lang::get('workflow.step_not_found'), true);
        }

        $formUrl = route('workflow.step.edit');

        return view('admin.workflow_step.add', compact(
            'info', 'formUrl', 'stepId','stepList',
            'workflow_Id', 'workflowInfo'
        ));
    }
    
    /**
     * 编辑工作流步骤入库处理
     *
     * @access private
     */
    private function updateWorkflowStep()
    {
        $this->checkFormHash();

        $stepId = (int) Request::input('workflow_step_id');
        $workflowId = (int) Request::input('workflow_id');
        $data = (array) Request::input('data');
        $data['id'] = $stepId;
        $data['workflow_id'] = $workflowId;

        $params = new WorkflowStepSave();
        $manager = new Process();
        $params->setAttributes($data);
        
        if( ! $manager->editWorkflowStep($params)) {
            return Js::error($manager->getErrorMessage());
        }
        $this->setActionLog();
        return Js::locate(
            route('workflow.step.index', ['id' => $workflowId]),
            'parent'
        );
    }

    /**
     * 删除工作流步骤
     *
     * @access public
     */
    public function delete(Process $manager)
    {
        $id = array_map('intval', (array) Request::input('id'));
        $info = $manager->workflowStepInfos(['ids' => $id]);

        if($manager->deleteWorkflowStep(['ids' => $id])) {
            $this->setActionLog(['workflowStepInfo' => $info]);
            return responseJson(Lang::get('common.action_success'), true);
        }
        return responseJson($manager->getErrorMessage());
    }

    /**
     * 设置关联人员
     *
     * @access public
     */
    public function relation(Process $manager)
    {
        if(Request::method() == 'POST') return $this->setRelation();

        $stepId = (int) Request::input('stepid');
        $workflowId = (int) Request::input('workflow_id');

        if( ! $stepId or ! $workflowId) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        $info = $manager->workflowStepInfo(['id' => $stepId]);

        if(empty($info) or $info['workflow_id'] != $workflowId) {
            return Js::error(Lang::get('common.illegal_operation'), true);
        }

        $userList = with(new \App\Services\Admin\User\Process())->getWorkflowUser(['nums' => 30]);
        $page = $userList->setPath('')->appends(Request::all())->render();
        $hasRelationUser = $manager->hasRelationUser($stepId);

        foreach($userList as $key => $val) {
            if(in_array($val['id'], $hasRelationUser)) $userList[$key]['selected'] = true;
            else $userList[$key]['selected'] = false;
        }
        
        return view('admin.workflow_step.relation',
            compact('page', 'stepId', 'workflowId', 'info', 'userList')
        );
    }

    /**
     * 设置审核步骤与用户的关联
     *
     * @access private
     */
    private function setRelation()
    {
        $this->checkFormHash();

        $stepId = (int) Request::input('stepId');
        $workflowId = (int) Request::input('workflowId');
        $userIds = Request::input('ids');

        if( ! $stepId or ! $workflowId or ! is_array($userIds)) {
            return Js::error(Lang::get('common.illegal_operation'));
        }

        $userIds = array_map('intval', $userIds);
        $manager = new Process();
        $stepInfo = $manager->workflowStepInfo(['id' => $stepId]);

        if(empty($stepInfo)) {
            return Js::error(Lang::get('common.illegal_operation'));
        }

        if($manager->setRelation($workflowId, $stepId, $userIds)) {
            $this->setActionLog(['userIds' => $userIds, 'stepInfo' => $stepInfo]);
            return Js::alert(Lang::get('common.action_success'));
        }
        
        return Js::error($manager->getErrorMessage());
    }


}