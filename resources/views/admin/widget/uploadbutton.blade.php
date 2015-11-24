<?php
	$paramString = base64url_encode(serialize($config));
	$onclick = "javascript:window.top.org.Common.uploaddialog('{$config['id']}_dialog', '上传文件','{$config['id']}',{$config['callback']},'{$paramString}','{$authkey}', '{$config['uploadUrl']}')";
?>
<a class="btn btn-default btn-sm" id="swf-upload-btn" style="font-size: 12px;" onclick="<?php echo $onclick; ?>" >
  <i class="icon-upload"></i>
  上传
</a>