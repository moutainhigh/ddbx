/*
 * @Description: TT单独类的演示
 * @Author: tt
 * @Date: 2018-10-29 13:58:00
 * @LastEditTime: 2019-01-23 09:47:19
 * @LastEditors: Please set LastEditors
 */
package com.example.ddbx.tt.table;

/**
 * 单独的类演示。
 * */
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.example.ddbx.tt.tool.DbCtrl;
import com.example.ddbx.tt.tool.Tools;

public class KjbUser extends DbCtrl {
	public KjbUser() {
		super(null, "KjbUser");
		// TODO Auto-generated constructor stub
	}

	public List<Map<String, String>> lists(String wheres, String f) {
		// 处理wheres,或者字段，自行处理
		return super.lists(wheres, f);
	}

	public boolean chk(Map<String, String> array, long id) {
		// 新增，删除，编辑时检查数据可写入，为真时 、、ss
		this.chkMsg = "";
		// todo 写入一些检查语句，比如添加时，一些参数的合法性检查。不通过设置为false,然后在controller里面判断结果，输出错误信息到jsp页面
		boolean result = true;
		return result;
	}

	public Map<String, String> param(Map<String, String> ary, long id) {
		// todo
		// 新增，删除，写入前的操作。
		return ary;
	}

	public void succ(Map<String, String> array, long id, int sqltp) {
		// todo
		// 新增，删除，写入成功后的操作。
	}

	public void setJspDataForList(HttpServletRequest request,DbCtrl dbCtrl){
		Map<String, String> info = null;
    List<Map<String, String>> list = null;
		Map<String, String> post = Tools.getpostmap(request);// 过滤参数，过滤mysql的注入，url参数注入
		String whereString = "true";//过滤 如 t.mid=222 ，只显示mid为222的列表
		String fieldsString = ""; //显示字段列表如t.id,t.name,t.dt_edit
		String orderString = ""; //排序
		String lsitTitleString = ""; //list的jsp页面左上角的标题
		int pageInt = Integer.valueOf(Tools.myisnull(post.get("p")) == false ? post.get("p") : "1"); //当前页
		int limtInt = Integer.valueOf(Tools.myisnull(post.get("l")) == false ? post.get("l") : "10"); //每页显示多少数据量
		boolean candel = false;
		dbCtrl.showall = true;
		lsitTitleString = "城市列表管理";
		orderString = "ORDER BY id DESC";
		String kw = post.get("kw");
		String state_id = post.get("state_id");
		String dtbe = post.get("dtbe");
		if (Tools.myisnull(kw)==false){
			whereString += " AND name like '%"+kw+"%'";
		}
		if (Tools.myisnull(state_id)==false && !state_id.equals("0")){
			whereString += " AND state_id="+state_id;
		}
		if (Tools.myisnull(dtbe)==false){
			dtbe = dtbe.replace("%2f","-").replace("+", "");
			String[] dtArr = dtbe.split("-");
			dtArr[0] = dtArr[0].trim();
			dtArr[1] = dtArr[1].trim();
			System.out.println("DTBE开始日期:"+dtArr[0]+"结束日期:"+dtArr[1]);
		}
		dbCtrl.orders = orderString;
		dbCtrl.p = pageInt;
		dbCtrl.limit = limtInt;
		list = dbCtrl.lists(whereString, fieldsString);
		request.setAttribute("list", list);
		request.setAttribute("recs", dbCtrl.recs); //总记录数
		String htmlpages = dbCtrl.getPage("", 0, true); //分页html代码
		request.setAttribute("pages", dbCtrl.pages); //总页数
		request.setAttribute("p", pageInt); //当前页码
		request.setAttribute("l", limtInt); //limit量
		request.setAttribute("lsitTitleString", lsitTitleString); //标题
		request.setAttribute("htmlpages", htmlpages); //分页的html代码
		request.setAttribute("canDel", candel); //分页的html代码
	}

	public void setJspDataForForm(HttpServletRequest request,DbCtrl dbCtrl){
		Map<String, String> info = null;
    List<Map<String, String>> list = null;
		Map<String, String> post = Tools.getpostmap(request);// 过滤参数，过滤mysql的注入，url参数注入
		String whereString = "true";//过滤 如 t.mid=222 ，只显示mid为222的列表
		String fieldsString = ""; //显示字段列表如t.id,t.name,t.dt_edit
		String orderString = ""; //排序
		String lsitTitleString = ""; //list的jsp页面左上角的标题
		int pageInt = Integer.valueOf(Tools.myisnull(post.get("p")) == false ? post.get("p") : "1"); //当前页
		int limtInt = Integer.valueOf(Tools.myisnull(post.get("l")) == false ? post.get("l") : "10"); //每页显示多少数据量
		boolean candel = false;
		dbCtrl.showall = true;
		lsitTitleString = "城市列表管理";
		orderString = "ORDER BY id DESC";
		String kw = post.get("kw");
		String state_id = post.get("state_id");
		String dtbe = post.get("dtbe");
		if (Tools.myisnull(kw)==false){
			whereString += " AND name like '%"+kw+"%'";
		}
		if (Tools.myisnull(state_id)==false && !state_id.equals("0")){
			whereString += " AND state_id="+state_id;
		}
		if (Tools.myisnull(dtbe)==false){
			dtbe = dtbe.replace("%2f","-").replace("+", "");
			String[] dtArr = dtbe.split("-");
			dtArr[0] = dtArr[0].trim();
			dtArr[1] = dtArr[1].trim();
			System.out.println("DTBE开始日期:"+dtArr[0]+"结束日期:"+dtArr[1]);
		}
		dbCtrl.orders = orderString;
		dbCtrl.p = pageInt;
		dbCtrl.limit = limtInt;
		list = dbCtrl.lists(whereString, fieldsString);
		request.setAttribute("list", list);
		request.setAttribute("recs", dbCtrl.recs); //总记录数
		String htmlpages = dbCtrl.getPage("", 0, true); //分页html代码
		request.setAttribute("pages", dbCtrl.pages); //总页数
		request.setAttribute("p", pageInt); //当前页码
		request.setAttribute("l", limtInt); //limit量
		request.setAttribute("lsitTitleString", lsitTitleString); //标题
		request.setAttribute("htmlpages", htmlpages); //分页的html代码
		request.setAttribute("canDel", candel); //分页的html代码
	}
}
