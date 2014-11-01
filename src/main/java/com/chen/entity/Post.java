package com.chen.entity;

import java.util.Date;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="T_POST")
public class Post {
	@Id
	@GenericGenerator(name="ID", strategy="uuid.hex")
	@GeneratedValue(generator="ID")
	@Column(name = "postid")
	private String postid;
	
	private int userid;
	
	private String sectionname;
	
	private String username;
	
	private String topic;
	
	private String title;
	
	private String content;
	
	@Temporal(TemporalType.DATE)
	private Date posttime;
	
	private int replytimes;

	public int getReplytimes() {
		return replytimes;
	}

	public void setReplytimes(int replytimes) {
		this.replytimes = replytimes;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}


	public String getPostid() {
		return postid;
	}

	public void setPostid(String postid) {
		this.postid = postid;
	}

	

	public String getSectionname() {
		return sectionname;
	}

	public void setSectionname(String sectionname) {
		this.sectionname = sectionname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	

	public Date getPosttime() {
		return posttime;
	}

	public void setPosttime(Date posttime) {
		this.posttime = posttime;
	}

	public int getViewcount() {
		return viewcount;
	}

	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getAuditor() {
		return auditor;
	}

	public void setAuditor(String auditor) {
		this.auditor = auditor;
	}

	public String getAuditoropinion() {
		return auditoropinion;
	}

	public void setAuditoropinion(String auditoropinion) {
		this.auditoropinion = auditoropinion;
	}

	public Date getLastreplydate() {
		return lastreplydate;
	}

	public void setLastreplydate(Date lastreplydate) {
		this.lastreplydate = lastreplydate;
	}

	private int viewcount;
	
	private int status;
	
	private String auditor;
	
	private String auditoropinion;
	
	@Temporal(TemporalType.DATE)
	private Date lastreplydate;
}
