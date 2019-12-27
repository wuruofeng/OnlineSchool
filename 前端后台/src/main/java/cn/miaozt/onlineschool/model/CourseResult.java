package cn.miaozt.onlineschool.model;

import cn.miaozt.onlineschool.enums.UserIsLearning;
import cn.miaozt.onlineschool.enums.UserIsNull;

import java.io.Serializable;
import java.util.List;

public class CourseResult implements Serializable {
    private CourseInfo courseInfo;
    private UserCourseRelationship userCourseRelationship;
    private UserIsNull userIsNull;
    private UserIsLearning userIsLearning;

    public CourseInfo getCourseInfo() {
        return courseInfo;
    }

    public void setCourseInfo(CourseInfo courseInfo) {
        this.courseInfo = courseInfo;
    }

    public UserCourseRelationship getUserCourseRelationship() {
        return userCourseRelationship;
    }

    public void setUserCourseRelationship(UserCourseRelationship userCourseRelationship) {
        this.userCourseRelationship = userCourseRelationship;
    }

    public UserIsNull getUserIsNull() {
        return userIsNull;
    }

    public void setUserIsNull(UserIsNull userIsNull) {
        this.userIsNull = userIsNull;
    }

    public UserIsLearning getUserIsLearning() {
        return userIsLearning;
    }

    public void setUserIsLearning(UserIsLearning userIsLearning) {
        this.userIsLearning = userIsLearning;
    }

    public CourseResult(CourseInfo courseInfo, UserCourseRelationship userCourseRelationship, UserIsNull userIsNull, UserIsLearning userIsLearning) {
        super();
        this.courseInfo = courseInfo;
        this.userCourseRelationship = userCourseRelationship;
        this.userIsNull = userIsNull;
        this.userIsLearning = userIsLearning;
    }

    public CourseResult() {
        super();
    }
}
