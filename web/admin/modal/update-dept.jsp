<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 模态框（修改部门） -->
<div class="modal fade" id="update_dept" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    <b>修改部门</b>
                </h4>
            </div>
            <form action="${pageContext.request.contextPath}/DeptServlet?method=updateDept" method="post">
                <input id="up_id" hidden name="deptId">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-4 text-center">
                            <b>部门编号：</b>
                        </div>
                        <div class="col-xs-8">
                            <div class="form-group has-feedback">
                                <input id="up_no" name="deptNo" type="text" class="form-control" placeholder="部门编号">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-4 text-center">
                            <b>部门名称：</b>
                        </div>
                        <div class="col-xs-8">
                            <div class="form-group has-feedback">
                                <input id="up_name" name="deptName" type="text" class="form-control" placeholder="部门名称">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-4 text-center">
                            <b>是否可用：</b>
                        </div>
                        <div class="col-xs-8" id="up_enabled">
                            <input name="enabled" type="radio" value="1" checked> 是
                            <input name="enabled" type="radio" value="0"> 否
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框（修改部门） -->