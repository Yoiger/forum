package com.chen.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the T_ROLE database table.
 * 
 */
@Entity
@Table(name="T_ROLE")

public class Role implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="roleid")
	private int roleid;

	private int accessable;

	private int enabled;

	private String roleintro;

	private String rolename;
	
	public Role() {
	}

	public int getRoleid() {
		return this.roleid;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}

	public int getAccessable() {
		return accessable;
	}

	public void setAccessable(int accessable) {
		this.accessable = accessable;
	}

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getRoleintro() {
		return this.roleintro;
	}

	public void setRoleintro(String roleintro) {
		this.roleintro = roleintro;
	}

	public String getRolename() {
		return this.rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
}