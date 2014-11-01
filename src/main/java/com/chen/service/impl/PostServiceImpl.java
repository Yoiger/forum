package com.chen.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.chen.dao.PostDao;
import com.chen.entity.Post;
import com.chen.service.PostService;
import com.chen.util.Constant;

@Service
public class PostServiceImpl implements PostService{

	@Autowired
	private PostDao postDao;
	
	public void save(Post p) {
		// TODO Auto-generated method stub
		postDao.save(p);
	}

	public Page<Post> findPost(int currentpage) {
		Page<Post> post = postDao.findPost(new PageRequest(currentpage, Constant.PAGESIZE));
		return post;
	}

	public Page<Post> findPost(int currentpage, String sectionname) {
		Page<Post> post	= null;	
		if(sectionname.equals("all")) {
			post = postDao.findPost(new PageRequest(currentpage, Constant.PAGESIZE));
		}
		else {
			post = postDao.findPostByCondition(new PageRequest(currentpage, Constant.PAGESIZE), sectionname);
		}
		return post;
	}

	public Post findPostByID(String postid) {
		return postDao.findOne(postid);
	}

	public Page<Post> findPost(int currentpage, int userid) {
		// TODO Auto-generated method stub
		return postDao.findPostByUserID(new PageRequest(currentpage, Constant.PAGESIZE), userid);
	}

	/*public Page<Post> findPosts(int currentpage, String username) {
		// TODO Auto-generated method stub
		return postDao.findPostByUsername(new PageRequest(currentpage, Constant.PAGESIZE), username);
	}
*/
	public void deletePost(String postid) {
		postDao.delete(postid);
	}

	public Page<Post> findPostBySearch(int currentpage, String tj) {
		// TODO Auto-generated method stub
		tj="%"+tj+"%";
		return postDao.findPostBySearch( tj, new PageRequest(currentpage, Constant.PAGESIZE));
	}
}
