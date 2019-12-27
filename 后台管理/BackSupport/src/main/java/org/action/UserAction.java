package org.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.dao.CourseDAO;
import org.dao.TeacherDAO;
import org.dao.UserInfoDAO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.vo.*;

import javax.swing.*;

public class UserAction extends Action {
    private PureUserInfo pureUserInfo;
    private JSONObject jsonObj;
	private JSONArray  jsonArray;
	private int page;
	private int rows;

	public UserAction() {
	}

	public UserAction(PureUserInfo pureUserInfo, JSONObject jsonObj, JSONArray jsonArray, int page, int rows) {
		this.pureUserInfo = pureUserInfo;
		this.jsonObj = jsonObj;
		this.jsonArray = jsonArray;
		this.page = page;
		this.rows = rows;
	}

	public PureUserInfo getPureUserInfo() {
		return pureUserInfo;
	}

	public void setPureUserInfo(PureUserInfo pureUserInfo) {
		this.pureUserInfo = pureUserInfo;
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

	public PureUserInfo parseUserInfoToPureUserInfo(UserInfo userInfo){
		PureUserInfo pureUserInfo=new PureUserInfo();
		pureUserInfo.setId(userInfo.getId());
		pureUserInfo.setUsername(userInfo.getUsername());
		pureUserInfo.setPassword(userInfo.getPassword());
		pureUserInfo.setEmail(userInfo.getEmail());
		pureUserInfo.setTel(userInfo.getTel());
		pureUserInfo.setSex(userInfo.getSex());
		pureUserInfo.setAvatar(userInfo.getAvatar());
		pureUserInfo.setTotallyWatchingNum(userInfo.getTotallyWatchingNum());
		pureUserInfo.setTotallyWatchingTimes(userInfo.getTotallyWatchingTimes());
		pureUserInfo.setExp(userInfo.getExp());
		pureUserInfo.setIsVip(userInfo.getIsVip());
		return pureUserInfo;
	}

	public UserInfo parsePureUserInfoToUserInfo(PureUserInfo pureUserInfo){
		UserInfo userInfo=new UserInfo();
		userInfo.setId(pureUserInfo.getId());
		userInfo.setUsername(pureUserInfo.getUsername());
		userInfo.setPassword(pureUserInfo.getPassword());
		userInfo.setEmail(pureUserInfo.getEmail());
		userInfo.setTel(pureUserInfo.getTel());
		userInfo.setSex(pureUserInfo.getSex());
		userInfo.setAvatar(pureUserInfo.getAvatar());
		userInfo.setTotallyWatchingNum(pureUserInfo.getTotallyWatchingNum());
		userInfo.setTotallyWatchingTimes(pureUserInfo.getTotallyWatchingTimes());
		userInfo.setExp(pureUserInfo.getExp());
		userInfo.setIsVip(pureUserInfo.getIsVip());
		return userInfo;
	}

	public String queryByUsernameAndPassword(){
		UserInfo userInfo=parsePureUserInfoToUserInfo(pureUserInfo);
        userInfo=UserInfoDAO.queryByUsernameAndPassword(userInfo);
        if(userInfo==null) {
    		jsonObj=fail();
    		return "fail";
    	}else {
    		jsonObj=success();
    		return "success";
    	}
    }
    
    public String queryByPage() {
		List<UserInfo> userList=UserInfoDAO.queryByPage(getMap(page,rows));
		ArrayList<PureUserInfo> pureUserList=new ArrayList<PureUserInfo>();
		for(UserInfo userInfo:userList){
			PureUserInfo pureUserInfo=parseUserInfoToPureUserInfo(userInfo);
			if(userInfo.getTeacherById()!=null){
				pureUserInfo.setIsTeacher(1);
			}else{
				pureUserInfo.setIsTeacher(0);
			}
			pureUserList.add(pureUserInfo);
		}
		jsonObj = getJSONObject(UserInfoDAO.queryNum(), pureUserList);
		return "success";
	}
    
    public String addUser() {
		UserInfo userInfo=parsePureUserInfoToUserInfo(pureUserInfo);
    	if(UserInfoDAO.insertUser(userInfo)){
    		if(pureUserInfo.getIsTeacher()==1){
				insertTeacherWithUserInfo(userInfo);
			}
    		jsonObj=success();
    		return "success";
    	}else {
    		jsonObj=fail();
    		return "fail";
    	}
    }

    public String deleteUser(){
		UserInfo userInfo=parsePureUserInfoToUserInfo(pureUserInfo);
    	if(UserInfoDAO.deleteUserByID(userInfo)){
    		Teacher teacher=new Teacher();
    		teacher.setUserid(userInfo.getId());
    		TeacherDAO.deleteByUserId(teacher);
    		jsonObj=success();
    		return "success";
		}else{
    		jsonObj=fail();
    		return "fail";
		}
	}

	public String queryById(){
		UserInfo userInfo=new UserInfo();
		userInfo.setId(pureUserInfo.getId());
		userInfo=UserInfoDAO.queryByUserId(userInfo);
		if(userInfo==null){
			jsonObj = (JSONObject)JSONObject.fromObject(new PureUserInfo());
			return "fail";
		}
		PureUserInfo pureUserInfo=parseUserInfoToPureUserInfo(userInfo);
		if(userInfo.getTeacherById()!=null){
			pureUserInfo.setIsTeacher(1);
		}else{
			pureUserInfo.setIsTeacher(0);
		}
		jsonObj = (JSONObject)JSONObject.fromObject(pureUserInfo);
		return "success";
	}

	public String updateUser(){
		UserInfo userInfo=parsePureUserInfoToUserInfo(pureUserInfo);
		UserInfo userInfoInDataBase=UserInfoDAO.queryByUserId(userInfo);
		if(userInfoInDataBase!=null){
			if(userInfo.getAvatar()==null||userInfo.getAvatar()==""){
				userInfo.setAvatar(userInfoInDataBase.getAvatar());
			}
		}
    	if(UserInfoDAO.updateUserByUserId(userInfo)){
			if(pureUserInfo.getIsTeacher()==1){
				insertTeacherWithUserInfo(userInfo);
			}else{
				Teacher teacher=new Teacher();
				teacher.setUserid(userInfo.getId());
				TeacherDAO.deleteByUserId(teacher);
			}
			jsonObj=success();
			return "success";
		}else{
			jsonObj=fail();
			return "fail";
		}
	}

	public String queryByUsername(){
		UserInfo userInfo=parsePureUserInfoToUserInfo(pureUserInfo);
		userInfo=UserInfoDAO.queryByUsername(userInfo);
		if(userInfo==null){
			jsonObj = (JSONObject)JSONObject.fromObject(new PureUserInfo());
			return "fail";
		}
		PureUserInfo pureUserInfo=parseUserInfoToPureUserInfo(userInfo);
		jsonObj = (JSONObject)JSONObject.fromObject(pureUserInfo);
		return "success";
	}

	public String queryByUsernameLikely(){
		UserInfo userInfo=parsePureUserInfoToUserInfo(pureUserInfo);
		List<UserInfo> userInfoList=UserInfoDAO.queryByUsernameLikely(userInfo);
		if(userInfoList==null){
			jsonObj = getJSONObject(0, new ArrayList<PureUserInfo>());
			return "fail";
		}
		ArrayList<PureUserInfo> pureUserInfoList=new ArrayList<PureUserInfo>();
		for(UserInfo tuserInfo:userInfoList){
			pureUserInfoList.add(parseUserInfoToPureUserInfo(tuserInfo));
		}
		jsonObj = getJSONObject(pureUserInfoList.size(), pureUserInfoList);
		return "success";
	}

	public boolean insertTeacherWithUserInfo(UserInfo userInfo){
		if(TeacherDAO.queryByUserId(userInfo)!=null){
			return false;
		}
    	Teacher teacher=new Teacher();
    	teacher.setAvatar(userInfo.getAvatar());
    	teacher.setName(userInfo.getUsername());
    	teacher.setUserid(userInfo.getId());
    	if(TeacherDAO.insertTeacher(teacher)){
    		return true;
		}else{
    		return false;
		}
	}

}
