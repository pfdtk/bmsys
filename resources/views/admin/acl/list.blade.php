<tr align="center">
  <td nowrap="nowrap"><input type="text" name="sort[<?php echo $value['id']; ?>]" value="<?php echo $value['sort']; ?>" style="width:50px;text-align:center;"></td>
  <td nowrap="nowrap" align="left" style="padding-left:30px;"><span style="color:#ccc;"><?php echo $prefix; ?></span><?php echo $value['name']; ?></td>
  <td nowrap="nowrap"><?php echo $value['module'].'-'.$value['class'].'-'.$value['action']; ?></td>
  <td nowrap="nowrap"><?php echo $value['display'] == 1 ? '是' : '否'; ?></td>
  <td nowrap="nowrap"><?php echo $value['mark']; ?></td>
  <td nowrap="nowrap">
    <?php echo widget('Admin.Acl')->edit($value); ?>
    <?php echo widget('Admin.Acl')->delete($value); ?>
  </td>
</tr>