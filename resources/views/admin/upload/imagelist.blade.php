<?php echo widget('Admin.Common')->header(); ?>
<link rel="stylesheet" type="text/css" href="<?php echo loadStatic('/weishop/js/webuploader/webuploader.css'); ?>">
<script type="text/javascript" src="<?php echo loadStatic('/weishop/js/laydate/laydate.js'); ?>"></script>
  <style type="text/css">
    body {background: none;}
    .imageslist {border: 1px solid #ddd; height: 220px; padding: 5px; overflow-y:auto; }
    .image-list-search {margin-bottom: 15px;}
    .images-list-img {width: 100px; height: 100px; cursor: pointer;}
    .pagination ul {margin-top: 10px;}
    .thumbnail:hover {border: 1px solid red;}
    .thumbnail-red {border: 1px solid red;}
    .none {display: none;}
  </style>

  <div class="main-content">
    <div id="sys-list">
      <form method="get" action="" class="form-inline">
        <div class="image-list-search">
          名称：<input type="text" class="span1-3" value="<?php if(isset($data['keyword'])) echo $data['keyword']; ?>" name="keyword" />
          日期：<input type="text"  class="laydate-icon span1-3" id="Calendar" value="<?php if(isset($data['time'])) echo $data['time']; ?>" name="time"  />
          <input type="submit" value="查询" class="btn btn-info " style="padding:2px 15px;" />
        </div>
        <div class="imageslist" id="uploader-comtainer">
            <div class="uploader-list" id="fileList">
            <?php foreach($list as $key => $value): ?>
              <div title="<?php echo $value['filename']; ?>" class="file-item thumbnail">
                <img class="images-list-img" data-file="<?php echo $value['filepath']; ?>" src="<?php echo Config::get('sys.sys_images_domain').'/'.$value['filepath']; ?>">
                <div class="web-upload-remove web-upload-check none" title="已选择"><i class="icon-ok"></i></div>
              </div>
            <?php endforeach; ?>
            </div>
        </div>
        <div class="pagination" style="margin-top:0;"><?php echo $page; ?></div>
      </form>
    </div>
  </div>
<script type="text/javascript">
  !function(){
    laydate.skin('molv');
    laydate({elem: '#Calendar'});
  }();

  !function(){
    function checkImage() {
      var images = new Array();
      $('.file-item').each(function(){
        if($(this).hasClass('thumbnail-red')) {
          var responseImage = $(this).find('.images-list-img').attr('data-file');
          var responseImageInput = '<input type="hidden" class="upload-reponse" value="'+responseImage+'" />';
          images.push(responseImageInput);
        }
      });
      var imagesStr = images.join('');
      $("#response-filelist",  window.parent.document).html(imagesStr);
    }
    window.imageslistCheck = checkImage;
  }();

  $(document).ready(function(e) {
    $('.file-item').click(function(){
      if( ! $(this).hasClass('thumbnail-red')) {
        $(this).addClass('thumbnail-red');
        $(this).find('.web-upload-check').show();
        imageslistCheck();
      } else {
        $(this).removeClass('thumbnail-red');
        $(this).find('.web-upload-check').hide();
        imageslistCheck();
      }
    });
  });
</script>
<?php echo widget('Admin.Common')->htmlend(); ?>