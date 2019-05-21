package com.example.ddbx.transfer.service.one;

import com.example.ddbx.transfer.entity.one.InfoCopy;
import com.example.ddbx.transfer.entity.one.PageInfo;

import java.util.List;
import java.util.Map;

public interface YXService {
	List selectSysModalByParentId(String s);
	String selectSysModalLater(String s);

	int add_YX_account(Map map);
	int addcallback(Map callback);
	List select_YX_video();
	List query_tokenbyid(String id);
	List query_token(String label, int count);

	int insert_infocopy_duration(InfoCopy infocopy);
	int insert_infocopy_download(InfoCopy infocopy);
	Map select_infocopy(String channelId);
	int update_infocopy_duration(InfoCopy infocopy);
	int update_infocopy_download(InfoCopy infocopy);
	//视频面前在视频表中添加一个记录
	int insert_infocopy_viedo(Map map);
	int deleteViedoInfoById(String s);

	int insert_M(String s);
	int insert_infocopy_durationM(Map infocopy);
	int insert_infocopy_downloadM(Map infocopy);
	String select_infocopyM(String channelId);
	int update_infocopy_durationM(Map infocopy);
	int update_infocopy_downloadM(Map infocopy);

	Map select_viedo_byid(String id);
	//历史免签
	List select_operating(PageInfo pageinfo);
	int select_operating_count(PageInfo pageinfo);
	//查询视频面签信息
	List select_mq_info(String id);
	List select_viedo_byid2(String id);

	Map select_icbc_byid(String id);
	Map select_car_byid(String icbcid);
	String select_kjicbc_byid(String typeid, String icbcid);
	int insert_kjicbcresult(Map map);
	int insert_kjicbc(Map map);//添加
	int update_kjicbc(Map map);//更新
	int update_infocopy_viedo_vid(Map map);
	int updata_mq_status(String bcstatus, String icbcid);
	List<Map> getOrganization();
	List<Map> getBank();
	String selectUidByAccid(String accid);
	String getCommStates(Integer id);
	String getCommCitys(Integer id);
	String getCommZones(Integer id);
	Object updateVideoTokenBinding(String delmark, String bankId, String Id, String dt_edit, String mid_edit);
	Map selectCountTokenByUid(String uid);
	int selectCountAdminById(String id);
	String selectBankId(String icbcId);
	Integer selectBankCount(String id);
	Integer addOccupyTest(Map map);
	int updateServerPath(String serverPath, String Id);
	Map selectUrlAndVidById(String Id);
	String SelectBankIdByUid(String id);
	//截图相关
	int addVideoScreenshot(Map map);
	List selectAllVideoScreenshot(Map map);
	int deleteVideoScreenshot(Map map);


	int deleteViedoInfoBychannelId(String channelId);
	String selectRealtimeUrl(String mark);
	String selectRecordingRrl(String mark);
}
