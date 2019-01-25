<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%
	String sPlUrl = Tools.urlKill("l|p");
	int l =(int) request.getAttribute("l");
	int p =(int) request.getAttribute("p");
	int pages =(int) request.getAttribute("pages");
	boolean canDel = (boolean) request.getAttribute("canDel");
	String type = request.getParameter("type");
	String cn = request.getParameter("cn");
	String sdo = request.getParameter("sdo");
	String msg =  "/WEB-INF/jsp/manager/" + type + "/" + cn + ".btn.jsp";
	ServletContext context = request.getSession().getServletContext();
	InputStream is= context.getResourceAsStream(msg);
	boolean havebtnfile = is!=null;
	if (havebtnfile){
		is.close();
	}
%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			${lsitTitleString} <small>共${recs}个 </small>
		</h1>
	</section>
	<!-- Main content -->
	<section class="content">
		<div class="admin-tools">
			<div class="row">
				<div class="col-sm-9 admin-button"><%-- col-sm-9，后面的数字9表示宽度，总共是12， --%>
					<div class="btn-group">
						<a href="<%=Tools.urlKill("id|sdo")+"&sdo=form"%>" data-target="#modal" class="btn btn-default"><i class="fa fa-edit"></i> 新增 </a> 
						<c:if test="${canDel}"><a href="javascript:;" id="del_more_btn" class="btn btn-default"><i class="fa fa-trash-o"></i> 删除</a></c:if>
						<%if(havebtnfile){%>
							<jsp:include page="<%=msg%>"></jsp:include>
						<%}%>
					</div>
				</div>
				<div class="col-sm-3 admin-page-top hidden-xs">
					<select id="page_limit_select" onchange="window.location.href='<%=sPlUrl%>&l='+this.value" class="form-control">
					<c:forEach var="i" begin="10" end="100" step="10">	
						<option value="${i}" <c:if test="${i==l}"> selected="selected" </c:if>>每页${i}条</option>
 					</c:forEach>						
					</select>
					<div class="btn-group">
						<a href="<%=sPlUrl%>&p=${p-1<=0?1:p-1}" class="btn btn-default">«</a> <a href="<%=sPlUrl%>&p=${p+1>pages?pages:p+1}"
						 class="btn btn-default">»</a>
					</div>
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
				msg =  "/WEB-INF/jsp/manager/" + type + "/" + cn + ".list.jsp";
			%>
			<jsp:include page="<%=msg%>"></jsp:include>
		</div>
		<div class="foot-page">
			<ul class="pagination no-margin">
			${htmlpages}
			</ul>
			<div class="page-num">
				共${recs}个 分${pages}页显示
			</div>
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.content-wrapper -->

<%-- <script type="text/javascript" src="/manager/js/list.js"></script> --%>