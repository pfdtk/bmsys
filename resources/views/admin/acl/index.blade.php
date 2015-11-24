<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <?php echo widget('Admin.Acl')->addAcl(); ?>
    <strong>功能管理</strong>
  </div>
   
   <div>

    <div id="featurebar">
      <ul class="nav">
        <li class="active">
          <a href="<?php echo route('foundation.acl.index', ['pid' => 'all' ]); ?>">所有功能</a>
        </li>
        <?php
          $son = App\Services\Admin\Tree::getSonKey();
          $all = array();
          foreach($list as $key => $value):
            if( ! isset($value[$son])) continue;
                        
        ?>
              <li class="active">
                <a <?php if($pid == $value['id']) echo 'style="background: #ddd; color: #333"'; ?> href="<?php echo route('foundation.acl.index', ['pid' => $value['id'] ]); ?>"><?php echo $value['name']; ?></a>
              </li>
        <?php
          endforeach;
        ?>
      </ul>
    </div>
    <form id="aclListForm" target="hiddenwin" method="post" action="<?php echo route('foundation.acl.sort');?>">
    <table class="table table-bordered table-striped table-hover">
     <tbody>
       <tr align="center">
         <td nowrap="nowrap"><strong>排序</strong></td>
         <td nowrap="nowrap"><strong>功能名字</strong></td>
         <td nowrap="nowrap"><strong>功能代码</strong></td>
         <td nowrap="nowrap"><strong>显示为菜单</strong></td>
         <td nowrap="nowrap"><strong>备注</strong></td>
         <td width="80" nowrap="nowrap"><strong> 操作 </strong></td>
         </tr>

         <?php echo widget('Admin.Acl')->acllist($list, $pid); ?>

     </tbody>
    </table>

    <?php echo widget('Admin.Acl')->sort(); ?>
    </form>
   </div>
  </div>     
</div>
<?php echo widget('Admin.Common')->footer(); ?>
<?php echo widget('Admin.Common')->htmlend(); ?>