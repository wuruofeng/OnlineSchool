package org.vo;

public class PureUserInfo {
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
    private int isTeacher;

    public Integer getIsTeacher() {
        return isTeacher;
    }

    public void setIsTeacher(Integer isTeacher) {
        this.isTeacher = isTeacher;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Integer getTotallyWatchingNum() {
        return totallyWatchingNum;
    }

    public void setTotallyWatchingNum(Integer totallyWatchingNum) {
        this.totallyWatchingNum = totallyWatchingNum;
    }

    public Integer getTotallyWatchingTimes() {
        return totallyWatchingTimes;
    }

    public void setTotallyWatchingTimes(Integer totallyWatchingTimes) {
        this.totallyWatchingTimes = totallyWatchingTimes;
    }

    public Integer getExp() {
        return exp;
    }

    public void setExp(Integer exp) {
        this.exp = exp;
    }

    public Integer getIsVip() {
        return isVip;
    }

    public void setIsVip(Integer isVip) {
        this.isVip = isVip;
    }
}
