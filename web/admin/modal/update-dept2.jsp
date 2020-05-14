<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 修改部门模态框 -->
<div class="modal fade" id="deptUpdateModal" tabindex="-1"
     role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title">修改部门</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="addDeptform" target="iframe_update">
                    <input type="hidden" class="form-control" name="deptId" id="input_update_DeptId">
                    <div class="form-group">
                        <label for="input_update_DeptNo" class="col-sm-3 control-label">部门编号：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="deptNo" id="input_update_DeptNo" placeholder="部门编号"
                                   required oninvalid="setCustomValidity('请输入部门编号')" oninput="setCustomValidity('')">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_update_DeptName"
                               class="col-sm-3 control-label">部门名称：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="deptName" id="input_update_DeptName" placeholder="部门名称"
                                   required oninvalid="setCustomValidity('请输入部门名称')" oninput="setCustomValidity('')">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_update_enabled" class="col-sm-3 control-label">是否可用：</label>
                        <div class="radio">
                            <div class="col-sm-9">
                                <label>
                                    <input type="radio" name="enabled" id="input_update_enabled" value="1" checked>是
                                </label>
                                <label>
                                    <input type="radio" name="enabled" id="input_update_enabled" value="0">否
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" id="dept_update_btn" class="btn btn-primary">保存</button>
                    </div>
                </form>
                <iframe name="iframe_update"  id="iframe_update" src="" width="0" height="0" frameborder="0" ></iframe>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
    window.test2=false;
    //点击更新按钮，更新员工信息
    $("#dept_update_btn").click(function () {
        var no = $("#input_update_DeptNo").val();
        var name = $("#input_update_DeptName").val();
        if (no.length == 0 || name.length == 0) {
            return;
        }
        if (window.test2) return;

        //alert("sfsdfsdf"+$("#deptUpdateModal form").serialize());
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/DeptServlet?method=updateDept",
            type: "POST",
            data: $("#deptUpdateModal form").serialize(),
            success: function (result) {
                // alert(result);
                var data = eval("(" + result + ")");
                // alert("****"+data.code);
                if (data.code == 100) {
                    //1、模态框关闭
                    $("#deptUpdateModal").modal("hide");
                    //2、来到本页，显示刚才保存的数据
                    window.location.reload();
                    test2=false;
                } else if (data.code == 300) {
                    $("#input_add_DeptNo").errortip({
                        text: '部门编号重复',
                        width: 200,
                        height: 30,
                        bg: '#f00',
                        font: 24,
                        show: true
                    });
                    test2=true;
                } else {
                    alert("更新失败！");
                }
            }
        });
    });

    $("#input_update_DeptNo").keyup(function () {
        //1、将模态框的数据提交到服务器
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/DeptServlet?method=findDeptByNo",
            type: "POST",
            data: {"deptNo": $("#input_update_DeptNo").val()},
            success: function (result) {
                var data = eval("(" + result + ")");
                // alert("****"+data.code);
                if (data.code == 300) {
                    $("#input_update_DeptNo").errortip({
                        text: '部门编号重复',
                        width: 200,
                        height: 30,
                        bg: '#f00',
                        font: 24,
                        show: true
                    });
                    test2=true;
                } else {
                    $("#input_update_DeptNo").errortip({
                        show: false
                    });
                    test2=false;
                }
            }
        });
    });

</script>