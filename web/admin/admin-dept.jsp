<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>部门管理</title>
    <meta name="description" content="部门管理">
    <meta name="keywords" content="部门管理">

    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="../plugins/morris/morris.css">
    <link rel="stylesheet" href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="../plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="../plugins/select2/select2.css">
    <link rel="stylesheet" href="../plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="../plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="../plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    <script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="../js/inputTip.js"></script>
    <style>
        .judge {
            width: 100px;
            margin-bottom: 50px;
        }
    </style>
    <script>
        function updateData(id, department) {
            $.ajax({
                type: 'POST',
                cache: false,
                dataType: 'json',
                url: "./ajax/data-update.jsp",
                data: "id=" + id + "&department=" + department,
                success: function (data) {
                    $("#dataUpdate").dialog({
                        content: data,
                        resizable: true,
                        model: true
                    });
                }
            });
        }

        function addData() {
            $('#dataAdd').show().dialog({
                title: "==========添加数据==========",
                modal: true
            });
        }

        function updateDept(deptId, deptNo, deptName, enabled) {
            $('#input_update_DeptId').val(deptId);
            $('#input_update_DeptNo').val(deptNo);
            $('#input_update_DeptName').val(deptName);
            if (parseInt(enabled) == 0) $("input[type=radio][name=enabled]:eq(3)").attr("checked", true);
            // $("#deptUpdateModal input[name=enabled]").val(enabled);
            $('#deptUpdateModal').modal('show');
        }

        function deleteDept(id) {
            if (confirm("您确定要删除吗？")) {
                location.href = "${pageContext.request.contextPath}/admin/DeptServlet?method=deleteDept&deptId=" + id;
            }
        }

        /*window.onload = function () {
            document.getElementById("delSelected").onclick = function () {
                if (confirm("您确定要删除选中条目吗吗？")) {
                    var flag = false;
                    var cbs = document.getElementsByName('ids');
                    for (var i = 0; i < cbs.length; i++) {
                        if (cbs[i].checked) {
                            flag = true;
                            break
                        }
                    }

                    if (flag) {
                        document.getElementById("form").submit();
                    }
                }
            }
        }*/

        //添加按钮事件,弹出新增模态框
        $("#dept_add_modal_btn").click(function () {
            $('#deptAddModal').modal({
                modal: 'show',
                backdrop: 'static'
            });
        });

        //根据部门编号查询部门信息
        function getDeptById(deptId,) {
            $("#deptUpdateModal").modal("show");
            $.ajax({
                url : "${pageContext.request.contextPath}/admin/DeptServlet?method=deptById&deptId=" + deptId,
                async : false,//同步，会阻塞操作
                type : "GET",
                success : function(result) {
                    //alert(result.deptNo+","+result.deptName+","+result.enabled);
                    var deptData = eval("(" + result + ")");
                    alert(deptData.deptId+deptData.deptNo+","+deptData.deptName+","+deptData.enabled);
                    $("#input_update_DeptId").val(deptData.deptId);
                    $("#input_update_DeptNo").val(deptData.deptNo);
                    $("#input_update_DeptName").val(deptData.deptName);
                    $("#deptUpdateModal input[name=enabled]").val([ deptData.enabled ]);
                }
            });
        }

        //点击更新按钮，更新员工信息
        /*$("#dept_update_btn").click(function() {
            //alert("sfsdfsdf"+$("#deptUpdateModal form").serialize());
            $.ajax({
                url : "${pageContext.request.contextPath}/admin/DeptServlet?method=updateDept",
                type : "post",
                data : $("#deptUpdateModal form").serialize(),
                success : function(result) {
                    //alert(result);
                    var data = eval("(" + result + ")");
                    alert("****"+data.code);
                    if (data.code == 100) {
                        //1、模态框关闭
                        $('#deptUpdateModal').modal('hide');
                        //2、来到本页，显示刚才保存的数据
                        window.location.reload();
                    } else {
                        alert("更新失败！");
                    }
                }
            });
        });*/

    </script>
</head>

<body class="hold-transition skin-purple sidebar-mini">

<!-- 模态框（修改密码） -->
<%@ include file="./modal/pwd-update.jsp" %>
<!-- 模态框（修改密码） -->

<!-- 模态框（添加部门） -->
<%@ include file="./modal/add-dept2.jsp" %>
<!-- 模态框（添加部门） -->

<!-- 模态框（修改部门） -->
<%@ include file="./modal/update-dept2.jsp" %>
<!-- 模态框（修改部门） -->

<div class="wrapper">

    <!-- 页面头部 -->
    <%@ include file="admin-head.jsp" %>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <%@ include file="admin-menu.jsp" %>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                部门管理
                <small>部门管理</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="admin-index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="admin-dept.jsp"><i class="fa fa-cube"></i> 部门管理</a></li>
                <li class="active">部门管理</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-success btn-sm"
                                            id="dept_add_modal_btn" title="新建" data-toggle="modal" href="#" data-target="#deptAddModal" rel="noopener noreferrer" <%--onclick='location.href="admin-dept-add.jsp"'--%>>
                                        <i class="fa fa-file-o"></i> 新建
                                    </button>
                                    <button type="button" class="btn btn-danger btn-sm" id="dept_delete_all_btn" title="删除">
                                        <i class="fa fa-trash-o"></i> 删除
                                    </button>

                                </div>
                            </div>
                        </div>
                        <div class="box-tools pull-right">
                            <form action="${pageContext.request.contextPath}/admin/DeptServlet?method=searchDept&page=${pageBean.curPage!=null?pageBean.curPage:1}" method="post">
                                <div class="has-feedback">
                                    <input name="keyword" type="text" class="form-control input-sm" value="${keyword}" placeholder="搜索">
                                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                </div>
                            </form>
                            <%--<div class="has-feedback">
                                <input type="text" class="form-control input-sm" placeholder="搜索">
                                <span class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>--%>
                        </div>
                        <!--工具栏/-->

                        <!--数据列表-->
                        <table id="dataList"
                               class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="text-center" style="padding-right: 0px;">
                                    <input id="check_all" type="checkbox" class="icheckbox_square-blue">
                                </th>
                                <th class="text-center">ID</th>
                                <th class="text-center">部门编号</th>
                                <th class="text-center">部门名称</th>
                                <th class="text-center">是否可用</th>
                                <th class="text-center">操作</th>
                            </tr>
                            </thead>
                            <tbody class="text-center">
                            <c:forEach var="dept" items="${pageBean.data}">
                                <tr>
                                    <td><input name="ids" type="checkbox" class="check_item"></td>
                                    <td>${dept.deptId}</td>
                                    <td>${dept.deptNo}</td>
                                    <td>${dept.deptName}</td>
                                    <td>${dept.enabled==1?"是":"否"}</td>
                                    <td class="text-center">
<%--                                        <button type="button" class="btn btn-primary btn-xs" id="update_dept_btn" data-id="${dept.deptId}">修改</button>--%>
                                        <button type="button" class="btn btn-primary btn-xs" onclick="updateDept(${dept.deptId},${dept.deptNo},'${dept.deptName}',${dept.enabled})">修改</button>
                                        <button type="button" class="btn btn-danger btn-xs"
                                                onclick="deleteDept(${dept.deptId})">删除
                                        </button>
                                        <%--<button type="button" class="btn btn-danger btn-xs"
                                                id="del_dept_btn" data-id="${dept.deptId}">删除
                                        </button>--%>
                                            <%-- <button type="button" class="btn btn-primary btn-xs"
                                           onclick='location.href="${pageContext.request.contextPath}/admin/DeptServlet?method=deptById&deptId=${dept.deptId}"'>修改</button> --%>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>
                        <!--数据列表/-->
                    </div>
                    <!-- 数据表格 /-->
                </div>
                <!-- /.box-body -->
                <!-- .box-footer-->
                <div class="box-footer">
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            总共${pageBean.totalPages}页，当前第${pageBean.curPage}页，共${pageBean.toalRows}条数据。
                        </div>
                    </div>

                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${pageBean.curPage==1}">
                                    <li><a href="#" aria-label="Previous">首页</a></li>
                                    <c:if test="${pageBean.toalRows!=0}">
                                        <li class="disabled">
                                            <a href="#">&laquo;</a>
                                        </li>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/DeptServlet?method=deptList&page=1" aria-label="Previous">首页</a>
                                    </li>
                                    <c:if test="${pageBean.toalRows!=0}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/admin/DeptServlet?method=deptList&page=${pageBean.curPage-1}">&laquo;</a>
                                        </li>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                            <%-- 计算begin、end --%>
                            <c:choose>
                                <%-- 如果总页数不足5页，那么把所有的页数都显示出来！ --%>
                                <c:when test="${pageBean.totalPages <= 5 }">
                                    <c:set var="begin" value="1"/>
                                    <c:set var="end" value="${pageBean.totalPages }"/>
                                </c:when>
                                <c:otherwise>
                                    <%-- 当总页数>10时，通过公式计算出begin和end --%>
                                    <c:set var="begin" value="${pageBean.curPage-5 }"/>
                                    <c:set var="end" value="${pageBean.curPage+4 }"/>
                                    <%-- 头溢出 --%>
                                    <c:if test="${begin < 1 }">
                                        <c:set var="begin" value="1"/>
                                        <c:set var="end" value="5"/>
                                    </c:if>
                                    <%-- 尾溢出 --%>
                                    <c:if test="${end > pageBean.totalPages }">
                                        <c:set var="begin" value="${pageBean.totalPages - 4 }"/>
                                        <c:set var="end" value="${pageBean.totalPages}"/>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                            <%-- 循坏显示页数 --%>
                            <c:forEach var="i" begin="${begin}" end="${end}">
                                <c:if test="${pageBean.curPage == i}">
                                    <li class="active"><a href="${pageContext.request.contextPath}/admin/DeptServlet?method=deptList&page=${i}">${i}</a></li>
                                </c:if>
                                <c:if test="${pageBean.curPage != i}">
                                    <li><a href="${pageContext.request.contextPath}/admin/DeptServlet?method=deptList&page=${i}">${i}</a></li>
                                </c:if>
                                <%--<li>
                                     href="${pageContext.request.contextPath}/admin/DeptServlet?method=deptList&page=${i}">${i}</a>
                                </li>--%>
                            </c:forEach>

                            <c:choose>
                                <c:when test="${pageBean.curPage==pageBean.totalPages}">
                                    <c:if test="${pageBean.toalRows!=0}">
                                        <li class="disabled">
                                            <a href="#">&raquo;</a>
                                        </li>
                                    </c:if>
                                    <li><a href="#" aria-label="Next">尾页</a></li>
                                </c:when>

                                <c:otherwise>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/DeptServlet?method=deptList&page=${pageBean.curPage+1}">&raquo;</a>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath}/admin/DeptServlet?method=deptList&page=${pageBean.totalPages}" aria-label="Next">尾页</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                    <!-- /.box-footer-->
                </div>

            </div>

        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <%@ include file="admin-footer.jsp" %>
    <!-- 底部导航 /-->

</div>


<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/raphael/raphael-min.js"></script>
<script src="../plugins/morris/morris.min.js"></script>
<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../plugins/knob/jquery.knob.js"></script>
<script src="../plugins/daterangepicker/moment.min.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../plugins/fastclick/fastclick.js"></script>
<script src="../plugins/iCheck/icheck.min.js"></script>
<script src="../plugins/adminLTE/js/app.min.js"></script>
<script src="../plugins/treeTable/jquery.treetable.js"></script>
<script src="../plugins/select2/select2.full.min.js"></script>
<script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="../plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="../plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="../plugins/ckeditor/ckeditor.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/chartjs/Chart.min.js"></script>
<script src="../plugins/flot/jquery.flot.min.js"></script>
<script src="../plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../plugins/flot/jquery.flot.categories.min.js"></script>
<script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="../plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
    $(document).ready(function () {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });


    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    $(document).ready(function () {

        // 激活导航位置
        setSidebarActive("admin-dept");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        /*// 全选操作
        $("#selall").click(function () {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });*/
    });

    //实现全选功能
    $("#check_all").click(function () {
        var clicks = $(this).is(':checked');
        if (!clicks) {
            $("#dataList td input[type='checkbox']").iCheck("uncheck");
        } else {
            $("#dataList td input[type='checkbox']").iCheck("check");
        }
        //attr获取checked是undefined;
        //我们这些dom原生的属性；attr获取自定义属性的值；
        //prop修改和读取dom原生属性的值
        // $(".check_item").prop("checked", $(this).prop("checked"));
    });

/*    $("#ids").click(function () {
        var flag = $("ids:checked").length == $(this).length;
        alert(flag);
        // var check=flag==true
        // $("#check_all").iCheck("checked", flag)
    });*/


    $(document).on("click", ".check_item", function () {
        //判断当前选择中的元素是否5个
        // alert($(".check_item:checked").length)
        var flag = $(".check_item:checked").length == $(".check_item").length;
        alert(flag);
        // var check=flag==true
        // $("#check_all").iCheck("checked", flag)
    });

    //批量删除功能
    $("#dept_delete_all_btn").click(function () {
        var deptNames = "";
        var del_deptidstr = "";
        $.each($(".check_item:checked"), function () {
            // alert( $(this).parents("tr").find("td:eq(3)").text());
            deptNames += $(this).parents("tr").find("td:eq(3)").text() + ",";
            //组装部门编号字符串
            del_deptidstr += $(this).parents("tr").find("td:eq(1)").text() + ",";
        });
        //去除deptNames多余的,
        deptNames = deptNames.substring(0,
            deptNames.length - 1);
        //去除删除的id多余的,
        del_deptidstr = del_deptidstr.substring(0, del_deptidstr.length - 1);
        //  alert(del_deptidstr);
        if (del_deptidstr != "") {
            if (confirm("确认删除【" + deptNames + "】吗？")) {
                location.href = "${pageContext.request.contextPath}/admin/DeptServlet?method=deptAllDept&del_deptidstr=" + del_deptidstr;
            }
        } else {
            alert("您没有选择要删除的数据！");
        }
    });

</script>
</body>

</html>
<!---->