package com.chen.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.chen.entity.UserRole;

public interface UserRoleDao extends JpaRepository<UserRole, String>{
	
	@Query("delete from UserRole where userid = ?")
	public void deleteUserRole(int userid);
	
	@Query("select ur from UserRole ur where ur.userid = ?")
	public UserRole findUserRoleByUserid(int userid);
	
	
}
