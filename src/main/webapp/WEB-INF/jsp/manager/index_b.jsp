<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
			String sdo = request.getParameter("sdo");
			String iframe = request.getParameter("iframe");
			String msg ="404";
			String head ="head.jsp";
			String header ="header.jsp";
			String slidebar = "sidebar.jsp";
			switch (sdo) {//过滤恶意的
				case "form":
				case "list":
					msg = "/WEB-INF/jsp/manager/" + sdo + ".jsp";
					break;
				default:
					break;
			}
			if (iframe!=null){
				switch (iframe) {//过滤恶意的
					case "yes":
					case "1":
					case "ok":
						msg =msg+".iframe.jsp";
						head = head+".iframe.jsp";
						slidebar = slidebar+".iframe.jsp";
						header = header+".iframe.jsp";
						break;
					default:
						break;
				}
			}
		%>
<%-- head.jsp 页面--%>
<jsp:include page="<%=head%>"></jsp:include>
<body class="skin-blue sidebar-mini fixed" >
<%if(request.getParameter("inframe")==null||request.getParameter("inframe")==""){%>
	<div class="wrapper">
		<%}%>
	<%--header.jsp 页面--%>
	<%if(request.getParameter("inframe")==null||request.getParameter("inframe")==""){%>
	<jsp:include page="<%=header%>"></jsp:include>
	<!-- Left side column. contains the logo and sidebar -->
	<%--sidebar.jsp 页面--%>
	<jsp:include page="<%=slidebar%>"></jsp:include>
	<%}%>
	<%if(request.getParameter("inframe")==null||request.getParameter("inframe")==""){%>
	<div class="wrapper">
		<%}%>
		<%if(request.getParameter("inframe")!=null || request.getParameter("iframe")==null){%>
		<!-- Content Wrapper. Contains page content -->
		<jsp:include page="<%=msg%>"></jsp:include>
		<%}%>
			<%if(request.getParameter("inframe")==null||request.getParameter("inframe")==""){%>
	</div>
			<%}%>
	</div>	
</body>
</html>

