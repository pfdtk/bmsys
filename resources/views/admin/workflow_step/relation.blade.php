<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <strong>工作流步骤管理</strong>
  </div>
   
   <div>

    <div id="featurebar">
      <ul class="nav">
        <li class="active">
          设置关联人员：<?php if(isset($info['name'])) echo $info['name']; ?>
        </li>
      </ul>
    </div>
    <form id="listForm" target="hiddenwin" method="post" action="<?php echo route('workflow.step.relation');?>">
    <table class="table table-bordered table-striped table-hover">
     <tbody>
       <tr align="center">
         <td nowrap="nowrap"><strong>选择</strong></td>
         <td nowrap="nowrap"><strong>真实姓名</strong></td>
         <td nowrap="nowrap"><strong>用户名</strong></td>
         <td nowrap="nowrap"><strong>电话</strong></td>
         </tr>
         <?php foreach($userList as $key => $value): ?>
            <tr align="center">
              <td nowrap="nowrap"><input type="checkbox" name="ids[]" class="ids" value="<?php echo $value['id']; ?>" <?php if($value['selected']) echo 'checked'; ?> ></td>
              <td nowrap="nowrap"><?php echo $value['realname']; ?></td>
              <td nowrap="nowrap"><?php echo $value['name']; ?></td>
              <td nowrap="nowrap"><?php echo $value['mobile']; ?></td>
            </tr>
          <?php endforeach; ?>
     </tbody>
    </table>
    <input type="hidden" name="stepId" value="<?php echo $stepId; ?>" >
    <input type="hidden" name="workflowId" value="<?php echo $workflowId; ?>" >
    <input type="hidden" name="_form_hash" value="<?php echo form_hash([ 'stepId' => $stepId, 'workflowId' => $workflowId ]); ?>" />
    <?php echo widget('Admin.WorkflowStep')->selected(); ?>
    <?php echo widget('Admin.Common')->goBack(route('workflow.step.index', ['id' => $workflowId])); ?>
    </form>
    <div class="pagination"><?php echo $page; ?></div>
   </div>
  </div>     
</div>
<?php echo widget('Admin.Common')->footer(); ?>
<?php echo widget('Admin.Common')->htmlend(); ?>