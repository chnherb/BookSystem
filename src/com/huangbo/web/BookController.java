package com.huangbo.web;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huangbo.common.CommonService;
import com.huangbo.entity.BarPer;
import com.huangbo.entity.Book;
import com.huangbo.entity.BookCase;
import com.huangbo.entity.BookState;
import com.huangbo.entity.BookType;
import com.huangbo.entity.Bookinfo;
import com.huangbo.entity.Borrow;
import com.huangbo.entity.Manager;
import com.huangbo.entity.PageData;
import com.huangbo.entity.ApiInfo;
import com.huangbo.utils.HttpUtils;

@Controller
@RequestMapping("/bookinfo")
public class BookController {
	@Resource(name = "CommonService")
	private CommonService commonService;

	@RequestMapping("/list")
	public String getBorrowList(Model model, PageData<Bookinfo> pageData,
			@RequestParam(value = "content", defaultValue = "") String content,
			@RequestParam(value = "role", defaultValue = "") String role,
			@RequestParam(value = "select", defaultValue = "") String select,
			HttpSession httpSession) {
		String readerId = (String) httpSession.getAttribute("manager");

		// System.out.println(readerId);
		StringBuilder hql = new StringBuilder();
		if (!"".contentEquals(content)) {
			hql.append(" bookname like '%").append(content).append("%' ");
			if (!"".contentEquals(select)) {
				hql.append(" and booktype.id='").append(select).append("' ");
			}
		} else {
			if (!"".contentEquals(select)) {
				hql.append(" booktype.id='").append(select).append("' ");
			}
		}
		pageData = commonService.getPageDataHql(Bookinfo.class, pageData,
				hql.toString());

		if (role.equals("user")) {
			model.addAttribute("readerId", "user");
		} else {
			model.addAttribute("readerId", ((Manager) commonService.getClass(
					Manager.class, readerId)).getRole());
		}
		List<BookType> bookTypeList = commonService.getList(BookType.class);

		model.addAttribute("bookTypeList", bookTypeList);
		model.addAttribute("content", content);
		model.addAttribute("pageData", pageData);
		return "/bsjsp/bookinfo/index";
	}

	@RequestMapping("/chaxunlist")
	public String getUserBorrowList(Model model, PageData<Bookinfo> pageData,
			@RequestParam(value = "content", defaultValue = "") String content,
			@RequestParam(value = "role", defaultValue = "") String role,
			@RequestParam(value = "select", defaultValue = "") String select,
			HttpSession httpSession) {
		String readerId = (String) httpSession.getAttribute("manager");

		// System.out.println(readerId);
		StringBuilder hql = new StringBuilder();
		if (!"".contentEquals(content)) {
			hql.append(" bookcode='").append(content).append("' ");
		}
		if (!"".contentEquals(select)) {
			hql.append(" booktype.id='").append(select).append("' ");
		}
		pageData = commonService.getPageDataHql(Bookinfo.class, pageData,
				hql.toString());

		if (role.equals("user")) {
			model.addAttribute("readerId", "user");
		} else {
			// model.addAttribute("readerId",
			// ((Manager)commonService.getClass(Manager.class,
			// readerId)).getRole());
		}
		List<BookType> bookTypeList = commonService.getList(BookType.class);

		model.addAttribute("bookTypeList", bookTypeList);
		model.addAttribute("content", content);
		model.addAttribute("pageData", pageData);
		return "/bsjsp/user/bookindex";
	}

	// find
	@RequestMapping("/find")
	public String getBorrowFindUserList(Model model,
			PageData<Bookinfo> pageData,
			@RequestParam(value = "content", defaultValue = "") String content,
			HttpSession httpSession) {
		String readerId = (String) httpSession.getAttribute("manager");

		pageData.setPageSize(14);

		// System.out.println(readerId);
		StringBuilder hql = new StringBuilder();
		if (!"".contentEquals(content)) {
			hql.append(" bookname like '%").append(content).append("%' ");
		}
		pageData = commonService.getPageDataHql(Bookinfo.class, pageData,
				hql.toString());

		model.addAttribute("readerId", readerId);
		model.addAttribute("pageData", pageData);
		return "/find";
	}

	// findnjust
	@RequestMapping("/findnjust")
	public String getFindnjust(Model model,
			PageData<Bookinfo> pageData,
			@RequestParam(value = "content", defaultValue = "") String content,
			HttpSession httpSession) {
		String readerId = (String) httpSession.getAttribute("manager");

		pageData.setPageSize(14);

		// System.out.println(readerId);
		StringBuilder hql = new StringBuilder();
		if (!"".contentEquals(content)) {
			hql.append(" bookname like '%").append(content).append("%' ");
		}
		pageData = commonService.getPageDataHql(Bookinfo.class, pageData,
				hql.toString());

		model.addAttribute("readerId", readerId);
		model.addAttribute("pageData", pageData);
		return "/findNJUST";
	}

	// chaxun
	@RequestMapping("/userlist")
	public String getBorrowUserList(Model model, PageData<Bookinfo> pageData,
			@RequestParam(value = "content", defaultValue = "") String content,
			HttpSession httpSession) {
		String readerId = (String) httpSession.getAttribute("manager");

		pageData.setPageSize(14);

		try {
			content = new String(content.getBytes("iso8859-1"), "UTF-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// System.out.println(readerId);
		StringBuilder hql = new StringBuilder();
		if (!"".contentEquals(content)) {
			hql.append(" bookname like '%").append(content).append("%' ");
		}
		pageData = commonService.getPageDataHql(Bookinfo.class, pageData,
				hql.toString());

		model.addAttribute("readerId", readerId);
		model.addAttribute("pageData", pageData);
		return "/chaxun";
	}

	// chaxun I add
	@RequestMapping("/booklist")
	public String getBookList(
			Model model,
			PageData<Bookinfo> pageData,
			@RequestParam(value = "searchtype", defaultValue = "0") int searchtype,
			@RequestParam(value = "content", defaultValue = "") String content,
			HttpSession httpSession) {
		String readerId = (String) httpSession.getAttribute("manager");

		pageData.setPageSize(14);

		try {
			content = new String(content.getBytes("iso8859-1"), "UTF-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// System.out.println(readerId);
		StringBuilder hql = new StringBuilder();
		if (!"".contentEquals(content)) {
			switch (searchtype) {
			case 0:
				hql.append(" bookname like '%").append(content).append("%' ");
				break;
			case 1:
				hql.append(" bookauthor like '%").append(content).append("%' ");
				break;
			case 2:
				hql.append(" bookaddress like '%").append(content)
						.append("%' ");
				break;

			default:
				hql.append(" bookname like '%").append(content).append("%' ");
				break;
			}
		}

		pageData = commonService.getPageDataHql(Bookinfo.class, pageData,
				hql.toString());

		model.addAttribute("readerId", readerId);
		model.addAttribute("pageData", pageData);
		return "/chaxun";
	}

	// xinshu
	@RequestMapping("/newlist")
	public String getBorrownewList(Model model, PageData<Bookinfo> pageData,
			@RequestParam(value = "content", defaultValue = "") String content,
			HttpSession httpSession) {
		String readerId = (String) httpSession.getAttribute("manager");

		// System.out.println(readerId);
		StringBuilder hql = new StringBuilder();
		if (!"".contentEquals(content)) {
			hql.append(" bookname='").append(content).append("' ");
		}
		hql.append(" 1=1 order by bookintime desc");
		pageData = commonService.getPageDataHql(Bookinfo.class, pageData,
				hql.toString());

		model.addAttribute("readerId", readerId);
		model.addAttribute("pageData", pageData);
		return "/xinshu";
	}

	// tonji
	@RequestMapping("/tonglist")
	public String getBorrowtongList(HttpSession httpSession,
			HttpServletRequest request) {
		// 放入书籍类型
		String booktype = "";
		// 放入对应书籍的总量
		String booktotal = "";
		String readerId = (String) httpSession.getAttribute("manager");
		// 获取所有的书籍类型和书籍总量
		List<BookType> typeList = commonService.getList(BookType.class);
		// 查找各个类型的总量
		for (BookType type : typeList) {
			booktype += type.getTypeName() + "','";
			List<Borrow> borrowList = commonService.getListHql(Borrow.class,
					" and bookinfo.booktype.id='" + type.getId() + "' ");
			booktotal += borrowList.size() + ",";
		}
		booktype = booktype.substring(0, booktype.length() - 3);
		booktotal = booktotal.substring(0, booktotal.length() - 1);
		// model.addAttribute("booktype", booktype);
		// model.addAttribute("booktotal", booktotal);
		request.setAttribute("booktype", booktype);
		request.setAttribute("booktotal", booktotal);
		return "/tongji";
	}

	@RequestMapping("/add")
	public String addBorrowinfo(Model model,
			@RequestParam(value = "id", defaultValue = "") String id) {
		Bookinfo bookinfo;
		if (id.contentEquals("")) {
			bookinfo = new Bookinfo();
		} else {
			bookinfo = (Bookinfo) commonService.getClass(Bookinfo.class, id);
		}
		List<BookCase> bookCaseList = commonService.getList(BookCase.class);
		List<BookType> bookTypeList = commonService.getList(BookType.class);

		model.addAttribute("bookTypeList", bookTypeList);
		model.addAttribute("bookCaseList", bookCaseList);
		model.addAttribute("bookinfo", bookinfo);
		return "/bsjsp/bookinfo/edit";
	}

	@RequestMapping("/bookDetail")
	public String getBookDetail(Model model,
			@RequestParam(value = "isbn", defaultValue = "") String isbn,
			@RequestParam(value = "href", defaultValue = "") String href)  {
		Bookinfo bookinfo;
		ApiInfo apiInfo;
		if (!isbn.contentEquals("")) {
			//bookinfo = (Bookinfo) commonService.getClass(Bookinfo.class, id);
			// System.out.println(bookinfo.getIsbn());
//			apiInfo = HttpUtils.getApiInfo(bookinfo.getIsbn().trim());
			apiInfo = HttpUtils.getApiInfo(isbn);
//			List<BookCase> bookCaseList = commonService.getList(BookCase.class);
//			List<BookType> bookTypeList = commonService.getList(BookType.class);

			List<Double> listPer = null;
			String iBigstar = "00";
			BarPer barPer = new BarPer();
			if (apiInfo != null
					&& !apiInfo.getAlternateHref().trim().equals("")) {
				listPer = HttpUtils.getListPer(apiInfo.getAlternateHref());
				if (listPer.size() == 5) {
					barPer.setPer1(listPer.get(0));
					barPer.setPer2(listPer.get(1));
					barPer.setPer3(listPer.get(2));
					barPer.setPer4(listPer.get(3));
					barPer.setPer5(listPer.get(4));
				} else {
					barPer.setPer1((Double) 0.0);
					barPer.setPer2((Double) 0.0);
					barPer.setPer3((Double) 0.0);
					barPer.setPer4((Double) 0.0);
					barPer.setPer5((Double) 0.0);
				}
				if (apiInfo.getRate() == 10.0)
					iBigstar = "50";
				else if (apiInfo.getRate() >= 9.0)
					iBigstar = "45";
				else if (apiInfo.getRate() >= 8.0)
					iBigstar = "40";
				else if (apiInfo.getRate() >= 7.0)
					iBigstar = "35";
				else if (apiInfo.getRate() >= 6.0)
					iBigstar = "30";
				else if (apiInfo.getRate() >= 5.0)
					iBigstar = "25";
				else if (apiInfo.getRate() >= 4.0)
					iBigstar = "20";
				else if (apiInfo.getRate() >= 3.0)
					iBigstar = "15";
				else if (apiInfo.getRate() >= 2.0)
					iBigstar = "10";
				else if (apiInfo.getRate() >= 1.0)
					iBigstar = "05";
				else
					iBigstar = "00";
			}

//			model.addAttribute("bookTypeList", bookTypeList);
//			model.addAttribute("bookCaseList", bookCaseList);
//			model.addAttribute("bookinfo", bookinfo);
			model.addAttribute("apiInfo", apiInfo);
			model.addAttribute("barPer", barPer);
			model.addAttribute("iBigstar", iBigstar);
		}
		if(!href.equals("") && !href.equals("null"))
		{
			List<BookState> listBookState = HttpUtils.getlistBookState(HttpUtils.getStringFromNet(href));
			PageData<BookState> pageBookState = new PageData<BookState>();
			pageBookState.setList(listBookState);
			pageBookState.setTotal(listBookState.size());
			model.addAttribute("pageBookState", pageBookState);
		}

		return "/bookDetail";
	}

	@RequestMapping("/listBooknjust")
	public String getListBooknjust(Model model,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "sType0", defaultValue = "") String sType0) {
		List<Book> listBook = null;
		PageData<Book> pageDataBook = new PageData<Book>();

		if(sType0.contentEquals("")){
			sType0 = "any";
		}
		if (!keyword.contentEquals("")) {
			
			try {
				keyword = new String(keyword.getBytes("iso8859-1"), "UTF-8");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			listBook = HttpUtils.getListBookFromNJUST(sType0,keyword);
			System.out.println("keyword" + keyword);
			if (listBook != null) {
				pageDataBook.setList(listBook);
				pageDataBook.setTotal(listBook.size());
				System.out.println("listBook.size():"+listBook.size());
				System.out.println("pageDataBook.list.size():"
						+ pageDataBook.getList().size());
			
				for(int i=0; i<pageDataBook.getList().size(); i++){
					System.out.println(pageDataBook.getList().get(i).getBookName());
				}
				model.addAttribute("pageDataBook", pageDataBook);
			}
		}

		return "/bookNJUST";
	}

	@RequestMapping("/save")
	@ResponseBody
	public String save(Model model, Bookinfo bookinfo) {
		String msg;
		if ("".contentEquals(bookinfo.getId())) {
			try {
				commonService.save(bookinfo);
				msg = "1";
			} catch (Exception e) {
				msg = "0";
			}
		} else {
			// 修改数量时，改变剩余量
			String sql = " and bookinfo.id= '" + bookinfo.getId() + "' ";
			List<Borrow> list = commonService.getListHql(Borrow.class, sql);
			bookinfo.setCurrbook(bookinfo.getTotalbook() - list.size());
			try {
				commonService.update(bookinfo);
				msg = "1";
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
			commonService.delete(Bookinfo.class, id);
			msg = "1";
		} catch (Exception e) {
			msg = "0";
		}

		return msg;
	}
}
