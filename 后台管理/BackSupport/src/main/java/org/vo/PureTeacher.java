package org.vo;

public class PureTeacher {
    private String avatar;
    private String name;
    private String job;
    private int userid;

    public PureTeacher() {
    }

    public PureTeacher(String avatar, String name, String job, int userid) {
        this.avatar = avatar;
        this.name = name;
        this.job = job;
        this.userid = userid;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }
}
