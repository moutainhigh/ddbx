<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- Content Wrapper. Contains page content -->
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			${listpagetille} <small> 共$ {totalcount} 个 </small>
		</h1>
	</section>

	<!-- Main content -->
	<section class="content">
		<div class="admin-tools">
			<div class="row">
				<div class="col-sm-9 admin-button"><%-- col-sm-9，后面的数字9表示宽度，总共是12， --%>
					<div class="btn-group">
						<a data-toggle="modal" href="" data-target="#modal" class="btn btn-default"><i class="fa fa-edit"></i> 新增 </a> <a
						 href="javascript:;" onclick="ajax_edit(null,'showtag','1')" class="btn btn-default"><i class="fa fa-arrow-circle-o-up"></i>
							发布</a> <a href="javascript:;" onclick="ajax_edit(null,'showtag','0')" class="btn btn-default"><i class="fa fa-arrow-circle-o-down"></i>
							待审</a> <a href="javascript:;" id="del_more_btn" class="btn btn-default"><i class="fa fa-trash-o"></i> 删除</a>
							<a href="javascript:dosearch();" class="btn btn-default pull-right">搜索</a>
							<input type="text" id="kw2" name="kw2" value="" class="form-control pull-right" onkeydown="searchkeypress(event);" placeholder="授权书or黑名单编号/被查身份证/姓名/电话">
					</div>
				</div>
				<div class="col-sm-3 admin-page-top hidden-xs">
					<select id="page_limit_select" onchange="window.location.href=''" class="form-control">
						<option>每页10条</option>
						<option>每页20条</option>
					</select>
					<div class="btn-group">
						<a href="<?php echo urlkill('p')?>&p=<?php echo $class->p-1?>" class="btn btn-default">«</a> <a href="<?php echo urlkill('p')?>&p=<?php echo $class->p+1?>"
						 class="btn btn-default">»</a>
					</div>
					<?php }?>
				</div>
			</div>
		</div>
		<div id="main_list" class="admin-content box">
			<!-- 数据载入中 请在搜索，筛选，载入的时候显示 放在.box里 -->
			<div class="overlay" style="display: none;">
				<i class="fa fa-refresh fa-spin"></i>
			</div>
			<!-- 数据载入中结束 -->
			<%
				String type = request.getParameter("type");
				String cn = request.getParameter("cn");
				String sdo = request.getParameter("sdo");
				String msg =  "/WEB-INF/jsp/manager/" + type + "/" + cn + ".list.jsp";
			%>
			<jsp:include page="<%=msg%>"></jsp:include>
		</div>
		<div class="foot-page">
			<ul class="pagination no-margin">
				<?php echo $page;?>
			</ul>
			<div class="page-num">
				共
				<?php echo $list_recs?>
				个 分
				<?php echo $page_max?>
				页显示
			</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%-- <script type="text/javascript" src="/manager/js/list.js"></script> --%>