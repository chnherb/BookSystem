
package com.huangbo.web;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huangbo.common.CommonService;
import com.huangbo.entity.Bookinfo;
import com.huangbo.entity.Borrow;
import com.huangbo.entity.Manager;
import com.huangbo.entity.PageData;
import com.huangbo.entity.Reader;
import com.huangbo.entity.ReaderType;
import com.huangbo.entity.User;
import com.huangbo.utils.ExcelUtil;

@Controller
@RequestMapping("/readerquery")
public class ReaderQueryController {
	
	@Resource(name="CommonService")
	private CommonService commonService;
	
	@RequestMapping("/list")
	public String getBorrowList(Model model, PageData<Borrow> pageData,
			@RequestParam(value="readerno", defaultValue="") String readerno,
			@RequestParam(value="select", defaultValue="") String select,
			HttpSession httpSession){
		//String readerId = (String)httpSession.getAttribute("manager"); 
		StringBuilder hql = new StringBuilder();
		if(!"".contentEquals(select)){
			hql.append(" isback='").append(select).append("' ");
			if(!"".contentEquals(readerno)){
				hql.append(" and reader.readerno='").append(readerno).append("' ");
			}
		}else{
			if(!"".contentEquals(readerno)){
				hql.append(" reader.readerno='").append(readerno).append("' ");
			}
		}
		hql.append(" order by borrowtime desc ");
		//System.out.println(readerId);
		pageData = commonService.getPageDataHql(Borrow.class, pageData, hql.toString());
		
		model.addAttribute("readerno", readerno);
		model.addAttribute("pageData", pageData);
		return "/bsjsp/readerquery/borrow";
	}
	
	@RequestMapping("/selfinfo")
	public String getReaderInfo(Model model, PageData<Reader> pageData,
			@RequestParam(value="readerno", defaultValue="") String readerno,
			@RequestParam(value="select", defaultValue="") String select,
			HttpSession httpSession){
		//String readerId = (String)httpSession.getAttribute("manager"); 
		
		//System.out.println(readerId);
		StringBuilder hql = new StringBuilder();
		if(!"".contentEquals(readerno)){
			hql.append(" readerno='").append(readerno).append("' ");
		}
		if(!"".contentEquals(select)){
			hql.append(" readerType.id='").append(select).append("' ");
		}
		pageData = commonService.getPageDataHql(Reader.class, pageData, hql.toString());
		List<ReaderType> readerTypeList = commonService.getList(ReaderType.class);
		
		model.addAttribute("readerTypeList", readerTypeList);
		model.addAttribute("readerno", readerno);
		model.addAttribute("reader", pageData.getList().get(0));
		return "/bsjsp/readerquery/reader";
	}
	
	@RequestMapping("/alterpwd")
	public String alterpwd(Model model, PageData<Reader> pageData,
			@RequestParam(value="readerno", defaultValue="") String readerno,
			@RequestParam(value="select", defaultValue="") String select,
			HttpSession httpSession){
		//String readerId = (String)httpSession.getAttribute("manager"); 
		
		//System.out.println(readerId);
		StringBuilder hql = new StringBuilder();
		if(!"".contentEquals(readerno)){
			hql.append(" readerno='").append(readerno).append("' ");
		}
		if(!"".contentEquals(select)){
			hql.append(" readerType.id='").append(select).append("' ");
		}
		pageData = commonService.getPageDataHql(Reader.class, pageData, hql.toString());
		List<ReaderType> readerTypeList = commonService.getList(ReaderType.class);
		
		model.addAttribute("readerTypeList", readerTypeList);
		model.addAttribute("readerno", readerno);
		model.addAttribute("reader", pageData.getList().get(0));
		return "/bsjsp/readerquery/alterpwd";
	}
}
