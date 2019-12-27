package org.vo;

import javax.persistence.*;
import java.util.Collection;
import java.util.Set;

@Entity
@Table(name = "user_info", schema = "onlineschool_v4", catalog = "")
public class UserInfo {
    private int id;
    private String username;
    private String password;
    private String email;
    private String tel;
    private String sex;
    private String avatar;
    private Integer totallyWatchingNum;
    private Integer totallyWatchingTimes;
    private Integer exp;
    private Integer isVip;
    private Teacher teacherById;
    private Set<Tokeninfo> tokeninfosById;
    private Set<UserCourse> userCoursesById;
    private Set<UserTerm> userTermsById;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "username", nullable = false, length = 255)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "password", nullable = true, length = 255)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "email", nullable = true, length = 255)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "tel", nullable = true, length = 255)
    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    @Basic
    @Column(name = "sex", nullable = true, length = 255)
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Basic
    @Column(name = "avatar", nullable = true, length = 255)
    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Basic
    @Column(name = "totally_watching_num", nullable = true)
    public Integer getTotallyWatchingNum() {
        return totallyWatchingNum;
    }

    public void setTotallyWatchingNum(Integer totallyWatchingNum) {
        this.totallyWatchingNum = totallyWatchingNum;
    }

    @Basic
    @Column(name = "totally_watching_times", nullable = true)
    public Integer getTotallyWatchingTimes() {
        return totallyWatchingTimes;
    }

    public void setTotallyWatchingTimes(Integer totallyWatchingTimes) {
        this.totallyWatchingTimes = totallyWatchingTimes;
    }

    @Basic
    @Column(name = "exp", nullable = true)
    public Integer getExp() {
        return exp;
    }

    public void setExp(Integer exp) {
        this.exp = exp;
    }

    @Basic
    @Column(name = "isVIP", nullable = true)
    public Integer getIsVip() {
        return isVip;
    }

    public void setIsVip(Integer isVip) {
        this.isVip = isVip;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserInfo userInfo = (UserInfo) o;

        if (id != userInfo.id) return false;
        if (username != null ? !username.equals(userInfo.username) : userInfo.username != null) return false;
        if (password != null ? !password.equals(userInfo.password) : userInfo.password != null) return false;
        if (email != null ? !email.equals(userInfo.email) : userInfo.email != null) return false;
        if (tel != null ? !tel.equals(userInfo.tel) : userInfo.tel != null) return false;
        if (sex != null ? !sex.equals(userInfo.sex) : userInfo.sex != null) return false;
        if (avatar != null ? !avatar.equals(userInfo.avatar) : userInfo.avatar != null) return false;
        if (totallyWatchingNum != null ? !totallyWatchingNum.equals(userInfo.totallyWatchingNum) : userInfo.totallyWatchingNum != null)
            return false;
        if (totallyWatchingTimes != null ? !totallyWatchingTimes.equals(userInfo.totallyWatchingTimes) : userInfo.totallyWatchingTimes != null)
            return false;
        if (exp != null ? !exp.equals(userInfo.exp) : userInfo.exp != null) return false;
        if (isVip != null ? !isVip.equals(userInfo.isVip) : userInfo.isVip != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (tel != null ? tel.hashCode() : 0);
        result = 31 * result + (sex != null ? sex.hashCode() : 0);
        result = 31 * result + (avatar != null ? avatar.hashCode() : 0);
        result = 31 * result + (totallyWatchingNum != null ? totallyWatchingNum.hashCode() : 0);
        result = 31 * result + (totallyWatchingTimes != null ? totallyWatchingTimes.hashCode() : 0);
        result = 31 * result + (exp != null ? exp.hashCode() : 0);
        result = 31 * result + (isVip != null ? isVip.hashCode() : 0);
        return result;
    }

    @OneToOne(mappedBy = "userInfoByUserid")
    public Teacher getTeacherById() {
        return teacherById;
    }

    public void setTeacherById(Teacher teacherById) {
        this.teacherById = teacherById;
    }

    @OneToMany(mappedBy = "userInfoByUserId")
    public Set<Tokeninfo> getTokeninfosById() {
        return tokeninfosById;
    }

    public void setTokeninfosById(Set<Tokeninfo> tokeninfosById) {
        this.tokeninfosById = tokeninfosById;
    }

    @OneToMany(mappedBy = "userInfoByUserid")
    public Set<UserCourse> getUserCoursesById() {
        return userCoursesById;
    }

    public void setUserCoursesById(Set<UserCourse> userCoursesById) {
        this.userCoursesById = userCoursesById;
    }

    @OneToMany(mappedBy = "userInfoByUserId")
    public Set<UserTerm> getUserTermsById() {
        return userTermsById;
    }

    public void setUserTermsById(Set<UserTerm> userTermsById) {
        this.userTermsById = userTermsById;
    }
}
