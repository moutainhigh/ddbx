/*
 * 内置简单型数据字典，在项目启动时调用initDic();初始化字典
 * @Description: file content
 * @Author: tt
 * @LastEditors: tt
 * @Date: 2019-03-15 16:23:06
 * @LastEditTime: 2019-03-16 09:44:06
 */
package com.example.ddbx.tt.tool;


import com.example.ddbx.tt.data.TtMap;

/**
 * 一些常用的数据字典，作为<select></select>用
 */
public class DataDic {
    public static TtMap dicYesOrNo = new TtMap();
    public static TtMap dicSex = new TtMap();
    public static TtMap dicBsType = new TtMap();
    public static TtMap dic_zx_status = new TtMap();
    public static TtMap dic_tr_status = new TtMap();
    public static TtMap dic_zx1_tag = new TtMap();
    public static TtMap dic_cars_type = new TtMap();
    public static TtMap dic_aj_date = new TtMap();
    public static TtMap dic_dz_type = new TtMap();
    public static TtMap dic_hyzk = new TtMap();
    public static TtMap dic_xl = new TtMap();
    public static TtMap dic_jzzk = new TtMap();
    public static TtMap dic_dwxz = new TtMap();
    public static TtMap dic_sshy = new TtMap();
    public static TtMap dic_zy = new TtMap();
    public static TtMap dic_zw = new TtMap();
    public static TtMap dic_kk_status = new TtMap();
    public static TtMap dic_cars_source = new TtMap();
    public static TtMap dic_cars_property = new TtMap();
    public static TtMap dic_car_status = new TtMap();
    public static TtMap dic_car_gear_box = new TtMap();
    public static TtMap dic_car_color = new TtMap();
    public static TtMap dic_isadmin = new TtMap();
    public static TtMap dic_gs_type = new TtMap();
    public static synchronized void initDic() {
        if (dicYesOrNo.size() > 0) { // 已经初始化过了
            return;
        }
        /*公司性质*/
        dic_gs_type.put("0","公司");
        dic_gs_type.put("1","银行");
        /*账户登录权限*/
        dic_isadmin.put("0","请选择");
        dic_isadmin.put("1","后台账户");
        dic_isadmin.put("2","APP账户");
        dic_isadmin.put("3","小程序账户");
        /* 是/否 */
        dicYesOrNo.put("0", "否");
        dicYesOrNo.put("1", "是");
        /* 性别 */
        dicSex.put("0", "请选择性别");
        dicSex.put("1", "男");
        dicSex.put("2", "女");
        /* 业务等级 */
        dicBsType.put("0", "请选择业务等级");
        dicBsType.put("1", "预期贷款额10万以下（含10万）");
        dicBsType.put("2", "预期贷款额10万以上");
        /* 征信审核状态 */
        dic_zx_status.put("0", "请选择");
        dic_zx_status.put("1", "草稿箱");
        dic_zx_status.put("2", "提交查询");
        dic_zx_status.put("3", "审核通过");
        dic_zx_status.put("4", "回退补件");
        dic_zx_status.put("5", "审核不通过");
        /* 通融审核状态 */
        dic_tr_status.put("0", "请选择");
        dic_tr_status.put("1", "提交通融信息");
        dic_tr_status.put("2", "通融不通过");
        dic_tr_status.put("3", "通融通过");
        dic_tr_status.put("4", "通融回退补件");
        /* 征信是否通过状态 */
        dic_zx1_tag.put("0", "请选择");
        dic_zx1_tag.put("1", "通过");
        dic_zx1_tag.put("2", "不通过");
        /*车辆类型*/
        dic_cars_type.put("0", "请选择");
        dic_cars_type.put("1", "新车");
        dic_cars_type.put("2", "二手车");
        /*按揭期限*/
        dic_aj_date.put("0", "请选择");
        dic_aj_date.put("24", "24期");
        dic_aj_date.put("36", "36期");
        /*垫资类型*/
        dic_dz_type.put("0", "请选择");
        dic_dz_type.put("1", "不垫资");
        dic_dz_type.put("2", "提车垫资");
        /*婚姻状况*/
        dic_hyzk.put("0", "请选择");
        dic_hyzk.put("1", "未婚");
        dic_hyzk.put("2", "已婚");
        dic_hyzk.put("3", "离异");
        dic_hyzk.put("4", "丧偶");
        /*最高学历*/
        dic_xl.put("0", "请选择");
        dic_xl.put("1", "小学");
        dic_xl.put("2", "初中");
        dic_xl.put("3", "高中");
        dic_xl.put("4", "大专");
        dic_xl.put("5", "本科");
        dic_xl.put("6", "硕士");
        dic_xl.put("7", "博士及以上");
        /*居住状况*/
        dic_jzzk.put("0", "请选择");
        dic_jzzk.put("1", "自有住房");
        dic_jzzk.put("2", "租房");
        dic_jzzk.put("3", "分期付款购房");
        dic_jzzk.put("4", "集体宿舍");
        dic_jzzk.put("5", "其他");
        /*单位性质*/
        dic_dwxz.put("0", "请选择");
        dic_dwxz.put("1", "国有");
        dic_dwxz.put("2", "私营");
        dic_dwxz.put("3", "民营");
        dic_dwxz.put("4", "股份合作");
        dic_dwxz.put("5", "其他股份制");
        dic_dwxz.put("6", "个体");
        dic_dwxz.put("7", "三资");
        dic_dwxz.put("8", "其他");
        /*所属行业*/
        dic_sshy.put("0", "请选择");
        dic_sshy.put("1", "农林牧渔");
        dic_sshy.put("2", "邮电通讯");
        dic_sshy.put("3", "房地产");
        dic_sshy.put("4", "科教文卫");
        dic_sshy.put("5", "工业");
        dic_sshy.put("6", "银行");
        dic_sshy.put("7", "证券");
        dic_sshy.put("8", "保险");
        dic_sshy.put("9", "商业");
        dic_sshy.put("10", "机关团体");
        dic_sshy.put("11", "其他");
        /*职业*/
        dic_zy.put("0", "请选择");
        dic_zy.put("1", "公务员");
        dic_zy.put("2", "事业单位员工");
        dic_zy.put("3", "工人");
        dic_zy.put("4", "农民");
        dic_zy.put("5", "军人");
        dic_zy.put("6", "职员");
        dic_zy.put("7", "私人业主");
        dic_zy.put("8", "学生");
        dic_zy.put("9", "自由职业");
        dic_zy.put("10", "其他");
        /*职务*/
        dic_zw.put("0", "请选择");
        dic_zw.put("1", "企业负责人");
        dic_zw.put("2", "总经理");
        dic_zw.put("3", "部门经理");
        dic_zw.put("4", "职员");
        /*开卡审核状态*/
        dic_kk_status.put("0", "请选择");
        dic_kk_status.put("1", "提交申请");
        dic_kk_status.put("2", "开卡成功");
        dic_kk_status.put("3", "开卡失败");
        dic_kk_status.put("4", "回退补件");
        /*国产/进口*/
        dic_cars_source.put("0", "请选择");
        dic_cars_source.put("1", "国产");
        dic_cars_source.put("2", "进口");
        /*使用性质*/
        dic_cars_property.put("0", "请选择");
        dic_cars_property.put("1", "营运");
        dic_cars_property.put("2", "非营运");
        /*车辆状况*/
        dic_car_status.put("0", "请选择");
        dic_car_status.put("1", "优秀");
        dic_car_status.put("2", "良好");
        dic_car_status.put("3", "一般");
        /*变速箱*/
        dic_car_gear_box.put("0", "请选择");
        dic_car_gear_box.put("1","自动");
        dic_car_gear_box.put("2","手动");
        /*车辆颜色*/
        dic_car_color.put("0", "请选择");
        dic_car_color.put("1","黑");
        dic_car_color.put("2","白");
        dic_car_color.put("3","灰");
        dic_car_color.put("4","红");
        dic_car_color.put("5","银");
        dic_car_color.put("6","蓝");
        dic_car_color.put("7","金");
        dic_car_color.put("8","棕");
        dic_car_color.put("9","橙");
        dic_car_color.put("10","黄");
        dic_car_color.put("11","紫");
        dic_car_color.put("12","绿");
        dic_car_color.put("13","褐");
        dic_car_color.put("14","栗");
        dic_car_color.put("15","米");
        dic_car_color.put("16","银灰");
        dic_car_color.put("17","青");
        dic_car_color.put("18","香槟");
        dic_car_color.put("19","咖啡");
        dic_car_color.put("20","天山");
        dic_car_color.put("21","其他色");
    }
}