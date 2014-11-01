package com.chen.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.chen.entity.Reply;

public interface ReplyService {
	public void save(Reply r);

	public Page<Reply> findReplies(String postid, int currentpage);
	
	public int findRepCount(String postid);
	
	public Page<Reply> findReplyByUserid(int userid, int currentpage);
	
	public void deleteReply(String replyid);
	
	public void deleteRepliesByPost(String postid);
	
	public List<Reply> findPostsReply(String postid);
	
	//public void deletePostsReply();
}
