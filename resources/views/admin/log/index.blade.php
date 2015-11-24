<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<script type="text/javascript" src="<?php echo loadStatic('/weishop/js/laydate/laydate.js'); ?>"></script>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <strong>操作日志</strong>
  </div>
   
   <div>

    <div>
      <form method="get" action="" class="form-inline">
        <table class="table table-bordered">
          <tr>
          <td align="right" nowrap="nowrap" bgcolor="#f1f1f1">用户名：</td>
         <td> <input type="text" class="span1-3" value="<?php if(isset($data['username'])) echo $data['username']; ?>" name="username" /></td>

         <td  align="right" nowrap="nowrap" bgcolor="#f1f1f1">真实姓名：</td>
         <td ><input type="text" class="span1-3" value="<?php if(isset($data['realname'])) echo $data['realname']; ?>" name="realname" /></td>

         <td  align="right" nowrap="nowrap" bgcolor="#f1f1f1">开始时间：</td>
         <td ><input type="text"  class="laydate-icon span1-3" id="Calendar" value="<?php if(isset($data['timeFrom'])) echo $data['timeFrom']; ?>" name="time_from"  /></td>
         <td  align="right" nowrap="nowrap" bgcolor="#f1f1f1">到：</td>
         <td ><input type="text"  class="laydate-icon  span1-3" id="Calendar2" value="<?php if(isset($data['timeTo'])) echo $data['timeTo']; ?>" name="time_to"  /></td>
         </tr>
        </table>
           
           <table  class="margin-bottom-20 table  no-border" >
            <tr>
          <td class="text-center"><input type="submit" value="查询日志" class="btn btn-info " style="width:80px;" /></td>
         </tr>
     </table>
     </form>
    </div>

    <table class="table table-bordered table-striped table-hover">
     <tbody>
       <tr align="center">
         <td nowrap="nowrap"><strong>ID</strong></td>
         <td nowrap="nowrap"><strong>用户名</strong></td>
         <td nowrap="nowrap"><strong>真实姓名</strong></td>
         <td nowrap="nowrap"><strong>操作详情</strong></td>
         <td><strong>操作IP</strong></td>
         <td><strong>操作时间</strong></td>
         </tr>
         <?php foreach($list as $key => $value): ?>
            <tr align="center">
              <td nowrap="nowrap"><?php echo $value['id']; ?></td>
              <td nowrap="nowrap"><?php echo $value['username']; ?></td>
              <td nowrap="nowrap"><?php echo $value['realname']; ?></td>
              <td nowrap="nowrap"><?php echo $value['content']; ?></td>
              <td nowrap="nowrap"><?php echo $value['ip']; ?></td>
              <td nowrap="nowrap"><?php echo date('Y-m-d H', $value['add_time']); ?></td>
            </tr>
          <?php endforeach; ?>
     </tbody>
    </table>

    <div class="pagination"><?php echo $page; ?></div>
   </div>
  </div>     
</div>
<script type="text/javascript">
  !function(){
  laydate.skin('molv');
  laydate({elem: '#Calendar'});
  laydate.skin('molv');
  laydate({elem: '#Calendar2'});
  }();
</script>
<?php echo widget('Admin.Common')->footer(); ?>
<?php echo widget('Admin.Common')->htmlend(); ?>