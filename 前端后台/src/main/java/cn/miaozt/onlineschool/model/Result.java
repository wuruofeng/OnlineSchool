package cn.miaozt.onlineschool.model;

import java.io.Serializable;

public class Result implements Serializable {
    private boolean flag=false;
    private String msg="";
    private String token="";
    public boolean isFlag() {
        return flag;
    }
    public void setFlag(boolean flag) {
        this.flag = flag;
    }
    public String getMsg() {
        return msg;
    }
    public void setMsg(String msg) {
        this.msg = msg;
    }
    public String getToken() {
        return token;
    }
    public void setToken(String token) {
        this.token = token;
    }
    @Override
    public String toString() {
        return "TokenResult [flag=" + flag + ", msg=" + msg + ", token=" + token + "]";
    }

}
