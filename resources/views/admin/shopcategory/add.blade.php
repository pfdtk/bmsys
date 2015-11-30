<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <strong>店铺分类管理</strong>
  </div>
   
  <div style="width:900px;margin:auto;">
    <form target="hiddenwin" method="post" action="<?php echo $formUrl; ?>">
      <table class="table table-bordered" >
        <tr>
          <td align="right" nowrap="nowrap" bgcolor="#f1f1f1">分类名：</td>
          <td><input type="text" value="<?php if(isset($info['category_name'])) echo $info['category_name']; ?>" name="data[category_name]" class="span1-3" /></td>
          <td align="right" nowrap="nowrap" bgcolor="#f1f1f1">父级分类：</td>
          <td>
            <select class="form-control" name="data[category_pid]">
              <option value="0">请选择父级分类</option>
              <?php echo $select;?>
            </select>
          </td>
          <td align="right" nowrap="nowrap" bgcolor="#f1f1f1">排序：</td>
          <td>
            <input type="text" value="<?php if(isset($info['category_sort'])) echo $info['category_sort']; ?>" name="data[category_sort]" class="span1-1" />
          </td>
          <td align="right" nowrap="nowrap" bgcolor="#f1f1f1">状态：</td>
          <td>
            <input type="radio" id="genderm" <?php if(isset($info['category_status']) && $info['category_status'] == 1) echo 'checked="checked"'; ?> value="1" name="data[category_status]"> 启用
            <input type="radio" id="genderf" <?php if(isset($info['category_status']) && $info['category_status'] == 0) echo 'checked="checked"'; ?> value="0" name="data[category_status]"> 禁用
          </td>
        </tr>

      </table>
      <?php if(isset($id)): ?>
        <input name="data[category_id]" type="hidden" value="<?php echo $id;?>" />
      <?php endif; ?>
           
     <table  class="margin-bottom-20  table no-border" >
       <tr>
      <td class="text-center">
        <input type="submit" value="确定" class="btn btn-info  " style="width:80px;" />
        <?php echo widget('Admin.Common')->goBack(route('shop.category.index')); ?>
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