package com.chen.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.WebUtils;

import com.chen.entity.Post;
import com.chen.entity.Reply;
import com.chen.entity.User;
import com.chen.service.PostService;
import com.chen.service.ReplyService;
import com.chen.util.Constant;

@Controller
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private ReplyService replyService;
	
	
	/**
	 * 显示所有帖子或是各版块的帖子
	 * @param request
	 * @param map
	 * @param target
	 * @return
	 */
	 @RequestMapping(value="/showPostList") 
	 public String showPostList(ModelMap map, String target) {
		 Page<Post> pl = postService.findPost(0, target);
		 NewPage(1, map, pl);
		 map.put("Section", target);
		 return "show_post";
	 }
	 
	 /**
	  * 在帖子首页的上下页跳转
	  * @param currentpage
	  * @param section
	  * @param map
	  * @return
	  */
	 @RequestMapping(value="/toNewPage") 
	 public String toNewPage(int currentpage, String condition,ModelMap map) {
		 map.put("Section", condition);
		 Page<Post> postList = postService.findPost(currentpage-1, condition);
 		 NewPage(currentpage,  map, postList);
		 return "show_post";
	 }
	 
	 /**
	  * 帖子管理页面的翻页，和上面只是返回页面不同
	  * @param currentpage
	  * @param condition
	  * @param map
	  * @return
	  */
	 @RequestMapping(value="/toNewPage2")
	 public String toNewPage2(int currentpage, String condition,ModelMap map) {	
		 Page<Post> postList = postService.findPost(currentpage-1, condition);
 		 NewPage(currentpage, map, postList);
		 return "post_manage";
	 }
	 
	 /**
	  * 查看一篇帖子，viewcount+1
	  * @param request
	  * @param map
	  * @param postid
	  * @return
	  */
	 @RequestMapping(value="/toViewPost")
	 public String toViewPost(HttpServletRequest request, ModelMap map, String postid) {
		 Post post = postService.findPostByID(postid);
		 int count = post.getViewcount()+1;
		 post.setViewcount(count);
		 postService.save(post);
		 Page<Reply> reply =  replyService.findReplies(postid, 0);
		 map.put("SinglePost", post);
		 map.put("currentPage", 1);
		 map.put("ReplyList", reply.getContent());
		 map.put("ReplyPages", reply.getTotalPages());
		 return "view_post";
		}
	 
	 /**
	  * 用户获取自己发表的帖子
	  * @param userid
	  * @param map
	  * @return
	  */
	 @RequestMapping(value="/mypost")
	 public String toMyPost(int userid, ModelMap map) {
		 Page<Post> pl = postService.findPost(0, userid);
		 NewPage(1, map, pl);

		 return "mypost";
	 }
	 
	 
	 /**
	  * 我的帖子页面的翻页
	  * @param condition
	  * @param currentpage
	  * @param map
	  * @return
	  */
	 @RequestMapping(value="/toMyPostNewPage")
	 public String toMyPostNewPage(int userid, int currentpage, ModelMap map) {
		 Page<Post> pl = postService.findPost(currentpage-1, userid);		 
		 NewPage(currentpage, map, pl);
		 return "mypost";
	 }
	 
	 /**
	  * 用户删除自己的帖子，先删除帖子下的回复
	  * @param postid
	  * @param map
	  * @param currentpage
	  * @param userid
	  * @return
	  */
	 @RequestMapping(value="/deleteMyPost")
	 public String doDeleteMyPost(String postid, ModelMap map, int currentpage, int userid) {
		 //replyService.deleteRepliesByPost(postid);
		 postService.deletePost(postid); 
		 Page<Post> pl = postService.findPost(currentpage-1, userid);
		 NewPage(currentpage, map, pl);
		 return "mypost";
	 }
	 
	 /**
	  * 管理员删除帖子
	  * @param postid
	  * @return
	  */
	 @RequestMapping(value="deletePost")
	 public String doDeletePost(String postid) {
		 //replyService.deleteRepliesByPost(postid);
		 postService.deletePost(postid);
		 return "redirect:postManage";
	 }
	 
	 /**
	  * 根据条件查找帖子，这里是根据标题的模糊查询
	  * @param map
	  * @param tj
	  * @return
	  */
	 @RequestMapping(value="/searchPost")
	 public String searchPost(ModelMap map, String tj) {
		 Page<Post> pl = postService.findPostBySearch(0, tj);
		 map.put("Search", tj);
		 NewPage(1, map, pl);
		 return "search_result";
	 }
	 
	 @RequestMapping(value="/toSearchNewPage")
	 public String toSearchNewPage(int currentpage, String condition, ModelMap map) {
		 Page<Post> pl = postService.findPostBySearch(currentpage-1, condition);
		 map.put("Search", condition);
		 NewPage(currentpage, map, pl);
		 return "search_result";
	 }
	 
	 /**
	  * 进入帖子管理页面
	  * @param map
	  * @return
	  */
	 @RequestMapping(value="/postManage")
	 public String toPostManage(ModelMap map) {
		 Page<Post> pl = postService.findPost(0);
		 NewPage(1, map, pl);
		 return "post_manage";
	 }
	 
	 /**
	  * 设置帖子状态，是否可查看
	  * @param postid
	  * @param status
	  * @return
	  */
	 @RequestMapping(value="/setPostStatus")
	 public String setPostStatus(String postid, int status) {
		 Post p = postService.findPostByID(postid);
		 if(status == Constant.VERIFIED) {
			p.setStatus(Constant.UN_VERIFIED);
		 }
		 else {
			 p.setStatus(Constant.VERIFIED);
		 }
		 postService.save(p);
		 return "redirect:postManage";
	 }
	 
	 /**
	  * 翻页时公用代码
	  * @param currentpage 当前页面
	  * @param map
	  * @param postList
	  */
	 public void NewPage(int currentpage, ModelMap map, Page<Post> postList) { 
		 map.put("currentPage", currentpage);
		 map.put("PostList", postList.getContent());
		 map.put("PostPages", postList.getTotalPages());
	 }
}
