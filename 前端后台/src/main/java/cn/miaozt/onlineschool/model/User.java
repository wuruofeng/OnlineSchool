package cn.miaozt.onlineschool.model;

import java.io.Serializable;

import cn.miaozt.onlineschool.enums.UserSexEnum;
import com.fasterxml.jackson.annotation.JsonProperty;

public class User implements Serializable {

	//private static final long serialVersionUID = 1L;
	private Long id;
	@JsonProperty("username")
	private String username;
	@JsonProperty("password")
	private String password;
	private UserSexEnum sex;
	private String email;
	private String tel;

	public User() {
		super();
	}
	public User(String username, String password, String email,UserSexEnum sex,String tel) {
		super();
		this.password = password;
		this.username = username;
		this.sex = sex;
		this.email=email;
		this.tel=tel;
	}

	public  User(String username, String password){
		super();
		this.username=username;
		this.password=password;
	}

	public User(Long id, String username, String password, String email, UserSexEnum sex) {
		super();
		this.id=id;
		this.password = password;
		this.username = username;
		this.sex = sex;
		this.email=email;
		this.tel=tel;
	}
	public Long getId() {
		return id;
	}

	public String getUserName() {
		return username;
	}

	public String getPassWord() {
		return password;
	}

	public void setPassWord(String password) {
		this.password = password;
	}

	public UserSexEnum getSex() {
		return sex;
	}

	public void setSex(UserSexEnum sex) {
		this.sex = sex;
	}

	public void setUserName(String username) {
		this.username = username;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() { return tel; }

	public void setTel(String tel) { this.tel = tel; }

	@Override
	public String toString() {
		return "User{" +
				"id=" + id +
				", username='" + username + '\'' +
				", password='" + password + '\'' +
				", sex=" + sex +
				", email='" + email + '\'' +
				", tel='" + tel + '\'' +
				'}';
	}
}