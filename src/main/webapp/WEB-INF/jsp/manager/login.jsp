<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<!--
 * @Description: file content
 * @Author: tt
 * @Date: 2019-01-10 10:54:21
 * @LastEditTime: 2019-01-16 13:45:29
 * @LastEditors: tt
 -->
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
    <!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title>系统后台管理-登入</title>
        <meta name="format-detection" content="telephone=no, email=no" />
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <!-- Bootstrap 3.3.4 -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- Font Awesome Icons -->
        <link href="icon/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Theme style -->
        <link href="dist/css/AdminLTE.css" rel="stylesheet" type="text/css" />
        <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
		          page. However, you can choose any other skin. Make sure you
		          apply the skin class to the body tag so the changes take effect.
		    -->
        <link href="dist/css/skins/skin-green.css" rel="stylesheet" type="text/css" />
        <link href="dist/css/style.css" rel="stylesheet" type="text/css" />
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
	        <script src="https://cdn.bootcss.com/html5shiv/r29/html5.min.js"></script>
	        <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
        <!-- <script src="js/jQuery-2.1.4.min.js" type="text/javascript"></script> -->
        <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" type="text/javascript"></script>
        <script src="js/jquery.form.js" type="text/javascript"></script>
        <!-- Bootstrap 3.3.2 JS -->
    </head>
    <!--
  BODY TAG OPTIONS:
  =================
  Apply one or more of the following classes to get the
  desired effect
  |---------------------------------------------------------|
  | SKINS         | skin-blue                               |
  |               | skin-black                              |
  |               | skin-purple                             |
  |               | skin-yellow                             |
  |               | skin-red                                |
  |               | skin-green                              |
  |---------------------------------------------------------|
  |LAYOUT OPTIONS | fixed                                   |
  |               | layout-boxed                            |
  |               | layout-top-nav                          |
  |               | sidebar-collapse                        |
  |               | sidebar-mini                            |
  |---------------------------------------------------------|
  -->

    <body class="skin-green login-page" style="background: url(images/bg2.jpeg) no-repeat center;">
        <div class="login-box">
            <div class="login-logo">
                <img src="images/logo.png" style="width: 50px">
            </div>
            <!-- /.login-logo -->
            <div class="login-box-body">
                <p class="login-box-msg">登录后台管理系统</p>
                <form id="loginform">
                    <input type="hidden" name="sdo" value="login">
                    <div class="form-group has-feedback">
                        <input type="user" class="form-control" placeholder="用户名" name="username" onfocus="myfocus(this)" />
                        <span class="fa fa-user form-control-feedback"></span>
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" placeholder="密码" name="password" />
                        <span class="fa fa-lock form-control-feedback"></span>
                    </div>
                    <div class="row">
                        <div class="col-xs-7">
                            <div class="checkbox">
                                <label>
								<input type="checkbox" name="remember" onclick="check(this)">
								自动登录
							</label>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-xs-5">
                            <a class="btn btn-danger btn-block" onclick="dologin();">登录</a>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>
            </div>
            <!-- /.login-box-body -->
        </div>
    </body>
	<script type="text/javascript">
		function myfocus(obj){
			$(obj).parents(".form-group").removeClass("has-error");
			$(obj).prev().remove();
		}
	  function check(obj){
	    	obj.value=(obj.checked?"1":"0");
	    }
		function dologin(){
			var form = $("#loginform").get(0);
			if(form.username.value==""){
				 alert("请输入用户名");
				 return false;
			}
			if(form.password.value==""){
				 alert("请输入密码");
				 return false;
            }
            $("#loginform").attr("action","<%=Tools.urlKill("")%>");
            $("#loginform").attr("method", "post");
			$(form).ajaxSubmit(function(res){
                eval("var res="+res);
                if (res.success=="false"){//失败时显示错误提示！
                    alert(res.msg);
                }
                location.href=res.next_url;
			});
			return true;
		};
		
</script>
</html>