<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="csrf-token" content="<?php echo csrf_token(); ?>" />
<title>管理系统</title>
<link rel="stylesheet" href="<?php echo loadStatic('/weishop/css/bootstrap.css'); ?>" />
<style type="text/css">
body{ background:#0066A8 no-repeat center 0px;}
.tit{ margin:auto; margin-top:170px; text-align:center; width:350px; padding-bottom:20px;}
.login-wrap{ width:220px; padding:30px 50px 0 330px; height:220px; background:#fff url(/weishop/img/20150212154319.jpg) no-repeat 30px 40px; margin:auto; overflow: hidden;}
.login_input{ display:block;width:210px;}
.login_user{ background: url(/weishop/img/input_icon_1.png) no-repeat 200px center; font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif}
.login_password{ background: url(/weishop/img/input_icon_2.png) no-repeat 200px center; font-family:"Courier New", Courier, monospace}
.btn-login{ background:#40454B; box-shadow:none; text-shadow:none; color:#fff; border:none;height:35px; line-height:26px; font-size:14px; font-family:"microsoft yahei";}
.btn-login:hover{ background:#333; color:#fff;}
.copyright{ margin:auto; margin-top:10px; text-align:center; width:370px; color:#CCC}
@media (max-height: 700px) {.tit{ margin:auto; margin-top:100px; }}
@media (max-height: 500px) {.tit{ margin:auto; margin-top:50px; }}
</style>
<script type="text/javascript">
  if (window != window.top) {
    window.top.location.href = '/';
  };
</script>
</head>

<body>
<div class="tit"><img src="<?php echo loadStatic('/weishop/img/tit.png'); ?>" alt="" /></div>
<div class="login-wrap">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="25" valign="bottom">用户名：</td>
    </tr>
    <tr>
      <td><input type="text" class="login_input login_user login" id="login-username" value="" /></td>
    </tr>
    <tr>
      <td height="35" valign="bottom">密  码：</td>
    </tr>
    <tr>
      <td><input type="password"  class="login_input login_password login" id="login-password" value="" /></td>
    </tr>
    <tr>
      <td height="60" valign="bottom"><a href="javascript:;" id="login-submit" class="btn btn-block btn-login login">登录</a></td>
    </tr>
   
  </table>
</div>
<div class="copyright">建议使用IE9以上版本或谷歌浏览器</div>
<script type="text/javascript" src="<?php echo loadStatic('/weishop/js/jquery.1.11.1.min.js'); ?>"></script>
<script type="text/javascript" src="<?php echo loadStatic('/weishop/js/bootstrap.min.js'); ?>"></script>
<script type="text/javascript" src="<?php echo loadStatic('/crypto/md5.js'); ?>" ></script>
<script type="text/javascript" src="<?php echo loadStatic('/weishop/js/login.min.js'); ?>"></script>
<script type="text/javascript">
  $(document).ready(function() {
    var login = new Login('login-username', 'login-password', 'login-submit');
    login.prelogin('login');
    $(document).on('click', '#login-submit', function() {
      var _check = login.checkParams();
      if( ! _check) {
        return alert(login.message);
      }
      login.doLogin();
    });

    $('#login-password').keyup(function(event) {
        if (event.keyCode == 13) {
            $('#login-submit').trigger('click').focus();
        }
    });
  });
</script>
</body>
</html>
