package cn.miaozt.onlineschool.model;

import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import java.io.Serializable;
import java.util.Date;

public class Token implements Serializable {
    private int tokenid,userid;
    private String token;
    private int buildtime;
    public int getTokenid() {
        return tokenid;
    }
    public void setTokenid(int tokenid) {
        this.tokenid = tokenid;
    }
    public int getUserid() {
        return userid;
    }
    public void setUserid(int userid) {
        this.userid = userid;
    }
    public int getBuildtime() {
        return buildtime;
    }
    public void setBuildtime(int buildtime) {
        this.buildtime = buildtime;
    }
    public String getToken() {
        return token;
    }
    public void setToken(String token) {
        this.token = token;
    }

    public Token(User user) {
        super();
        Date date=new Date();
        this.tokenid = tokenid;
        int nowtime = (int) (date.getTime() / 1000);
        this.token=creatToken(user,new Date());
        this.userid = userid;
        this.buildtime=(int) (date.getTime() / 1000);
    }
    private String creatToken(User user, Date date) {
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
        JwtBuilder builder = Jwts.builder().setHeaderParam("typ", "JWT") // 设置header
                .setHeaderParam("alg", "HS256").setIssuedAt(date) // 设置签发时间
                .setExpiration(new Date(date.getTime() + 1000 * 60 * 60 * 24 * 3))
                .claim("userid",String.valueOf(user.getId()) ) // 设置内容
                .setIssuer("lws")// 设置签发人
                .signWith(signatureAlgorithm, "dahao"); // 签名，需要算法和key
        String jwt = builder.compact();
        return jwt;
    }

    @Override
    public String toString() {
        return "Token [tokenid=" + tokenid + ", userid=" + userid + ", buildtime=" + buildtime + ", token=" + token + "]";
    }
}
