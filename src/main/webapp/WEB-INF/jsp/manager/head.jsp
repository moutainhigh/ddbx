<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/9/21/021
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<% 
  String AdminLTE_Path = "/manager/AdminLTE-2.4.5/";
%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>
  后台演示
  </title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <script type="text/javascript">
    var _rooturl = "<?php echo $_rooturl ?>";
    var page_cn = "<?php echo $cn ?>";
  </script>
  <!-- Bootstrap 3.3.4 -->
  <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <!-- Font Awesome Icons -->
  <!-- Font Awesome Icons -->
  <link href="icon/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="js/select2/select2.min.css" rel="stylesheet" type="text/css" />
  <link href="dist/css/ionicons.min.css" rel="stylesheet">
  <!-- Theme style -->
  <link href="dist/css/AdminLTE.css" rel="stylesheet" type="text/css" />
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
			page. However, you can choose any other skin. Make sure you
			apply the skin class to the body tag so the changes take effect.
	-->
  <link href="dist/css/skins/skin-blue.css" rel="stylesheet" type="text/css" />
  <link href="dist/css/style.css" rel="stylesheet" type="text/css" />
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
		<script src="https://cdn.bootcss.com/html5shiv/r29/html5.min.js"></script>
		<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
  <!-- jQuery 2.1.4 -->
  <script src="js/jQuery-2.1.4.min.js" type="text/javascript"></script>
  <script src="js/common.js" type="text/javascript"></script>
  <script src="js/jquery.form.js" type="text/javascript"></script>
  <script src="js/ajaxfileupload.js" type="text/javascript"></script>
  <script type="text/javascript" src="js/php.js"></script>
  <!-- Bootstrap 3.3.2 JS -->
  <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
  <script src="js/daterangepicker/moment.js" type="text/javascript"></script>
  <script src="js/daterangepicker/daterangepicker.js" type="text/javascript"></script>
  <link href="js/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css" />
  <script src="js/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
  <link href="js/datepicker/datepicker3.css" rel="stylesheet" type="text/css" />
  <script src="js/datepicker/locales/bootstrap-datepicker.zh-CN.js" type="text/javascript"></script>
  <script src="js/datetimepicker/bootstrap-datetimepicker.js" type="text/javascript"></script>
  <link href="js/datetimepicker/bootstrap-datetimepicker.css" rel="stylesheet" type="text/css" />
  <script src="js/datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js" type="text/javascript"></script>
  <script src="js/select2/select2.min.js" type="text/javascript"></script>
  <script src="js/select2/i18n/zh-CN.js" type="text/javascript"></script>
  <!-- AdminLTE App -->
  <script src="dist/js/app.min.js" type="text/javascript"></script>
  <script src="dist/js/jQuery-slimScroll-1.3.8/jquery.slimscroll.js " type="text/javascript"></script>
  <!-- <script src="/comm/jquery.dragsort-0.4.min.js" type="text/javascript"></script> -->
  <link href="dist/css/iconfont.css" rel="stylesheet" type="text/css" />
  <%-- 文件上传 --%>
  <script type="text/javascript" src="js/fileupload.js?v=4.0"></script><%--这个必须--%>
  <script type="text/javascript" src="js/exif.js"></script><%--这个必须,处理图片用--%>
  <script type="text/javascript" src="js/megapic-image.js"></script><%--这个必须，压缩和处理图片用--%>
  <%-- app.iframe --%>
  <script src="iframe/dist/js/app_iframe.js?ver=3"></script>
  <link href="dist/css/style.css" rel="stylesheet" type="text/css" />
</head>