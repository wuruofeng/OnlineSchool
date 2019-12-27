package org.action;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.dao.TeacherDAO;
import org.vo.AdminInfo;
import org.vo.PureCourse;
import org.vo.PureTeacher;
import org.vo.Teacher;

public class TeacherAction extends Action {
    private PureTeacher pureTeacher;
    private JSONObject jsonObj;
    private JSONArray jsonArray;
    private int page;
    private int rows;

    public TeacherAction() {
    }

    public TeacherAction(PureTeacher pureTeacher, JSONObject jsonObj, JSONArray jsonArray, int page, int rows) {
        this.pureTeacher = pureTeacher;
        this.jsonObj = jsonObj;
        this.jsonArray = jsonArray;
        this.page = page;
        this.rows = rows;
    }

    public PureTeacher getPureTeacher() {
        return pureTeacher;
    }

    public void setPureTeacher(PureTeacher pureTeacher) {
        this.pureTeacher = pureTeacher;
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

    public PureTeacher parseTeacherToPureTeacher(Teacher teacher){
        PureTeacher pureTeacher=new PureTeacher();
        pureTeacher.setUserid(teacher.getUserid());
        pureTeacher.setAvatar(teacher.getAvatar());
        pureTeacher.setJob(teacher.getJob());
        pureTeacher.setName(teacher.getName());
        return pureTeacher;
    }

    public String queryByTeacherName(){
        Teacher teacher=new Teacher();
        teacher.setName(pureTeacher.getName());
        teacher=TeacherDAO.queryByName(teacher);
        if(teacher==null){
            jsonObj = (JSONObject)JSONObject.fromObject(new PureTeacher());
            return "fail";
        }
        jsonObj = (JSONObject)JSONObject.fromObject(parseTeacherToPureTeacher(teacher));
        return "success";
    }

}
