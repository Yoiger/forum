package com.chen.service;

import org.springframework.data.domain.Page;

import com.chen.entity.User;

public interface UserService {
	
	public User findUserByName(String username);
	
	public void save(User u);
	
	public int findMaxUserId();
	
	public User findUserByID(int userid);
	
	public Page<User> findUserList(int currentpage);
	
	public void deleteUser(int userid);
}
