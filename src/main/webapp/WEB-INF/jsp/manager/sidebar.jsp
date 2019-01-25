<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="Tools" uri="/tld/manager" %>
 
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header">管理菜单</li>
            <%
                String nowurl = Tools.urlKill("cn|sdo|type|id")+"&cn=home&sdo=form&type=demo";
                String nowcn = request.getParameter("cn");
                String nowsdo = request.getParameter("sdo");
                String nowtype = request.getParameter("type");
            %>
            <li <% if(nowcn.equals("home") && nowtype.equals("demo")){ %> class="active" <%}%>>
                <a href="<%=nowurl%>"> <i class="fa fa-home"></i> <span>管理中心首页</span>
                </a>
            </li>
            <% 
                Map<String,Object> menus = (Map<String,Object>)request.getAttribute("menus");
                for (String key :menus.keySet()){  //一级菜单循环开始
                    List<Map<String, String>> submenus =(List<Map<String, String>>)menus.get(key);
                    String iconHtmlMain = submenus.get(submenus.size()-1).get("icon");
                    submenus.remove(submenus.size()-1);
                    iconHtmlMain = !Tools.myisnull(iconHtmlMain)?iconHtmlMain:"<i class=\"fa fa-sitemap\"></i>";
            %>
            <li>
                <a href="#"> <%=iconHtmlMain%> <span><%=key%></span>
                </a>
                <ul class="treeview-menu">
                <%
                    for (Map<String, String> keysub :submenus){//二级级菜单循环开始
                        String cn = keysub.get("cn");
                        String type = keysub.get("type");
                        String sdo = keysub.get("sdo");
                        String icohtml = keysub.get("icohtml");
                        String subMenuName = keysub.get("showmmenuname");
                        boolean active = nowcn.equals(cn) &&  nowtype.equals(type) /*&& nowsdo.equals(sdo)*/;
                %>
                    <li <% if(active){ %> class="active" <%}%> >
                        <a href="index?cn=<%=cn%>&sdo=<%=sdo%>&type=<%=type%>"><%=icohtml%>
                            <span><%=subMenuName%></span>
                            <%--显示小图标 <span class="pull-right-container">
                                <small class="label pull-right bg-green">16</small>
                                <small class="label pull-right bg-red">5</small>
                            </span> --%>
                        </a>
                    </li>
                <%//二级级菜单循环结束
                    }
                %>
                    
                </ul>
            </li>
            <%
            //一级菜单循环结束
                }
            %>
        </ul> <!-- /.sidebar-menu -->
    </section> <!-- /.sidebar -->
</aside>
<script>
    $('li.active').parents('li').addClass('treeview').addClass('active');
</script>