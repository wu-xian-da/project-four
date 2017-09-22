/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月11日上午9:55:58
  */
package com.jianfei.pf.dao.system;

import java.util.List;

import com.jianfei.pf.dao.base.CrudDao;
import com.jianfei.pf.entity.system.Menus;

public interface MenusDao extends CrudDao<Menus>{

	/**
	 * 根据类型菜单查询权限
	 * @return
	 */
	public List<Menus> findMenusByType();
	
	/**
	 * 根据类型按钮查询权限
	 * @return
	 */
	public List<Menus> findButtonByType();
	
	public List<Menus> findTitlesByType();
	
	public Menus findMenusByPermission(String permission);
}
