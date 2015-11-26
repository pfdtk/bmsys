<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <?php //echo widget('Admin.Workflow')->addWorkflow(); ?>
    <strong>商口管理</strong>
  </div>
   
   <div>
    <div class="pagination"><?php //echo $page; ?></div>
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