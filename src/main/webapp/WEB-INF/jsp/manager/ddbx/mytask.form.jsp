<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.tool.Config" %>
<%@ page import="com.example.ddbx.tt.tool.DbTools" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="admin-content nav-tabs-custom box">
	<div class="box-header with-border">
		<div class="box-header with-border">
			<ul id="myTab" class="nav nav-tabs">
				<li class="active">
					<a href="#rwcl" data-toggle="tab">任务处理</a>
				</li>
				<li>
					<a href="#jcxx" data-toggle="tab">基础信息</a>
				</li>
				<li>
					<a href="#khgl" data-toggle="tab">客户管理</a>
				</li>
				<li>
					<a href="#dkgl" data-toggle="tab">贷款管理</a>
				</li>
				<li>
					<a href="#clxx" data-toggle="tab">车辆信息</a>
				</li>
				<li>
					<a href="#zzsc" data-toggle="tab">资质审查</a>
				</li>
				<li>
					<a href="#yycl" data-toggle="tab">影音材料</a>
				</li>
				<li>
					<a href="#sfmx" data-toggle="tab">收费明细</a>
				</li>


			</ul>
		</div>
		<div id="myTabContent" class="tab-content">

			<div class="tab-pane fade active in" id="rwcl">
				<div class="box-body">
					任务处理板块
				</div>
			</div>

			<div class="tab-pane fade" id="jcxx">
				<div class="box-body">
					基础信息板块
				</div>
			</div>
		</div>
	</div>
	<script src="iframe/dist/js/app_iframe.js?ver=3"></script>
	<script src="js/ChinesePY.js"></script>
	<script>


		function doShowLoading() {
			App.setbasePath("iframe/");
			App.setGlobalImgPath("dist/img/");
			App.blockUI({
				target: '#tab-content',
				boxed: true,
				message: '加载中......' //,
				// animate: true
			});
			setTimeout("doCloseLoading()", 3000);
		}

		function doCloseLoading() {
			App.unblockUI('#tab-content'); //解锁界面
		}
	</script>