package com.huangbo.dao;

import java.util.List;

import com.huangbo.entity.PageData;

public interface Dao {
	/**
	 * ��ȡ��֪id������
	 * @param clazz
	 * @param id
	 * @return
	 */
	public <T> Object getClass(Class<T> clazz, String id);
	/**
	 * ��ȡ��������
	 * @param clazz
	 * @return
	 */
	public <T> List<T> getList(Class<T> clazz);
	/**
	 * ��������
	 * @param clazz
	 */
	public void save(Object clazz);
	/**
	 * ɾ����֪ID������
	 * @param clazz
	 * @param id
	 * @return
	 */
	public <T> boolean delete(Class<T> clazz, String id);
	/**
	 * ��������
	 * @param clazz
	 * @return
	 */
	public boolean update(Object clazz);
	/**
	 * ��ҳ��ȡ��������
	 * @param clazz
	 * @param pageData
	 * @return
	 */
	public <T> PageData<T> getPageData(Class<T> clazz, PageData<T> pageData);
	/**
	 * ������ҳ
	 * @param clazz
	 * @param pageData
	 * @param hql
	 * @return
	 */
	public <T> PageData<T> getPageDataHql(Class<T> clazz, PageData<T> pageData, String hql);
	
	public <T> List<T> getListHql(Class<T> clazz, String hql);
}
