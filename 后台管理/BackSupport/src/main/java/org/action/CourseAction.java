package org.action;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.dao.CourseDAO;
import org.dao.TeacherDAO;
import org.dao.UserInfoDAO;
import org.vo.*;

import javax.swing.*;
import java.util.ArrayList;
import java.util.List;

public class CourseAction extends Action {
    private PureCourse pureCourse;
    private JSONObject jsonObj;
    private JSONArray jsonArray;
    private int page;
    private int rows;

    public CourseAction() {
    }

    public CourseAction(PureCourse pureCourse, JSONObject jsonObj, JSONArray jsonArray, int page, int rows) {
        this.pureCourse = pureCourse;
        this.jsonObj = jsonObj;
        this.jsonArray = jsonArray;
        this.page = page;
        this.rows = rows;
    }

    public PureCourse getPureCourse() {
        return pureCourse;
    }

    public void setPureCourse(PureCourse pureCourse) {
        this.pureCourse = pureCourse;
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

    public PureCourse parseCourseToPureCourse(Course course){
        PureCourse pureCourse=new PureCourse();
        pureCourse.setCourseId(course.getCourseId());
        pureCourse.setTitle(course.getTitle());
        pureCourse.setImg(course.getImg());
        pureCourse.setPraise(course.getPraise());
        pureCourse.setIsLike(course.getIsLike());
        pureCourse.setRank(course.getRank());
        pureCourse.setNumber(course.getNumber());
        pureCourse.setCourseDesc(course.getCourseDesc());
        pureCourse.setIsComplete(course.getIsComplete());
        pureCourse.setPraise(course.getPraise());
        pureCourse.setShortTitle(course.getShortTitle());
        pureCourse.setTeacherName(course.getTeacherByTeacherId().getName());
        return pureCourse;
    }

    public Course parsePureCourseToCourse(PureCourse pureCourse){
        Course course=new Course();
        course.setCourseId(pureCourse.getCourseId());
        course.setTitle(pureCourse.getTitle());
        course.setImg(pureCourse.getImg());
        course.setPraise(pureCourse.getPraise());
        course.setIsLike(pureCourse.getIsLike());
        course.setRank(pureCourse.getRank());
        course.setNumber(pureCourse.getNumber());
        course.setCourseDesc(pureCourse.getCourseDesc());
        course.setIsComplete(pureCourse.getIsComplete());
        course.setPraise(pureCourse.getPraise());
        course.setShortTitle(pureCourse.getShortTitle());
        return course;
    }

    public String queryByPage() {
        List<Course> courseList = CourseDAO.queryByPage(getMap(page,rows));
        ArrayList<PureCourse> pureCourseList=new ArrayList<PureCourse>();
        for(Course course:courseList){
            pureCourseList.add(parseCourseToPureCourse(course));
        }
        jsonObj = getJSONObject(CourseDAO.queryNum(), pureCourseList);
        return "success";
    }

    public String queryCourseByCourseId(){
        Course course=new Course();
        course.setCourseId(pureCourse.getCourseId());
        course=CourseDAO.queryByCourseId(course);
        if(course==null){
            jsonObj = (JSONObject)JSONObject.fromObject(new PureCourse());
            return "fail";
        }
        jsonObj = (JSONObject)JSONObject.fromObject(parseCourseToPureCourse(course));
        return "success";
    }

    public Course getFullCourse(){
        Teacher teacher=new Teacher();
        teacher.setName(pureCourse.getTeacherName());
        teacher=TeacherDAO.queryByName(teacher);
        UserInfo userInfo=new UserInfo();
        userInfo.setId(teacher.getUserid());
        userInfo= UserInfoDAO.queryByUserId(userInfo);
        teacher.setUserInfoByUserid(userInfo);
        Course course=parsePureCourseToCourse(pureCourse);
        course.setTeacherByTeacherId(teacher);
        return course;
    }

    public String insertCourse(){
        Course course=getFullCourse();
        if(CourseDAO.insertCourse(course)){
            jsonObj=success();
            return "success";
        }
        jsonObj=fail();
        return "fail";
    }

    public String updateCourse(){
        Course course=getFullCourse();
        Course courseInDataBase=new Course();
        courseInDataBase.setCourseId(course.getCourseId());
        courseInDataBase=CourseDAO.queryByCourseId(courseInDataBase);
        if(courseInDataBase!=null){
            if(course.getImg()==null||course.getImg()==""){
                course.setImg(courseInDataBase.getImg());
            }
        }
        if(CourseDAO.updateCourseByCourseId(course)) {
            jsonObj = success();
            return "success";
        }
        jsonObj=fail();
        return "fail";
    }


    public String deleteCourse(){
        Course course=new Course();
        course.setCourseId(pureCourse.getCourseId());
        if(CourseDAO.deleteByCourseId(course)){
            jsonObj = success();
            return "success";
        }
        jsonObj=fail();
        return "fail";
    }

    public String queryByCourseTitle(){
        Course course=parsePureCourseToCourse(pureCourse);
        List<Course> courseList=CourseDAO.queryByCourseTitle(course);
        ArrayList<PureCourse> pureCourseList=new ArrayList<PureCourse>();
        if(courseList==null){
            jsonObj = getJSONObject(0, pureCourseList);
            return "success";
        }
        for(Course tCourse:courseList){
            pureCourseList.add(parseCourseToPureCourse(tCourse));
        }
        jsonObj = getJSONObject(courseList.size(), pureCourseList);
        return "success";
    }

    public String queryByCourseTitleLikely(){
        Course course=parsePureCourseToCourse(pureCourse);
        List<Course> courseList=CourseDAO.queryByCourseTitleLikely(course);
        ArrayList<PureCourse> pureCourseList=new ArrayList<PureCourse>();
        if(courseList==null){
            jsonObj = getJSONObject(0, pureCourseList);
            return "success";
        }
        for(Course tCourse:courseList){
            pureCourseList.add(parseCourseToPureCourse(tCourse));
        }
        jsonObj = getJSONObject(courseList.size(), pureCourseList);
        return "success";
    }

}
