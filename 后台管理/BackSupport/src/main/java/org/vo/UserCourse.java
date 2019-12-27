package org.vo;

import javax.persistence.*;

@Entity
@Table(name = "user_course", schema = "onlineschool_v4", catalog = "")
@IdClass(UserCoursePK.class)
public class UserCourse {
    private int userid;
    private int courseid;
    private Integer lastPercent;
    private Integer lastChapterId;
    private Integer rate;
    private UserInfo userInfoByUserid;
    private Course courseByCourseid;

    @Id
    @Column(name = "userid", nullable = false)
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Id
    @Column(name = "courseid", nullable = false)
    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

    @Basic
    @Column(name = "last_percent", nullable = true)
    public Integer getLastPercent() {
        return lastPercent;
    }

    public void setLastPercent(Integer lastPercent) {
        this.lastPercent = lastPercent;
    }

    @Basic
    @Column(name = "last_chapter_id", nullable = true)
    public Integer getLastChapterId() {
        return lastChapterId;
    }

    public void setLastChapterId(Integer lastChapterId) {
        this.lastChapterId = lastChapterId;
    }

    @Basic
    @Column(name = "rate", nullable = true)
    public Integer getRate() {
        return rate;
    }

    public void setRate(Integer rate) {
        this.rate = rate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserCourse that = (UserCourse) o;

        if (userid != that.userid) return false;
        if (courseid != that.courseid) return false;
        if (lastPercent != null ? !lastPercent.equals(that.lastPercent) : that.lastPercent != null) return false;
        if (lastChapterId != null ? !lastChapterId.equals(that.lastChapterId) : that.lastChapterId != null)
            return false;
        if (rate != null ? !rate.equals(that.rate) : that.rate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userid;
        result = 31 * result + courseid;
        result = 31 * result + (lastPercent != null ? lastPercent.hashCode() : 0);
        result = 31 * result + (lastChapterId != null ? lastChapterId.hashCode() : 0);
        result = 31 * result + (rate != null ? rate.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "userid", referencedColumnName = "id", nullable = false)
    public UserInfo getUserInfoByUserid() {
        return userInfoByUserid;
    }

    public void setUserInfoByUserid(UserInfo userInfoByUserid) {
        this.userInfoByUserid = userInfoByUserid;
    }

    @ManyToOne
    @JoinColumn(name = "courseid", referencedColumnName = "course_id", nullable = false)
    public Course getCourseByCourseid() {
        return courseByCourseid;
    }

    public void setCourseByCourseid(Course courseByCourseid) {
        this.courseByCourseid = courseByCourseid;
    }
}
