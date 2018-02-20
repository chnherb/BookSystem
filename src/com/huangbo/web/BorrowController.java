package com.huangbo.web;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.huangbo.entity.User;
import com.huangbo.utils.ExcelUtil;

@Controller
@RequestMapping("/library")
public class BorrowController {

	@Resource(name = "CommonService")
	private CommonService commonService;

	@RequestMapping("/list")
	public String getBorrowList(
			Model model,
			PageData<Borrow> pageData,
			@RequestParam(value = "readerno", defaultValue = "") String readerno,
			@RequestParam(value = "select", defaultValue = "") String select,
			HttpSession httpSession) {
		// String readerId = (String)httpSession.getAttribute("manager");
		StringBuilder hql = new StringBuilder();
		if (!"".contentEquals(select)) {
			hql.append(" isback='").append(select).append("' ");
			if (!"".contentEquals(readerno)) {
				hql.append(" and reader.readerno like '%").append(readerno)
						.append("%' order by borrowtime desc ");
			}else{
				hql.append(" order by borrowtime desc ");
			}
		} else {
			if (!"".contentEquals(readerno)) {
				hql.append(" reader.readerno like '%").append(readerno).append("%' order by borrowtime desc ");
			}else{
				hql.append(" 1=1 order by borrowtime desc ");
			}
		}
		
		System.out.println("pageData:CurrentPage:" + pageData.getCurrPage());

		// System.out.println(readerId);
		pageData = commonService.getPageDataHql(Borrow.class, pageData,
				hql.toString());

		System.out.println("pageData:CurrentPage:" + pageData.getCurrPage());

		model.addAttribute("readerno", readerno);
		model.addAttribute("pageData", pageData);
		return "/bsjsp/borrowbook/index";
	}

	// 鏈�繎鍊熼槄
	@RequestMapping("/newlist")
	public String getBorrownewList(
			Model model,
			PageData<Borrow> pageData,
			@RequestParam(value = "readerno", defaultValue = "") String readerno,
			@RequestParam(value = "select", defaultValue = "") String select,
			HttpSession httpSession) {
		// String readerId = (String)httpSession.getAttribute("manager");
		StringBuilder hql = new StringBuilder();
		// System.out.println(readerId);
		hql.append(" 1=1 order by borrowTime");
		pageData = commonService.getPageDataHql(Borrow.class, pageData,
				hql.toString());

		model.addAttribute("readerno", readerno);
		model.addAttribute("pageData", pageData);
		return "/zuijinjieyue";
	}

	@RequestMapping("/add")
	public String addBorrowinfo(Model model,
			@RequestParam(value = "id", defaultValue = "") String id) {
		Borrow borrow;
		if (id.contentEquals("")) {
			borrow = new Borrow();
		} else {
			borrow = (Borrow) commonService.getClass(Borrow.class, id);
		}
		List<Reader> readerList = commonService.getList(Reader.class);
		List<Bookinfo> bookList = commonService.getList(Bookinfo.class);
		List<Manager> managerList = commonService.getList(Manager.class);

		model.addAttribute("readerList", readerList);
		model.addAttribute("bookList", bookList);
		model.addAttribute("managerList", managerList);
		model.addAttribute("borrow", borrow);
		return "/bsjsp/borrowbook/addBorrow";
	}

	@RequestMapping("/save")
	@ResponseBody
	public String save(Model model, Borrow borrow) {
		String msg;
		Bookinfo book = (Bookinfo) commonService.getClass(Bookinfo.class,
				borrow.getBookinfo().getId());
		if ("".contentEquals(borrow.getId())) {
			try {
				commonService.save(borrow);

				book.setCurrbook(book.getCurrbook() - 1);
				commonService.update(book);
				msg = "1";
			} catch (Exception e) {
				msg = "0";
			}
		} else {
			try {
				commonService.update(borrow);
				if (borrow.getIsback().equals("宸茶繕")) {
					book.setCurrbook(book.getCurrbook() + 1);
					commonService.update(book);
				}
				msg = "1";
			} catch (Exception e) {
				msg = "0";
			}
		}

		return msg;
	}

	@RequestMapping("/xujie")
	@ResponseBody
	public String xujie(Model model,
			@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "readerno", defaultValue = "") String readerno) {
		String msg = "0";
		// Bookinfo book = (Bookinfo)commonService.getClass(Bookinfo.class,
		// borrow.getBookinfo().getId());
		Borrow borrow = (Borrow) commonService.getClass(Borrow.class, id);
		if (!"".contentEquals(id)) {

			try {
				if (!"宸茶繕".contentEquals(borrow.getIsback())) {
					if (Integer.parseInt(borrow.getMoney()) == 0) {// 缁�娆℃暟涓�鏃�
						DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
						Date dDate = new Date();
						// if (dDate.getMonth() == 11) {
						// dDate.setYear(dDate.getYear() + 1);
						// dDate.setMonth(0);
						// } else {
						// dDate.setMonth(dDate.getMonth() + 1);
						// }
						String sDate = fmt.format(dDate);

						List<Reader> listReader = commonService.getListHql(
								Reader.class, " and readerno='" + readerno
										+ "' ");
						String hql = " and isback='鏈繕' and backtime < '"
								+ sDate + "' and readerid='"
								+ listReader.get(0).getId() + "' ";
						List<Borrow> listBorrow = commonService.getListHql(
								Borrow.class, hql);
						if (listBorrow.size() == 0) {// 娌℃湁杩濈害璁板綍

							Date backTime = fmt.parse(borrow.getBackTime());
							if (backTime.getMonth() == 11) {
								backTime.setYear(backTime.getYear() + 1);
								backTime.setMonth(0);
							} else {
								backTime.setMonth(backTime.getMonth() + 1);
							}

							String time = fmt.format(backTime);
							borrow.setBackTime(time);
							borrow.setMoney("1");
							commonService.update(borrow);
							// if(borrow.getIsback().equals("宸茶繕")){
							// book.setCurrbook(book.getCurrbook()+1);
							// commonService.update(book);
							// }
							msg = "1";// 姝ｅ父缁�
						} else {
							msg = "2";// 杩濈害涓嶅彲缁�
						}

					} else {
						msg = "3";// 瓒呰繃缁�娆℃暟
					}
				}else{
					msg = "0";
				}
			} catch (Exception e) {
				msg = "0";
			}
		}

		return msg;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public String delete(Model model,
			@RequestParam(value = "id", defaultValue = "") String id) {
		String msg;
		try {
			commonService.delete(Borrow.class, id);
			msg = "1";
		} catch (Exception e) {
			msg = "0";
		}

		return msg;
	}

	@RequestMapping("report")
	public void exportExcel(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value = "endtime", defaultValue = "") String endtime,
			@RequestParam(value = "select", defaultValue = "") String select)
			throws IOException {
		// 鏌ュ嚭瀛︾敓淇℃伅骞舵斁鍒癿ap涓�
		StringBuilder hql = new StringBuilder();
		if (!endtime.contentEquals("")) {
			hql.append(" and backTime>='").append(endtime).append("'");
		}
		/*
		 * if(!select.contentEquals("")){
		 * hql.append(" and isback='").append(select).append("'"); }
		 */
		hql.append(" and isback='").append("宸茶繕").append("'");

		List<Borrow> list = commonService.getListHql(Borrow.class,
				hql.toString());
		String templateFileName = "template/template.xls";
		String resultFileName = "result/borrowBook.xls";
		new ExcelUtil().createExcel(templateFileName, list, resultFileName);

		URL url = this.getClass().getClassLoader().getResource("");
		String destFilePath = url.getPath() + resultFileName;
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/x-download");
		response.setHeader("Content-disposition", "attachment;filename="
				+ endtime + "宸茶繕鍥句功琛�xls");
		// 灏嗗浘鐗囦娇鐢ㄥ瓧鑺傛祦鐨勫舰寮忓啓缁欏鎴锋満
		InputStream in = new FileInputStream(destFilePath);
		OutputStream out = response.getOutputStream();
		byte[] buffer = new byte[1024];
		int len = 0;
		while ((len = in.read(buffer)) != -1) {
			out.write(buffer, 0, len);
		}
		in.close();
		out.close();
	}
}
