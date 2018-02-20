package com.huangbo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import com.huangbo.entity.BookType;
import com.huangbo.entity.Manager;
import com.huangbo.entity.BookCase;
/**
 * 书类
 * @author Huangbo
 *
 */
@Entity
@Table(name="bookinfo")
public class Bookinfo {
	@Id
	@GeneratedValue(generator="system-uuid")
	@GenericGenerator(name = "system-uuid",strategy="uuid")
	@Column(length=32)
	private String id;
	
	private String bookname;
	
	private String isbn;
	
	
	
	@ManyToOne
	@JoinColumn(name = "typeid", nullable = true)
	@NotFound(action = NotFoundAction.IGNORE)
	private BookType booktype;
	
	private String bookauthor;
	
	private int bookprice;
	/**
	 * 实际有多少书
	 */
	private int totalbook;
	
	/**
	 * 现有多少书
	 */
	private int currbook;
	
	@ManyToOne
	@JoinColumn(name = "caseid", nullable = true)
	@NotFound(action = NotFoundAction.IGNORE)
	private BookCase bookcase;
	
	private String bookintime;
	
	@ManyToOne
	@JoinColumn(name = "operatorid", nullable = true)
	@NotFound(action = NotFoundAction.IGNORE)
	private Manager manager;
	
	
	private String bookcomment;
	
	private String bookaddress;
	
	private int bookcode;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}


	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public BookType getBooktype() {
		return booktype;
	}

	public void setBooktype(BookType booktype) {
		this.booktype = booktype;
	}

	public String getBookauthor() {
		return bookauthor;
	}

	public void setBookauthor(String bookauthor) {
		this.bookauthor = bookauthor;
	}

	public int getBookprice() {
		return bookprice;
	}

	public void setBookprice(int bookprice) {
		this.bookprice = bookprice;
	}

	public int getTotalbook() {
		return totalbook;
	}

	public void setTotalbook(int totalbook) {
		this.totalbook = totalbook;
	}

	public int getCurrbook() {
		return currbook;
	}

	public void setCurrbook(int currbook) {
		this.currbook = currbook;
	}

	public BookCase getBookcase() {
		return bookcase;
	}

	public void setBookcase(BookCase bookcase) {
		this.bookcase = bookcase;
	}

	public String getBookintime() {
		return bookintime;
	}

	public void setBookintime(String bookintime) {
		this.bookintime = bookintime;
	}

	public Manager getManager() {
		return manager;
	}

	public void setManager(Manager manager) {
		this.manager = manager;
	}

	public String getBookcomment() {
		return bookcomment;
	}

	public void setBookcomment(String bookcomment) {
		this.bookcomment = bookcomment;
	}

	public String getBookaddress() {
		return bookaddress;
	}

	public void setBookaddress(String bookaddress) {
		this.bookaddress = bookaddress;
	}

	public int getBookcode() {
		return bookcode;
	}

	public void setBookcode(int bookcode) {
		this.bookcode = bookcode;
	}
	

	
}
