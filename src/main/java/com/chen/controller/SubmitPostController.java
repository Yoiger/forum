package com.chen.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.chen.entity.Post;
import com.chen.entity.Section;
import com.chen.entity.Topic;
import com.chen.entity.User;
import com.chen.service.PostService;
import com.chen.service.SectionService;
import com.chen.service.TopicService;
import com.chen.util.Constant;

@Controller
public class SubmitPostController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private SectionService sectionService;
	
	@Autowired
	private TopicService topicService;
	
	/**
	 * 发帖
	 * @param request
	 * @param post
	 * @return
	 */
	@RequestMapping(value="/submitPost", method=RequestMethod.POST)
	public String doSubmitPost(HttpServletRequest request, Post post){
		
		User u = (User) WebUtils.getSessionAttribute(request, Constant.LOGIN_USER);
		Date time = new Date();
		//设置时间
		post.setPosttime(new Date());
		//设置状态
		post.setStatus(Constant.VERIFIED);
		post.setUsername(u.getUsername());
		post.setUserid(u.getUserid());
		post.setViewcount(0);
		post.setReplytimes(0);
		postService.save(post);
		System.out.println(post.getPosttime());
		return "redirect:showPostList?target=all";
	}
	
	/**
	 * 跳转到发帖
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/toPost")
	public String toPost(ModelMap map) {
		/*List<Section> sl = sectionService.findSection();
		map.put("SectionList", sl);*/
		return "index_posting";
	}
	
	@RequestMapping(value="/getTopic")
	@ResponseBody
	public Object getTopic(int sectionid) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Topic> tl = topicService.findTopic(sectionid);
		map.put("result", true);
		map.put("TopicList", tl);
		return map;
	}
}
