<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<form id="info_form" action="${posturl}" class="form-horizontal" method="post" enctype="multipart/form-data">
	<input type="hidden" id="id" name="id" value="${id }" />
	<section class="content-header">
    <h1>
        <small>测试时所所所所所所所todo</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>1111</a></li>
        <li class="active">222222222</li>
    </ol>
</section>
<section class="content">
	<!-- Content Wrapper. Contains page content -->
		<!-- Main content -->
			<%
				String type = request.getParameter("type");
				String cn = request.getParameter("cn");
				String sdo = request.getParameter("sdo");
				String msg =  "/WEB-INF/jsp/manager/" + type + "/" + cn + ".form.jsp";
				String info =String.valueOf(request.getAttribute("info"));
			%>
			<jsp:include page="<%=msg%>"></jsp:include>
</section>
		<div class="footer-wrap">
			<div class="box-footer">
				<button type="button" class="btn btn-default" onclick="location.href='#'">取消返回</button>
				<button type="submit" class="btn btn-primary pull-right">保存提交</button>
			</div>
		</div>
	<!-- /.content-wrapper -->

</form>
<script src="${pageContext.request.contextPath}/manager/js/common.js"></script>
<script>
function sure(){//todo
	var form = $("#info_form").get(0);
	$(form).ajaxSubmit(function(res){
			eval("var res=" + res);
			if (res.msg){
				alert(res.msg);
			}
			if (res.next_url){
				window.location.href=res.next_url;
			}
	});
}
editFun(${info});
</script>
