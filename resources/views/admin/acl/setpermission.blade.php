<?php echo widget('Admin.Common')->header(); ?>
<?php echo widget('Admin.Common')->headerContent(); ?>
<!-- ztree -->
<link rel="stylesheet" href="<?php echo loadStatic('/weishop/js/zTree_v3/css/zTreeStyle/zTreeStyle.css'); ?>" type="text/css">
<script type="text/javascript" src="<?php echo loadStatic('/weishop/js/zTree_v3/js/jquery.ztree.core-3.5.js'); ?>"></script>
<script type="text/javascript" src="<?php echo loadStatic('/weishop/js/zTree_v3/js/jquery.ztree.excheck-3.5.js'); ?>"></script>
<div class="right"  id="mainFrame">
     
  <div class="right_cont">
  <?php echo widget('Admin.Common')->crumbs(); ?>

      
  <div class="title_right">
    <strong>权限给予管理</strong>
  </div>
   
  <div style="width:900px;margin:auto;">
      <div id="featurebar" style="padding:0px;">
        <div class="heading">设置权限 : <?php echo isset($info['name']) ? $info['name'] : ''; ?><?php echo isset($info['group_name']) ? $info['group_name'] : ''; ?></div>
      </div>
      <?php
        $zTree_Node = json_encode($zTree);
      ?>
      <div id="zTree-container" class="ztree"></div>
      <script type="text/javascript">
        var __zTree_Node = <?php echo $zTree_Node; ?>;
        var __setting = {
          check: {
            enable: true,
            chkboxType: { "Y" : "p", "N" : "ps" }
          },
          data: {
            simpleData: {
              enable: true
            }
          }
        };
        $(document).ready(function(){

          $.fn.zTree.init($("#zTree-container"), __setting, __zTree_Node);

          //获取所有选中节点的值
          function getCheckedAll() {
              var treeObj = $.fn.zTree.getZTreeObj("zTree-container");
              var nodes = treeObj.getCheckedNodes(true);
              var checkNodes = new Array();
              for (var i = 0; i < nodes.length; i++) {
                  checkNodes.push(nodes[i].id);
              }
              return checkNodes;
          }

          //save
          $('.acl-submit').click(function(){
            var _url = '<?php echo route('foundation.acl.'.$router); ?>';
            var _id = $('input[name="id"]').val();
            var _all = $('input[name="all"]').val();
            var _form_hash = $('input[name="_form_hash"]').val();
            var _nodes = getCheckedAll();
            var params = {permission:_nodes, id:_id, all:_all, _form_hash:_form_hash};

            $.ajax({
                type: 'POST', 
                url: _url,
                data: params,
                dataType: 'json',
                success:  function(data) {
                  window.top.org.Common.alert(data.message);
                },
                beforeSend: function() {
                  window.top.org.Common.loading();
                },
                complete: function() {
                  window.top.org.Common.unloading();
                }
            });
          });
      });
      </script>
      <table  class="margin-bottom-20  table no-border" >
         <tr>
        <td class="text-center">
          <input type="button" value="确定" class="btn btn-info acl-submit" style="width:80px;" />
          <?php echo widget('Admin.Common')->goBack(route('foundation.'.$router.'.index')); ?>
        </td>
       </tr>
      </table>

      <input type="hidden" name="id" value="<?php echo $id;?>" />
      <input type="hidden" name="all" value="<?php echo implode(',', $all); ?>" />
      <input type="hidden" name="_form_hash" value="<?php echo form_hash([ 'id' => $id, 'all' => implode(',', $all) ]); ?>" />

      <div class="alert"> 
      <button type="button" class="close" data-dismiss="alert">&times;</button>
      温馨提示：重新给予权限后需要重新登陆才会生效 
       </div>
   
   </div>  
  </div>     
</div>
<?php echo widget('Admin.Common')->footer(); ?>
<?php echo widget('Admin.Common')->htmlend(); ?>