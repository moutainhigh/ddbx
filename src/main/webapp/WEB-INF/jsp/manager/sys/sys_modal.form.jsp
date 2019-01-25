<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.tt.tool.Tools" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
		Map<String, String> infodb = (Map<String, String>) request.getAttribute("infodb");
		long id_uplevel = 0;
		if (!Tools.myisnull(infodb.get("id_uplevel"))){
			id_uplevel = Long.parseLong(infodb.get("id_uplevel"));
		}
%>
<div class="admin-content nav-tabs-custom box">
	<div class="box-header with-border">
		<div class="box-header with-border">
			<h3 class="box-title">编辑模块</h3>
		</div>
		<div class="box-body" id="tab-content">
			<div class="form-group">
				<label class="col-sm-2 control-label">菜单完整名称</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="name" name="name" placeholder="比如，系统管理里面的管理员管理">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">后台菜单显示名称</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="showmmenuname" name="showmmenuname" placeholder="显示在后台左侧里面的名称，最好4个字以内">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">上级模块</label>
				<div class="col-sm-6">
					<select id="id_uplevel" name="id_uplevel" class="form-control">
						<option value="0">一级菜单</option>
						${Tools.dicopt("sys_modal",id_uplevel,"level=1","")}
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">显示/隐藏到后台菜单</label>
				<div class="col-sm-6">
					<select id="showmmenutag" name="showmmenutag" class="form-control">
						<option value="">请选择</option>
						<option value="1">显示</option>
						<option value="0">隐藏</option>
					</select>
				</div>
			</div>			
			<div class="form-group">
				<label class="col-sm-2 control-label">cn</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="cn" name="cn" placeholder="cn" value="${infodb.get("cn")}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">type</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="type" name="type" placeholder="type" value="${infodb.get("type")}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">sdo</label>
				<div class="col-sm-6">
					<input type="text" class="form-control" id="sdo" name="sdo" placeholder="sdo" value="${infodb.get("sdo")}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">sort排序，越小越靠前</label>
				<div class="col-sm-6">
					<input type="number" class="form-control" id="sort" name="sort" placeholder="排序">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">icohtml显示图标</label>
				<div class="col-sm-6">
					<input type="icohtml" class="form-control" id="icohtml" name="icohtml" placeholder="icohtml显示图标，可不填，使用默认">
				</div>
			</div>
		</div>
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