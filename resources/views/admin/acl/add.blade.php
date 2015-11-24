<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <strong>功能管理</strong>
  </div>
   
  <div style="width:900px;margin:auto;">
    <form target="hiddenwin" method="post" action="<?php echo $formUrl; ?>">
      <table class="table table-bordered" >
        <tr>
          <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">功能名：</td>
          <td width="23%"><input type="text" value="<?php if(isset($permissionInfo['name'])) echo $permissionInfo['name']; ?>" name="data[name]" class="span1-3"  /></td>
          <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">模块名：</td>
          <td width="23%"><input type="text" value="<?php if(isset($permissionInfo['module'])) echo $permissionInfo['module']; ?>" name="data[module]" class="span1-3" placeholder="一般为子文件夹的名字" /></td>
          <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">类名：</td>
          <td><input type="text" value="<?php if(isset($permissionInfo['class'])) echo $permissionInfo['class']; ?>" name="data[class]" class="span1-3" placeholder="一般为Contrller的类名" /></td>
        </tr>
        <tr>
          <td align="right" nowrap="nowrap" bgcolor="#f1f1f1">函数名：</td>
          <td><input type="text" value="<?php if(isset($permissionInfo['action'])) echo $permissionInfo['action']; ?>" name="data[action]" class="span1-3" placeholder="一般为Contrller的函数名" /></td>
          <td align="right" nowrap="nowrap" bgcolor="#f1f1f1">父级功能：</td>
          <td>
            <select class="form-control" name="data[pid]">
              <option value="0">请选择父级功能</option>
              <?php echo $select;?>
            </select>
          </td>
          <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">是否显示为菜单：</td>
          <td>
            <input type="radio" id="genderm" <?php if(isset($permissionInfo['display']) && $permissionInfo['display'] == 1) echo 'checked="checked"'; ?> value="1" name="data[display]"> 是
            <input type="radio" id="genderf" <?php if(isset($permissionInfo['display']) && $permissionInfo['display'] == 0) echo 'checked="checked"'; ?> value="0" name="data[display]"> 否
          </td>
        </tr>

        <tr>
          <td align="right" nowrap="nowrap" bgcolor="#f1f1f1">备注：</td>
          <td colspan="5" nowrap="nowrap"><textarea name="data[mark]" rows="3" style="width:98%"><?php if(isset($permissionInfo['mark'])) echo $permissionInfo['mark']; ?></textarea></td>
          </tr>
      </table>
      <?php if(isset($id)): ?>
        <input name="data[id]" type="hidden" value="<?php echo $id;?>" />
      <?php endif; ?>
           
     <table  class="margin-bottom-20  table no-border" >
       <tr>
      <td class="text-center">
        <input type="submit" value="确定" class="btn btn-info  " style="width:80px;" />
        <?php echo widget('Admin.Common')->goBack(route('foundation.acl.index')); ?>
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