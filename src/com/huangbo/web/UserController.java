package com.huangbo.web;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huangbo.common.CommonService;
import com.huangbo.entity.PageData;
import com.huangbo.entity.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource(name="CommonService")
	private CommonService commonService;

	@RequestMapping("/getAllUser")
	public String getAllUser(Model model, PageData<User> pageData){
		
		pageData = commonService.getPageData(User.class, pageData);
		//model.addAttribute("userList", commonService.getList(User.class));
		
		model.addAttribute("pageData", pageData);
		//model.addAttribute("userList", commonService.getList(User.class));
		
		return "/index";
	}
	
	@RequestMapping("/getUser")
	public String getUser(String id,Model model){
		
		model.addAttribute("user", commonService.getClass(User.class, id));
	
		return "/editUser";
	}
	
	@RequestMapping("/toAddUser")
	public String toAddUser(){
		return "/addUser";
	}
	
	@RequestMapping("/addUser")
	public String addUser(User user,Model model){
		
		commonService.save(user );
		
		return "redirect:/user/getAllUser.do";
	}
	
	@RequestMapping("/delUser")
	public void delUser(String id,HttpServletResponse response){
		
		String result = "{\"result\":\"error\"}";
		
		if(commonService.delete(User.class, id)){
			result = "{\"result\":\"success\"}";
		}
		
		response.setContentType("application/json");
		
		try {
			PrintWriter out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/updateUser")
	public String updateUser(User user,HttpServletRequest request){
		
		if(commonService.update(user)){
			//user = commonService.getUser(user.getId());
			//request.setAttribute("user", user);
			return "redirect:/user/getAllUser.do";
		}else{
			return "/error";
		}
	}
	
}