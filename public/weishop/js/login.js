!function(w, $) {
    var _login = {};
    _login.cache_publickey = 'publickey';
    _login.username = '';
    _login.password = '';

    function Login(usenameId, passwdId, submitId) {
        this.usenameId = usenameId;
        this.passwdId = passwdId;
        this.submitId = submitId;
        this.disabledClass = '';
        this.message = '登录成功';
    }

    Login.prototype.doLogin = function () {
        var submitId = this.submitId;
        var _this = this;
        $.ajax({
            type: "get",
            url: "/login/proc",
            data: {username:_login.username, password:_login.password},
            dataType: "jsonp",
            jsonp: "callback",
            jsonpCallback:"callback",
            headers: {
                'X-XSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            success: function(data) {
                if( ! data.result) {
                    _this.prelogin(_this.disabledClass);
                    _this.alert(data.msg);
                }
                if(data.result && typeof data.jumpUrl != 'undefined') {
                    window.location.href = data.jumpUrl;
                }else if(data.result) {
                    window.location.href = '/';
                }
            },
            beforeSend: function() {
                $('#' + submitId).html('登录中...');
            },
            timeout: 30000,
            complete: function(request, status) {
                if(status == 'timeout') {
                    _this.alert('登录超时，请重试！');
                }
                $('#' + submitId).html('登录');
            }
        });
    }

    Login.prototype.checkParams = function () {
        _login.username = $('#' + this.usenameId).val();
        _login.password = $('#' + this.passwdId).val();
        if(_login.username == '') {
            this.message = '请输入用户名';
            return false;
        }
        if(_login.password == '') {
            this.message = '请输入密码';
            return false;
        }
        var publickey = $('#' + this.submitId).data(_login.cache_publickey);
        if(typeof publickey == 'undefined') {
            this.message = '登录失败，刷新重试';
            return false;
        }
        _login.password = CryptoJS.MD5(_login.password) + publickey;
        _login.password = ("" + CryptoJS.MD5(_login.password)).toUpperCase();
        return true;
    }

    Login.prototype.prelogin = function (disabledClass) {
        this.disabledClass = disabledClass;
        var submitId = this.submitId;
        var _this = this;
        $.ajax({
            type: "get",
            url: "/login/prelogin",
            data: "",
            dataType: "jsonp",
            jsonp: "callback",
            jsonpCallback:"callback",
            success: function(data) {
                $('.' + disabledClass).attr('disabled', false);
                $('#' + submitId).data(_login.cache_publickey, data.pKey);
                $('meta[name="csrf-token"]').attr('content', data.a);
            },
            beforeSend: function() {
                $('.' + disabledClass).attr('disabled', true);
            },
            timeout: 10000,
            complete: function(request, status) {
                if(status == 'timeout') {
                    _this.alert('初始化失败，刷新页面重试');
                }
            }
        });
    }

    Login.prototype.alert = function(message) {
        w.alert(message);
    }

    w.Login = Login;
}(window, jQuery);