<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <?php echo widget('Admin.Workflow')->addWorkflow(); ?>
    <strong>工作流管理</strong>
  </div>
   
   <div>
    <table class="table table-bordered table-striped table-hover">
     <tbody>
       <tr align="center">
         <td nowrap="nowrap"><strong>调用代码(<a href="#" title="主要用于接口调用">?</a>)</strong></td>
         <td nowrap="nowrap"><strong>类型(<a href="#" title="主要分为：1）多层级审核，即多人同时参与的层级审核，低等级的用户审核通过后会提交给高等级人用户审核。2）辅助权限，当普通的用户权限管理不能满足时，它可以用来处理更细化的权限管理需求。和普通的用户权限结合成多级权限管理。">?</a>)</strong></td>
         <td nowrap="nowrap"><strong>工作流名字</strong></td>
         <td nowrap="nowrap"><strong>备注</strong></td>
         <td><strong>增加时间</strong></td>
         <td width="80" nowrap="nowrap" class="widget-acl"><strong>详情</strong></td>
         </tr>
         <?php foreach($list as $key => $value): ?>
            <tr align="center">
              <td nowrap="nowrap"><?php echo $value['code']; ?></td>
              <td nowrap="nowrap"><?php echo $value['type'] == App\Models\Admin\Workflow::W_TYPE_TIER ? '多层级审核' : '辅助权限'; ?></td>
              <td nowrap="nowrap"><?php echo $value['name']; ?></td>
              <td nowrap="nowrap"><?php echo $value['description']; ?></td>
              <td nowrap="nowrap"><?php echo date('Y-m-d', $value['addtime']); ?></td>
              <td nowrap="nowrap" class="widget-acl">
                <?php $edit = widget('Admin.Workflow')->edit($value); echo $edit['html']; ?>
                <?php $detail = widget('Admin.Workflow')->detail($value); echo $detail['html']; ?>
                <?php $delete = widget('Admin.Workflow')->delete($value); echo $delete['html']; ?>
                <?php if($edit['show'] or $detail['show'] or $delete['show']) $showAction = true; ?>
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