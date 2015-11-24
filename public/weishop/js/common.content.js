!function ($, w) {
    /**
     * 命名空间
     * @type {Object}
     */
    var org = {};

    /**
     * 异步删除
     * 
     * @param  {string} url       执行的url
     * @param  {string} replaceID 用于刷新列表的容器id
     * @param  {string} notice    提示信息
     * @return {void}
     */
    org.ajaxDelete = function(url, replaceID, notice) {
        w.top.org.Common.confirm(notice, function() {
            $.ajax({
                type:     'GET', 
                url:      url,
                dataType: 'json', 
                success:  function(data) {
                    if(data.result == 'success') {
                        w.location.reload();
                    } else {
                        w.top.org.Common.alert(data.message);
                    }
                },
                beforeSend: function() {
                    w.top.org.Common.loading();
                },
                complete: function() {
                    w.top.org.Common.unloading();
                }
            });
        });
    }

    w.rc = org;

} (jQuery, window);