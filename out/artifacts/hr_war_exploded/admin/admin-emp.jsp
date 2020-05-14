<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>员工管理</title>
    <meta name="description" content="员工管理">
    <meta name="keywords" content="员工管理">

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
</head>

<body class="hold-transition skin-purple sidebar-mini">

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
                员工管理
                <small>员工管理</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="admin-index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="admin-emp.jsp"><i class="fa fa-users"></i> 员工管理</a></li>
                <li class="active">员工管理</li>
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
                                    <button type="button" class="btn btn-success btn-sm" title="新建">
                                        <i class="fa fa-file-o"></i> 新建
                                    </button>
                                    <button type="button" class="btn btn-danger btn-sm" title="删除">
                                        <i class="fa fa-trash-o"></i> 删除
                                    </button>

                                </div>
                            </div>
                        </div>
                        <div class="box-tools pull-right">
                            <div class="has-feedback">
                                <input type="text" class="form-control input-sm"
                                       placeholder="搜索"> <span
                                    class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
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
                                <th class="text-center">工号</th>
                                <th class="text-center">姓名</th>
                                <th class="text-center">性别</th>
                                <th class="text-center">部门</th>
                                <th class="text-center">职位</th>
                                <th class="text-center">出生年月</th>
                                <th class="text-center">电话</th>
                                <th class="text-center">状态</th>
                            </tr>
                            </thead>
                            <tbody class="text-center">
                            <c:forEach var="emp" items="${pageBean.data}">
                                <tr>
                                    <td><input name="ids" type="checkbox" class="check_item"></td>
                                    <td>${emp.empId}</td>
                                    <td>${emp.empNo}</td>
                                    <td>${emp.empName}</td>
                                    <td>${emp.sex==1?"男":"女"}</td>
                                    <td>${emp.deptName}</td>
                                    <td>${emp.position}</td>
                                    <td>${emp.birthday}</td>
                                    <td>${emp.tel}</td>
                                    <td>${emp.status}</td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-twitter btn-xs">详情</button>
                                        <button type="button" class="btn btn-primary btn-xs">修改</button>
                                        <button type="button" class="btn btn-success btn-xs">转正</button>
                                        <button type="button" class="btn btn-warning btn-xs">离职</button>
                                        <button type="button" class="btn btn-danger btn-xs">删除</button>
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
                                    <li class="disabled">
                                        <a href="#">&laquo;</a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/EmpServlet?method=empList&page=1"
                                           aria-label="Previous">首页</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/EmpServlet?method=empList&page=${pageBean.curPage-1}">&laquo;</a>
                                    </li>
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
                                    <li class="active"><a
                                            href="${pageContext.request.contextPath}/admin/EmpServlet?method=empList&page=${i}">${i}</a>
                                    </li>
                                </c:if>
                                <c:if test="${pageBean.curPage != i}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/EmpServlet?method=empList&page=${i}">${i}</a>
                                    </li>
                                </c:if>
                                <%--<li>
                                     href="${pageContext.request.contextPath}/admin/EmpServlet?method=empList&page=${i}">${i}</a>
                                </li>--%>
                            </c:forEach>

                            <c:choose>
                                <c:when test="${pageBean.curPage==pageBean.totalPages}">
                                    <li class="disabled">
                                        <a href="#">&raquo;</a>
                                    </li>
                                    <li><a href="#" aria-label="Next">尾页</a></li>
                                </c:when>

                                <c:otherwise>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/EmpServlet?method=empList&page=${pageBean.curPage+1}">&raquo;</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/admin/EmpServlet?method=empList&page=${pageBean.totalPages}"
                                           aria-label="Next">尾页</a></li>
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


<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
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
        setSidebarActive("admin-emp");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        // // 全选操作
        // $("#selall").click(function () {
        //     var clicks = $(this).is(':checked');
        //     if (!clicks) {
        //         $("#dataList td input[type='checkbox']").iCheck("uncheck");
        //     } else {
        //         $("#dataList td input[type='checkbox']").iCheck("check");
        //     }
        //     $(this).data("clicks", !clicks);
        // });
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