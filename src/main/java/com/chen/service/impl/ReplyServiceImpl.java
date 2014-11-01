package com.chen.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.chen.dao.ReplyDao;
import com.chen.entity.Reply;
import com.chen.service.ReplyService;
import com.chen.util.Constant;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDao replyDao;

	public void save(Reply r) {
		// TODO Auto-generated method stub
		replyDao.save(r);
	}

	public Page<Reply> findReplies(String postid, int currentpage) {
		Page<Reply> reply = replyDao.findReplies(new PageRequest(currentpage, Constant.PAGESIZE), postid);
		return reply;
	}

	public int findRepCount(String postid) {
		
		return replyDao.findReplyCount(postid);
	}

	public Page<Reply> findReplyByUserid(int userid, int currentpage) {
		// TODO Auto-generated method stub
		return replyDao.findReplyByUserid(new PageRequest(currentpage, Constant.PAGESIZE), userid);
	}

	public void deleteReply(String replyid) {
		// TODO Auto-generated method stub
		replyDao.delete(replyid);
	}

	public void deleteRepliesByPost(String postid) {
		// TODO Auto-generated method stub
		replyDao.deleteReplies(postid);;
	}

	public List<Reply> findPostsReply(String postid) {
		// TODO Auto-generated method stub
		return replyDao.findPostsReply(postid);
	}

	
}
