<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <strong>功能示例</strong>
  </div>

  <div id="res"></div>

  <!-- 上传的示例 -->
    上传的示例：<?php echo widget('Admin.Upload')->setConfig(['id' => 'id', 'nums' => '100', 'callback' => 'returnUpload', 'thumbSetting' => [['width' => 150, 'height' => 150],['width' => 170, 'height' => 170]], 'waterSetting' => true ])->uploadButton();?>
    <script type="text/javascript">
        //示例的回调函数
        function returnUpload(uploadid, itemId) {
            var $dialog_id = uploadid;
            var $response = $(".tab-pane:visible .upload-reponse", window.top.frames[$dialog_id].document);

            $response.each(function(){
              console.log($(this).val());
              $('#res').append($(this).val());
            });
        }
    </script>
   
  </div>     
</div>
<?php echo widget('Admin.Common')->footer(); ?>
<?php echo widget('Admin.Common')->htmlend(); ?>