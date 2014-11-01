package com.chen.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.chen.entity.Reply;

public interface ReplyDao extends JpaRepository<Reply, String>{
	@Query("select a from Reply a where a.postid = ? order by replyid")
	public Page<Reply> findReplies(Pageable pageable, String postid);
	
	@Query("select count(*) as totalcount from Reply where postid = ?")
	public int findReplyCount(String postid);
	
	@Query("select a from Reply a where a.userid = ? order by replyid desc")
	public Page<Reply> findReplyByUserid(Pageable pageable, int userid);
	
	
	@Query("delete from Reply r where r.postid=?")
	@Modifying
	public void deleteReplies(String postid);
	
	@Query("select r from Reply r where r.postid=?")
	public List<Reply> findPostsReply(String postid);
}
