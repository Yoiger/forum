package com.chen.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.chen.entity.Post;


public interface PostDao extends JpaRepository<Post, String>{
	
	@Query("select p from Post p order by postid desc")
	public Page<Post> findPost(Pageable pageable );
	
	
	@Query("select p from Post p where p.sectionname = ? and p.status = 1 order by postid desc")
	public Page<Post> findPostByCondition(Pageable pageable, String sectionname);
	
	@Query("select p from Post p where p.userid = ? order by postid  desc")
	public Page<Post> findPostByUserID(Pageable pageable, int userid);
	
	@Query("delete from Post where postid = ?")
	public void deletePostByID(String postid);
	
	@Query("select p from Post p where p.title like ? order by posttime")
	public Page<Post> findPostBySearch(String tj, Pageable pageable);
	
}
