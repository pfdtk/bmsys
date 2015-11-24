<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->top(); ?>
<style type="text/css">
	html, body { padding: 0px!important; padding: 100px 0px; min-width: 1024px; height: 100%; overflow: auto; }
	.header, #middle { min-width: 1024px;}
</style>
            
<div id="middle">
  <?php echo widget('Admin.Menu')->leftMenu(); ?>
</div>
<div class="Switch" title="ctrl+z试试"></div>
<script type="text/javascript">
$(document).ready(function(e) {
    $(".Switch").click(function(){
    $(".left").toggle();
  });
});
</script>

 <div class="right"  id="mainFrame">
 <iframe name="right" id="rightMain" src="" frameborder="false" scrolling="auto" style="border:none" width="100%" height="99%" allowtransparency="true"></iframe>
 </div>
</div>
    
<!-- 底部 -->
<div id="footer"></div>
    
<script src="<?php echo loadStatic('/weishop/js/blockui.js'); ?>" type="text/javascript"></script>
<!-- 弹出窗口 -->
<link rel="stylesheet" href="<?php echo loadStatic('/weishop/js/artdialog/css/ui-dialog.css'); ?>">
<script src="<?php echo loadStatic('/weishop/js/artdialog/dist/dialog-plus-min.js'); ?>"></script>
<script src="<?php echo loadStatic('/weishop/js/common.js'); ?>" type="text/javascript"></script>
 
</body>
</html>