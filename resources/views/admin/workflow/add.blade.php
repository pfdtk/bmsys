<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <strong>工作流管理</strong>
  </div>
   
  <div style="width:900px;margin:auto;">
    <form target="hiddenwin" method="post" action="<?php echo $formUrl; ?>">
      <table class="table table-bordered" >
        <tr>
          <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">工作流名字：</td>
          <td width="23%"><input type="text" value="<?php if(isset($info['name'])) echo $info['name']; ?>" name="data[name]" class="span1-3"  /></td>
          <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">调用代码：</td>
          <td width="23%"><input type="text" placeholder="建议格式：W_xxx" value="<?php if(isset($info['code'])) echo $info['code']; ?>" name="data[code]" <?php if(isset($id)): ?>readonly<?php endif; ?> class="span1-3"  /></td>
          <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">工作流类型：</td>
          <td>
            <select name="data[type]" class="form-control">
              <option value="1" <?php if(isset($info['type']) && $info['type'] == 1) echo 'selected'; ?>>多层级审核</option>
              <option value="2" <?php if(isset($info['type']) && $info['type'] == 2) echo 'selected'; ?>>辅助权限</option>
            </select>
          </td>
        </tr>
        <tr>
          <td align="right" nowrap="nowrap" bgcolor="#f1f1f1">备注：</td>
          <td colspan="5" nowrap="nowrap"><textarea name="data[description]" rows="3" style="width:98%"><?php if(isset($info['description'])) echo $info['description']; ?></textarea></td>
          </tr>
      </table>
      <?php if(isset($id)): ?>
        <input name="data[id]" type="hidden" value="<?php echo $id;?>" />
      <?php endif; ?>
           
     <table  class="margin-bottom-20  table no-border" >
       <tr>
      <td class="text-center">
        <input type="submit" value="确定" class="btn btn-info  " style="width:80px;" />
        <?php echo widget('Admin.Common')->goBack(route('workflow.index.index')); ?>
      </td>
     </tr>
    </table>
    </form>
      <div class="alert"> 
      <button type="button" class="close" data-dismiss="alert">&times;</button>
      温馨提示：全部项目必填，调用代码用于程序结合的调用，请保持唯一性，一但确定不要更改。
       </div>
   
   </div>  
  </div>     
</div>
<?php echo widget('Admin.Common')->footer(); ?>
<?php echo widget('Admin.Common')->htmlend(); ?>