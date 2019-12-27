package org.vo;

import javax.persistence.*;
import java.util.Collection;
import java.util.Set;

@Entity
public class Teacher {
    private String avatar;
    private String name;
    private String job;
    private int userid;
    private Set<Course> coursesByUserid;
    private UserInfo userInfoByUserid;

    @Basic
    @Column(name = "avatar", nullable = true, length = 255)
    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Basic
    @Column(name = "name", nullable = true, length = 255)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "job", nullable = true, length = 255)
    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    @Id
    @Column(name = "userid", nullable = false)
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Teacher teacher = (Teacher) o;

        if (userid != teacher.userid) return false;
        if (avatar != null ? !avatar.equals(teacher.avatar) : teacher.avatar != null) return false;
        if (name != null ? !name.equals(teacher.name) : teacher.name != null) return false;
        if (job != null ? !job.equals(teacher.job) : teacher.job != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = avatar != null ? avatar.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (job != null ? job.hashCode() : 0);
        result = 31 * result + userid;
        return result;
    }

    @OneToMany(mappedBy = "teacherByTeacherId")
    public Set<Course> getCoursesByUserid() {
        return coursesByUserid;
    }

    public void setCoursesByUserid(Set<Course> coursesByUserid) {
        this.coursesByUserid = coursesByUserid;
    }

    @OneToOne
    @JoinColumn(name = "userid", referencedColumnName = "id", nullable = false)
    public UserInfo getUserInfoByUserid() {
        return userInfoByUserid;
    }

    public void setUserInfoByUserid(UserInfo userInfoByUserid) {
        this.userInfoByUserid = userInfoByUserid;
    }
}
