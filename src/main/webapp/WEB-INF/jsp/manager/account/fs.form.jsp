<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.tool.Config" %>
<%@ page import="com.example.ddbx.tt.tool.DbTools" %>
<%@ page import="com.example.ddbx.tt.data.TtMap" %>
<%@ page import="com.example.ddbx.tt.data.TtList" %>
<%@ page import="com.example.ddbx.tt.tool.DataDic" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="admin-content nav-tabs-custom box">
	<div class="box-header with-border">
		<div class="box-header with-border">
			<h3 class="box-title">代理公司</h3>
		</div>
		<div class="box-body" id="tab-content">
			<div class="form-group">
				<label class="col-sm-2 control-label">公司性质</label>
				<div class="col-sm-6">
					<select id="bank_id" name="bank_id" class="form-control">
                       <%=Tools.dicopt(DataDic.dic_gs_type,"0")%>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">公司名称</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="name" name="name"   placeholder="公司名称">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">签约时完整名称</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="name_qy" name="name_qy" placeholder="签约时完整名称">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">名称拼音</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="code_pre" name="code_pre" placeholder="名称拼音">
				</div>
			</div>
			<script>
				$("#name").change(function(){
					var name=$("#name").val();
				  	var py=getPinYinFirstCharacter(name,"","");
					py = py.replace(/\ +/g,"").replace(/[\r\n]/g,"");
					document.getElementById("code_pre").value=py;
				});

			</script>
			<%
				Map<String, String> infodb = (Map<String, String>) request.getAttribute("infodb");
			%>
			<div class="form-group">
				<label class="col-sm-2 control-label">公司logo</label>
				<div class="col-sm-6">
					<% 
								String  upFile = "../upfile.inc.jsp";
								String imgPreName = "fs_logo";
                String[] ssImgs = { //设置已有值
											!Tools.myIsNull(infodb.get(imgPreName))?infodb.get(imgPreName):""
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
						<jsp:param name="img_NamePre" value="fs_logo" />
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
			//String cp = Tools.dicopt("comm_citys", 0);//市，
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
						<div class="col-sm-3">
							<div class="input-group">
								<span class="input-group-addon">县</span>
								<select name="zone_id" id="zone_id" class="form-control">
									<option value="0">请选择</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">详细地址</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="address" name="address" placeholder="详细地址">
				</div>
			</div>
			<div class="form-group">
				<label for="link" class="col-sm-2 control-label">权限列表</label>
				<div class="col-sm-10">
					<table class="table table-bordered table-hover">
						<tbody>
						<tr>
							<th style="width: 140px"><label class="checkbox-inline"><input type="checkbox" class="check_all"
																						   onclick="checkall(this,1)">全选</label></th>
							<th><label class="checkbox-inline"><input type="checkbox" class="check_all" onclick="checkall(this,2)">全选</label></th>
						</tr>
						<%
							Map<String,Object> menus = (Map<String,Object>)request.getAttribute("modals");
							for (String key :menus.keySet()){  //一级菜单循环开始
								Map<String,Object>  mainList = (Map<String,Object>) menus.get(key);
								TtList submenus =(TtList)mainList.get("submenu");
								TtMap mainInfo = (TtMap)mainList.get("mainmenu");
								String iconHtmlMain = mainInfo.get("icohtml");
								iconHtmlMain = !Tools.myIsNull(iconHtmlMain)?iconHtmlMain:"<i class=\"fa fa-sitemap\"></i>";
								boolean haveAgp = (","+infodb.get("purview_map")).indexOf(","+mainInfo.get("id")+",")!=-1;
								String mainCheckName = "MAIN/"+mainInfo.get("id");
						%>
						<tr>
							<td><label class="checkbox-inline"><input type="checkbox" name="<%=mainCheckName%>" id="<%=mainCheckName%>"
																	  value="<%=haveAgp?"1":"0"%>"  onclick="checkfl(this)" "<%=haveAgp?"checked":""%>" /><%=key%></label>
							</td>
							<td>
								<%
									for (TtMap keysub :submenus){//二级级菜单循环开始
										String cn = keysub.get("cn");
										String type = keysub.get("type");
										String sdo = keysub.get("sdo");
										String icohtml = keysub.get("icohtml");
										String subMenuName = keysub.get("showmmenuname");
										boolean haveAgp2 = (","+infodb.get("purview_map")).indexOf(","+keysub.get("id")+",")!=-1;
										String subCheckName = mainCheckName.replace("MAIN","SUBMAIN")+"/"+keysub.get("id");
								%>
								<label class="checkbox-inline"><input type="checkbox" name="<%=subCheckName%>" id="<%=subCheckName%>"
																	  value="<%=haveAgp2?"1":"0"%>" onclick="check(this)" />
									<%=subMenuName%></label>
								<%}%>
							</td>
						</tr>
						<%}%>
						</tbody>
					</table>
				</div>
			</div>
			<script>
				/*选择省后，动态获取省下面的市，并默认选中你指定的id的市，/ttAjax在Ajax.java中处理
														/ttAjax也可以单独使用，比如
														/ttAjax?do=opt&cn=kjb_user&id=3&mid_add=100000
														//显示创建人id为100000的所有用户，默认选择id为3的记录
														* */
				objacl('#state_id', '#city_id', '/ttAjax?do=opt&cn=comm_citys&id=0&state_id=', '${infodb.state_id}', '${infodb.city_id}');
				objacl('#city_id', '#zone_id', '/ttAjax?do=opt&cn=comm_zones&id=0&cityid=', '${infodb.city_id}', '${infodb.zone_id}');
			</script>
		</div>
	</div>
</div>
<script src="iframe/dist/js/app_iframe.js?ver=3"></script>
<script src="js/ChinesePY.js"></script>
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
<script>
	$(document).ready(function() {
		input = document.getElementsByTagName("input");
		for (var i = 0; i < input.length; i++) {
			if ((input[i].type == "checkbox") ) {
				input[i].checked = input[i].value==1;
			}
		}
		// $("#info_form").submit(function() {
		// 	//alert($("input:checkbox[name='orders']").val());
		// 	if (this.name.value.length == 0) {
		// 		alert("请输入管理组名称");
		// 		return false;
		// 	}
		// });
	});

	function check(obj) {
		obj.value = (obj.checked ? "1" : "0");
	}

	function checkall(obj, type) {
		if (type == 1) { //勾选大类
			input = document.getElementsByTagName("input");
			for (var i = 0; i < input.length; i++) {
				if ((input[i].type == "checkbox") && (input[i].name.length > 0) && (input[i].name.indexOf("MAIN/") == 0)) {
					input[i].checked = obj.checked;
					input[i].value = obj.checked ? 1 : 0;
				}
			}
		} else {
			input = document.getElementsByTagName("input");
			for (var i = 0; i < input.length; i++) {
				if ((input[i].type == "checkbox") && (input[i].name.length > 0) && (input[i].name.indexOf("SUBMAIN/") == 0)) {
					input[i].checked = obj.checked;
					input[i].value = obj.checked ? 1 : 0;
				}
			}

		}
	}

	function checkfl(obj) {
		obj.value = (obj.checked ? "1" : "0");
		input = document.getElementsByTagName("input");
		for (var i = 0; i < input.length; i++) {
			if ((input[i].type == "checkbox") && (input[i].name.length > 0) && (input[i].name.indexOf(obj.name) >= 0)) {
				input[i].checked = obj.checked;
				input[i].value = obj.checked ? 1 : 0;
			}
		}
	}
</script>