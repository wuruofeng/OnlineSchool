package cn.miaozt.onlineschool.model;


import cn.miaozt.onlineschool.enums.CourseIsOver;
import cn.miaozt.onlineschool.enums.CourseIsPay;

public class UserCourseRelationship {

  private long id;
  private long userId;
  private long courseId;
  private java.sql.Timestamp startTime;
  private java.sql.Timestamp lastTime;
  private String learningIndex;
  private String exp;
  private CourseIsPay isPay;
  private CourseIsOver isOver;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public long getCourseId() {
    return courseId;
  }

  public void setCourseId(long courseId) {
    this.courseId = courseId;
  }


  public java.sql.Timestamp getStartTime() {
    return startTime;
  }

  public void setStartTime(java.sql.Timestamp startTime) {
    this.startTime = startTime;
  }


  public java.sql.Timestamp getLastTime() {
    return lastTime;
  }

  public void setLastTime(java.sql.Timestamp lastTime) {
    this.lastTime = lastTime;
  }


  public String getLearningIndex() {
    return learningIndex;
  }

  public void setLearningIndex(String learningIndex) {
    this.learningIndex = learningIndex;
  }


  public String getExp() {
    return exp;
  }

  public void setExp(String exp) {
    this.exp = exp;
  }


  public CourseIsPay getIsPay() {
    return isPay;
  }

  public void setIsPay(CourseIsPay isPay) {
    this.isPay = isPay;
  }


  public CourseIsOver getIsOver() {
    return isOver;
  }

  public void setIsOver(CourseIsOver isOver) {
    this.isOver = isOver;
  }

}
