package com.example.ddbx.transfer.service.one.impl;

import java.util.List;
import java.util.Map;
import com.example.ddbx.transfer.base.BaseController;
import com.example.ddbx.transfer.dao.one.YXMapper;
import com.example.ddbx.transfer.entity.one.InfoCopy;
import com.example.ddbx.transfer.entity.one.PageInfo;
import com.example.ddbx.transfer.service.one.YXService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class YXServiceImpl implements YXService{
	@Autowired
	private YXMapper yxmapper;

	@Override
	public List selectSysModalByParentId(String s) {
		return yxmapper.selectSysModalByParentId(s);
	}

	@Override
	public String selectSysModalLater(String s) {
		return yxmapper.selectSysModalLater(s);
	}

	public int add_YX_account(Map map){
		return yxmapper.add_YX_account(map);
	}
	public int addcallback(Map callback){
		return yxmapper.addcallback(callback);
	}
	public List select_YX_video(){
		return yxmapper.select_YX_video();
	}
	public List query_tokenbyid(String id){
		return yxmapper.query_tokenbyid(id);
	}

	public int insert_infocopy_duration(InfoCopy infocopy){
		return yxmapper.insert_infocopy_duration(infocopy);
	}
	public int insert_infocopy_download(InfoCopy infocopy){
		return yxmapper.insert_infocopy_download(infocopy);
	}
	public Map select_infocopy(String channelId){
		return yxmapper.select_infocopy(channelId);
	}
	public int update_infocopy_duration(InfoCopy infocopy){
		return yxmapper.update_infocopy_duration(infocopy);
	}
	public int update_infocopy_download(InfoCopy infocopy){
		return yxmapper.update_infocopy_download(infocopy);
	}
	public int insert_M(String s){
		return yxmapper.insert_M( s);
	}
	public int insert_infocopy_durationM(Map infocopy){
		return yxmapper.insert_infocopy_durationM(infocopy);
	}
	public int insert_infocopy_downloadM(Map infocopy){
		return yxmapper.insert_infocopy_downloadM(infocopy);
	}
	public String select_infocopyM(String channelId){
		return yxmapper.select_infocopyM(channelId);
	}
	public int update_infocopy_durationM(Map infocopy){
		return yxmapper.update_infocopy_durationM(infocopy);
	}
	public int update_infocopy_downloadM(Map infocopy){
		return yxmapper.update_infocopy_downloadM(infocopy);
	}
	public Map select_viedo_byid(String id){
		return yxmapper.select_viedo_byid(id);
	}
	//历史列表
	public List select_operating(PageInfo pageinfo){
		return yxmapper.select_operating( pageinfo);
	}

	public Map select_icbc_byid(String id){
		return yxmapper.select_icbc_byid(id);
	}
	public Map select_car_byid(String icbcid){
		return yxmapper.select_car_byid(icbcid);
	}
	public String select_kjicbc_byid(String typeid, String icbcid){
		return yxmapper.select_kjicbc_byid(typeid,icbcid);
	}
	public int insert_kjicbcresult(Map map){
		return yxmapper.insert_kjicbcresult(map);
	}
	public int insert_kjicbc(Map map){
		return yxmapper.insert_kjicbc(map);
	}
	public int update_kjicbc(Map map){
		return yxmapper.update_kjicbc(map);
	}
	public List select_viedo_byid2(String id){
		return yxmapper.select_viedo_byid2(id);
	}

	//视频面前在视频表中添加一个记录
	public int insert_infocopy_viedo(Map map){
		return yxmapper.insert_infocopy_viedo(map);
	}
	@Override
	public int select_operating_count(PageInfo pageinfo) {
		// TODO Auto-generated method stub
		return yxmapper.select_operating_count(pageinfo);
	}
	@Override
	public List query_token(String label, int count) {
		// TODO Auto-generated method stub
		return yxmapper.query_token(label,count);
	}
	public int update_infocopy_viedo_vid(Map map){
		return yxmapper.update_infocopy_viedo_vid(map);
	}
	public int updata_mq_status(String bcstatus,String icbcid){
		return yxmapper.updata_mq_status(bcstatus,icbcid);
	}
	//查询视频面签信息
	@Override
	public List select_mq_info(String id) {
		// TODO Auto-generated method stub
		return yxmapper.select_mq_info( id);
	}
	@Override
	public List<Map> getOrganization() {
		// TODO Auto-generated method stub
		return yxmapper.getOrganization();
	}
	@Override
	public List<Map> getBank() {
		// TODO Auto-generated method stub
		return yxmapper.getBank();
	}
	@Override
	public String selectUidByAccid(String accid) {
		return yxmapper.selectUidByAccid(accid);
	}
	@Override
	public String getCommStates(Integer id) {
		// TODO Auto-generated method stub
		return yxmapper.getCommStates(id);
	}
	@Override
	public String getCommCitys(Integer id) {
		// TODO Auto-generated method stub
		return yxmapper.getCommCitys(id);
	}
	@Override
	public String getCommZones(Integer id) {
		// TODO Auto-generated method stub
		return yxmapper.getCommZones(id);
	}
	@Override
	public Object updateVideoTokenBinding(String delmark,String bankId, String Id,String dt_edit,String mid_edit) {
		if(StringUtils.isNotBlank(delmark) && (delmark.equals("0") || delmark.equals("1")) && StringUtils.isNotBlank(Id)){
			int i=yxmapper.updateVideoTokenBinding(Integer.parseInt(delmark),bankId,Id,dt_edit,mid_edit);
			if(i>0){
				return BaseController.renderSuccess("修改权限成功!");
			}else{
				return BaseController.renderError("修改权限失败!");
			}
		}
		return BaseController.renderError("请求参数不正确!");

	}
	@Override
	public Map selectCountTokenByUid(String uid) {
		// TODO Auto-generated method stub
		return yxmapper.selectCountTokenByUid(uid);
	}
	@Override
	public int selectCountAdminById(String id) {
		// TODO Auto-generated method stub
		return yxmapper.selectCountAdminById(id);
	}
	@Override
	public String selectBankId(String icbcId) {
		// TODO Auto-generated method stub
		return yxmapper.selectBankId(icbcId);
	}
	@Override
	public Integer selectBankCount(String id) {
		// TODO Auto-generated method stub
		return yxmapper.selectBankCount(id);
	}
	@Override
	public Integer addOccupyTest(Map map) {
		// TODO Auto-generated method stub
		return yxmapper.addOccupyTest(map);
	}
	@Override
	public int updateServerPath(String serverPath, String Id) {
		// TODO Auto-generated method stub
		return yxmapper.updateServerPath(serverPath,Id);
	}
	@Override
	public Map selectUrlAndVidById(String Id) {
		// TODO Auto-generated method stub
		return yxmapper.selectUrlAndVidById(Id);
	}
	@Override
	public String SelectBankIdByUid(String id) {
		// TODO Auto-generated method stub
		return yxmapper.SelectBankIdByUid(id);
	}
	@Override
	public int addVideoScreenshot(Map map) {
		// TODO Auto-generated method stub
		return yxmapper.addVideoScreenshot(map);
	}
	@Override
	public List selectAllVideoScreenshot(Map map) {
		// TODO Auto-generated method stub
		return yxmapper.selectAllVideoScreenshot(map);
	}
	@Override
	public int deleteVideoScreenshot(Map map) {
		// TODO Auto-generated method stub
		return yxmapper.deleteVideoScreenshot(map);
	}
	@Override
	public int deleteViedoInfoBychannelId(String channelId) {
		// TODO Auto-generated method stub
		return yxmapper.deleteViedoInfoBychannelId(channelId);
	}
	@Override
	public String selectRealtimeUrl(String mark) {
		// TODO Auto-generated method stub
		return yxmapper.selectRealtimeUrl(mark);
	}
	@Override
	public String selectRecordingRrl(String mark) {
		// TODO Auto-generated method stub
		return yxmapper.selectRecordingRrl(mark);
	}
	@Override
	public int deleteViedoInfoById(String s) {
		// TODO Auto-generated method stub
		return yxmapper.deleteViedoInfoById(s);
	}
}
