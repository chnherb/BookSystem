package com.huangbo.entity;

import java.util.List;

public class Book {
	private String id;
	private String bookName;
	private String type;
	private String isbn;
	private String author;
	private double price;
	private String state;
	private String summary;
	private String publisher;
	private String readingroom;
	private String href;
	private String callnum;
	//private List<BookState> listBookState;
//	public List<BookState> getListBookState() {
//		return listBookState;
//	}
//	public void setListBookState(List<BookState> listBookState) {
//		this.listBookState = listBookState;
//	}
	public String getCallnum() {
		return callnum;
	}
	public void setCallnum(String callnum) {
		this.callnum = callnum;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getReadingroom() {
		return readingroom;
	}
	public void setReadingroom(String readingroom) {
		this.readingroom = readingroom;
	}
	
	public String toString(){
		StringBuffer sb = new StringBuffer();
		sb.append("[bookName:" + this.bookName + "\n");
		sb.append("author:" + this.author + "\n");
		sb.append("isbn:" + this.isbn + "\n");
		sb.append("id:" + this.id + "\n");
		sb.append("publisher:" + this.publisher + "\n");
		sb.append("href:" + this.href + "\n");
		sb.append("callnum:" + this.callnum + "]\n");
//		sb.append("listBookState:" + "\n");
//		if(this.listBookState != null){
//			for(int i=0; i<this.listBookState.size(); i++){
//				sb.append(this.listBookState.get(i).toString() + "\n");
//			}
//		}
//		else
//		{
//			sb.append("null\n");
//		
//		}
		
		return sb.toString();
	}
}
