package com.chen.service.impl;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.chen.dao.UserDao;
import com.chen.entity.User;
import com.chen.service.UserService;
import com.chen.util.Constant;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDao userDao;
	
	public User findUserByName(String username) {
		User u = null;
		u = userDao.findUserByName(username);
		return u;
	}

	public void save(User u) {
		// TODO Auto-generated method stub
		userDao.save(u);
	}

	public int findMaxUserId() {
		// TODO Auto-generated method stub
		return userDao.findMaxUserId();
	}

	public User findUserByID(int userid) {
		// TODO Auto-generated method stub
		return userDao.findOne(userid);
	}

	public Page<User> findUserList(int currentpage) {
		// TODO Auto-generated method stub
		return userDao.findUserList(new PageRequest(currentpage, Constant.PAGESIZE));
	}

	public void deleteUser(int userid) {
		// TODO Auto-generated method stub
		userDao.delete(userid);
	}

}
