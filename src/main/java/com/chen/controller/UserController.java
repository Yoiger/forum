package com.chen.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.chen.entity.User;
import com.chen.entity.UserRole;
import com.chen.service.UserService;
import com.chen.service.User_RoleService;
import com.chen.util.Constant;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private User_RoleService urService;
	
	/**
	 * ajax验证登陆
	 * @param username
	 * @param password
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/login")
	@ResponseBody
	public Object doLogin(String username, String password, HttpServletRequest request, ModelMap map) {
		User u = userService.findUserByName(username);
		Map<String, Object> m = new HashMap<String, Object>(); 
		if(u != null && u.getPassword().trim().equals(password.trim())) {
			request.getSession().setAttribute("Login_User", u);
			UserRole ur = urService.findURByUserid(u.getUserid());
			request.getSession().setAttribute("Login_Role", ur);		
			m.put("result", true);
		}
		else{
			m.put("result", false);
		}
		return m;
	}
	
	/**
	 * 登出
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/logout")
	public String doLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("Login_User");
		session.invalidate();
		return "redirect:index";
	}
	
	@RequestMapping(value="/index")
	public String index() {
		return "index";
	}
	
	/**
	 * 表单注册
	 * @param u
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String doRegister(User u, HttpServletRequest request, ModelMap map) {
		User user = userService.findUserByName(u.getUsername());
		if(user == null) {
			u.setEnabled(Constant.ENABLE);
			u.setIsopened(Constant.OPENED);
		
			int uid = userService.findMaxUserId();
			uid++;	
			u.setUserid(uid);
			Date date = new Date();
			u.setCreationtime(date);
			userService.save(u);
			setMember(uid);
			return "redirect:skipTo?target=image";
		}
		else {
			map.put("ExsitName", "用户名已存在！");
			JOptionPane.showMessageDialog(null, "用户名已存在！");
			return "redirect:skipTo?target=register";
		}	
	}
	
	public void setMember(int userid) {
		UserRole ur = new UserRole();
		ur.setRoleid(Constant.MEMBER);
		ur.setUserid(userid);
		urService.save(ur);
	}
	
	/**
	 * 修改用户信息
	 * @param userid
	 * @param age
	 * @param email
	 * @return
	 */
	/*@RequestMapping(value="/changeInfo")
	public String doChangeInfo(int userid, int age, String email) {
		User u = userService.findUserByID(userid);
		u.setAge(age);
		u.setEmail(email);
		userService.save(u);
		return "redirect:skipTo?target=personalInfo";
	}*/
	
	/**
	 * ajax修改用户信息
	 * @param userid
	 * @param age
	 * @param email
	 * @return
	 */
	@RequestMapping(value="/changeInfo")
	@ResponseBody
	public Object doChangeInfo(int userid, int age, String email) {
		Map<String, Object> m = new HashMap<String, Object>();
		User u = userService.findUserByID(userid);
		u.setAge(age);
		u.setEmail(email);
		userService.save(u);
		m.put("result", true);
		return m;
	}
	
	/**
	 * 跳转到用户列表
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/toUserList")
	public String toUserList(ModelMap map, HttpServletRequest request) {
		UserRole ur = (UserRole) request.getSession().getAttribute("Login_Role");
		if(ur.getRoleid() == 3001) {
			Page<User> ul = userService.findUserList(0);
			map.put("UserList", ul.getContent());
			map.put("currentPage", 1);
			map.put("UserPages", ul.getTotalPages());
		}
		return "user_list";
	}
	
	/**
	 * 用户列表的翻页
	 * @param currentpage
	 * @param map
	 * @return
	 */
	@RequestMapping(value="/toUserNewPage")
	public String toUserNewPage(int currentpage, ModelMap map) {
		Page<User> ul = userService.findUserList(currentpage-1);
		map.put("UserList", ul.getContent());
		map.put("currentPage", currentpage);
		map.put("UserPages", ul.getTotalPages());
		return "user_list";
	}
	
	/**
	 * 删除一个用户
	 * @param userid
	 * @return
	 */
	@RequestMapping(value="/deleteUser")
	public String doDeleteUser(int userid, HttpServletRequest request) {
		UserRole admin = (UserRole) request.getSession().getAttribute("Login_Role");
		if(admin.getRoleid() == 3001) {
			UserRole ur = urService.findURByUserid(userid);
			urService.deleteUserRole(ur);
			userService.deleteUser(userid);
			return "redirect:toUserList";
		}
		else{
			return "index";
		}
	}
	
	/**
	 * 设置用户是否可用
	 * @param userid
	 * @param enabled
	 * @return
	 */
	/*@RequestMapping(value="/setUserEnabled")
	public String setUserEnabled(int userid, int enabled){
		User u = userService.findUserByID(userid);
		if(enabled == Constant.ENABLE) {
			u.setEnabled(Constant.INVISIBAL);
		}
		else {
			u.setEnabled(Constant.ENABLE);
		}
		userService.save(u);
		return "redirect:toUserList";
	}*/
	
	@RequestMapping(value="/setUserEnabled")
	@ResponseBody
	public Object setUserEnabled(int userid, int enabled){
		Map<String, Object> m = new HashMap<String, Object>();
		User u = userService.findUserByID(userid);
		if(enabled == Constant.ENABLE) {
			u.setEnabled(Constant.INVISIBAL);
			m.put("result", true);
		}
		else {
			u.setEnabled(Constant.ENABLE);
			m.put("result", false);
		}
		userService.save(u);
		return m;
	}
}
