package com.huangbo.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringEscapeUtils;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.io.SAXReader;

import com.huangbo.entity.ApiInfo;
import com.huangbo.entity.Book;
import com.huangbo.entity.BookState;

public class HttpUtils {

	// private static final String URL =
	// "http://202.119.83.14:8080/uopac/opac/search_adv_result.php?"
	// + "sType0=02&pageSize=20&sort=score&desc=on&with_ebook=on";

	private static String getURLDecoderString(String str) {
		String result = "";
		if (null == str) {
			return "";
		}
		try {
			// result = java.net.URLDecoder.decode(str, "UTF-8");
			result = java.net.URLEncoder.encode(str, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static String getStringFromNet(String url) {
		String result = "";
		BufferedReader in = null;
		try {
			// String urlNameString;
			// if (param != null && param.trim().length() > 0) {
			// urlNameString = url + "?" + param;
			// }
			// urlNameString = url;
			// URL realUrl = new URL(urlNameString);
			URL realUrl = new URL(url);
			// 打开和URL之间的连接
			URLConnection connection = realUrl.openConnection();
			// 设置通用的请求属性
			// connection.setRequestProperty("accept", "*/*");
			connection
					.setRequestProperty("Accept",
							"text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
			//connection.setReadTimeout(5000);
			// connection.setRequestProperty("Connection", "Keep-Alive");
			connection.setRequestProperty("Connection", "keep-alive");

			// connection.setRequestProperty("user-agent",
			// "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
			connection
					.setRequestProperty("User-Agent",
							"Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0");
			// 建立实际的连接
			connection.connect();
			// 获取所有响应头字段
			Map<String, List<String>> map = connection.getHeaderFields();
			// 遍历所有的响应头字段
			// for (String key : map.keySet()) {
			// System.out.println(key + "--->" + map.get(key));
			// }
			// 定义 BufferedReader输入流来读取URL的响应

			InputStreamReader isr = new InputStreamReader(
					connection.getInputStream(), "UTF-8");
			in = new BufferedReader(isr);
			// in = new BufferedReader(new InputStreamReader(
			// connection.getInputStream()));
			// 没有处理中文乱码，导致后面无法处理节点！！！！
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
			//Thread.sleep(5000);
		} catch (Exception e) {
			System.out.println("发送GET请求出现异常！" + e);
			e.printStackTrace();
			return null;
		}
		// 使用finally块来关闭输入流
		finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}

	public static ApiInfo getApiInfo(String isbn) {
		// 根据ISBN号得到评分
		ApiInfo apiInfo = new ApiInfo();
		// http://api.douban.com/book/subject/isbn/9787312027277
		// http://api.douban.com/book/subject/isbn/9787532161690
		// String isbn = "9787532161690";
		String doubanHref = "http://api.douban.com/book/subject/isbn/";
		String scoreXML = getStringFromNet(doubanHref + isbn);
		if (scoreXML == null)
			return null;
		System.out.println(scoreXML);
		try {
			org.dom4j.Document parseText = DocumentHelper.parseText(scoreXML);
			org.dom4j.Element rootElement = parseText.getRootElement();
			org.dom4j.Element rating = rootElement.element("rating");

			String average = rating.attributeValue("average");
			if (average == null || average.equals("")) {
				apiInfo.setRate(0);
			} else {
				apiInfo.setRate(Double.parseDouble(average));
			}
			// System.out.println("average:" + average);

			String numRaters = rating.attributeValue("numRaters");
			if (numRaters == null || numRaters.equals("")) {
				apiInfo.setNumRaters(0);
			} else {
				apiInfo.setNumRaters(Integer.parseInt(numRaters));
			}
			// System.out.println("numRaters:" + numRaters);

			org.dom4j.Element summaryEle = rootElement.element("summary");
			if (summaryEle != null) {
				String summary = summaryEle.getText();
				// System.out.println("summary"+summary);
				apiInfo.setSummary(summary);
			}

			List<org.dom4j.Element> linkElements = rootElement.elements("link");
			// String imageHref = "",alternateHref="";
			if (linkElements != null) {
				for (int i = 0; i < linkElements.size(); i++) {
					String href = linkElements.get(i).attributeValue("href");
					String rel = linkElements.get(i).attributeValue("rel");
					if (rel.equals("image"))
						apiInfo.setImageHref(href);
					if (rel.equals("alternate"))
						apiInfo.setAlternateHref(href);
					// System.out.println(href);
				}
			}
			// System.out.println("imageHref:"+apiInfo.getImageHref());
			// System.out.println("alternateHref:"+apiInfo.getAlternateHref());

			List<org.dom4j.Element> dbElements = rootElement
					.elements("attribute");
			// System.out.println(dbElements.size() + "");
			if (dbElements != null) {
				for (int i = 0; i < dbElements.size(); i++) {
					String dbName = dbElements.get(i).attributeValue("name");
					// System.out.println("dbName:"+dbName);
					if (dbName.equals("isbn13")) {
						String str = dbElements.get(i).getText();
						// System.out.println("str:"+str);
						apiInfo.setIsbn(str);
					} else if (dbName.equals("title")) {
						String str = dbElements.get(i).getText();
						// System.out.println("str:"+str);
						apiInfo.setTitle(str);
					} else if (dbName.equals("pages")) {
						String str = dbElements.get(i).getText();
						// System.out.println("str:"+str);
						apiInfo.setPages(str);
					} else if (dbName.equals("author")) {
						String str = dbElements.get(i).getText();
						// System.out.println("str:"+str);
						apiInfo.setAuthor(str);
					} else if (dbName.equals("price")) {
						String str = dbElements.get(i).getText();
						// System.out.println("str:"+str);
						apiInfo.setPrice(str);
					} else if (dbName.equals("publisher")) {
						String str = dbElements.get(i).getText();
						// System.out.println("str:"+str);
						apiInfo.setPublisher(str);
					} else if (dbName.equals("binding")) {
						String str = dbElements.get(i).getText();
						// System.out.println("str:"+str);
						apiInfo.setBinding(str);
					} else if (dbName.equals("pubdate")) {
						String str = dbElements.get(i).getText();
						// System.out.println("str:"+str);
						apiInfo.setPubdate(str);
					} else if (dbName.equals("author-intro")) {
						String str = dbElements.get(i).getText();
						// System.out.println("str:"+str);
						apiInfo.setAuthorIntro(str);
					}
				}
			}

		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

		return apiInfo;
	}

	public static List<Double> getListPer(String href) {
		List<Double> listPer = new ArrayList<Double>();
		String html = getStringFromNet(href);
		if (html == null || html.equals(""))
			return null;
		// System.out.println(html);
		int index1 = 0, index2 = 0;
		for (int i = 0; i < 5; i++) {
			index1 = html.indexOf("rating_per", index2);
			if (index1 == -1 || index2 == -1)
				break;
			index2 = html.indexOf("%", index1);
			String str = html.substring(index1 + 12, index2);
			try {
				Double d = Double.parseDouble(str);
				listPer.add(d);
				// System.out.println(d+"");
			} catch (Exception e) {
				e.printStackTrace();
			}
			// System.out.println(str);
		}
		while (listPer.size() < 5) {
			listPer.add(0.0);
		}
		return listPer;
	}

	public static List<Book> getListBookFromNJUST(String sType0, String keyword) {
		String url = "http://202.119.83.14:8080/uopac/opac/search_adv_result.php?sType0="
				+ sType0
				+ "&q0="
				+ getURLDecoderString(keyword)
				+ "&pageSize=15&sort=score&desc=true";
		// String url =
		// "http://202.119.83.14:8080/uopac/opac/search_adv_result.php?sType0=02&q0=java&pageSize=15&sort=score&desc=true";
		List<Book> listBook = new ArrayList<Book>();
		String html = getStringFromNet(url);

		// System.out.println("urlHtml:" + html);

		int index1 = 0, index2 = 0;
		String target = "item.php?";
		String hrefPre = "http://202.119.83.14:8080/uopac/opac/";
		for (int i = 0; i < 15; i++) {
			index1 = html.indexOf(target, index2);
			if (index1 == -1 || index2 == -1)
				break;
			index2 = html.indexOf("\">", index1);
			String href = html.substring(index1, index2);
			Book book = new Book();
			book.setHref(hrefPre + href);
			index1 = html.indexOf("</a>", index2);
			if (index1 == -1 || index2 == -1)
				break;
			String bookName = html.substring(index2 + 2, index1);
			book.setBookName(bookName);

			String strTar = "#FFFFFF\">";
			String strTD = "</TD>";
			index2 = html.indexOf(strTar, index1);
			index1 = html.indexOf(strTD, index2);
			if (index1 == -1 || index2 == -1)
				break;
			String author = html.substring(index2 + strTar.length(), index1);
			book.setAuthor(author);

			index2 = html.indexOf(strTar, index1);
			index1 = html.indexOf(strTD, index2);
			if (index1 == -1 || index2 == -1)
				break;
			String publisher = html.substring(index2 + strTar.length(), index1);
			book.setPublisher(publisher);

			index2 = html.indexOf(strTar, index1);
			index1 = html.indexOf(strTD, index2);
			if (index1 == -1 || index2 == -1)
				break;
			String callnum = html.substring(index2 + strTar.length(), index1);
			book.setCallnum(callnum);

			String bookHtml = getStringFromNet(book.getHref());

			System.out.println("bookHtml:" + i + bookHtml);

			String isbn = getBookISBN(bookHtml);
			book.setIsbn(isbn);
			// List<BookState> listBookState = getlistBookState(bookHtml);
			// book.setListBookState(listBookState);

			System.out.println(book.toString());

			listBook.add(book);
		}
		// System.out.println(listBook.size()+"");
		return listBook;
	}

	private static String getBookISBN(String html) {
		if (html == null || html.equals(""))
			return null;
		String target = "ISBN及定价:</dt>";
		// System.out.println(html);
		// String ss = new String(html.getBytes("utf-8"),"gbk");
		// System.out.println(ss);
		int index1 = 0, index2 = 0;
		index1 = html.indexOf(target, index2);
		if (index1 == -1 || index2 == -1)
			return null;
		index2 = html.indexOf("<dd>", index1);
		index1 = html.indexOf("</dd>", index2);
		if (index1 == -1 || index2 == -1)
			return null;
		String isbn = html.substring(index2 + 4, index1);
		isbn = unescapeHtml4(isbn);
		isbn = isbn.replace("-", "");
		if (isbn.length() > 13) {
			isbn = isbn.substring(0, 13);
			if (isbn.indexOf("/") != -1)
				isbn = isbn.substring(0, 10);
		} else
			isbn = null;

		// System.out.println("isbn:" + isbn);

		return isbn;
	}

	public static List<BookState> getlistBookState(String html) {
		List<BookState> listBookState = new ArrayList<BookState>();
		if (html == null || html.equals(""))
			return listBookState;
		int index1 = 0, index2 = 0;
		index1 = html.indexOf("书刊状态");
		index2 = html.indexOf("/table", index1);
		if (index1 == -1 || index2 == -1)
			return listBookState;
		html = html.substring(index1, index2).trim();
		index2 = 0;
		// System.out.println(html);

		while (true) {
			BookState bookState = new BookState();
			index1 = html.indexOf("width", index2);
			index2 = html.indexOf("</td>", index1);
			if (index1 == -1 || index2 == -1)
				break;
			String callnum = html.substring(index1 + 13, index2).trim();
			bookState.setCallnum(callnum);

			index1 = html.indexOf("width", index2);
			index2 = html.indexOf("</td>", index1);
			if (index1 == -1 || index2 == -1)
				break;
			String barcode = html.substring(index1 + 13, index2).trim();
			bookState.setBarcode(barcode);

			index1 = html.indexOf("title", index2);
			index2 = html.indexOf(">", index1);
			index1 = html.indexOf("</td>", index2);
			if (index1 == -1 || index2 == -1)
				break;
			String readingroom = html.substring(index2 + 1, index1).trim();
			readingroom = readingroom
					.substring(0, readingroom.indexOf("&nbsp")).trim();
			bookState.setReadingroom(readingroom);

			index2 = html.indexOf("width", index1);
			index1 = html.indexOf("</td>", index2);
			if (index1 == -1 || index2 == -1)
				break;
			String state = html.substring(index2 + 13, index1);
			int left = state.indexOf("<");
			if (left != -1) {
				int right = state.indexOf(">");
				left = state.indexOf("<", right);
				state = state.substring(right + 1, left);
			}
			bookState.setState(state);
			// System.out.println(bookState.toString());
			listBookState.add(bookState);
			index2 = index1;
		}
		return listBookState;
	}

	private static String unescapeHtml4(String str) {
		try {
			str = StringEscapeUtils.unescapeHtml4(str);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return str;
	}

	public static void main(String[] args) {
		// ApiInfo api = getApiInfo("9787312027277");
		// if(api == null)
		// System.out.println("weikong!");
		// else
		// System.out.println(api.toString());
		// if(api.getRate() == -1)
		// System.out.println("无评价");
		//
		// String str = "https://book.douban.com/subject/26889865/";
		// String str = "https://book.douban.com/subject/5280644/";
		// List<Double> listPer = getPerList(str);
		// for(int i=0; i<listPer.size(); i++){
		// System.out.println(listPer.get(i));
		// }

		// String str =
		// "http://202.119.83.14:8080/uopac/opac/search_adv_result.php?sType0=02&q0=我们一起&pageSize=100&sort=score&desc=true";
		// getBookList(str);
		// String html = getStringFromNet(str);
		// System.out.println(html);

		// String str =
		// "http://202.119.83.14:8080/uopac/opac/item.php?marc_no=0000607831";
		// String str =
		// "http://202.119.83.14:8080/uopac/opac/item.php?marc_no=0000519083";
		// String html = getStringFromNet(str);
		// System.out.println(html);

		// List<Book> listBook = getBookList(url);
		// System.out.println(listBook.get(0).toString());
		// for(int i=0; i<listBook.size(); i++){
		// System.out.println(listBook.get(i).toString());
		// }

		// getListBookFromNJUST("sfdhk");
		// String bookhref =
		// "http://202.119.83.14:8080/uopac/opac/item.php?marc_no=0000132574";
		// getlistBookState(getStringFromNet(bookhref));
		// System.out.println(getURLDecoderString("java"));
		// System.out.println(getURLDecoderString("http://202.119.83.14:8080/uopac/opac/search_adv_result.php?sType0=02&q0=%E6%95%B0%E6%8D%AE%E7%BB%93%E6%9E%84&pageSize=15&sort=score&desc=true"));
	}

}
