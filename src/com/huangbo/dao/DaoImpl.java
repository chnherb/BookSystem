package com.huangbo.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huangbo.entity.PageData;

@Service
public class DaoImpl implements Dao {

	private SessionFactory sessionFactory;
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public <T> Object getClass(Class<T> clazz, String id) {
		String clas = clazz.getName().substring(clazz.getName().lastIndexOf(".")+1);
		
		String hql = "from "+clas+" u where u.id=?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, id);
		
		return (Object)query.uniqueResult();
		//Object object =sessionFactory.getCurrentSession().get(clazz, id);
	}

	@Override
	public <T> List<T> getList(Class<T> clazz) {
		
		String clas = clazz.getName().substring(clazz.getName().lastIndexOf(".")+1);
		
		String hql = "from "+clas;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		//用于分页
		//query.setFirstResult(0);//就是说你的从第几条开始
		//query.setMaxResults(4);//页面默认显示的条数
		
		
		return query.list();
		//session.createQuery("select item.order from Item item where item.productName='Hibernate'").list(); 
	}
	
	@Override
	public <T> PageData<T> getPageData(Class<T> clazz, PageData<T> pageData) {
		
		String clas = clazz.getName().substring(clazz.getName().lastIndexOf(".")+1);
		
		String hql = "from "+clas;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		//用于分页
		query.setFirstResult(pageData.getPageSize()*(pageData.getCurrPage()-1));//就是说你的从第几条开始
		query.setMaxResults(pageData.getPageSize());//页面默认显示的条数
		
		List<T> list = query.list();
		pageData.setList(list);
		
		/*String sqltotal = "select count(*) from "+ Utils.getRealTableName(clazz);
		BigInteger total = (BigInteger)sessionFactory.getCurrentSession().createSQLQuery(sqltotal).uniqueResult();
		int n = total.intValue();*/
		
		Query query1 = sessionFactory.getCurrentSession().createQuery(hql.toString());
		List<T> listtotal = query1.list();
		
		int n =listtotal.size();
		pageData.setTotal(n);
		int page = n%pageData.getPageSize()==0?n/pageData.getPageSize():n/pageData.getPageSize()+1;
		pageData.setPage(page);
		
		return pageData;
	}

	@Override
	public  void save(Object clazz) {
		sessionFactory.getCurrentSession().save(clazz);
	}

	@Override
	public <T> boolean delete(Class<T> clazz, String id) {
		
		String clas = clazz.getName().substring(clazz.getName().lastIndexOf(".")+1);
		
		String hql = "delete "+clas+" u where u.id = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, id);
		
		return (query.executeUpdate() > 0);
	}

	//@Override
	public boolean update(Object clazz) {
		try{
			Session session =sessionFactory.getCurrentSession();
			session.merge(clazz);
			//sessionFactory.getCurrentSession().update(clazz);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		
		/*String hql = "update User u set u.userName = ?,u.age=? where u.id = ?";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString(0, user.getUserName());
		query.setString(1, user.getAge());
		query.setString(2, user.getId());*/
		
		//return (query.executeUpdate() > 0);
	}

	@Override
	public <T> PageData<T> getPageDataHql(Class<T> clazz, PageData<T> pageData,
			String sql) {
		String clas = clazz.getName().substring(clazz.getName().lastIndexOf(".")+1);
		StringBuilder hql = new StringBuilder();
		hql.append(" from ").append(clas).append(" where 1=1 ");
		 //hql = "from "+clas;
		if(!sql.contentEquals("")){
			hql.append(" and ").append(sql);
		}
		Query query = sessionFactory.getCurrentSession().createQuery(hql.toString());
		//用于分页
		query.setFirstResult(pageData.getPageSize()*(pageData.getCurrPage()));//就是说你的从第几条开始
		query.setMaxResults(pageData.getPageSize());//页面默认显示的条数
		List<T> list = query.list();
		pageData.setList(list);
		
		Query query1 = sessionFactory.getCurrentSession().createQuery(hql.toString());
		List<T> listtotal = query1.list();
		
		int n =listtotal.size();
		pageData.setTotal(n);
		
		int page = n%pageData.getPageSize()==0?n/pageData.getPageSize():n/pageData.getPageSize()+1;
		System.out.println("hql:" + hql);
		System.out.println("sql:" + sql);
		System.out.println("page:" + page);
		System.out.println("list_size:" + list.size());
		System.out.println("listTotal_size:" + listtotal.size());
		pageData.setPage(page);
		
		return pageData;
	}

	@Override
	public <T> List<T> getListHql(Class<T> clazz, String sql) {
		String clas = clazz.getName().substring(clazz.getName().lastIndexOf(".")+1);
		
		String hql = "from "+clas;
		if(!sql.contentEquals("")){
			hql += " where 1=1 "+sql;
		}
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

}
