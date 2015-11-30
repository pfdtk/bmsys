<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<script type="text/javascript" src="<?php echo loadStatic('/weishop/js/laydate/laydate.js'); ?>"></script>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <?php echo widget('Admin.ShopCategory')->addShopCategory(); ?>
    <strong>店铺分类管理</strong>
  </div>
   
   <div>
      <div id="featurebar">
        <ul class="nav">
          <li class="active">
            <a href="<?php echo route('shop.category.index', ['category_pid' => 'all' ]); ?>">所有分类</a>
          </li>
          <?php
            $son = App\Services\Admin\Tree::getSonKey();
            foreach($list as $key => $value):
              if( ! isset($value[$son])) continue;
                          
          ?>
            <li class="active">
              <a <?php if($categoryPid == $value['id']) echo 'style="background: #ddd; color: #333"'; ?> href="<?php echo route('shop.category.index', ['category_pid' => $value['id'] ]); ?>"><?php echo $value['category_name']; ?></a>
            </li>
          <?php
            endforeach;
          ?>
        </ul>
      </div>

      <form id="aclListForm" target="hiddenwin" method="post" action="<?php echo route('shop.category.sort');?>">
        <table class="table table-bordered table-striped table-hover">
         <tbody>
           <tr align="center">
             <td nowrap="nowrap"><strong>排序</strong></td>
             <td nowrap="nowrap"><strong>分类名字</strong></td>
             <td nowrap="nowrap"><strong>创建时间</strong></td>
             <td nowrap="nowrap"><strong>修改时间</strong></td>
             <td nowrap="nowrap"><strong>状态</strong></td>
             <td width="80" nowrap="nowrap" class="widget-acl"><strong> 操作 </strong></td>
             </tr>

             <?php echo widget('Admin.ShopCategory')->categoryList($list, $categoryPid); ?>

         </tbody>
        </table>

        <?php echo widget('Admin.ShopCategory')->sort(); ?>
        </form>
        <?php if( ! \App\Services\Tmp::getTmp()): ?>
          <style type="text/css">
           .widget-acl { display: none; }
          </style>
        <?php endif; ?>
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