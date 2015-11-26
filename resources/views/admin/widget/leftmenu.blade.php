<div class="left">
<script type="text/javascript" src="<?php echo loadStatic('/weishop/js/sdmenu.js'); ?>"></script>
<script type="text/javascript">
var myMenu;
window.onload = function() {
  myMenu = new SDMenu("my_menu");
  myMenu.init();
};

var leftMenu = new LeftMenuClick('left-menu-click');
leftMenu.init();
</script>

<div id="my_menu" class="sdmenu">
  <?php $son = App\Services\Admin\Tree::getSonKey(); ?>
  <?php foreach($menu as $key => $value): ?>
  <?php if(isset($value[$son])): ?>
  <div <?php if($key != 0) echo 'class="collapsed"'; ?>>
    <span><?php echo $value['name']; ?></span>
    <?php if(is_array($value[$son]) && !empty($value[$son])): ?>
    <?php foreach($value[$son] as $skey => $svalue): ?>
      <a class="left-menu-click" href="javascript:;" data-router="<?php echo route($svalue['module'].'.'.$svalue['class'].'.'.$svalue['action'], [], false); ?>" data-href="<?php echo route($svalue['module'].'.'.$svalue['class'].'.'.$svalue['action']); ?>" ><?php echo $svalue['name']; ?></a>
    <?php endforeach;?>
    <?php endif; ?>
  </div>
  <?php endif; ?>
  <?php endforeach;?>
</div>