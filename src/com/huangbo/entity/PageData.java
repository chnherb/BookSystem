package com.huangbo.entity;

import java.util.List;

public class PageData<T> {
	/**
	 * ��ҳ��
	 */
	private int page;
	/**
	 * ҳ��С
	 */
	private int pageSize=8;
	/**
	 * ����
	 */
	private List<T> list; 
	/**
	 * ��ǰҳ��
	 */
	private int currPage;
	/**
	 * �ܵ�������
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
