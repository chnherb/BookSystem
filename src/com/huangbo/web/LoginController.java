package com.huangbo.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huangbo.common.CommonService;
import com.huangbo.entity.Manager;
import com.huangbo.entity.Reader;
import com.huangbo.service.UserServer;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Resource(name="CommonService")
	private CommonService commonService;
	
	@Autowired
	private UserServer userServer;
	
	@RequestMapping("/checkname")
	@ResponseBody
	public String checkname(@RequestParam(value="name", defaultValue="") String name,
			@RequestParam(value="password", defaultValue="") String password, Model model, HttpSession httpSession){
		//Session session =getSession();
		//JsonMessage msg = null;
		String msg="";
		StringBuilder hql = new StringBuilder();
		hql.append(" and name= '").append(name).append("' and pwd ='").append(password).append("' ");
		List<Manager> managerList = commonService.getListHql(Manager.class, hql.toString());
		
		if(managerList.size()!=0){
			//msg = new JsonMessage(true, "登陆成功");
			msg = "1";
			System.out.println(managerList.get(0).getId());
			httpSession.setAttribute("manager", managerList.get(0).getId());
			httpSession.setAttribute("managername", managerList.get(0).getName());
			
			//Manager manager = userServer.getManager(managerList.get(0).getId());
			//System.out.println(manager.getName());
		}else{
			//msg = new JsonMessage(false, "用户名或密码错误");
			msg = "0";
		}
		return msg;
	}
	
	@RequestMapping("/readerlogin")
	@ResponseBody
	public String readerlogin(@RequestParam(value="readerno", defaultValue="") String readerno,
			@RequestParam(value="password", defaultValue="") String password, Model model, HttpSession httpSession){
		//Session session =getSession();
		//JsonMessage msg = null;
		String msg="";
		StringBuilder hql = new StringBuilder();
		hql.append(" and readerno= '").append(readerno).append("' and pwd ='").append(password).append("' ");
		List<Reader> readerList = commonService.getListHql(Reader.class, hql.toString());
		
		if(readerList.size()!=0){
			//msg = new JsonMessage(true, "登陆成功");
			msg = "1";
			System.out.println(readerList.get(0).getId());
			httpSession.setAttribute("readerno", readerList.get(0).getReaderno());
			
			//Manager manager = userServer.getManager(managerList.get(0).getId());
			//System.out.println(manager.getName());
		}else{
			//msg = new JsonMessage(false, "用户名或密码错误");
			msg = "0";
		}
		return msg;
	}
	
	@RequestMapping("/logout")
	@ResponseBody
	public String logout(@RequestParam(value="readerno", defaultValue="") String readerno,
			@RequestParam(value="password", defaultValue="") String password, Model model, HttpSession httpSession){
		
	
		httpSession.setAttribute("readerno", "");
		
		return "1";
	}
}
