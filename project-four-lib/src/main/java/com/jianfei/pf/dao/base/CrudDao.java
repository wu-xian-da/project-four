/**
  *project project-frist
  *@author changchun.wu
  *2017年8月4日上午10:11:16
  */
package com.jianfei.pf.dao.base;

import java.util.List;

import com.jianfei.pf.entity.page.Page;

public interface CrudDao<T> extends BaseDao {

	public int insert(T entity);
	
	public int update(T entity);
	
	public int delete(int id);
	
	public T findById(int id);
	
	public List<T> findAll();
	
	public int findCount();
	
	public int findCountByT(T entity);
	
	/***
	 * 条件查询
	 * @param entity
	 * @return
	 */
	public List<T> findCondition(T entity);
	
	public Page<T> findPage(T entity);
	
}
