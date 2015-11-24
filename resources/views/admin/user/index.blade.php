<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <?php echo widget('Admin.User')->addUser(); ?>
    <strong>用户管理</strong>
  </div>
   
   <div>
    <table class="table table-bordered table-striped table-hover">
     <tbody>
       <tr align="center">
         <td nowrap="nowrap"><strong>ID</strong></td>
         <td nowrap="nowrap"><strong>真实姓名</strong></td>
         <td nowrap="nowrap"><strong>用户名</strong></td>
         <td nowrap="nowrap"><strong>用户组</strong></td>
         <td><strong>电话</strong></td>
         <td><strong>最后登录</strong></td>
         <td width="80" nowrap="nowrap"><strong> 操作 </strong></td>
         </tr>
         <?php foreach($userList as $key => $value): ?>
            <tr align="center">
              <td nowrap="nowrap"><?php echo $value['id']; ?></td>
              <td nowrap="nowrap"><?php echo $value['realname']; ?></td>
              <td nowrap="nowrap"><?php echo $value['name']; ?></td>
              <td nowrap="nowrap"><?php echo $value['group_name']; ?></td>
              <td nowrap="nowrap"><?php echo $value['mobile']; ?></td>
              <td nowrap="nowrap"><?php echo date('Y-m-d H', $value['last_login_time']); ?></td>
              <td nowrap="nowrap">
                <?php echo widget('Admin.User')->edit($value); ?>
                <?php echo widget('Admin.User')->acl($value); ?>
                <?php echo widget('Admin.User')->delete($value); ?>
              </td>
            </tr>
          <?php endforeach; ?>
     </tbody>
    </table>
    <div class="pagination"><?php echo $page; ?></div>
   </div>
  </div>     
</div>
<?php echo widget('Admin.Common')->footer(); ?>
<?php echo widget('Admin.Common')->htmlend(); ?>