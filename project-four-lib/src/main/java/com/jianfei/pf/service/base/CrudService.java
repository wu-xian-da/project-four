/**
  *project project-frist
  *@author changchun.wu
  *2017年8月4日上午10:20:54
  */
package com.jianfei.pf.service.base;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.jianfei.pf.dao.base.CrudDao;
import com.jianfei.pf.entity.base.BaseEntity;
import com.jianfei.pf.entity.page.Page;

public abstract class CrudService<D extends CrudDao<T>,T extends BaseEntity> extends BaseService {

	@Autowired
	protected D dao;
	
	public int insert(T entity){
		if (entity.getId() != null) {
			return this.dao.update(entity);
		}
		return this.dao.insert(entity);
	}
	
	public int update(T entity){
		return this.dao.update(entity);
	}
	
	public int delete(int id){
		return this.dao.delete(id);
	}
	
	public T findById(int id){
		return this.dao.findById(id);
	}
	
	public List<T> findAll(){
		return this.dao.findAll();
	}
	
	public int findCount(){
		return this.dao.findCount();
	}
	
	public int findCountByT(T entity){
		return this.dao.findCountByT(entity);
	}
	
	public List<T> findCondition(T entity){
		return this.dao.findCondition(entity);
	}
	
	/**
	 * 查询分页数据
	 * @param page 分页对象
	 * @param entity
	 * @return
	 */
	public Page<T> findPage(T entity) {
	    Page<T> page = dao.findPage(entity);
	    page.setEntity(entity);
		return page;
	}
}
