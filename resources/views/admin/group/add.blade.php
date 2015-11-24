<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <strong>用户组管理</strong>
  </div>
   
  <div style="width:900px;margin:auto;">
    <form target="hiddenwin" method="post" action="<?php echo $formUrl; ?>">
      <table class="table table-bordered" >
        <tr>
          <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">用户组名：</td>
          <td width="23%"><input type="text" value="<?php if(isset($groupInfo['group_name'])) echo $groupInfo['group_name']; ?>" name="data[group_name]" class="span1-3"  /></td>
          <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">用户组等级：</td>
          <td width="23%"><input type="text" value="<?php if(isset($groupInfo['level'])) echo $groupInfo['level']; ?>" name="data[level]" class="span1-3" placeholder="请输入数字" /></td>
        </tr>
        <tr>
          <td align="right" nowrap="nowrap" bgcolor="#f1f1f1">备注：</td>
          <td colspan="3" nowrap="nowrap"><textarea name="data[mark]" rows="3" style="width:98%"><?php if(isset($groupInfo['mark'])) echo $groupInfo['mark']; ?></textarea></td>
        </tr>
      </table>
      <?php if(isset($id)): ?>
        <input name="data[id]" type="hidden" value="<?php echo $id;?>" />
      <?php endif; ?>
           
     <table  class="margin-bottom-20  table no-border" >
       <tr>
      <td class="text-center">
        <input type="submit" value="确定" class="btn btn-info  " style="width:80px;" />
        <?php echo widget('Admin.Common')->goBack(route('foundation.group.index')); ?>
      </td>
     </tr>
    </table>
    </form>
      <div class="alert"> 
      <button type="button" class="close" data-dismiss="alert">&times;</button>
      温馨提示：全部项目必填。用户组等级请输入数字，数字越大，等级越小。
       </div>
   
   </div>  
  </div>     
</div>
<?php echo widget('Admin.Common')->footer(); ?>
<?php echo widget('Admin.Common')->htmlend(); ?>