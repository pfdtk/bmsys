<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>微店管理系统</title>
<link rel="stylesheet" href="<?php echo loadStatic('/weishop/css/bootstrap.css'); ?>" />
<link rel="stylesheet" href="<?php echo loadStatic('/weishop/css/css.css'); ?>" />
<script type="text/javascript" src="<?php echo loadStatic('/weishop/js/jquery.1.11.1.min.js'); ?>"></script>
<script type="text/javascript" src="<?php echo loadStatic('/weishop/js/bootstrap.min.js'); ?>"></script>
<script type="text/javascript">
    var SYS_DOMAIN = '<?php echo $domain['domain']; ?>';
    var SYS_IMG_DOMAIN = '<?php echo $domain['img_domain']; ?>';
    $(document).keydown(function(e) {
        // ctrl + z
        if( e.ctrlKey  == true && e.keyCode == 90 ){
          $(window.top.document).find('.Switch').trigger('click');
          return false;
        }
    });
</script>
</head>
<body>