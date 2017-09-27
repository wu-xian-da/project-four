/**
  *project project-three-web
  *@author changchun.wu
  *2017年9月4日上午10:03:55
  */
package com.jianfei.pf.common;

import org.springframework.ui.Model;

import com.jianfei.pf.entity.base.BaseEntity;

public class PageController<T extends BaseEntity> {
	
	/***
	 * 页面传输的pn,ps
	 * @param model
	 * @param entity
	 */
	public void setPNPS(Model model,T entity){
		//分页操作
		model.addAttribute("page",entity);
		//页面传输的pn,ps
		entity.setPn(entity.getPn()*entity.getPs());
		entity.setPs(entity.getPs());
	}
	
	/***
	 * 数值变化
	 * @param model
	 * @param entity
	 */
	public void ValueChange(Model model,T entity){
		//上一页的数值变化
		model.addAttribute("bianPageShang",entity.pn/entity.ps-1);
		//下一页的数值变化
		model.addAttribute("bianPageXia",entity.pn/entity.ps+1);
		
	}
	
	/***
	 * 查询条件为null
	 * @param model
	 * @param entity
	 * @param totalRecord
	 */
	public void findPage(Model model,T entity,int totalRecord){
		//总记录条数
		model.addAttribute("totalRecord",totalRecord);
		//分页的页数
		int pageNo = (totalRecord % entity.pageSize) == 0 ? totalRecord / entity.pageSize : totalRecord / entity.pageSize + 1 ;
		model.addAttribute("pageNo",pageNo);
		//上下页的变化
		new PageController<T>().ValueChange(model, entity);
		
		model.addAttribute("jspurl","");
	}
	
	/***
	 * 查询条件不为null
	 * @param model
	 * @param entity
	 * @param totalRecord
	 */
	public void findPageCondition(Model model,T entity,int totalRecord){
		//条件查询总记录条数
		model.addAttribute("totalRecord",totalRecord);
		//分页的页数
		int pageNo = (totalRecord % entity.pageSize) == 0 ? totalRecord / entity.pageSize : totalRecord / entity.pageSize + 1 ;
		model.addAttribute("pageNo",pageNo);
		//上下页的变化
		new PageController<T>().ValueChange(model, entity);
	}
}
