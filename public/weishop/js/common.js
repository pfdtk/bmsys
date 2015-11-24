!function ($) {
    /**
     * 命名空间
     * @type {Object}
     */
    var org = {};
    org.Common = {};

    /**
     * 自定义的confirm确认弹出窗口
     * 
     * @param  string   content  提示的内容
     * @param  function callback 回调函数
     * @return void
     */
    org.Common.confirm = function(content, callback) {
        var d = dialog({
            title: '提示',
            fixed: true,
            content: content,
            okValue: '确定',
            width: 250,
            ok: function () {
                if(typeof callback === 'function') {
                    this.title('提交中…');
                    callback();
                }
            },
            cancelValue: '取消',
            cancel: function () {}
        });
        d.showModal();
    }

    /**
     * 自定义的alert提示弹窗
     * 
     * @param  string content 提示的内容
     * @param  function callback 回调函数
     * @return void
     */
    org.Common.alert = function(content, callback) {
        var d = dialog({
            title: '提示',
            fixed: true,
            content: content,
            okValue: '确定',
            width: 250,
            ok: function () {
                if(callback && typeof callback === 'function') {
                    callback();
                }
            }
        });
        d.showModal();
    }

    /**
     * 显示loading，用于处理数据的时候显示
     * 
     * @return void
     */
    org.Common.loading = function() {
        var loading_image = '<img src="'+SYS_DOMAIN+'/images/loading-icons/loading9.gif">';
        $.blockUI({
            message: loading_image,
            css: {
                border: 'none', 
                padding: '0px', 
                backgroundColor: 'none'
            }
        }); 
    }

    /**
     * 关闭loading
     * 
     * @return void
     */
    org.Common.unloading = function() {
        $.unblockUI();
    }

    /**
     * 上传弹出窗口
     * 
     * @param  {string} uploadid   dialog插件的ID
     * @param  {string} title      dialog插件的标题
     * @param  {string} itemId     回调函数用到的html ID
     * @param  {function} funcName 回调函数
     * @param  {string} args       附带的参数
     * @param  {string} authkey    当前上传窗口的签名token,防止篡改
     * @param  {string} upload_url 处理上传的接口
     * @return {void}
     */
    org.Common.uploaddialog = function(uploadid, title, itemId, funcName, args, authkey, upload_url) {
        var args = args ? '&args=' + args : '';
        var setting = '&authkey=' + authkey;
        var d = dialog({
            title: title,
            id: uploadid,
            url: upload_url+'?_=' + Math.random() + args + setting,
            width: '500',
            height: '420',
            padding: 0,
            okValue: '确定',
            ok: function () {
                this.title('提交中…');
                if (funcName) {
                    funcName.apply(this, [uploadid, itemId]);
                }
                this.close().remove();
                org.Common.removeDialogIframe(uploadid);
                return false;
            },
            cancelValue: '取消',
            cancel: function () {
                this.close().remove();
                org.Common.removeDialogIframe(uploadid);
                return false;
            }
        });
        d.showModal();
    }

    /**
     * artdialog关闭后还会有一个iframe，删除它
     * @param  {[string]} uploadid dialog插件的id
     * @return {[void]}
     */
    org.Common.removeDialogIframe = function(uploadid) {
        $('body').find('iframe[name="'+uploadid+'"]').remove();
    }

    window.org = org;

} (jQuery);