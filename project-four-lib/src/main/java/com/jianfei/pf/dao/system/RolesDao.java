/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月11日上午9:55:45
  */
package com.jianfei.pf.dao.system;

import com.jianfei.pf.dao.base.CrudDao;
import com.jianfei.pf.entity.system.Roles;

public interface RolesDao extends CrudDao<Roles>{

	/***
	 * 根据角色名称查询Roles
	 * @param roles
	 * @return
	 */
	public Roles findRolesByRolename(String rolename);
	
	/***
	 * 添加角色与权限之间的关系
	 * @param id
	 * @param parentId
	 * @param childId
	 * @return
	 */
	//public int insertRoleMenu(int id,int titleId,int menuId,int buttonId);
	
	public int insertRoleMenu(int id,int menubutton);
}
