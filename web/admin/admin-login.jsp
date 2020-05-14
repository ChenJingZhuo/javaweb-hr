<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>登录页面</title>

    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="../css/signin.css">
    <script>
        window.onload=()=>{
            var bd = document.getElementById("bd");
            bd.style.backgroundImage="url(../img/photo"+parseInt(Math.random()*4+1)+".png)";
            bd.style.backgroundRepeat="no-repeat";
            bd.style.backgroundSize="100% 150%";
        }

        function refreshCode() {
            document.getElementById("vcode").onclick = function () {
                this.src = "${pageContext.request.contextPath}/CheckCodeServlet?time="+new Date().getTime();
            }
        }
    </script>
</head>

<body id="bd" class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">

        <a href="admin-index.jsp"><b>人事</b>管理系统</a>

    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">登录系统</p>

        <form action="${pageContext.request.contextPath}/UserServlet?method=login" method="post">
            <div class="form-group has-feedback">
                <input name="username" value="${username==null?login_user:username}"
                       type="text" class="form-control" placeholder="用户名" required oninvalid="setCustomValidity('请输入用户名')" oninput="setCustomValidity('')">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input name="password" type="password" class="form-control" placeholder="密码" required oninvalid="setCustomValidity('请输入密码')" oninput="setCustomValidity('')">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row" style="position: relative">
                <div class="col-xs-6">
                    <input type="text" name="verifycode" class="form-control" placeholder="请输入验证码">
                </div>
                <!-- /.col -->
                <div class="col-xs-6">
                    <a href="javascript:refreshCode()" style="position: absolute;right: 15px"><img src="${pageContext.request.contextPath}/CheckCodeServlet" title="看不清点击刷新" id="vcode"></a>
                </div>
                <!-- /.col -->
            </div>
            <div class="row">
                <div class="col-xs-12" style="color: red">${code_error!=null?code_error:login_error}</div>
            </div>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label><input name="remember" type="checkbox" value="rem"> 记住 下次自动登录</label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
                <!-- /.col -->
            </div>
            <div class="row" style="position: relative">
                <a href="#" style="margin-left: 15px">忘记密码</a>
                <a href="admin-register.jsp" class="text-center" style="position: absolute;right: 15px">新用户注册</a>
            </div>
        </form>

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<!-- Bootstrap 3.3.6 -->
<!-- iCheck -->
<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/iCheck/icheck.min.js"></script>
<script>
    $(function() {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>

</html>
