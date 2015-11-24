<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <strong>功能示例</strong>
  </div>

  <!-- 上传的示例 -->
    上传的示例：<?php echo widget('Admin.Upload')->setConfig(['id' => 'id', 'callback' => 'returnUpload', 'thumbSetting' => [['width' => 50, 'height' => 50],['width' => 70, 'height' => 70]], 'waterSetting' => true ])->uploadButton();?>
    <script type="text/javascript">
        //示例的回调函数
        function returnUpload(uploadid, itemId) {
            var $dialog_id = uploadid;
            var $response = $(".upload-reponse", window.top.frames[$dialog_id].document);
            alert($response.val());
        }
    </script>
   
  </div>     
</div>
<?php echo widget('Admin.Common')->footer(); ?>
<?php echo widget('Admin.Common')->htmlend(); ?>