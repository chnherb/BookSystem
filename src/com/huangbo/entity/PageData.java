package com.huangbo.entity;

import java.util.List;

public class PageData<T> {
	/**
	 * 总页数
	 */
	private int page;
	/**
	 * 页大小
	 */
	private int pageSize=8;
	/**
	 * 数据
	 */
	private List<T> list; 
	/**
	 * 当前页数
	 */
	private int currPage;
	/**
	 * 总的数据数
	 */
	private int total;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
}
