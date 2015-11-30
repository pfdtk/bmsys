<tr align="center">
  <td nowrap="nowrap"><input type="text" name="sort[<?php echo $value['id']; ?>]" value="<?php echo $value['category_sort']; ?>" style="width:50px;text-align:center;"></td>
  <td nowrap="nowrap" align="left" style="padding-left:30px;"><span style="color:#ccc;"><?php echo $prefix; ?></span><?php echo $value['category_name']; ?></td>
  <td nowrap="nowrap"><?php echo date('Y-m-d', $value['add_time']); ?></td>
  <td nowrap="nowrap"><?php echo date('Y-m-d', $value['update_time']); ?></td>
  <td nowrap="nowrap"><?php echo $value['category_status'] == 1 ? '启用' : '禁用'; ?></td>
  <td nowrap="nowrap" class="widget-acl">
    <?php $edit = widget('Admin.ShopCategory')->edit($value); echo $edit['html']; ?>
    <?php $delete = widget('Admin.ShopCategory')->delete($value); echo $delete['html']; ?>
    <?php if($edit['show'] or $delete['show']) \App\Services\Tmp::setTmp(); ?>
  </td>
</tr>