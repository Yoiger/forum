package com.chen.entity;

import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

import java.math.BigDecimal;
import java.util.Date;


/**
 * The persistent class for the T_REPLY database table.
 * 
 */
@Entity
@Table(name="T_REPLY")
public class Reply implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="replyid")
	@GenericGenerator(name="Id", strategy="uuid.hex")
	@GeneratedValue(generator="Id")
	private String replyid;

	private String content;

	private String postid;

	@Temporal(TemporalType.DATE)
	private Date replytime;

	private int userid;

	private String username;

	public Reply() {
	}


	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public String getReplyid() {
		return replyid;
	}


	public void setReplyid(String replyid) {
		this.replyid = replyid;
	}


	public String getPostid() {
		return postid;
	}


	public void setPostid(String postid) {
		this.postid = postid;
	}


	public Date getReplytime() {
		return this.replytime;
	}

	public void setReplytime(Date replytime) {
		this.replytime = replytime;
	}

	public int getUserid() {
		return this.userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}