package com.huangbo.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huangbo.common.CommonService;
import com.huangbo.entity.InfoPublish;
import com.huangbo.entity.Manager;
import com.huangbo.entity.PageData;

@Controller
@RequestMapping("/infopublish")
public class InfoController {
	@Resource(name="CommonService")
	private CommonService commonService;
	
	@RequestMapping("/list")
	public String getBorrowList(Model model, PageData<InfoPublish> pageData,
			@RequestParam(value="content", defaultValue="") String content,
			@RequestParam(value="role", defaultValue="") String role,
			HttpSession httpSession){
		String readerId = (String)httpSession.getAttribute("manager"); 
		
		//System.out.println(readerId);
		StringBuilder hql = new StringBuilder();
		if(!"".contentEquals(content)){
			hql.append(" title like '%").append(content).append("%' order by createtime desc ");
		}else{
			hql.append(" 1=1 order by createtime desc ");
		}
		pageData = commonService.getPageDataHql(InfoPublish.class, pageData, hql.toString());
		if(role.equals("user")){
			model.addAttribute("readerId","user");
		}else{
			model.addAttribute("readerId", ((Manager)commonService.getClass(Manager.class, readerId)).getRole());
		}
		model.addAttribute("content", content);
		model.addAttribute("pageData", pageData);
		return "/bsjsp/infopublish/index";
	}
	
	@RequestMapping("/userlist")
	public String getUserList(Model model, PageData<InfoPublish> pageData,
			@RequestParam(value="content", defaultValue="") String content,
			HttpSession httpSession){
		//String readerId = (String)httpSession.getAttribute("manager"); 
		
		//System.out.println(readerId);
		pageData = commonService.getPageDataHql(InfoPublish.class, pageData, " 1=1 order by createTime desc");
		
		model.addAttribute("pageData", pageData);
		return "/info";
	}
	
	@RequestMapping("/add")
	public String addBorrowinfo(Model model, @RequestParam(value="id", defaultValue="") String id){
		InfoPublish infoPublish ;
		if(id.contentEquals("")){
			infoPublish = new InfoPublish(); 
		}else{
			infoPublish = (InfoPublish)commonService.getClass(InfoPublish.class, id);
		}
		model.addAttribute("infoPublish", infoPublish);
		return "/bsjsp/infopublish/edit";
	}
	
	@RequestMapping("/look")
	public String addLookinfo(Model model, @RequestParam(value="id", defaultValue="") String id){
		InfoPublish infoPublish ;
		if(id.contentEquals("")){
			infoPublish = new InfoPublish(); 
		}else{
			infoPublish = (InfoPublish)commonService.getClass(InfoPublish.class, id);
		}
		model.addAttribute("infoPublish", infoPublish);
		return "/bsjsp/infopublish/look";
	}
	@RequestMapping("/save")
	@ResponseBody
	public String save(Model model, InfoPublish infoPublish){
		String msg ;
		if("".contentEquals(infoPublish.getId())){
			try{
				commonService.save(infoPublish);
				msg = "1";
			}catch(Exception e){
				msg = "0";
			}
		}else{
			try{
				commonService.update(infoPublish);
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
			commonService.delete(InfoPublish.class, id);
			msg = "1";
		}catch(Exception e){
			msg = "0";
		}
		
		return msg;
	}
}
