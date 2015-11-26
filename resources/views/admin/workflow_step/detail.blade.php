<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <?php echo widget('Admin.WorkflowStep')->addWorkflowStep(); ?>
    <strong>工作流步骤管理</strong>
  </div>
   
   <div>
    <table class="table table-bordered table-striped table-hover">
     <tbody>
       <tr align="center">
         <?php $isTier = ($workflowInfo['type'] == App\Models\Admin\Workflow::W_TYPE_TIER); ?>
          <?php if($isTier): ?>
            <td nowrap="nowrap">审核步骤</td>
          <?php else: ?>
            <td nowrap="nowrap">调用代码(<a href="#" title="主要用于接口调用">?</a>)</td>
          <?php endif; ?>
         <td nowrap="nowrap"><strong>工作流步骤名字</strong></td>
         <td nowrap="nowrap"><strong>关联人员</strong></td>
         <td nowrap="nowrap"><strong>备注</strong></td>
         <td nowrap="nowrap"><strong>增加时间</strong></td>
         <td width="80" nowrap="nowrap" class="widget-acl"><strong>操作</strong></td>
         </tr>
         <?php foreach($list as $key => $value): ?>
            <tr align="center">
              <?php if($isTier): ?>
                <td nowrap="nowrap">第<?php echo $value['step_level']; ?>步</td>
              <?php else: ?>
                <td nowrap="nowrap"><?php echo $value['code']; ?></td>
              <?php endif; ?>
              <td nowrap="nowrap"><?php echo $value['name']; ?></td>
              <td nowrap="nowrap"><?php echo $value['relatioin_users']; ?></td>
              <td nowrap="nowrap"><?php echo $value['description']; ?></td>
              <td nowrap="nowrap"><?php echo date('Y-m-d', $value['addtime']); ?></td>
              <td nowrap="nowrap" class="widget-acl">
                <?php $relation = widget('Admin.WorkflowStep')->relation($value); echo $relation['html']; ?>
                <?php $edit = widget('Admin.WorkflowStep')->edit($value); echo $edit['html']; ?>
                <?php $delete = widget('Admin.WorkflowStep')->delete($value); echo $delete['html']; ?>
                <?php if($relation['show'] or $edit['show'] or $delete['show']) $showAction = true; ?>
              </td>
            </tr>
          <?php endforeach; ?>
     </tbody>
    </table>
    <div class="pagination"><?php echo $page; ?></div>
    <?php if( ! isset($showAction)): ?>
      <style type="text/css">
       .widget-acl { display: none; }
      </style>
    <?php endif; ?>
   </div>
  </div>     
</div>
<?php echo widget('Admin.Common')->footer(); ?>
<?php echo widget('Admin.Common')->htmlend(); ?>