package com.chen.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.chen.entity.Post;
import com.chen.entity.Reply;
import com.chen.service.PostService;
import com.chen.service.ReplyService;

@Controller
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private PostService postService;
	
	/**
	 * 发表回复
	 * @param map
	 * @param request
	 * @param postid
	 * @param username
	 * @param userid
	 * @param content
	 * @return
	 */
	@RequestMapping(value="deliverReply", method=RequestMethod.POST)
	public String replyPost(ModelMap map, HttpServletRequest request, String postid, String username, 
			int userid, @RequestParam("content")String content) {
		
		Reply rep = new Reply();
		
		Date date = new Date();
		
		rep.setContent(content);
		rep.setPostid(postid);
		rep.setUserid(userid);
		rep.setReplytime(date);
		rep.setUsername(username);
		replyService.save(rep);
		
		Post p = postService.findPostByID(postid);
		p.setLastreplydate(date);
		p.setReplytimes(p.getReplytimes() +1);
		postService.save(p);
		
		return "redirect:toViewPost?postid="+postid;
	}
	
	/**
	 * 浏览帖子时回复的翻页
	 * @param currentpage
	 * @param map
	 * @param postid
	 * @return
	 */
	 @RequestMapping(value="/toReplyNewPage") 
	 public String toReplyNewPage(int currentpage, ModelMap map, String postid) {
		 
		 Page<Reply> replyList = replyService.findReplies(postid, currentpage-1);
		 
		 Post post = postService.findPostByID(postid);
		 map.put("SinglePost", post);
		 map.put("currentPage", currentpage);
		 map.put("ReplyList", replyList.getContent());
		 map.put("ReplyPages", replyList.getTotalPages());
		 return "view_post";
	 }
	 
	 /**
	  * 跳转到我的回复页面
	  * @param userid
	  * @param map
	  * @return
	  */
	 @RequestMapping(value="/myreply")
	 public String toMyReply(int userid, ModelMap map) {
		 Page<Reply> rl = replyService.findReplyByUserid(userid, 0);
		 map.put("currentPage", 1);
		 map.put("ReplyList", rl.getContent());
		 map.put("ReplyPages", rl.getTotalPages());
		 return "myreply";
	 }
	 
	 /**
	  * 在我的回复页面回复翻页
	  * @param currentpage
	  * @param condition
	  * @param map
	  * @return
	  */
	 @RequestMapping(value="/toMyReplyNewPage")
	 public String toMyReplyNewPage(int currentpage, int condition, ModelMap map) {
		 Page<Reply> rl = replyService.findReplyByUserid(condition, currentpage-1);
		 map.put("currentPage", currentpage);
		 map.put("ReplyList", rl.getContent());
		 map.put("ReplyPages", rl.getTotalPages());
		 return "myreply";
	 }
	 
	 /**
	  * 删除一条回复
	  * @param replyid
	  * @param map
	  * @param currentpage
	  * @param userid
	  * @return
	  */
	 @RequestMapping(value="/deleteReply")
	 public String doDeleteReply(String replyid, ModelMap map, int currentpage, int userid) {
		 replyService.deleteReply(replyid);
		 Page<Reply> rl = replyService.findReplyByUserid(userid, currentpage-1);
		 map.put("currentPage", currentpage);
		 map.put("ReplyList", rl.getContent());
		 map.put("ReplyPages", rl.getTotalPages());
		 return "myreply";
	 }
}
