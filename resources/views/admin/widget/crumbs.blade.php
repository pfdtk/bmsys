<ul class="breadcrumb">当前位置：
  首页
  <?php if( ! empty($topMenu) and isset($topMenu['name'])): ?>
  <span class="divider">/</span>
  <?php echo $topMenu['name']; ?>
  <?php endif; ?>
  <?php if( ! empty($currentMCAinfo) and isset($currentMCAinfo['name'])): ?>
  <span class="divider">/</span>
  <?php echo $currentMCAinfo['name']; ?>
  <?php endif; ?>
</ul>