package com.huangbo.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huangbo.dao.Dao;
import com.huangbo.entity.PageData;

@Service
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	private Dao Dao;
	
	public void setDao(Dao Dao) {
		this.Dao = Dao;
	}

	public <T> Object getClass(Class<T> clazz, String id) {
		return Dao.getClass(clazz, id);
	}

	@Override
	public <T> List<T> getList(Class<T> clazz) {
		return Dao.getList(clazz);
	}

	@Override
	public void save(Object clazz) {
		Dao.save(clazz);
	}

	public <T> boolean delete(Class<T> clazz, String id) {
		
		return Dao.delete(clazz, id);
	}

	@Override
	public boolean update(Object clazz) {
		return Dao.update(clazz);
	}

	@Override
	public <T> PageData<T> getPageData(Class<T> clazz, PageData<T> pageData) {
		return Dao.getPageData(clazz, pageData);
	}

	@Override
	public <T> PageData<T> getPageDataHql(Class<T> clazz, PageData<T> pageData,
			String hql) {
		return Dao.getPageDataHql(clazz, pageData, hql);
	}

	@Override
	public <T> List<T> getListHql(Class<T> clazz, String hql) {
		// TODO Auto-generated method stub
		return Dao.getListHql(clazz, hql);
	}

}
