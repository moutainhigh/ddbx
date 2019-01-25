<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.ddbx.tt.tool.Tools" %>
<%@ page import="com.example.ddbx.tt.tool.Config" %>
<%@ page import="com.example.ddbx.tt.tool.DbTools" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	DbTools myDbTools = new DbTools(null, true);
	Map<String, String> info = myDbTools.recinfo("select fsid from dd_gems where id="+Tools.mid(), false, "", null);
%>
<input id="up_id" name="up_id" type="hidden" value="<%=info.get("fsid") %>">
<div class="admin-content nav-tabs-custom box">
	<div class="box-header with-border">
		<div class="box-header with-border">
			<h3 class="box-title">代理公司</h3>
		</div>
		<div class="box-body" id="tab-content">
			<div class="form-group">
				<label class="col-sm-2 control-label">公司名称</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="name" name="name"  placeholder="公司名称">
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
					<input type="text" class="form-control" id="name_py" name="name_py" placeholder="名称拼音">
				</div>
			</div>
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
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">详细地址</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="address" name="address" placeholder="详细地址">
				</div>
			</div>
			<script>
				/*选择省后，动态获取省下面的市，并默认选中你指定的id的市，/ttAjax在Ajax.java中处理
														/ttAjax也可以单独使用，比如
														/ttAjax?do=opt&cn=kjb_user&id=3&mid_add=100000 //显示创建人id为100000的所有用户，默认选择id为3的记录
														* */
				objacl('#state_id', '#city_id', '/ttAjax?do=opt&cn=comm_citys&id=3&state_id=', '${infodb.state_id}', '${infodb.city_id}');
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