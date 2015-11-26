<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <?php echo widget('Admin.Group')->addGroup(); ?>
    <strong>用户组管理</strong>
  </div>
   
   <div>
    <table class="table table-bordered table-striped table-hover">
     <tbody>
       <tr align="center">
         <td nowrap="nowrap"><strong>ID</strong></td>
         <td nowrap="nowrap"><strong>用户组名</strong></td>
         <td nowrap="nowrap"><strong>备注</strong></td>
         <td nowrap="nowrap"><strong>状态</strong></td>
         <td width="80" nowrap="nowrap" class="widget-acl"><strong> 操作 </strong></td>
         </tr>
         <?php foreach($grouplist as $key => $value): ?>
            <tr align="center">
              <td nowrap="nowrap"><?php echo $value['id']; ?></td>
              <td nowrap="nowrap"><?php echo $value['group_name']; ?></td>
              <td nowrap="nowrap"><?php echo $value['mark']; ?></td>
              <td nowrap="nowrap"><?php echo $value['status'] == 1 ? '正常' : '禁用'; ?></td>
              <td nowrap="nowrap" class="widget-acl">
                <?php $edit = widget('Admin.Group')->edit($value); echo $edit['html']; ?>
                <?php $acl = widget('Admin.Group')->acl($value); echo $acl['html']; ?>
                <?php $delete = widget('Admin.Group')->delete($value); echo $delete['html']; ?>
                <?php if($edit['show'] or $acl['show'] or $delete['show']) $showAction = true; ?>
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