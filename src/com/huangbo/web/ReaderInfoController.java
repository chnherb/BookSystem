package com.huangbo.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huangbo.common.CommonService;
import com.huangbo.entity.PageData;
import com.huangbo.entity.Reader;
import com.huangbo.entity.ReaderType;

@Controller
@RequestMapping("/readerinfo")
public class ReaderInfoController {
	@Resource(name="CommonService")
	private CommonService commonService;
	
	@RequestMapping("/list")
	public String getBorrowList(Model model, PageData<Reader> pageData,
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
		model.addAttribute("pageData", pageData);
		return "/bsjsp/readerinfo/index";
	}
	
	@RequestMapping("/add")
	public String addBorrowinfo(Model model, @RequestParam(value="id", defaultValue="") String id){
		Reader reader ;
		if(id.contentEquals("")){
			reader = new Reader(); 
		}else{
			reader = (Reader)commonService.getClass(Reader.class, id);
		}
		List<ReaderType> readerTypeList = commonService.getList(ReaderType.class);
		
		model.addAttribute("readerTypeList", readerTypeList);
		model.addAttribute("reader", reader);
		return "/bsjsp/readerinfo/edit";
	}
	@RequestMapping("/save")
	@ResponseBody
	public String save(Model model, Reader reader){
		String msg ;
		if("".contentEquals(reader.getId())){
			try{
				commonService.save(reader);
				msg = "1";
			}catch(Exception e){
				msg = "0";
			}
		}else{
			try{
				commonService.update(reader);
				msg = "1";
			}catch(Exception e){
				msg = "0";
			}
		}
		
		
		return msg;
	}
	
	@RequestMapping("/alterpwd")
	@ResponseBody
	public String alterpwd(Model model, Reader reader,@RequestParam(value="oldpwd", defaultValue="") String oldpwd){
		Reader oldReader = (Reader)commonService.getClass(Reader.class, reader.getId());
		String msg = "0" ;
		if(!"".contentEquals(reader.getId())){
			if(oldpwd.contentEquals(oldReader.getPwd())){
				oldReader.setPwd(reader.getPwd());
				try{
					commonService.update(oldReader);
					msg = "1";
				}catch(Exception e){
					msg = "0";
				}
			}
		}
		
		
		return msg;
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(Model model, @RequestParam(value ="id", defaultValue="") String id){
		String msg ;
		try{
			commonService.delete(Reader.class, id);
			msg = "1";
		}catch(Exception e){
			msg = "0";
		}
		
		return msg;
	}
	
	/*@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request,HttpServletResponse response){
		//查出学生信息并放到map中
		List<Reader> list = commonService.getList(Reader.class); 
		//List list = studentService.findAll();
		Map<String,Object> beans = new HashMap<String,Object>();
		beans.put("list", list);
		//获得模板路径
		//String path=request.getServletContext().getRealPath("/template");
		//String srcPath = path+File.separator+"student_template.xls";
		String srcPath = request.getRealPath("/template/student_template.xls");
		//准备输出流
		OutputStream os=null;
		try {
			response.setContentType("application/x-excel");
			response.setHeader("Content-Disposition", "attachment;filename=studentInfo.xls");
			os = response.getOutputStream();
			ExportExcelUtils.exportStudentExcel(beans,srcPath,os);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
}
