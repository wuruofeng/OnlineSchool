package org.vo;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

public class UserCoursePK implements Serializable {
    private int userid;
    private int courseid;

    @Column(name = "userid", nullable = false)
    @Id
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Column(name = "courseid", nullable = false)
    @Id
    public int getCourseid() {
        return courseid;
    }

    public void setCourseid(int courseid) {
        this.courseid = courseid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserCoursePK that = (UserCoursePK) o;

        if (userid != that.userid) return false;
        if (courseid != that.courseid) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userid;
        result = 31 * result + courseid;
        return result;
    }
}
