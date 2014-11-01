package com.chen.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chen.dao.UserRoleDao;
import com.chen.entity.UserRole;
import com.chen.service.User_RoleService;

@Service
public class User_RoleServiceImpl implements User_RoleService {
	
	@Autowired
	private UserRoleDao uR_Dao;
	
	public void save(UserRole ur) {
		if(ur != null)
			uR_Dao.save(ur);
	}

	public void deleteUserRole(UserRole ur) {
		// TODO Auto-generated method stub
		uR_Dao.delete(ur);
	}

	public UserRole findURByUserid(int userid) {
		// TODO Auto-generated method stub
		return uR_Dao.findUserRoleByUserid(userid);
	}
}
