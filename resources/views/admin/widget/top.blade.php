<div class="header">
   <div class="logo">微店管理系统</div>
     
   <div class="header-right">
     
     <i class="icon-user icon-white"></i> <a href="#"><?php echo $username; ?></a> 
     <i class="icon-edit icon-white"></i> <a href="javascript:;" data-dialog-id="modify-password" class="modify-password">修改密码</a> 
     <i class="icon-off icon-white"></i> <a id="modal-973558" href="<?php echo route('foundation.login.out'); ?>" role="button" >注销</a> 
   </div>
</div>
<?php echo widget('Admin.Common')->mpassword(); ?>
<!-- 顶部 --> 