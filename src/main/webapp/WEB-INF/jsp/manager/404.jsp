<%@ page contentType="text/html;charset=UTF-8" language="java"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
                <%-- head.jsp 页面--%>
                    <%
                      String head ="head.jsp";
                    %>
                        <jsp:include page="<%=head%>"></jsp:include>

                        <body class="skin-blue sidebar-mini fixed">
                            <div class="box-body">
                                <div class="callout callout-danger">
                                    <h4>老大非常请求了</h4>

                                    <p>There is a problem that we need to fix. A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
                                </div>
                                <div class="callout callout-info">
                                    <h4>I am an info callout!</h4>

                                    <p>Follow the steps to continue to payment.</p>
                                </div>
                                <div class="callout callout-warning">
                                    <h4>I am a warning callout!</h4>

                                    <p>This is a yellow callout.</p>
                                </div>
                                <div class="callout callout-success">
                                    <h4>I am a success callout!</h4>

                                    <p>This is a green callout.</p>
                                </div>

                                <a type="button" href="/manager/index?&cn=home&sdo=form&type=demo" class="btn btn-block btn-primary btn-lg">返回首页</a>
                            </div>
                        </body>