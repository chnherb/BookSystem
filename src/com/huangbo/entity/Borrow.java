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

@Entity
@Table(name = "borrow")
public class Borrow {
	@Id
	@GeneratedValue(generator="system-uuid")
	@GenericGenerator(name = "system-uuid",strategy="uuid")
	@Column(length=32)
	private String id ;
	
	@ManyToOne
	@JoinColumn(name = "readerId", nullable = true)
	@NotFound(action = NotFoundAction.IGNORE)
	private Reader reader;
	
	@ManyToOne
	@JoinColumn(name = "bookId", nullable = true)
	@NotFound(action = NotFoundAction.IGNORE)
	private Bookinfo bookinfo;
	
	private String borrowTime;
	
	private String backTime;
	
	private String isback;
	
	@ManyToOne
	@JoinColumn(name = "managerid", nullable = true)
	@NotFound(action = NotFoundAction.IGNORE)
	private Manager managerid;
	
	private String money;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Reader getReader() {
		return reader;
	}

	public void setReader(Reader reader) {
		this.reader = reader;
	}

	public Bookinfo getBookinfo() {
		return bookinfo;
	}

	public void setBookinfo(Bookinfo bookinfo) {
		this.bookinfo = bookinfo;
	}

	public String getBorrowTime() {
		return borrowTime;
	}

	public void setBorrowTime(String borrowTime) {
		this.borrowTime = borrowTime;
	}

	public String getBackTime() {
		return backTime;
	}

	public void setBackTime(String backTime) {
		this.backTime = backTime;
	}

	public String getIsback() {
		return isback;
	}

	public void setIsback(String isback) {
		this.isback = isback;
	}

	public Manager getManagerid() {
		return managerid;
	}

	public void setManagerid(Manager managerid) {
		this.managerid = managerid;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}
	
	
	
	
}
