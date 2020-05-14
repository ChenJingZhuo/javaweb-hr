<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="../img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${username==null?'张猿猿':username}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>
        <!-- search form -->
        <!--<form action="#" method="get" class="sidebar-form">
    <div class="input-group">
        <input type="text" name="q" class="form-control" placeholder="搜索...">
        <span class="input-group-btn">
        <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
        </button>
      </span>
    </div>
</form>-->
        <!-- /.search form -->


        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li id="admin-index"><a href="admin-index.jsp"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

            <!-- 菜单 -->
            <li id="admin-dept" class="treeview">
                <a href="${pageContext.request.contextPath}/admin/DeptServlet?method=deptList">
                    <i class="fa fa-cube"></i>
                    <span>部门管理</span>
                </a>
            </li>

            <li class="treeview">
                <a href="${pageContext.request.contextPath}/admin/EmpServlet?method=empList">
                    <i class="fa fa-users"></i>
                    <span>员工管理</span>
                </a>
            </li>

            <li id="admin-position" class="treeview">
                <a href="admin-position.jsp">
                    <i class="fa fa-database"></i>
                    <span>职位管理</span>
                </a>
            </li>

            <li id="admin-salary" class="treeview">
                <a href="admin-salary.jsp">
                    <i class="fa fa-money"></i>
                    <span>薪资管理</span>
                </a>
            </li>

            <li id="admin-work" class="treeview">
                <a href="admin-work.jsp">
                    <i class="fa fa-clock-o"></i>
                    <span>考勤管理</span>
                </a>
            </li>

            <li id="admin-note" class="treeview">
                <a href="admin-note.jsp">
                    <i class="fa fa-sticky-note-o"></i>
                    <span>公告管理</span>
                </a>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-bar-chart"></i>
                    <span>数据统计</span>
                </a>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>后台通用页面</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="admin-login">
                        <a href="admin-login.jsp">
                            <i class="fa fa-circle-o"></i> 登录
                        </a>
                    </li>

                    <li id="admin-register">
                        <a href="admin-register.jsp">
                            <i class="fa fa-circle-o"></i> 注册
                        </a>
                    </li>

                    <li id="admin-404">
                        <a href="all-admin-404.jsp">
                            <i class="fa fa-circle-o"></i> 404页
                        </a>
                    </li>

                    <li id="admin-500">
                        <a href="all-admin-500.jsp">
                            <i class="fa fa-circle-o"></i> 500页
                        </a>
                    </li>

                    <li id="admin-blank">
                        <a href="all-admin-blank.jsp">
                            <i class="fa fa-circle-o"></i> 空白页
                        </a>
                    </li>

                    <li id="admin-datalist">
                        <a href="all-admin-datalist.jsp">
                            <i class="fa fa-circle-o"></i> 数据列表页
                        </a>
                    </li>

                    <li id="admin-dataform">
                        <a href="all-admin-dataform.jsp">
                            <i class="fa fa-circle-o"></i> 表单页
                        </a>
                    </li>

                    <li id="admin-profile">
                        <a href="all-admin-profile.jsp">
                            <i class="fa fa-circle-o"></i> 个人中心
                        </a>
                    </li>

                    <li id="admin-invoice">
                        <a href="all-admin-invoice.jsp">
                            <i class="fa fa-circle-o"></i> 发票
                        </a>
                    </li>

                    <li id="admin-invoice-print">
                        <a href="all-admin-invoice-print.jsp">
                            <i class="fa fa-circle-o"></i> 发票打印
                        </a>
                    </li>

                </ul>
            </li>


            <li class="treeview">
                <a href="#">
                    <i class="fa fa-cube"></i> <span>订单管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">

                    <li id="order-manage">
                        <a href="all-order-manage-list.jsp">
                            <i class="fa fa-circle-o"></i> 全部订单
                        </a>
                    </li>

                    <li id="order-cancel">
                        <a href="all-order-cancel-list.jsp">
                            <i class="fa fa-circle-o"></i> 退款
                        </a>
                    </li>

                </ul>
            </li>


            <li class="treeview">
                <a href="#">
                    <i class="fa fa-cogs"></i> <span>系统管理</span>
                    <span class="pull-right-container">
            <i class="fa fa-angle-left pull-right"></i>
        </span>
                </a>
                <ul class="treeview-menu">
                    <li id="admin-setting">
                        <a href="admin-setting.jsp">
                            <i class="fa fa-circle-o"></i> 系统设置
                        </a>
                    </li>

                    <li id="admin-back">
                        <a href="admin-back.jsp">
                            <i class="fa fa-circle-o"></i> 数据备份
                        </a>
                    </li>

                    <li id="admin-log">
                        <a href="admin-log.jsp">
                            <i class="fa fa-circle-o"></i> 操作日志
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 菜单 /-->
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<!-- 导航侧栏 /-->
