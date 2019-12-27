package org.vo;

import javax.persistence.*;

@Entity
public class Tokeninfo {
    private int id;
    private String token;
    private Integer buildtime;
    private UserInfo userInfoByUserId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "token", nullable = true, length = 255)
    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Basic
    @Column(name = "buildtime", nullable = true)
    public Integer getBuildtime() {
        return buildtime;
    }

    public void setBuildtime(Integer buildtime) {
        this.buildtime = buildtime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Tokeninfo tokeninfo = (Tokeninfo) o;

        if (id != tokeninfo.id) return false;
        if (token != null ? !token.equals(tokeninfo.token) : tokeninfo.token != null) return false;
        if (buildtime != null ? !buildtime.equals(tokeninfo.buildtime) : tokeninfo.buildtime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (token != null ? token.hashCode() : 0);
        result = 31 * result + (buildtime != null ? buildtime.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    public UserInfo getUserInfoByUserId() {
        return userInfoByUserId;
    }

    public void setUserInfoByUserId(UserInfo userInfoByUserId) {
        this.userInfoByUserId = userInfoByUserId;
    }
}
