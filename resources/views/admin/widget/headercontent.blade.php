<script src="<?php echo loadStatic('/weishop/js/common.content.js'); ?>" type="text/javascript"></script>
<script type="text/javascript">
  if(window == window.top) {
    window.location.href = '/';
  }
  $(document).ready(function() {
    window.top.org.Common.unloading();
  });
</script>