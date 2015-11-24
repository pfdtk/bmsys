<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <strong>工作流步骤管理</strong>
  </div>
   
  <div style="width:900px;margin:auto;">
    <form target="hiddenwin" method="post" action="<?php echo $formUrl; ?>">
      <table class="table table-bordered" >
        <tr>
          <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">工作流步骤名字：</td>
          <td width="23%"><input type="text" value="<?php if(isset($info['name'])) echo $info['name']; ?>" name="data[name]" class="span1-3"  /></td>
          <?php $isTier = ($workflowInfo['type'] == App\Models\Admin\Workflow::W_TYPE_TIER); ?>
          <?php if($isTier): ?>
          <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">工作流步骤：</td>
          <td>
            <select name="data[step_level]" id="DropDownTimezone" class="form-control">
              <?php if(isset($stepList) and is_array($stepList)): ?>
                <?php foreach($stepList as $key => $value): ?>
                    <option value="<?php echo $value['step_level'];?>" <?php if(isset($info['step_level']) && $info['step_level'] == $value['step_level']) echo 'selected'; ?>><?php echo $value['title'];?></option>
                <?php endforeach; ?>
              <?php endif;?>
            </select>
          </td>
          <?php else: ?>
            <td width="10%" align="right" nowrap="nowrap" bgcolor="#f1f1f1">调用代码：</td>
            <td><input type="text" placeholder="建议格式：W_xxx" value="<?php if(isset($info['code'])) echo $info['code']; ?>" name="data[code]" <?php if(isset($stepId)): ?>readonly<?php endif; ?> class="span1-3"  /></td>
          <?php endif; ?>
        </tr>
        <tr>
          <td align="right" nowrap="nowrap" bgcolor="#f1f1f1">备注：</td>
          <td colspan="3" nowrap="nowrap"><textarea name="data[description]" rows="3" style="width:98%"><?php if(isset($info['description'])) echo $info['description']; ?></textarea></td>
          </tr>
      </table>
      <?php if(isset($workflowId)): ?>
        <input name="workflow_id" type="hidden" value="<?php echo $workflowId;?>" />
        <input type="hidden" name="_form_hash" value="<?php echo form_hash([ 'workflow_id' => $workflowId ]); ?>" />
      <?php endif; ?>
      <?php if(isset($stepId, $workflow_Id)): ?>
        <input name="workflow_step_id" type="hidden" value="<?php echo $stepId;?>" />
        <input name="workflow_id" type="hidden" value="<?php echo $workflow_Id;?>" />
        <input type="hidden" name="_form_hash" value="<?php echo form_hash([ 'workflow_step_id' => $stepId, 'workflow_id' => $workflow_Id ]); ?>" />
      <?php endif; ?>
           
     <table  class="margin-bottom-20  table no-border" >
       <tr>
      <td class="text-center">
        <input type="submit" value="确定" class="btn btn-info  " style="width:80px;" />
        <?php $wid = isset($workflowId) ? $workflowId : $workflow_Id; ?>
        <?php echo widget('Admin.Common')->goBack(route('workflow.step.index', ['id' => $wid])); ?>
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