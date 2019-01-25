<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="admin-content nav-tabs-custom box">
	<div class="box-header with-border">
		<div class="box-header with-border">
			<h3 class="box-title">修改用户</h3>
		</div>
		<div class="box-body" id="tab-content">
			<div class="form-group">
				<label class="col-sm-2 control-label">所属公司</label>
				<div class="col-sm-6">
					<select name="fsid" id="fsid" class="form-control">
						<option value="0">请选择</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">姓名</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="name" name="name" placeholder="姓名">
				</div>
			</div>
			<%
				Map<String, String> infodb = (Map<String, String>) request.getAttribute("infodb");
				if (Tools.myisnull(request.getParameter("id")) || Tools.myisnull(infodb.get("username"))){//如果是新增用户，或者当前编辑的用户的username值为空时，显示用户名输入框
			%>
			<div class="form-group">
				<label class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="username" name="username" placeholder="用户名">
				</div>
			</div>
			<%
				}
			%>
			<div class="form-group">
				<a href="javascript:doShowLoading();"><label class="col-sm-2 control-label">用户密码</label></a>
				<div class="col-sm-6">
					<div class="input-append input-group">
						<input type="password" class="form-control" id="password" name="password" placeholder="密码">
						<input type="text" class="form-control" id="userpass1" name="userpass1" placeholder="密码" style="display: none;">
						<span onclick="sh_password()" tabindex="100" title="点击显示/隐藏密码" class="add-on input-group-addon" style="cursor: pointer;">
							<i id="i_style" class="glyphicon icon-eye-open glyphicon-eye-open"></i>
						</span>
					</div>
				</div>
				<script>
					function sh_password() {
						var s = document.getElementById("i_style").className;
						//alert(s);
						if (s == 'glyphicon icon-eye-open glyphicon-eye-open') {
							document.getElementById("userpass1").value = document
									.getElementById("password").value;
							document.getElementById("i_style").className = 'glyphicon icon-eye-close glyphicon-eye-close';
							document.getElementById("userpass1").style.display = 'inline-block';
							document.getElementById("password").style.display = 'none';
						} else {

							document.getElementById("password").value = document
									.getElementById("userpass1").value;
							document.getElementById("i_style").className = 'glyphicon icon-eye-open glyphicon-eye-open';
							document.getElementById("password").style.display = 'inline-block';
							document.getElementById("userpass1").style.display = 'none';
						}

					}
				</script>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">头像</label>
				<div class="col-sm-6">
					<%
						String  upFile = "../upfile.inc.jsp";
						String imgPreName = "imgurl";
						String[] ssImgs = { //设置已有值
								!Tools.myisnull(infodb.get(imgPreName))?infodb.get(imgPreName):""
						};
						String sImgs = "";
						for (int i =0 ;i<ssImgs.length;i++){
							sImgs=sImgs+ssImgs[i]+"|";
						}
					%>
					<jsp:include page="<%=upFile%>">
						<jsp:param name="img_MarginImgSrc" value="" />
						<jsp:param name="img_MarginImgClass" value="" />
						<jsp:param name="img_Total" value="1" />
						<jsp:param name="img_NamePre" value="imgurl" />
						<jsp:param name="img_DefaultImgSrc" value="images/mgcaraddimg.jpg" />
						<jsp:param name="l1div_Style" value="width: 100px;height:140px;display: inline-block;text-align: center;margin: auto;" />
						<jsp:param name="img_Style" value="width: 100%;height:100px;border-radius:10px;" />
						<jsp:param name="img_FileStyle" value="position: absolute;left: 0;top: 0;height: 100%;width: 100%;background: transparent;border: 0;margin: 0;padding: 0;filter: alpha(opacity=0);-moz-opacity: 0;-khtml-opacity: 0;opacity: 0;" />
						<jsp:param name="img_Class" value="imgclass" />
						<jsp:param name="img_FileClass" value="uploadfileclass" />
						<jsp:param name="img_SmallWidth" value="100" />
						<jsp:param name="img_SmallHeight" value="100" />
						<jsp:param name="sImgs" value="<%=sImgs%>" />
					</jsp:include>
				</div>
			</div>
			<%--selcet，下拉框演示--%>
			<%
				//dicopt功能演示，指定表里面的name和id，并用name组成<option></option>
				String sp = Tools.dicopt("comm_states", 0);//省会，
			%>
			<div class="form-group">
				<label class="col-sm-2 control-label">显示/隐藏</label>
				<div class="col-sm-6">
					<select id="showtag" name="showtag" class="form-control">
						<option value="">请选择</option>
						<option value="1">显示</option>
						<option value="0">隐藏</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">权限分配</label>
				<div class="col-sm-6">
					<select name="agpid" id="agpid" class="form-control">
						<option value="0">请选择</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">所属部门</label>
				<div class="col-sm-6">
					<select name="ssbm" id="ssbm" class="form-control">
						<option value="0">请选择</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">用户等级</label>
				<div class="col-sm-6">
					<select name="cp" id="cp" class="form-control">
						<option value="0">请选择</option>
						<option value="1">1级</option>
						<option value="2">2级</option>
						<option value="3">3级</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">用户类型</label>
				<div class="col-sm-6">
					<select name="isadmin" id="isadmin" class="form-control">
						<option value="0">业务员</option>
						<option value="1">管理员</option>

					</select>
				</div>
			</div>
			<%--<div class="form-group">
				<label class="col-sm-2 control-label">城市选择</label>
				<div class="col-sm-10">
					<div class="row inline-from">
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon">省</span>
								<select name="state_id" id="state_id" class="form-control">
									<option value="0">请选择</option>
									<%=sp%>
								</select>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon">市</span>
								<select name="city_id" id="city_id" class="form-control">
									<option value="0">请选择</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script>
				/*选择省后，动态获取省下面的市，并默认选中你指定的id的市，/ttAjax在Ajax.java中处理
														/ttAjax也可以单独使用，比如
														/ttAjax?do=opt&cn=kjb_user&id=3&mid_add=100000 //显示创建人id为100000的所有用户，默认选择id为3的记录
														* */
				objacl('#state_id', '#city_id', '/ttAjax?do=opt&cn=comm_citys&id=3&state_id=', '${infodb.state_id}', '${infodb.city_id}');
			</script>
		</div>--%>
	</div>
</div>
<script src="iframe/dist/js/app_iframe.js?ver=3"></script>
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