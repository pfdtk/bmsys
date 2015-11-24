<?php namespace App\Http\Controllers\Admin\Workflow;

use App\Http\Controllers\Admin\Controller;
use App\Services\Admin\Workflow\Process;
use App\Services\Admin\Workflow\Param\WorkflowSave;
use App\Libraries\Js;
use Request, Lang;

/**
 * 工作流
 *
 * @author jiang <mylampblog@163.com>
 */
class IndexController extends Controller
{
    /**
     * 工作流管理
     */
    public function index(Process $process)
    {
        $list = $process->workflowInfos();
        $page = $list->setPath('')->appends(Request::all())->render();
        return view('admin.workflow.index', compact('list', 'page'));
    }

    /**
     * 增加新的工作流
     */
    public function add()
    {
        if(Request::method() == 'POST') return $this->addWorkflow();
        $formUrl = route('workflow.index.add');
        return view('admin.workflow.add', compact('formUrl'));
    }

    /**
     * 增加工作流入库处理
     *
     * @access private
     */
    private function addWorkflow()
    {
        $data = (array) Request::input('data');
        $data['addtime'] = time();

        $params = new WorkflowSave();
        $manager = new Process();
        $params->setAttributes($data);
        
        if($manager->addWorkflow($params) === false) {
            return Js::error($manager->getErrorMessage());
        }
        $this->setActionLog();
        return Js::locate(
            route('workflow.index.index'),
            'parent'
        );
    }

    /**
     * 编辑工作流
     *
     * @access public
     */
    public function edit(Process $process)
    {
        if(Request::method() == 'POST') return $this->updateWorkflow();

        $id = (int) Request::input('id');
        $info = $process->workflowInfo(['id' => $id]);

        if(empty($info)) {
            return Js::error(Lang::get('workflow.workflow_not_found'));
        }

        $formUrl = route('workflow.index.edit');

        return view('admin.workflow.add',
            compact('info', 'formUrl', 'id')
        );
    }
    
    /**
     * 编辑工作流入库处理
     *
     * @access private
     */
    private function updateWorkflow()
    {
        $params = new WorkflowSave();
        $manager = new Process();

        $params->setAttributes((array) Request::input('data'));
        
        if( ! $manager->editWorkflow($params)) {
            return Js::error($manager->getErrorMessage());
        }
        $this->setActionLog();
        return Js::locate(
            route('workflow.index.index'),
            'parent'
        );        
    }

    /**
     * 删除工作流
     *
     * @access public
     */
    public function delete(Process $manager)
    {
        $id = array_map('intval', (array) Request::input('id'));
        $info = $manager->workflowInfos(['ids' => $id]);

        if( ! $manager->deleteWorkflow(['ids' => $id])) {
            return responseJson($manager->getErrorMessage());
        }

        $this->setActionLog(['workflowInfo' => $info]);
        return responseJson(
            Lang::get('common.action_success'),
            true
        );
    }


}