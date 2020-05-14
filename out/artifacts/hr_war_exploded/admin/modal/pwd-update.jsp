<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 模态框（修改密码） -->
<div class="modal fade" id="update_pwd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    <b>修改密码</b>
                </h4>
            </div>
            <form action="${pageContext.request.contextPath}/UserServlet?method=adminChangePwd" method="post">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-4 text-right">
                            <b>新密码：</b>
                        </div>
                        <div class="col-xs-8">
                            <div class="form-group has-feedback">
                                <input name="password" type="password" class="form-control" placeholder="新密码" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-4 text-right">
                            <b>确认密码：</b>
                        </div>
                        <div class="col-xs-8">
                            <div class="form-group has-feedback">
                                <input name="rePassword" type="password" class="form-control" placeholder="确认密码" required>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 text-center"><b style="color: red">${pwd_update_error}</b></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">修改</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框（修改密码） -->