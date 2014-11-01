package com.chen.entity;

import java.io.Serializable;

import javax.persistence.*;

import org.hibernate.annotations.GenericGenerator;


/**
 * The persistent class for the T_SECTION database table.
 * 
 */
@Entity
@Table(name="T_SECTION")
public class Section implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="sectionid")
	private int sectionid;

	private String sectionhost;

	private String sectionintro;

	private String sectionname;

	public Section() {
	}


	public int getSectionid() {
		return sectionid;
	}


	public void setSectionid(int sectionid) {
		this.sectionid = sectionid;
	}


	public String getSectionhost() {
		return this.sectionhost;
	}

	public void setSectionhost(String sectionhost) {
		this.sectionhost = sectionhost;
	}

	public String getSectionintro() {
		return this.sectionintro;
	}

	public void setSectionintro(String sectionintro) {
		this.sectionintro = sectionintro;
	}

	public String getSectionname() {
		return this.sectionname;
	}

	public void setSectionname(String sectionname) {
		this.sectionname = sectionname;
	}

}