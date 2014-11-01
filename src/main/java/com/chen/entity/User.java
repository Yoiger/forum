package com.chen.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the T_USER database table.
 * 
 */
@Entity
@Table(name="T_USER")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="userid")
	private int userid;

	private int age;

	//private String company;

	@Temporal(TemporalType.DATE)
	private Date creationtime;

	//private String depart;

	private String email;

	private int enabled;

	private int isopened;

	private String password;

	private String realname;

	private String sex;

	//private String tel;

	private String username;

	public User() {
	}

	public int getUserid() {
		return this.userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getAge() {
		return this.age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	

	public Date getCreationtime() {
		return this.creationtime;
	}

	public void setCreationtime(Date creationtime) {
		this.creationtime = creationtime;
	}


	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public int getIsopened() {
		return isopened;
	}

	public void setIsopened(int isopened) {
		this.isopened = isopened;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	/*public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}*/

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}