<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
	<!-- 页面meta -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>职位管理</title>
	<meta name="description" content="职位管理">
	<meta name="keywords" content="职位管理">

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
	<%@ include file="admin-head.jsp"%>
	<!-- 页面头部 /-->

	<!-- 导航侧栏 -->
	<%@ include file="admin-menu.jsp"%>
	<!-- 导航侧栏 /-->

	<!-- 内容区域 -->
	<div class="content-wrapper">

		<!-- 内容头部 -->
		<section class="content-header">
			<h1>
				职位管理
				<small>职位管理</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="admin-index.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
				<li><a href="admin-position.jsp"><i class="fa fa-database"></i> 职位管理</a></li>
				<li class="active">职位管理</li>
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
								<th class="text-center" style="padding-right: 0px;"><input
										id="selall" type="checkbox" class="icheckbox_square-blue">
								</th>
								<th class="text-center">ID</th>
								<th class="text-center">Browser</th>
								<th class="text-center">Platform(s)
								</th>
								<th class="text-center">Engine
								</th>
								<th class="text-center">CSS grade </th>
								<th class="text-center">操作</th>
							</tr>
							</thead>
							<tbody class="text-center">

							<tr>
								<td><input name="ids" type="checkbox"></td>
								<td>1</td>
								<td>Internet Explorer 4.0</td>
								<td>Win 95+</td>
								<td>4</td>
								<td>X</td>
								<td class="text-center">
									<button type="button" class="btn btn-primary btn-xs">修改</button>
									<button type="button" class="btn btn-danger btn-xs">删除</button>
								</td>
							</tr>
							<tr>
								<td><input name="ids" type="checkbox"></td>
								<td>2</td>
								<td>Internet Explorer 4.0</td>
								<td>Win 95+</td>
								<td>4</td>
								<td>X</td>
								<td class="text-center">
									<button type="button" class="btn btn-primary btn-xs">修改</button>
									<button type="button" class="btn btn-danger btn-xs">删除</button>
								</td>
							</tr>
							<tr>
								<td><input name="ids" type="checkbox"></td>
								<td>3</td>
								<td>Internet Explorer 4.0</td>
								<td>Win 95+</td>
								<td>4</td>
								<td>X</td>
								<td class="text-center">
									<button type="button" class="btn btn-primary btn-xs">修改</button>
									<button type="button" class="btn btn-danger btn-xs">删除</button>
								</td>
							</tr>
							<tr>
								<td><input name="ids" type="checkbox"></td>
								<td>4</td>
								<td>Internet Explorer 4.0</td>
								<td>Win 95+</td>
								<td>4</td>
								<td>X</td>

								<td class="text-center">
									<button type="button" class="btn btn-primary btn-xs">修改</button>
									<button type="button" class="btn btn-danger btn-xs">删除</button>
								</td>
							</tr>
							<tr>
								<td><input name="ids" type="checkbox"></td>
								<td>5</td>
								<td>Internet Explorer 4.0</td>
								<td>Win 95+</td>
								<td>4</td>
								<td>X</td>

								<td class="text-center">
									<button type="button" class="btn btn-primary btn-xs">修改</button>
									<button type="button" class="btn btn-danger btn-xs">删除</button>
								</td>
							</tr>
							<tr>
								<td><input name="ids" type="checkbox"></td>
								<td>6</td>
								<td>Internet Explorer 4.0</td>
								<td>Win 95+</td>
								<td>4</td>
								<td>X</td>

								<td class="text-center">
									<button type="button" class="btn btn-primary btn-xs">修改</button>
									<button type="button" class="btn btn-danger btn-xs">删除</button>
								</td>
							</tr>
							<tr>
								<td><input name="ids" type="checkbox"></td>
								<td>7</td>
								<td>Internet Explorer 4.0</td>
								<td>Win 95+</td>
								<td>4</td>
								<td>X</td>
								<td class="text-center">
									<button type="button" class="btn btn-primary btn-xs">修改</button>
									<button type="button" class="btn btn-danger btn-xs">删除</button>
								</td>
							</tr>

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
							总共2 页，共14 条数据。 每页 <select class="form-control">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select> 条
						</div>
					</div>

					<div class="box-tools pull-right">
						<ul class="pagination">
							<li><a href="#" aria-label="Previous">首页</a></li>
							<li><a href="#">上一页</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
							<li><a href="#">下一页</a></li>
							<li><a href="#" aria-label="Next">尾页</a></li>
						</ul>
					</div>

				</div>
				<!-- /.box-footer-->



			</div>

		</section>
		<!-- 正文区域 /-->

	</div>

	<!-- 内容区域 /-->

	<!-- 底部导航 -->
	<%@ include file="admin-footer.jsp"%>
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
	$(document).ready(function() {
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


	$(document).ready(function() {

		// 激活导航位置
		setSidebarActive("admin-position");

		// 列表按钮
		$("#dataList td input[type='checkbox']").iCheck({
			checkboxClass: 'icheckbox_square-blue',
			increaseArea: '20%'
		});
		// 全选操作
		$("#selall").click(function() {
			var clicks = $(this).is(':checked');
			if (!clicks) {
				$("#dataList td input[type='checkbox']").iCheck("uncheck");
			} else {
				$("#dataList td input[type='checkbox']").iCheck("check");
			}
			$(this).data("clicks", !clicks);
		});
	});
</script>
</body>

</html>
<!---->