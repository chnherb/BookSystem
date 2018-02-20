package com.huangbo.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huangbo.common.CommonService;
import com.huangbo.entity.Manager;
import com.huangbo.entity.PageData;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Resource(name="CommonService")
	private CommonService commonService;
	
	@RequestMapping("/list")
	public String getBorrowList(Model model, PageData<Manager> pageData,
			@RequestParam(value="content", defaultValue="") String content,
			HttpSession httpSession){
		//String readerId = (String)httpSession.getAttribute("manager"); 
		
		//System.out.println(readerId);
		StringBuilder hql = new StringBuilder();
		if(!"".contentEquals(content)){
			hql.append(" name='").append(content).append("' ");
		}
		pageData = commonService.getPageDataHql(Manager.class, pageData, hql.toString());
		
		model.addAttribute("content", content);
		model.addAttribute("pageData", pageData);
		return "/bsjsp/managerinfo/index";
	}
	
	@RequestMapping("/add")
	public String addBorrowinfo(Model model, @RequestParam(value="id", defaultValue="") String id){
		Manager manager ;
		if(id.contentEquals("")||id.contentEquals("undefined")){
			manager = new Manager(); 
		}else{
			manager = (Manager)commonService.getClass(Manager.class, id);
		}
		model.addAttribute("manager", manager);
		return "/bsjsp/managerinfo/edit";
	}
	@RequestMapping("/save")
	@ResponseBody
	public String save(Model model, Manager manager){
		String msg ;
		if("".contentEquals(manager.getId())){
			try{
				commonService.save(manager);
				msg = "1";
			}catch(Exception e){
				msg = "0";
			}
		}else{
			try{
				commonService.update(manager);
				msg = "1";
			}catch(Exception e){
				msg = "0";
			}
		}
		return msg;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(Model model, @RequestParam(value ="id", defaultValue="") String id){
		String msg ;
		try{
			commonService.delete(Manager.class, id);
			msg = "1";
		}catch(Exception e){
			msg = "0";
		}
		
		return msg;
	}
}
