package com.huangbo.dao;

import java.util.List;

import com.huangbo.entity.PageData;

public interface Dao {
	/**
	 * 获取已知id的数据
	 * @param clazz
	 * @param id
	 * @return
	 */
	public <T> Object getClass(Class<T> clazz, String id);
	/**
	 * 获取所有数据
	 * @param clazz
	 * @return
	 */
	public <T> List<T> getList(Class<T> clazz);
	/**
	 * 保存数据
	 * @param clazz
	 */
	public void save(Object clazz);
	/**
	 * 删除已知ID的数据
	 * @param clazz
	 * @param id
	 * @return
	 */
	public <T> boolean delete(Class<T> clazz, String id);
	/**
	 * 更新数据
	 * @param clazz
	 * @return
	 */
	public boolean update(Object clazz);
	/**
	 * 分页获取所有数据
	 * @param clazz
	 * @param pageData
	 * @return
	 */
	public <T> PageData<T> getPageData(Class<T> clazz, PageData<T> pageData);
	/**
	 * 条件分页
	 * @param clazz
	 * @param pageData
	 * @param hql
	 * @return
	 */
	public <T> PageData<T> getPageDataHql(Class<T> clazz, PageData<T> pageData, String hql);
	
	public <T> List<T> getListHql(Class<T> clazz, String hql);
}
