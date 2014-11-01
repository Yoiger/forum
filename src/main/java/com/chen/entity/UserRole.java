package com.chen.entity;

import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;


/**
 * The persistent class for the T_USER_ROLE database table.
 * 
 */
@Entity
@Table(name="T_USER_ROLE")

public class UserRole implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GenericGenerator(name="id", strategy="uuid.hex")
	@GeneratedValue(generator="id")
	@Column(name="id")
	private String id;

	private int userid;
	
	private int roleid;

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getRoleid() {
		return roleid;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

}