package com.chen.service;

import com.chen.entity.UserRole;

public interface User_RoleService {
	public void save(UserRole ur);
	
	public void deleteUserRole(UserRole ur);
	
	public UserRole findURByUserid(int userid);
}
