package com.huangbo.entity;

public class ApiInfo {
	//书本详细信息网页地址
	private String alternateHref;
	//书本图片
	private String imageHref;
	//内容简介
	private String summary;
	
	private String isbn;
	//本书名称
	private String title;
	//页数
	private String pages;

	private String author;
	
	private String price;
	//出版社
	private String publisher;
	//装帧
	private String binding;
	//出版年
	private String pubdate;
	//作者简介
	private String authorIntro;
	//评分
	private double rate;
	//评分人数
	private int numRaters;
	public String getAlternateHref() {
		return alternateHref;
	}
	public void setAlternateHref(String alternateHref) {
		this.alternateHref = alternateHref;
	}
	public String getImageHref() {
		return imageHref;
	}
	public void setImageHref(String imageHref) {
		this.imageHref = imageHref;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPages() {
		return pages;
	}
	public void setPages(String pages) {
		this.pages = pages;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getBinding() {
		return binding;
	}
	public void setBinding(String binding) {
		this.binding = binding;
	}
	public String getPubdate() {
		return pubdate;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	public String getAuthorIntro() {
		return authorIntro;
	}
	public void setAuthorIntro(String authorIntro) {
		this.authorIntro = authorIntro;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public int getNumRaters() {
		return numRaters;
	}
	public void setNumRaters(int numRaters) {
		this.numRaters = numRaters;
	}
	
	public String toString(){
		StringBuffer sb = new StringBuffer();
		sb.append("[alternateHref:" + this.alternateHref + ",\n");
		sb.append("imageHref:" + this.imageHref + ",\n");
		sb.append("summary:" + this.summary + ",\n");
		sb.append("isbn:" + this.isbn + ",\n");
		sb.append("title:" + this.title + ",\n");
		sb.append("pages:" + this.pages + ",\n");
		sb.append("author:" + this.author + ",\n");
		sb.append("price:" + this.price + ",\n");
		sb.append("publisher:" + this.publisher + ",\n");
		sb.append("binding:" + this.binding + ",\n");
		sb.append("pubdate:" + this.pubdate + ",\n");
		sb.append("authorIntro:" + this.authorIntro + ",\n");
		sb.append("rate:" + this.rate + ",\n");
		sb.append("numRaters:" + this.numRaters + "]");
		return sb.toString();
	}
	
	
	
}
