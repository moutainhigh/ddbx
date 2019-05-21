package com.example.ddbx.transfer.controller;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.example.ddbx.transfer.base.DataConversionParent;
import com.example.ddbx.transfer.base.BaseController;
import com.example.ddbx.transfer.base.Result;
import com.example.ddbx.transfer.base.RootStatic;
import com.example.ddbx.transfer.seats.PoolCache1;
import com.example.ddbx.transfer.entity.one.ScanPool1;
import com.example.ddbx.transfer.entity.one.PageInfo;
import com.example.ddbx.transfer.service.one.YXService;
import com.example.ddbx.transfer.utils.*;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;


/*
#新建视频面签模块
select * from sys_modal where name like '%面签%'
INSERT INTO `ddbxdb`.`sys_modal`(`name`, `id_uplevel`, `mid_add`, `mid_edit`, `dt_add`, `dt_edit`, `showmmenutag`, `showmmenuname`, `type`, `cn`, `sort`, `level`, `icohtml`, `urlotherstr`, `sdo`, `superadmin`, `show_tag`) VALUES ('视频面签', 176, 21, 21, '2019-05-20 14:04:23', '2019-05-20 14:04:23', 1, '视频面签', 'into_modal', 'yxVideo', 1, 1, '<i class=\"fa fa-home\"></i>', '', 'form', 1, 1);
*/

/**
 * @Description:TODO
 * @author:LiWang
 * @time:2018年8月22日
 */
@Controller
@RequestMapping("yx/")
public class YunXinController extends BaseController{
	private static Logger log = LogManager.getLogger(YunXinController.class.getName());
	public YunXinController(){
		super();
	};
	@Autowired
	private YXService yx;
	/**
	 * @param icbcid 征信id 用来判大状态是否存在 和查询用户的评估信息和征信信息
	 * @param through 通过或者不通过
	 */
	@PostMapping(value="sutitstatus.do")
	@ResponseBody
	public void auditStatus(String icbcid,String auditstatus,String channel,HttpServletRequest request){
		Map map=autioMonth(icbcid,auditstatus,channel,request);
		/*关联一下此result操作和面签信息*/
		int i0=yx.update_infocopy_viedo_vid(map);
		log.info("关联小记录和面签信息->update:"+i0);
		//如果审批通过  25的小状态
		if(auditstatus.equals("1")){
			/*nextStatus(map,(List) map.get("sysModal"),map.get("later_status").toString());*/
			map.put("now_status","67");//结果反馈
			map.put("later_status","67");//完成
			//则添加一个完成的小状态
			map.put("remark","完成");
			map.put("resultmsg","完成");
			int i=yx.insert_kjicbcresult(map);//添加一个完成的小状态
			log.info("添加一个完成的小状态->insert:"+i);
		}
	}
	//查询所有的机构
	@GetMapping(value="cl.do")
	@ResponseBody
	public List getOrganization(){
		return yx.getOrganization();
	}
	//查询所有的银行
	@GetMapping(value="getBank.do")
	@ResponseBody
	public List getBank(){
		return yx.getBank();
	}
	public static void nextStatus(Map map,List sysModal,String later_status){
		map.put("now_status",later_status);
		int length=sysModal.size();
		for(int i=0;i<length;i++){
			if(sysModal.get(i).toString().equals(later_status)){
				if(i<length-1){//如果不为最后一个
					later_status=sysModal.get(i+1).toString();
				}
				map.put("later_status",later_status);
				break;
			}
		}
	}
	/**	提取公共部分
	 * @param icbcid 审核的id
	 * auditstatus   通过或者不通过 0代表通过 代表不通过
	 * @param request 用来获
	 */
	public Map  autioMonth(String icbcid,String auditstatus,String channel,HttpServletRequest request){
		String parentid = yx.select_kjicbc_byid("63",icbcid);//查询对应的视频面签大状态是否存在
		Map map=new HashMap<>();
		map.put("channel", channel);
		//通用的直接赋值吧
		map.put("addadmin","121");//pdsession.get("id").toString();//获得当前登录用户的主键
		map.put("editadmin","121");//修改人
		map.put("addtime",super.getTime());//新建时间
		map.put("editime",super.getTime());//最后编辑时间
		/*map.put("sub",super.getTime());//提交时间*/
		map.put("icbcid",icbcid);
		map.put("typeid", 63);
		if(auditstatus.equals("1")){//如果审核通过
			int i=yx.updata_mq_status("3",icbcid);//更新免签表状态 3代表审核通过
			log.info("更新面签表状态(面签通过)->update"+i);
			map.put("resultmsg","面签通过");
			map.put("now_status","67");//完成
			map.put("later_status","67");//完成
		}else if(auditstatus.equals("3")){//回退
			int i=yx.updata_mq_status("4",icbcid);//免签不通过
			log.info("更新面签表状态(面签不通过)->update"+i);
			map.put("resultmsg","面签不通过");
			map.put("now_status","66");//结果反馈
			map.put("later_status","67");//完成
		}
		//List  sysModal=yx.selectSysModalByParentId(icbcid);
		//map.put("sysModal",sysModal);
		if(parentid==null){//不存在大状态  则添加 这其实已经存在这个大状态了！！！！！，可以删除，暂且保留
			//查询信息
			Map icbc = yx.select_icbc_byid(icbcid);
			Map car = yx.select_car_byid(icbcid);
			/*map.put("now_status",sysModal.get(0));//当前节点
			map.put("later_status",sysModal.get(1));//下一个节点*/
			map.put("c_name", icbc.get("c_name").toString());//姓名
			map.put("gems_id", icbc.get("gems_id").toString());//业务员
			map.put("gems_fs_id",icbc.get("gems_fs_id").toString());//机构
			map.put("c_cardno", icbc.get("c_cardno").toString());
			map.put("vincode",car.get("vincode").toString());//vin码
			map.put("code", car.get("code").toString());//车牌
			//添加一个大状态
			int i=yx.insert_kjicbc(map);
			log.info("添加一条da状态->"+i);
			map.put("parentid",map.get("id"));//重新设置一下result的父级的id
		}else{
			//查询当前节点
		 	//String later_status=yx.selectSysModalLater(icbcid);
		 	//log.info("下一个节点状态:"+later_status);
			//nextStatus(map,sysModal,later_status);
			//更新一下大状态
			int i=yx.update_kjicbc(map);//根据icbcId 和 typeid 主要修改一下最新的狀態 和最後更新時間 和 最後操作的人
			log.info("更新一条大状态->"+i);
			map.put("parentid",parentid);//重新设置一下result的父级的id
		}
		//保存一个24小状态 结果反馈
		map.put("remark","结果反馈");

		map.put("now_status","66");//结果反馈
		map.put("later_status","67");//完成
		map.put("resultcode",auditstatus);//1通过 3回退
		int i=yx.insert_kjicbcresult(map);//添加一个小状态
		log.info("添加一个小状态(结果反馈)->"+i);
		return map;
	}
	/**一系列的信息 如果视频面签后没有点击通过或者不通过 那么这里面的逻辑就不会执行 审核的逻辑放在查看历史订单中的 切记！！！
	 * @param auditstatus 审核状态
	 * @param customvalue icbc_id address等
	 * @param chanelid 通道id
	 * @param request
	 * @Description: TODO
	 * @param name
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@PostMapping(value="      .do")
	@ResponseBody
	public void viedoAudit(String auditstatus, String customvalue,String channel,HttpServletRequest request) throws UnsupportedEncodingException{
		log.info("请求参数:"+auditstatus+" "+customvalue+" "+channel);
		/*JSONObject custom = JSONObject.parseObject(customvalue);
		String icbcid=custom.getString("id");
		Map map=autioMonth(icbcid,auditstatus,channel,request);
		//对小视频的操作
		map.put("address", custom.getString("address"));
		if(yx.select_infocopy(channel)!=null){//面签表
			//更新
			int i=yx.update_infocopy_viedo(map);
			log.info("更新icbc_erp_video_info表->update:"+i);
		}else{
			//添加
			int i=yx.insert_infocopy_viedo(map);
			log.info("添加icbc_erp_video_info表->insert:"+i);
		}

		//如果审批通过  25的小状态
		if(auditstatus.equals("1")){
			//则添加一个完成的小状态
			map.put("status",25);
			map.put("remark","完成");
			map.put("resultmsg","完成");
			int i=yx.insert_kjicbcresult(map);//添加一个完成的小状态
			log.info("添加小状态icbc_erp_kj_icbc_result表->insert"+i);
		}*/
		JSONObject custom = JSONObject.parseObject(customvalue);

		String additional=custom.getString("id");
		String[] ss=additional.split("-");
		custom.put("extId", ss[0]);
		if(ss.length>1) {
			custom.put("appMark", ss[1]);
		}else {
			custom.put("appMark",RootStatic.appMark);
		}

		if(yx.select_infocopy(channel)==null){
			custom.put("channel", channel);
			//添加
			int i=yx.insert_infocopy_viedo(custom);
			log.info("添加icbc_erp_video_info表->insert:"+i);
		}
	}
	//分页查询历史
	@PostMapping(value="selectOperatingFalse.do")
	@ResponseBody
	public PageInfo selectOperatingFalse(Integer pagesize,
										 Integer offset,
										 String name,
										 String idNumber,
										 String organization, //机构的主键
										 String viedostartsvalue,//审核状态 1已审核 2未审核
										 String viedotype,//视频类型 1视频面签 2视频录制
										 String contract,//签约状态 1成功 3回退
										 String bank,//银行id
										 String timeInterval,
										 HttpServletRequest request) throws UnsupportedEncodingException{ //签约状态
		request.setCharacterEncoding("utf-8");
		//String  s = new String(request.getParameter("name").getBytes("ISO-8859-1"),"utf-8");
		bank=yx.SelectBankIdByUid(super.getUserId(request));
		if(!EmptyUtil.isEmpty(bank)) {//是面签账号
			Map map=new HashMap();
			map.put("bank", bank);
			map.put("appMark", RootStatic.appMark);
			//查询条件
			if(!EmptyUtil.isEmpty(name)){//姓名
				map.put("name", "%"+name+"%");
			}
			//查询条件
			if(!EmptyUtil.isEmpty(name)){//姓名
				map.put("name", "%"+name+"%");
			}
			if(!EmptyUtil.isEmpty(idNumber) ){//身份证
				map.put("idNumber", "%"+idNumber+"%");
			}
			if(!EmptyUtil.isEmpty(viedostartsvalue) ){
				map.put("viedostartsvalue",viedostartsvalue);
			}
			if(!EmptyUtil.isEmpty(organization) ){
				map.put("organization",organization);//机构
			}
			if(!EmptyUtil.isEmpty(contract) ){
				map.put("contract", contract);
			}
			if(!EmptyUtil.isEmpty(viedotype) ){
				map.put("viedotype",viedotype);
			}
			if(!EmptyUtil.isEmpty(bank) ){
				map.put("bank",bank);
			}
			if(!EmptyUtil.isEmpty(timeInterval) ){
				String[] ss=timeInterval.split(" - ");
				map.put("startTime",ss[0].trim());
				map.put("endTime",ss[1].trim());
			}
			PageInfo pageinfo=new PageInfo();
			pageinfo.setFrom(offset);
			pageinfo.setSize(pagesize);

			pageinfo.setCondition(map);

			log.info("分页条件->"+JSON.toJSONString(pageinfo));
			pageinfo.setRows(yx.select_operating(pageinfo));//数据
			pageinfo.setTotal(yx.select_operating_count(pageinfo));//总条数
			return pageinfo;
		}else {
			return null;
		}
	}

	/*来电用户的信息 详情*/
	@PostMapping(value="viedoinfo.do")
	@ResponseBody
	public Object selectViedobyid(String id,String domvalue){
		Map map=null;
		List select_mq_info=null;
		if(domvalue.equals("A")){//视频对话 id为icbc_id
			String[] ss=id.split("-");
			map= yx.select_viedo_byid(ss[0]);
			log.info("实时视频返回元数据->{}"+JSON.toJSONString(map));
		}else if(domvalue.equals("B")){
			map=(Map) yx.select_viedo_byid2(id).get(0);
			map.put("allVideoScreenshot", yx.selectAllVideoScreenshot(map));
			log.info("查看历史视频返回元数据->{}"+JSON.toJSONString(map));
		}
		if(map.get("kk_car_stateid")!=null){
			map.put("kk_car_stateid",yx.getCommStates(Integer.parseInt(map.get("kk_car_stateid").toString())));
		}
		if(map.get("kk_car_cityid")!=null){
			map.put("kk_car_cityid",yx.getCommCitys(Integer.parseInt(map.get("kk_car_cityid").toString())));
		}
		if(map.get("kk_loan_stateid")!=null){
			map.put("kk_loan_stateid",yx.getCommStates(Integer.parseInt(map.get("kk_loan_stateid").toString())));
		}
		if(map.get("kk_loan_cityid")!=null){
			map.put("kk_loan_cityid",yx.getCommCitys(Integer.parseInt(map.get("kk_loan_cityid").toString())));
		}
		if(map.get("mem_states")!=null){
			map.put("mem_states",yx.getCommStates(Integer.parseInt(map.get("mem_states").toString())));
		}
		if(map.get("mem_citys")!=null){
			map.put("mem_citys",yx.getCommCitys(Integer.parseInt(map.get("mem_citys").toString())));
		}
		if(map.get("kk_kpj")!=null && Integer.parseInt(DataConversionParent.subZeroAndDot(map.get("kk_kpj").toString()))>0 &&  map.get("sfje")!=null){
			map.put("sfbl",DataConversionParent.subZeroAndDot(DoubleUtil.mul(DoubleUtil.div( map.get("sfje").toString(),map.get("kk_kpj").toString(),4),"100")));
		}
		//修理下图片
		Object imgstep2_1ss=map.get("imgstep2_1ss");
		if(imgstep2_1ss!=null && !imgstep2_1ss.toString().equals("")){
			String ss[]=imgstep2_1ss.toString().split("");
			for(String s:ss){
				if(!s.equals("")){
					map.put("positive","http://a.kcway.net/assess/"+s);
					map.remove("img");
					break;
				}
			}
		}
		String icbcId=map.get("id").toString();
		select_mq_info = yx.select_mq_info(icbcId);//改  多个面签只取第一个
		if(select_mq_info.size()>0){
			map.putAll((Map)select_mq_info.get(0));//添加到集合中
		}

		//处理下载的地址 先从本地下载再考虑从云信下载
		//本地
		Object serverPath= map.get("serverPath");
		if(serverPath!=null && StringUtils.isNotBlank(serverPath.toString())){
			log.info("本地下载路径已经存在");
			//http://a.kcway.net/assess/upload/0-50873460261080-0-mix.mp4
			String serverPath1=serverPath.toString();
			int i=serverPath1.indexOf("upload");
			if(i!=-1){
				map.put("downUrl",RootStatic.url+RootStatic.root_Directory+serverPath1.substring(i));
				//C:/Users/Administrator/Desktop/word/haha1/upload/0-50873460261080-0-mix.mp4
			}
		}else{
			log.info("只存在云信的下载路径");
			//云信
			Object url=map.get("url");
			if(url!=null && StringUtils.isNotBlank(url.toString())){
				map.put("downUrl",RootStatic.url+url.toString());
				//http://localhost/kcd/yx/downloadClient.do?url=http://jdvod6ep5thqk.vod.126.net/jdvod6ep5thqk/0-50873460261080-0-mix.mp4
			}
		}
		log.info("查看历史视频或者实时面签返回处理过用户信息->{}"+JSON.toJSONString(map));
		return map;
	}

	/**上传成功的回调地址
	 * @param callback
	 * @Description: TODO
	 * @param name
	 * 请求示例:
	 * $.ajax({
	type: "POST",
	url: "${pageContext.request.contextPath}/yx/callback.do",
	dataType: "json",
	data:{name:'snow.mp4',origAddr:'http://vodk32ywxdf.vod.126.net/vodk32ywxdf/b3d259f4-a7bc-4119-ae24-60e0eb09216e.mp4',type:'upload',vid:1022,user_defined:'userId=123456'},
	success: function(date){
	}
	});
	 */
	@PostMapping(value="callback.do")
	@ResponseBody
	public Object callBack(HttpServletRequest request){
		String body="";
		try {
			body = readBody(request);
			log.info("上传成功的回调字符串->"+body);
			StringBuilder redundant=new StringBuilder(body.replaceAll("(\\})|(\\{)|(\\[)|(\\])|(\")", ""));//抄送的完整信息
			//字符串处理
			body=body.replaceAll("\\\\", "").replaceAll("\"\\{","{").replaceAll("\\}\"","}").replaceAll("\"\\[\\{", "[{").replaceAll("\\}\\]\"", "}]");
			JSONObject map = JSONObject.parseObject(body);
			String id=map.getJSONObject("user_defined").getString("id");
			String[] ss=id.split("-");
			map.put("ext",ss[0]);
			if(ss.length>1) {//说明为其他平台的
				map.put("appMark", ss[1]);
				if(RootStatic.appMark.equals("0")) {
					/*查询对应的访问地址*/
					String recordingRrl=yx.selectRecordingRrl(ss[1]);
					String s=HttpYX.doPost(recordingRrl, body);
					log.info("跨平台录制抄送结果:"+s);
					if(!JSONObject.parseObject(s).getBooleanValue("success")) {
						throw new RuntimeException("跨平台抄送失败，返回"+s);
					}else{
                        return renderError("跨平台录制抄送成功");
                    }
				}
			}else {
				map.put("appMark", RootStatic.appMark);
			}
			//自定义通道id 这里与前端的操作关联使用通道id 也可以使用书主键id
			map.put("channelid",super.getRandomMark());
			map.put("viedotype", 0);
			map.put("te", redundant.toString());
			int i=yx.addcallback(map);
			log.info("上传成功添加->"+i);
			if(i>0) {
				return renderSuccess();
			}else {
				return renderError("保存失败");
			}
		} catch (Exception e) {
			yx.insert_M(body+"----error:"+getErrorInfoFromException(e));//如果错误直接保存
			return renderError("异常");
		}
	}
	@PostMapping(value="selectvideo.do")
	@ResponseBody
	public Result selectvideo(){
		return renderSuccess(yx.select_YX_video());
	}



	//设置上传成功后的回调地址 {"ret":{},"requestId":"vodc59a1e37-9654-4314-89fb-406b5661086f","code":200}
	public static String setCallBack(){
		Map map=new HashMap(2);
		map.put("callbackUrl","http://apitest.kcway.net/kcd/yx/callback.do");
		map.put("signKey","kjs9999");
		return HttpYX.doPost(YXConstant.SetCallBack,map);
	}
	/**用于文件上传的初始化，获取xNosToken（上传凭证）、bucket（存储对象的桶名）、object（生成的唯一对象名）。
	 * @param originFileName 上传文件的原始名称（包含后缀名）
	 * @param userFileName 用户命名的上传文件名称
	 * @param typeId 视频所属的类别Id（不填写为默认分类）
	 * @param presetId 视频所需转码模板Id（不填写为默认模板，默认模板不进行转码）
	 * @param uploadCallbackUrl 上传成功后回调客户端的URL地址（需标准http格式）
	 * @param callbackUrl 转码成功后回调客户端的URL地址（需标准http格式）
	 * @param description 上传视频的描述信息
	 * @param watermarkId 视频水印Id（不填写为不添加水印，如果选择，请务必在水印管理中提前完成水印图片的上传和参数的配置；且必需设置prestId字段，且presetId字段不为默认模板）
	 * @param userDefInfo 用户自定义信息，回调会返回此信息（长度不能超过256字符）
	 * @param transOffset 视频转码处理裁剪视频的起始位置（单位：秒）
	 * @param transDuration 视频转码处理裁剪视频的视频时长（单位：秒）
	示例：
	sbucket": "jdvod6ep5thqk",
	"xNosToken": "UPLOAD ab1856bb39044591939d7b94e1b8e5ee:Lvz8pD5w0VFDnr6DfS4DdUEh/Pjr6QlUbB5fp7SgOV8=:eyJCdWNrZXQiOiJqZHZvZDZlcDV0aHFrIiwiT2JqZWN0IjoiNjM0MzA2ZjctYWE4Mi00ZmE2LWFjM2QtOTZlMDcyNWUyZjBhLm1wNCIsIkV4cGlyZXMiOjE1NjU0OTM5MjgsIkNhbGxiYWNrVXJsIjoiaHR0cDovL3ZjbG91ZC4xNjMuY29tL3hoci92b2Qvbm9zL2NhbGxiYWNrIiwiQ2FsbGJhY2tCb2R5IjoiZmlsZU5hbWU9dGVzdC5tcDQmb2JqZWN0TmFtZT02MzQzMDZmNy1hYTgyLTRmYTYtYWMzZC05NmUwNzI1ZTJmMGEubXA0JiQoT2JqZWN0U2l6ZSkmdWlkPTEwMjMxMDAwOCZ0eXBlSWQ9MTA0MjY3NDY0JnByZXNldElkPTEwNDI4MjQyNCZ3YXRlcm1hcmtJZHM9MTAyMzY2NDQxJmRlc2NyaXB0aW9uPW51bGwmdHJhbnNjb2RlQ2FsbGJhY2s9bnVsbCYkKEFWaW5mby5WaWRlby5EdXJhdGlvbikmJChBVmluZm8uVmlkZW8uSGVpZ2h0KSYkKEFWaW5mby5WaWRlby5XaWR0aCkmMCYwJjAmbnVsbCZ1cGxvYWRTdGFydD0xNTMzOTU3OTI4MzQzJnVwbG9hZENhbGxiYWNrPW51bGwmbnVsbCZtcDQmMCYwJnRyYW5zT2Zmc2V0PW51bGwmdHJhbnNEdXJhdGlvbj1udWxsJmFwcGtleT05MDM5MmNkNDEzMGIzNmJlNTIzMjk5Y2M5YmJhYmVlOCIsIlJlZ2lvbiI6IkpEIn0=",
	"object": "634306f7-aa82-4fa6-ac3d-96e0725e2f0a.mp4"
	 * @Description: TODO
	 * @param name
	 * @return
	 */
	@PostMapping(value="UploadInit.do")
	@ResponseBody
	public Result getUploadInit(
			String originFileName,
			String userFileName,
			Integer typeId,
			Integer presetId,
			String uploadCallbackUrl,
			String callbackUrl,
			String description,
			Integer watermarkId,
			String userDefInfo,
			Integer transOffset,
			Integer transDuration,
			String id){
		if(!EmptyUtil.isEmpty(originFileName)){
			JSONObject jsonobject=new JSONObject();
			jsonobject.put("originFileName", originFileName);
			jsonobject.put("userFileName", userFileName);
			jsonobject.put("typeId", typeId);
			jsonobject.put("presetId", presetId);
			jsonobject.put("uploadCallbackUrl", uploadCallbackUrl);
			jsonobject.put("callbackUrl", callbackUrl);
			jsonobject.put("description", description);
			jsonobject.put("watermarkId", watermarkId);
			jsonobject.put("userDefInfo", userDefInfo);
			jsonobject.put("transOffset", transOffset);
			jsonobject.put("transDuration", transDuration);


			String obj=HttpYX.doPost(YXConstant.InitUpload,jsonobject.toJSONString());
			Map map=new HashMap<>();
			map.put("icbcId", id);
			map.put("dataTime",super.getTime());
			map.put("result", obj);
			map.put("describe","文件上传初始化");
			int i=yx.addOccupyTest(map);
			log.info("添加调用记录->addCount:+"+i);
			return tokenDispose(obj,"1");
		}else{
			return renderError("请输入上传文件的原始名称(包含后缀名)!");
		}
	}

	@PostMapping(value="DImg.do")
	@ResponseBody
	//遇到问题:上传图片base64 SringMVC+Tomcat 报错 Request header is too large
	public Object deletePrintscreenImg(String id,HttpServletRequest request){
		Map map=super.updateBoToMap(request);
		map.put("id", id);
		int i=yx.deleteVideoScreenshot(map);
		log.info("删除截图->Id:"+id+",updateCount:"+i);
		if(i>0) {
			return renderSuccess("删除成功！");
		}else {
			return renderError("删除失败请重试！");
		}
	}
	@PostMapping(value="pImg.do")
	@ResponseBody
	//遇到问题:上传图片base64 SringMVC+Tomcat 报错 Request header is too large
	public Object addPrintscreenImg(MultipartFile file,HttpServletRequest request,String icbcId,String channelId){
		String fileName=super.getRandomMark()+".png";
		String savepdfpath="upload/"+new SimpleDateFormat("yyyy/MM/dd/").format(new Date());
		String roorSavePath=RootStatic.root_Directory+savepdfpath;
		boolean b=super.uploadServer(file,roorSavePath, fileName);
		log.info("截图保存->YorX:"+b+",保存路径:"+roorSavePath+",文件名:"+fileName);
		if(b) {
			Map map=super.AddBoToMap(request);
			String dataStorePath=savepdfpath+fileName;
			map.put("path", dataStorePath);
			String[] ss=icbcId.split("-");
			map.put("icbcId", ss[0]);
			map.put("channelId", channelId);
			int i=yx.addVideoScreenshot(map);
			if(i>0) {
				log.info("截图保存成功->icbcId"+icbcId);
				return renderSuccess(RootStatic.download_prefix+dataStorePath);//返回图片路径显示在前端
			}else {
				log.info("截图保存失败");
				return renderError("保存失败！");
			}
		}else {
			return renderError("上传失败！");
		}
//		byte[] buffer;//图像转换的目的字节数组
//		String ab=param.substring(22);//images为图片字符串数据，通过spring方式获取，在这里截去字符串中”data:image/png;base64,“，使其格式正确
//		BASE64Decoder base64=new BASE64Decoder();//新建64位解码器
//		try {
//			buffer = base64.decodeBuffer(ab);//64位解码到字节数组中
//			FileOutputStream fos=new FileOutputStream(new File(savepdfpath)); //设置好保存路径，创建文件输出流。
//			fos.write(buffer);//写入
//			fos.flush();//刷新
//			fos.close();//关闭
//			fos=null;//释放
//		} catch (IOException e) {
//			e.printStackTrace();
//			return renderError("上传失败！"+e.getMessage());
//		}
//		return renderSuccess(RootStatic.download_prefix+savepdfpath);//返回图片路径显示在前端
	}
	/**根据传入的accid创建网易云上传账号 如果没有传入accid则由系统创建一个32位的accid
	 * @param accid 自定义accid
	 * @param cfcode 分类名称
	 */
	@PostMapping(value="ct.do")
	@ResponseBody
	public Object createAccount(String accid,HttpServletRequest request){
		if(EmptyUtil.isEmpty(accid)){
			accid=super.getRandomMark();
		}
		Result result=tokenDispose(HttpYX.geMobileUpload(accid),"1");
		log.info("创建移动上传账户接口返回->"+result);
		if(result.isSuccess()){//请求成功！
			Map map=((Map) result.getData());
			map.put("employcode","1");//设置类型
			map.put("delmark", 0);
			map.put("dt_add",super.getTime());
			map.put("dt_edit",super.getTime());
			map.put("mid_add", super.getUserId(request));
			map.put("mid_edit", super.getUserId(request));
			int i=yx.add_YX_account(map);//保存
			if(i>0){//保存成功
				return result;
			}else{
				return renderError("保存失败:"+JSON.toJSONString(result.getData()));//保存失败返回accid、token
			}
		}
		return result;//请求失败 或者保存失败
	}
	//创建视频用户
	@PostMapping(value="addRealTimeVideoBinding.do")
	@ResponseBody
	public Object addRealTimeVideoBinding(String Id,String bankId,HttpServletRequest request){
		log.info("创建视频用户->Id:"+Id+",bankId:"+bankId);
		//下面的添加逻辑
		if(StringUtils.isBlank(bankId)){
			return renderError("bankId不能为空！");
		}
		int i=yx.selectBankCount(bankId);
		if(i==0){
			return renderError("不存在此银行！");
		}
		if(StringUtils.isBlank(Id)){
			return renderError("Id不能为空！");
		}
		//查看用户id是否存在
		int count=yx.selectCountAdminById(Id);
		if(count==1){//此Id已注册
			Map map=yx.selectCountTokenByUid(Id);
			log.info("查看是否已经分配"+JSON.toJSONString(map));
			if(!map.isEmpty()) {
				//是当前银行相同 并且可用的
				if(map.get("bankId").toString().equals(bankId) && map.get("delmark").toString().equals("0")) {
					log.info("此账号已存在此权限");
					return renderSuccess("此账号已存在此权限!");
				}
				//如果这个用户不可用 绑定的银行默认不能修改
				return yx.updateVideoTokenBinding("0",bankId, Id,super.getTime(),super.getUserId(request));
			}

			//申请账号
			Result result1=tokenDispose(HttpYX.getToken(super.getRandomMark()),"0");
			log.info("创建点对点视频账户接口返回->"+result1);
			if(result1.isSuccess()){
				Map map1=((Map) result1.getData());
				map1.put("delmark", 0);
				map1.put("uid", Id);
				map1.put("bankId", bankId);
				map1.put("employcode","0");//设置类型
				map1.put("dt_add",super.getTime());
				map1.put("dt_edit",super.getTime());
				map1.put("mid_add", super.getUserId(request));
				map1.put("mid_edit", super.getUserId(request));
				int i1=yx.add_YX_account(map1);//保存
				if(i1==1){
					Result result2=tokenDispose(HttpYX.getToken(super.getRandomMark()),"0");
					log.info("创建点对点视频账户接口返回->"+result2);
					if(result2.isSuccess()){
						Map map2=((Map) result2.getData());
						map2.put("parentid",map1.get("id").toString());
						map2.put("delmark", 0);
						map2.put("employcode","0");
						map2.put("bankId", bankId);
						map2.put("dt_add",super.getTime());
						map2.put("dt_edit",super.getTime());
						map2.put("mid_add", super.getUserId(request));
						map2.put("mid_edit", super.getUserId(request));
						int i2=yx.add_YX_account(map2);//保存
						if(i2==1){
							//添加好友
							String addBuddy=HttpYX.addBuddy(map1.get("accid").toString(), map2.get("accid").toString());
							log.info("添加好友返回->"+addBuddy);
							return renderSuccess("创建成功!");
						}else{
							return renderError("保存账户2失败!");
						}
					}else{
						return renderError("创建账户2失败!");
					}
				}else{
					return renderError("保存账户1失败!");
				}
			}
			return result1;
		}
		return renderError("此用户不存在!");
	}
	//解除绑定账号
	@PostMapping(value="VideoUnbind.do") //delmark 1代表不可用  0代表可用
	@ResponseBody
	public Object removeRealTimeVideoUnbind(String Id,HttpServletRequest request){
		return yx.updateVideoTokenBinding("1",null,Id,super.getTime(),super.getUserId(request));
	}
	/** 解析 创建网易云通信ID 返回结果
	 * @param s 接口中返回的字符串
	 */
	public  Result tokenDispose(String s,String type){
		if(s!=null){//如果不存在
			log.info("请求接口返回->"+s+",类型->"+type);
			JSONObject jo = JSONObject.parseObject(s);//先创建
			if(jo.getInteger("code")==200){//请求成功
				Map map =null;
				if(type.equals("0")){
					map=jo.getJSONObject("info");
				}else if(type.equals("1")){
					map=jo.getJSONObject("ret");
				}
				return renderSuccess(map);
			}else{//请求失败
				return renderError(jo.getString("code")+"!");//这里失败的状态码可以 用来确定网易 http://dev.netease.im/docs/product/%E9%80%9A%E7%94%A8/%E7%8A%B6%E6%80%81%E7%A0%81
			}
		}
		return renderError("请求接口失败！");
	}

	/**直接添加好友
	 * @param accid  加好友发起者accid
	 * @param faccid 加好友接收者accid
	 * http://localhost/kcd/yx/Buddy.do?accid=75dd5d18ee7c102b4aa3ff5c12a5936a&faccid=4a21effaf6827d9a312e628a929f6525
	 */
/*	@PostMapping(value="Buddy.do")
	@ResponseBody
	public Object addBuddy(String accid,String faccid){
		Result result=new Result();
		if(EmptyUtil.isEmpty(accid) || EmptyUtil.isEmpty(faccid)){
			return renderError("请输入正确的发起者和接受者！");
		}else{
			String s=HttpYX.addBuddy(accid,faccid);
			if(s!=null){
				if(s.indexOf("200")!=-1){//表示成功
					return renderSuccess();
				}else{
					return renderError("添加失败！");
				}
			}else{
				return renderError("请求接口失败！");
			}
		}
	}*/
	/**
	 *移动端占位
	 *http://localhost/kcd/yx/occupy.do
	 */
	@PostMapping(value="occupy.do")
	@ResponseBody
	public Object occupy(Integer id){
		log.info("占位icbcId->"+id);
		String bankId=yx.selectBankId(String.valueOf(id));
		ScanPool1 scanPool1=null;;
		if(id==null || StringUtils.isBlank(bankId)){
			scanPool1=PoolCache1.defaultSeat();
			log.info("随机获取一个吧->"+scanPool1);
			//return renderError("icbcId不存在或者bankId不存在！");
		}else{
			log.info("占位bankId->"+bankId);
			scanPool1 =PoolCache1.aReduceBusy(bankId);
			log.info("占位结果->"+scanPool1);
		}
		Map map=new HashMap<>();
		map.put("icbcId", id);
		map.put("dataTime",super.getTime());
		map.put("result", JSON.toJSONString(scanPool1));
		map.put("describe","获取视频通话账号");
		int i=yx.addOccupyTest(map);
		String Id=map.get("id").toString();
		log.info("添加调用记录->addCount:+"+i+",主键:"+Id);

		if(scanPool1!=null){
			scanPool1.setId(Id);//记录id
			return renderSuccess(scanPool1);
		}else{
			return renderError("暂且没有闲置的视频通话坐席,请稍后再试！");
		}
	}
	/**
	 *移动端释放
	 */
	@PostMapping(value="free.do")
	@ResponseBody
	public Object freeToken(String mark){
		log.info("移动端挂断通知->"+mark);
		return null;
	}

	//web端挂断释放
	@PostMapping(value="free1.do")
	@ResponseBody
	public Object freeToken1(ScanPool1 data){
		log.info("web端挂断释放->param:"+data.toString());
		ScanPool1 scanPool1=PoolCache1.deleteBusy(data.getMark());

		if(scanPool1!=null){
			log.info("web端释放成功");
			return renderSuccess(scanPool1);
		}else{
			log.info("web端释放失败");
			return renderError("释放失败");
		}

	}
	//web端刷新在线，如果不存在则添加
	@PostMapping(value="refreshtime.do")
	@ResponseBody
	public Object refreshTime(ScanPool1 data){
		log.info("web端刷新在线->param:"+data.toString());
		return PoolCache1.add(data);
	}
	/**
	 登陆 成功并返回云信ID
	 * @throws Exception
	 */
	@PostMapping(value="login.do")
	@ResponseBody
	public Object toLogin(HttpServletRequest request) throws Exception{
		String id=null;
		try {
			id=getUserId(request);
		} catch (Exception e) {
			id=request.getParameter("id");
			if(StringUtils.isBlank(id)){
				return null;
			}
		}
		if(!EmptyUtil.isEmpty(id)){//存在
			List list = yx.query_tokenbyid(id);
			if(list.size()>0){
				ScanPool1 scanpool=(ScanPool1)list.get(0);
				if(scanpool.getDelmark()==0){
					ScanPool1 offer=null;
					ScanPool1 poolCache1= PoolCache1.isMarkToBusy(scanpool.getMark());
					if(poolCache1!=null){
						return renderError("此账号正在视频中");
					}else{
						offer =PoolCache1.add(scanpool);
					}
					return renderSuccess(offer);
				}else{
					log.info("此账号被禁用");
					return renderError("此账号被禁用");
				}
			}else{
				log.info("此账号没有绑定视频token");
				return renderError("此账号没有绑定视频token");
			}
		}
		return renderError("此账号没有绑定视频token");
	}

	//删除活跃中的
	@PostMapping(value="deleteActive.do")
	@ResponseBody
	public  Object deleteActive(ScanPool1 data){
		log.info("Web端收到Becall->回话用户信息:"+data.toString());
		return renderSuccess(PoolCache1.deleteActive(data));
	}

	/*退出操作*/
	@PostMapping(value="outlogin.do")
	@ResponseBody
	public  Object outLogin(ScanPool1 data){
		log.info("web退出操作->param:"+data.toString());
		return renderSuccess(PoolCache1.outLogin(data));
	}
	/**
	 *获取随机一个上传accid
	 */
	@PostMapping(value="sur.do")
	@ResponseBody
	public Object setUploadReduce(String id){
		List list = yx.query_token("2",-1);
		Random random = new Random();
		int n = random.nextInt(list.size());

		Map map=new HashMap<>();
		Object object=list.get(n);
		map.put("icbcId", id);
		map.put("dataTime",super.getTime());
		map.put("result", JSON.toJSONString(object));
		map.put("describe", "获取随机上传账号");
		int i=yx.addOccupyTest(map);
		log.info("添加调用记录->addCount:+"+i);

		return renderSuccess(object);
	}
	/**
	 * @param infocopy  信息抄送 自定义消息
	 */
	/*时长:
		routeBody = {"ext":"{\"id\":\"761\",\"latitude\":31.182165,\"longitude\":121.488821,\"address\":\"上海市浦东新区咖喱客(世博源店)世博源\"}","routeResult":true,"createtime":"1552897298949","routePriority":1,"eventType":"5","type":"VEDIO","routeHttpCode":200,"duration":"22","members":"[{\"duration\":11,\"accid\":\"123456\"},{\"duration\":11,\"caller\":true,\"accid\":\"75dd5d18ee7c102b4aa3ff5c12a5936a\"}]","appkey":"90392cd4130b36be523299cc9bbabee8","channelId":"50885338660987","live":"0","status":"SUCCESS
	下载:
		routeBody = {"routeResult":true,"routePriority":1,"fileinfo":"[{\"vid\":\"2384372030\",\"caller\":true,\"filename\":\"2469468234-50885338660987.mp4\",\"pieceindex\":\"0\",\"size\":\"411213\",\"type\":\"mp4\",\"user\":\"75dd5d18ee7c102b4aa3ff5c12a5936a\",\"mix\":false,\"url\":\"http://jdvod6ep5thqk.vod.126.net/jdvod6ep5thqk/2469468234-50885338660987-0.mp4\",\"channelid\":\"50885338660987\",\"timestamp\":\"1552897312\",\"md5\":\"5340e67f6e589d66fd6b7a49e46b2c1f\"}]","appkey":"90392cd4130b36be523299cc9bbabee8","eventType":"6","routeHttpCode":200

	 */
    @PostMapping(value="infocopy.do")
    @ResponseBody
    public Result infoCopy(HttpServletRequest request)
            throws Exception {
        String body=null;
        JSONObject map=null;
        try {
            // 获取请求体
            body = readBody(request);
            Object redundant=body;
            log.info("信息抄送原->"+body);
            body=body.replaceAll("\\\\", "");// 去掉\\
            if (EmptyUtil.isEmpty(body)) {//如果为null 或者空字符
                return renderError("空数据");
            }else{
                //StringBuilder redundant=new StringBuilder(body.replaceAll("(\\})|(\\{)|(\\[)|(\\])", ""));//抄送的完整信息
                //字符串处理
                body=body.replaceAll("\"\\{","{").replaceAll("\\}\"","}").replaceAll("\"\\[\\{", "[{").replaceAll("\\}\\]\"", "}]");
                map = JSONObject.parseObject(body);
                log.info("信息抄送处理JSON->"+map.toJSONString());
                map.put("viedotype", "1");//设置视频的类型
                String eventType = map.get("eventType").toString();
                Object id_=null;//主键
                String appMark=null;//app标识
                //{"channelId":"6265490045067594274","createtime":"1458798080073","duration":"22","eventType":"5","live":"1","members":"[{\"accid\":\"789\",\"duration\":11},{\"accid\":\"123456\",\"caller\":true,\"duration\":11}]","status":"SUCCESS","type":"VEDIO"}
                if(eventType.equals("5")){//表示AUDIO/VEDIO/DataTunnel消息，即汇报实时音视频通话时长、白板事件时长的消息
                    log.info("时长信息start");
                    //JSONArray members  =JSONArray.parseArray(map.getString("members").toString().replaceAll("(^\"*)|(\"*$)","")); //获得字符串 去掉收尾的"号 再转换为jsonarray

                    JSONArray members=map.getJSONArray("members");
                    String additional=map.getJSONObject("ext").getString("id");
                    String[] ss=additional.split("-");
                    map.put("extId", ss[0]);//icbcId
                    if(ss.length>1) {//因为最初的快进所app传递的为icbcId，后续其他app传递为icbcId-标识,所以这里加一层>1
                        appMark=ss[1];
                        map.put("appMark", appMark);
                        if(!appMark.equals(RootStatic.appMark)) {//不是自己的平台的
                            if(RootStatic.appMark.equals("0")) {//我是分发总平台
                                /*查询对应的挂平台实时视频相关信息 抄送访问地址*/
                                String realtimeUrl=yx.selectRealtimeUrl(appMark);
                                String s=HttpYX.doPost(realtimeUrl, body);
                                log.info("跨平台时长信息抄送结果:"+s);
                                if(!JSONObject.parseObject(s).getBooleanValue("success")) {
                                    throw new RuntimeException("跨平台时长信息抄送失败，返回"+s);
                                }else {
									//查询本地是否有下载信息
									Map map5 = yx.select_infocopy(map.get("channelId").toString());//获取通道id
									if(map5!=null) {
										id_=map5.get("id");
									}
                                    if(id_!=null) {//已经收到了下载信息抄送  抄送一下载信息
                                        String s1=HttpYX.doPost(realtimeUrl, map5.get("downloadInfo").toString());
                                        log.info("跨平台下载信息抄送结果:"+s1);
                                        //抄送下载信息成功
                                        if(!JSONObject.parseObject(s1).getBooleanValue("success")) {
                                            throw new RuntimeException("跨平台下载信息抄送失败，返回"+s1);
                                        }else {
                                            //删除脏数据
                                            int deleteCount= yx.deleteViedoInfoById(id_.toString());
                                            log.info("删除脏数据->id:"+id_.toString()+",deleteCount:"+(deleteCount==0?"删除失败":"删除成功"));
                                            return  renderSuccess("时长信息抄送完毕");
                                        }
                                    }//继续下面的操作，然后脏数据放在收到下载信息抄送的时候清理
                                }
                            }
                        }
                    }else {
                        map.put("appMark",RootStatic.appMark);
						Map map5 = yx.select_infocopy(map.getString("channelId"));//获取通道id
						if(map5!=null) {
							id_=map5.get("id");
						}
                    }

                    map.put("duration_time",redundant.toString());//完整的通话时长抄送
                    for(int i=0;i<members.size();i++){//确定出发起者和接收者
                        JSONObject members2=members.getJSONObject(i);
                        //如果是通话的发起者的话，caller字段为true,否则无caller字段;
                        if(members2.toString().indexOf("caller")==-1){//如果是通话的发起者的话，caller字段为true，否则无caller字段；duration表示对应accid用户的单方时长
	    						/*String uid=yx.selectUidByAccid(members2.getString("accid"));
	    						log.info("根据accid查询uid->accid:"+members2.getString("accid")+",uid:"+uid);*/
                            map.put("createtime", DataUtil.millisecondTodate(Long.parseLong(map.getString("createtime").toString())));
                            map.put("faccid",members2.getString("accid"));//改成接受
                            if(id_!=null){//存在根据channeid更新
                                int count=yx.update_infocopy_durationM(map);
                                log.info("更新通话时长消息->"+count);
                            }else{//不存在则添加
                                int count=yx.insert_infocopy_durationM(map);
                                log.info("添加通话时长消息->"+count);
                            }
                        }
                        //不过不是接收者 则丢掉这条
                    }
                    //{"eventType":"6","fileinfo":"[{\"caller\":true,\"channelid\":\"6290737000999815988\",\"filename\":\"xxxxxx.type\",\"md5\":\"a9b248e29669d588dd0b10259dedea1a\",\"mix\":true,\"size\":\"2167\",\"type\":\"gz\",\"vid\":\"1062591\",\"url\":\"http://xxxxxxxxxxxxxxxxxxxx.mp4\",\"user\":\"zhangsan\"}]"}
                }else if(eventType.equals("6")){//表示音视频/白板文件存储信息，即汇报音视频/白板文件的大小、下载地址等消息
                    log.info("下载信息start");
                    JSONArray fileinfo = map.getJSONArray("fileinfo");
                    String url="";
                    map.put("download_info", redundant.toString());
                    for(int j=0;j<fileinfo.size();j++){
                        JSONObject fileinfo2 = fileinfo.getJSONObject(j);
                        boolean b=fileinfo2.getBooleanValue("mix");//mix：是否为混合录制文件，true：混合录制文件；false：单人录制文件
                        url=fileinfo2.getString("url");
                        if(b && url.indexOf("mp4")!=-1){//mix：是否为混合录制文件，true：混合录制文件；false：单人录制文件 并且为mp4格式
							Map map5 = yx.select_infocopy(fileinfo2.get("channelid").toString());
							if(map5!=null) {
								id_=map5.get("id");
								appMark=map5.get("appMark").toString();
							}
                            map.put("fi", fileinfo2);//这里解决同一次抄送，可能会抄给你不同channel ID 的信息的
                            if(id_!=null){//已经收到了抄送，这个抄送可能是别的平台通话时长的 和自己平台的通话时长信息、挂断后提交的
                                if(!appMark.equals(RootStatic.appMark)) {//不是当前的平台
                                    if(RootStatic.appMark.equals("0")) {//我是分发总平台
										String realtimeUrl=yx.selectRealtimeUrl(appMark);
										String s1=HttpYX.doPost(realtimeUrl, body);
                                        log.info("跨平台下载信息抄送结果:"+s1);
                                        //抄送下载信息成功
                                        if(!JSONObject.parseObject(s1).getBooleanValue("success")) {
                                            throw new RuntimeException("跨平台下载信息抄送失败，返回"+s1);
                                        }else {
                                            //删除脏数据
                                            int deleteCount= yx.deleteViedoInfoById(id_.toString());
                                            log.info("删除脏数据->id:"+id_.toString()+",deleteCount:"+(deleteCount==0?"删除失败":"删除成功"));
                                            return  renderSuccess("下载信息抄送完毕");
                                        }
                                    }
                                }
								map.put("id11", id_);
								int i=yx.update_infocopy_downloadM(map);
								log.info("更新下载地址信息->"+i);

                            }else{//不存在则添加
                                map.put("channelid", fileinfo2.get("channelid"));
                                int i=yx.insert_infocopy_downloadM(map);
                                log.info("添加下载地址信息->"+i);
                            }
                        }
                    }
                }
            }
            // TODO: 比较md5、checkSum是否一致，以及后续业务处理
            return renderSuccess("完成");
        } catch (Exception ex) {
            yx.insert_M(body+"，----error:"+getErrorInfoFromException(ex));//如果错误直接保存
            return renderError("异常'");
        }
    }
	private String readBody(HttpServletRequest request) throws UnsupportedEncodingException, IOException {
		if (request.getContentLength() > 0) {
			BufferedReader br = new BufferedReader(new InputStreamReader((ServletInputStream) request.getInputStream(), "utf-8"));
			StringBuffer sb = new StringBuffer("");
			String temp;
			//循环读取
			while ((temp = br.readLine()) != null) {
				sb.append(temp);
			}
			br.close();
			return  sb.toString();
		} else
			return null;
	}
	@GetMapping(value="downloadClient.do")
	@ResponseBody
	public void downloadClient(String url,HttpServletResponse response) throws Exception{
		log.info("客户端下载视频文件->"+url);
		String[] ss=url.split("/");
		String fileName= ss[ss.length-1];
		if(url.indexOf("www")!=-1 || url.indexOf("http")!=-1){//通过url下载
			log.info("通过url下载");
			super.urlToWeb(url, response, fileName);
		}else{
			log.info("本地下载");
			super.	download(url,response);
		}

	}
	private static HashMap map__1=new HashMap<>();
	@PostMapping(value="dsdb.do")
	@ResponseBody
	public Object downloadServiceDatabase(String id){
		if(StringUtils.isBlank(id)){
			return renderError("参数不正确");
		}
		Map map1=yx.selectUrlAndVidById(id);
		String url=map1.get("url").toString();
		log.info("id:"+id+"是否存在->"+map__1.get("id"));
		if(map__1.get(id)==null){
			//删除云端的视频
			String[] s=url.split("/");
			try {
				map__1.put(id,super.getTime());
				String last=s[s.length-1];
				log.info("原视频文件名->"+last);
				String scen="upload/mp4/"+new SimpleDateFormat("yyyy/MM/dd/").format(new Date());
				String download_path=RootStatic.root_Directory+scen;
				String play_path=RootStatic.download_prefix+scen+last;
				log.info("视频播放地址->"+play_path);

				File file=new File(download_path);


				if(!file.exists()){
					file.mkdirs();//创建目录
				}
				log.info("本地路径->"+file.getAbsolutePath());
				downloadFile(url,download_path+last);
				//更新数据库播放地址
				int updateCount=yx.updateServerPath(play_path,id);
				if(updateCount>0){//更新成功
					//刪除原視頻
					String result=HttpYX.delteViedo(map1.get("vid").toString());
					log.info("刪除视频源文件返回->"+result);
				}
				log.info("更新播放地址->id:"+id+",count"+updateCount);
				Map map=new HashMap<>();
				map.put("play_path", play_path);
				map.put("AbsolutePath", file.getAbsolutePath());
				map.put("downUrl", RootStatic.url+RootStatic.root_Directory+scen+last);
				map.put("id", id);
				return renderSuccess(map);
			} catch (Exception e) {
				log.info("下载视频到本地服务器异常");
				e.printStackTrace();
				return renderError("下载失败，失败原因："+e.getMessage());
			}finally {
				map__1.remove(id);
			}
		}else{
			return renderError(map__1.get(id).toString()+",正在下载中，请等待...");
		}
	}
	public static void main(String[] args) throws Exception{

		//创建目录测试
		/*String scen="upload/mp4/"+DataUtil.splicingPath;
		String download_path=RootStatic.root_Directory+scen;
		File file =new File(download_path);
		if(file.exists()){
			System.out.println("目录存在");
		}else{
			System.out.println("创建");
			file.mkdirs();
		}*/

		//信息时长抄送测试
/*		InfoCopy infocopy=new InfoCopy();
		infocopy.setChannelId("62654898432013131");
		infocopy.setCreatetime(System.currentTimeMillis()+"");
		infocopy.setDuration(25+"");
		infocopy.setEventType(5+"");
		infocopy.setStatus("SUCCESS");
		infocopy.setExt("123");
		Members members=new Members();
		members.setAccid("2");
		members.setCaller(true);
		Members members1=new Members();
		members1.setAccid("3");
		List<Members> list=new ArrayList<>();
		list.add(members1);
		list.add(members);
		infocopy.setMembers(list);

		//System.out.println(JSON.toJSONString(infocopy));


		//System.out.println(HttpYX.doPost("http://localhost:80/yx/infocopy.do",JSON.toJSONString(infocopy)));*/


		//删除好友 开始
	/*	List list = yx.query_token("1",-1);
		String s;
		String s1 = "";
		String s2;//接收返回结果
		StringBuilder sb=new StringBuilder();*/
		//循环删除好友
	/*	int i=0;
		for(int j=0;j<list.size();j++){
			s=((Map)list.get(j)).get("accid").toString();//发起者
			List<NameValuePair> nvps = new ArrayList<NameValuePair>();
			nvps.add(new BasicNameValuePair("accid",s));
			nvps.add(new BasicNameValuePair("faccid",s1));
			s2=HttpYX.doPost("https://api.netease.im/nimserver/friend/delete.action",nvps);
			if(s2.indexOf("200")==-1){
				sb.append(s1).append("删除：").append(s).append("失败！");
				i++;
			}
		}
		//System.out.println("总的好友数:"+list.size()+",失败个数："+i+" "+sb.toString());*/
		//删除好友结束

		//添加好友
		//System.out.println(HttpYX.addBuddy("c6fa296f9c17c8032be6593a5d02269b", "507da3a2ddd113ec9166fb8e58005fb5"));
		//System.out.print(DataConversionParent.subZeroAndDot("0.0"));
		//循环删除好友 开始
		//获取所有的审核
		/*List list0 = yx.query_token("0",-1);
		//获取所有的客户
		List list = yx.query_token("1",-1);
		String s;
		String s1 = "";
		String s2;//接收返回结果

		//循环删除好友
		for(int i=0;i<list0.size();i++){
			s1=((Map)list0.get(i)).get("accid").toString();
			int sum=0;
			StringBuilder sb=new StringBuilder();
			for(int j=0;j<list.size();j++){
				s=((Map)list.get(j)).get("accid").toString();//发起者
				List<NameValuePair> nvps = new ArrayList<NameValuePair>();
				nvps.add(new BasicNameValuePair("accid",s));
				nvps.add(new BasicNameValuePair("faccid",s1));
				s2=HttpYX.doPost("https://api.netease.im/nimserver/friend/delete.action",nvps);
				if(s2.indexOf("200")==-1){
					sb.append(s1).append("删除：").append(s).append("失败！");
					sum++;
				}
			}
			//System.out.println(s1+"总的好友数:"+list.size()+",失败个数："+sum+" "+sb.toString());
		}*/
		//循环删除好友结束
//		String s="dfd'{dfd}''{";
//		//System.out.println(s.replaceAll("\\'\\{","{"));
//		//char5分割
//		String s1="upload/2018/12/05/b96488e4cb8801432fd5c5a1944751a0.jpgupload/2018/12/05/0480eb24d3448ceade8ad0f84fd57458.jpgupload/2018/12/05/19c43d2433d75441c2dd7be45a604ff8.jpgupload/2018/12/05/250126c780fd93b29e175db5ec00db8d.jpg";
//		String ss[]=s1.split("");
//		for(String s2:ss){
//			if(!s2.equals("")){
//				System.out.println("输出"+s2);
//				break;
//			}
//		}
		//视频下载
	/*	Long l=System.currentTimeMillis();
		downloadFile("http://jdvod6ep5thqk.vod.126.net/jdvod6ep5thqk/0-50870502883509-0-mix.mp4","C:\\Users\\Administrator\\Desktop\\word\\haha1\\upload\\0-6324213347287310-0-mix.mp4");
		Long l1=System.currentTimeMillis();
		System.out.println(l1-l);*/

		//截取字符测试
		/*String s="http://a.kcway.net/assess/upload/0-50873460261080-0-mix.mp4";
		int i=s.indexOf("upload");
		if(i!=-1){
			System.out.println(s.substring(i));
		}*/
	}
}
