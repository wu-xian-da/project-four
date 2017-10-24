/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月14日下午2:07:48
  */
package com.jianfei.pf.dao.relation;

import java.util.List;

import com.jianfei.pf.dao.base.CrudDao;
import com.jianfei.pf.entity.relation.RoleMenu;

public interface RoleMenuDao extends CrudDao<RoleMenu> {

	/***
	 * 根据roleId查询RoleMenu
	 * @param id
	 * @return
	 */
	public List<RoleMenu> findRoleByRoleId(int id);
	
	public List<RoleMenu> findRolesRoleId();
	
	/***
	 * 查询角色与权限之间的关联
	 * @param roleId
	 * @return
	 */
	public List<RoleMenu> findTMBMenusByRoles(int roleId);
	
	public RoleMenu findByRoleIdAndMenuId(int roleId,int menusId);
	
}
