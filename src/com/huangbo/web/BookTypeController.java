package com.huangbo.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huangbo.common.CommonService;
import com.huangbo.entity.BookType;
import com.huangbo.entity.PageData;

@Controller
@RequestMapping("/booktype")
public class BookTypeController {
	@Resource(name="CommonService")
	private CommonService commonService;
	
	@RequestMapping("/list")
	public String getBorrowList(Model model, PageData<BookType> pageData,
			@RequestParam(value="content", defaultValue="") String content,
			HttpSession httpSession){
		//String readerId = (String)httpSession.getAttribute("manager"); 
		
		//System.out.println(readerId);
		StringBuilder hql = new StringBuilder();
		if(!"".contentEquals(content)){
			hql.append(" typeName='").append(content).append("' ");
		}
		pageData = commonService.getPageDataHql(BookType.class, pageData, hql.toString());
		
		model.addAttribute("content", content);
		model.addAttribute("pageData", pageData);
		return "/bsjsp/booktype/index";
	}
	
	@RequestMapping("/add")
	public String addBorrowinfo(Model model, @RequestParam(value="id", defaultValue="") String id){
		BookType booktype ;
		if(id.contentEquals("")){
			booktype = new BookType(); 
		}else{
			booktype = (BookType)commonService.getClass(BookType.class, id);
		}
		model.addAttribute("booktype", booktype);
		return "/bsjsp/booktype/edit";
	}
	@RequestMapping("/save")
	@ResponseBody
	public String save(Model model, BookType booktype){
		String msg ;
		if("".contentEquals(booktype.getId())){
			try{
				commonService.save(booktype);
				msg = "1";
			}catch(Exception e){
				msg = "0";
			}
		}else{
			try{
				commonService.update(booktype);
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
			commonService.delete(BookType.class, id);
			msg = "1";
		}catch(Exception e){
			msg = "0";
		}
		
		return msg;
	}
}
