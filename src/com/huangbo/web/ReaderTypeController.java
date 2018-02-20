package com.huangbo.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huangbo.common.CommonService;
import com.huangbo.entity.PageData;
import com.huangbo.entity.ReaderType;

@Controller
@RequestMapping("/readertype")
public class ReaderTypeController {
	
	@Resource(name="CommonService")
	private CommonService commonService;
	
	@RequestMapping("/list")
	public String getBorrowList(Model model, PageData<ReaderType> pageData,
			@RequestParam(value="content", defaultValue="") String content,
			HttpSession httpSession){
		//String readerId = (String)httpSession.getAttribute("manager"); 
		
		//System.out.println(readerId);
		StringBuilder hql = new StringBuilder();
		if(!"".contentEquals(content)){
			hql.append(" typeName='").append(content).append("' ");
		}
		pageData = commonService.getPageDataHql(ReaderType.class, pageData, hql.toString());
		
		model.addAttribute("content", content);
		model.addAttribute("pageData", pageData);
		return "/bsjsp/readertype/index";
	}
	
	@RequestMapping("/add")
	public String addBorrowinfo(Model model, @RequestParam(value="id", defaultValue="") String id){
		ReaderType readerType ;
		if(id.contentEquals("")){
			readerType = new ReaderType(); 
		}else{
			readerType = (ReaderType)commonService.getClass(ReaderType.class, id);
		}
		model.addAttribute("readerType", readerType);
		return "/bsjsp/readertype/edit";
	}
	@RequestMapping("/save")
	@ResponseBody
	public String save(Model model, ReaderType readerType){
		String msg ;
		if("".contentEquals(readerType.getId())){
			try{
				commonService.save(readerType);
				msg = "1";
			}catch(Exception e){
				msg = "0";
			}
		}else{
			try{
				commonService.update(readerType);
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
			commonService.delete(ReaderType.class, id);
			msg = "1";
		}catch(Exception e){
			msg = "0";
		}
		
		return msg;
	}
}
