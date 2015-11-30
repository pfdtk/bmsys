<ul class="breadcrumb">当前位置：
  首页
  <?php if(is_array($topMenu)): ?>
  	<?php foreach($topMenu as $key => $value): ?>
  		<span class="divider">/</span>
  		<?php echo $value['name']; ?>
  	<?php endforeach; ?>
  <?php endif; ?>

  <?php if( ! empty($currentMCAinfo) and isset($currentMCAinfo['name'])): ?>
  <span class="divider">/</span>
  <?php echo $currentMCAinfo['name']; ?>
  <?php endif; ?>
</ul>