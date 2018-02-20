package com.huangbo.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huangbo.common.CommonService;
import com.huangbo.entity.BookCase;
import com.huangbo.entity.PageData;

@Controller
@RequestMapping("/bookcase")
public class BookCaseController {
	@Resource(name="CommonService")
	private CommonService commonService;
	
	@RequestMapping("/list")
	public String getBorrowList(Model model, PageData<BookCase> pageData,
			@RequestParam(value="content", defaultValue="") String content,
			HttpSession httpSession){
		//String readerId = (String)httpSession.getAttribute("manager"); 
		
		//System.out.println(readerId);
		StringBuilder hql = new StringBuilder();
		if(!"".contentEquals(content)){
			hql.append(" name='").append(content).append("' ");
		}
		pageData = commonService.getPageDataHql(BookCase.class, pageData, hql.toString());
		
		model.addAttribute("content", content);
		model.addAttribute("pageData", pageData);
		return "/bsjsp/bookcase/index";
	}
	
	@RequestMapping("/add")
	public String addBorrowinfo(Model model, @RequestParam(value="id", defaultValue="") String id){
		BookCase bookCase ;
		if(id.contentEquals("")){
			bookCase = new BookCase(); 
		}else{
			bookCase = (BookCase)commonService.getClass(BookCase.class, id);
		}
		model.addAttribute("bookCase", bookCase);
		return "/bsjsp/bookcase/edit";
	}
	@RequestMapping("/save")
	@ResponseBody
	public String save(Model model, BookCase bookCase){
		String msg ;
		if("".contentEquals(bookCase.getId())){
			try{
				commonService.save(bookCase);
				msg = "1";
			}catch(Exception e){
				msg = "0";
			}
		}else{
			try{
				commonService.update(bookCase);
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
			commonService.delete(BookCase.class, id);
			msg = "1";
		}catch(Exception e){
			msg = "0";
		}
		
		return msg;
	}
}
