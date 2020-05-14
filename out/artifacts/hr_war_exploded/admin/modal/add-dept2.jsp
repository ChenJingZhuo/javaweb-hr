<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 添加部门模态框 -->
<div class="modal fade" id="deptAddModal" tabindex="-1"
     role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h3 class="modal-title">添加部门</h3>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="addDeptform" target="iframe_add">
                    <div class="form-group">
                        <label for="input_add_DeptNo" class="col-sm-3 control-label">部门编号：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="deptNo" id="input_add_DeptNo" placeholder="部门编号" required oninvalid="setCustomValidity('请输入部门编号')" oninput="setCustomValidity('')">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_add_DeptName" class="col-sm-3 control-label">部门名称：</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="deptName" id="input_add_DeptName" placeholder="部门名称" required oninvalid="setCustomValidity('请输入部门名称')" oninput="setCustomValidity('')">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="input_add_enabled" class="col-sm-3 control-label">是否可用：</label>
                        <div class="radio">
                            <div class="col-sm-9">
                                <label>
                                    <input type="radio" name="enabled" id="input_add_enabled" value="1" checked>是
                                </label>
                                <label>
                                    <input type="radio" name="enabled" id="input_add_enabled" value="0">否
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" id="dept_save_btn" class="btn btn-primary">保存</button>
                    </div>
                </form>
                <iframe name="iframe_add"  id="iframe_add" src="" width="0" height="0" frameborder="0" ></iframe>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
    $("form").submit(function( event ) {
        return;
    });
    window.test=false;
    //添保存部门
    $("#dept_save_btn").click(function () {
        var no=$("#input_add_DeptNo").val();
        var name=$("#input_add_DeptName").val();
        if (no.length==0||name.length==0){
            return;
        }
        if (window.test)return;
        // alert("****"+$("#deptAddModal form").serialize());
        //1、将模态框的数据提交到服务器
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/DeptServlet?method=addDept",
            type: "POST",
            data: $("#deptAddModal form").serialize(),
            success: function (result) {
                var data = eval("(" + result + ")");
                // alert("****"+data.code);
                if (data.code == 100) {
                    //1、数据保存成功，关闭模态框
                    $('#deptAddModal').modal('hide');
                    window.location.reload();
                    window.test=false;
                } else if (data.code == 300){
                    $("#input_add_DeptNo").errortip({
                        text: '部门编号重复',
                        width: 200,
                        height: 30,
                        bg: '#f00',
                        font: 24,
                        show: true
                    });
                    window.test=true;
                } else {
                    alert("添加数据失败！");
                }
            }
        });
    });

    $("#input_add_DeptNo").keyup(function () {
        //1、将模态框的数据提交到服务器
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/DeptServlet?method=findDeptByNo",
            type: "POST",
            data: {"deptNo":$("#input_add_DeptNo").val()},
            success: function (result) {
                var data = eval("(" + result + ")");
                // alert("****"+data.code);
                if (data.code == 300) {
                    $("#input_add_DeptNo").errortip({
                        text: '部门编号重复',
                        width: 200,
                        height: 30,
                        bg: '#f00',
                        font: 24,
                        show: true
                    });
                    window.test=true;
                } else {
                    $("#input_add_DeptNo").errortip({
                        show: false
                    });
                    window.test=false;
                }
            }
        });
    });

</script>