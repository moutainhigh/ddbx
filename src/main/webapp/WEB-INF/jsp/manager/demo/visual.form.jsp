<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="Tools" uri="/tld/manager" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script type="text/javascript" src="/manager/js/visual/echarts.js"></script>
<script type="text/javascript" src="/manager/css/visual/Visual.css"></script>

<div class="content_visual">
  <div class="form_visual">
      <%--  数据图一  --%>
    <div class="form_visual_form1">
        <div class="visual_form1_top">
            <div class="visual_form1_top_left">
                <div class="baodan_left">
                    <div class="baodan_left_title" style="margin-bottom: 5%;">报单统计</div>
                    <div style="width: 100%;height: 7%;">
                        <ul  >
                            <li>
                                <input type="text" placeholder="请输入代理商" />
                            </li>
                            <li>
                                <div>请选择省份<i>></i></div>
                            </li>
                            <li>
                                <div>请选择时间<i>></i></div>
                            </li>
                        </ul>
                    </div>
                    <div style="height: 80%;width: 100%; position: relative; top: -20px; padding-left: 4%;" id="baodan">
                    </div>
                </div>
                <div class="baodan_right">

                </div>
            </div>
            <div class="visual_form1_top_right">

            </div>
        </div>
        <div class="visual_form1_bottom">

        </div>
    </div>
     <%-- 数据图切换按钮 --%>
    <div class="qiehuanbutton" onclick="visualTransform()">切</br>换</div>
      <%--  数据图二  --%>
    <div class="form_visual_form2">


    </div>
  </div>
</div>

<script type="text/javascript" src="/manager/js/visual/visual.js"></script>
<script type="text/javascript">
    window.onload =function(){
        document.getElementById("").style.display="none";
    };
</script>





