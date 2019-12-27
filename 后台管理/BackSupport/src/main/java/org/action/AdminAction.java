package org.action;

import org.apache.struts2.ServletActionContext;
import org.dao.AdminInfoDAO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.vo.AdminInfo;

public class AdminAction extends Action {
	private AdminInfo adminInfo;
    private JSONObject jsonObj;
	private JSONArray  jsonArray;
	private int page;
	private int rows;
	
    public AdminAction(AdminInfo adminInfo, JSONObject jsonObj, JSONArray jsonArray, int page, int rows) {
		super();
		this.adminInfo = adminInfo;
		this.jsonObj = jsonObj;
		this.jsonArray = jsonArray;
		this.page = page;
		this.rows = rows;
	}

	public AdminAction() {
		super();
	}

	public AdminInfo getAdminInfo() {
		return adminInfo;
	}

	public void setAdminInfo(AdminInfo adminInfo) {
		this.adminInfo = adminInfo;
	}

	public JSONObject getJsonObj() {
		return jsonObj;
	}

	public void setJsonObj(JSONObject jsonObj) {
		this.jsonObj = jsonObj;
	}

	public JSONArray getJsonArray() {
		return jsonArray;
	}

	public void setJsonArray(JSONArray jsonArray) {
		this.jsonArray = jsonArray;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public String queryByAdminName() {
		adminInfo=AdminInfoDAO.queryByAdminName(adminInfo);
    	if(adminInfo==null) {
    		jsonObj=fail();
    		return "fail";
    	}else {
    		jsonObj=success();
    		return "success";
    	}
    }
	
	public String queryByAdminNameAndAdminPassword(){
		adminInfo=AdminInfoDAO.queryByAdminNameAndAdminPassword(adminInfo);
        if(adminInfo==null) {
    		jsonObj=fail();
    		return "fail";
    	}else {
    		jsonObj=success();
    		return "success";
    	}
    }

    public String updateAdmin(){
    	if(AdminInfoDAO.updateAdmin(adminInfo)){
			jsonObj=success();
			return "success";
		}else{
			jsonObj=fail();
			return "fail";
		}
	}
}
