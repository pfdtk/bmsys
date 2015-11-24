<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <strong>用户管理</strong>
  </div>
   
  <div style="width:900px;margin:auto;">
    <form target="hiddenwin" method="post" action="<?php echo $formUrl; ?>">
      <table class="table table-bordered" >
        <tr>
          <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">用户名：</td>
          <td width="23%"><input <?php if(isset($id)) echo 'readonly'; ?> type="text" name="data[name]" value="<?php if(isset($userInfo['name'])) echo $userInfo['name']; ?>" class="span1-3"  /></td>
          <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">真实姓名：</td>
          <td width="23%"><input type="text" value="<?php if(isset($userInfo['realname'])) echo $userInfo['realname']; ?>" name="data[realname]" class="span1-3" /></td>
          <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">密码：</td>
          <td><input type="password" value="" name="data[password]" class="span1-3"  /></td>
        </tr>
        <tr>
          <td align="right" nowrap="nowrap" bgcolor="#f1f1f1">电话：</td>
          <td><input type="text" value="<?php if(isset($userInfo['mobile'])) echo $userInfo['mobile']; ?>" name="data[mobile]" class="span1-3"  /></td>
          <td align="right" nowrap="nowrap" bgcolor="#f1f1f1">用户组：</td>
          <td colspan="3">
            <select name="data[group_id]" id="DropDownTimezone">
              <?php if(isset($groupList) and is_array($groupList)): ?>
                <?php foreach($groupList as $key => $value): ?>
                    <option value="<?php echo $value['id'];?>" <?php if(isset($userInfo['group_id']) && $userInfo['group_id'] == $value['id']) echo 'selected'; ?>><?php echo $value['group_name'];?></option>
                <?php endforeach; ?>
              <?php endif;?>
            </select>
          </td>
        </tr>

        <tr>
          <td align="right" nowrap="nowrap" bgcolor="#f1f1f1">备注：</td>
          <td colspan="5" nowrap="nowrap"><textarea name="data[mark]" rows="3" style="width:98%"><?php if(isset($userInfo['mark'])) echo $userInfo['mark']; ?></textarea></td>
          </tr>
      </table>
      <?php if(isset($id)): ?>
        <input name="data[id]" type="hidden" value="<?php echo $id;?>" />
      <?php endif; ?>
           
     <table  class="margin-bottom-20  table no-border" >
       <tr>
      <td class="text-center">
        <input type="submit" value="确定" class="btn btn-info  " style="width:80px;" />
        <?php echo widget('Admin.Common')->goBack(route('foundation.user.index')); ?>
      </td>
     </tr>
    </table>
    </form>
      <div class="alert"> 
      <button type="button" class="close" data-dismiss="alert">&times;</button>
      温馨提示：全部项目必填 
       </div>
   
   </div>  
  </div>     
</div>
<?php echo widget('Admin.Common')->footer(); ?>
<?php echo widget('Admin.Common')->htmlend(); ?>