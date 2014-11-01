package com.chen.service;

import org.springframework.data.domain.Page;

import com.chen.entity.Post;

public interface PostService {
	
	public Post findPostByID(String postid);
	
	public void save(Post p);
	
	public Page<Post> findPost(int currentpage);
	
	public Page<Post> findPost(int currentpage, String sectionname);
	
	public Page<Post> findPost(int currentpage, int userid);
	
	public void deletePost(String postid);
	
	public Page<Post> findPostBySearch(int currentpage, String tj);
}
