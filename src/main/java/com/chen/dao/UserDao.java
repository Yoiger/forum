package com.chen.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.chen.entity.User;

public interface UserDao extends JpaRepository<User, Integer>{
	
	@Query("select u from User u where username=?")
	public User findUserByName(String username);
	
	@Query("select max(userid) from User")
	public int findMaxUserId();
	
	@Query("select u from User u order by creationtime")
	public Page<User> findUserList(Pageable pageable);
}
