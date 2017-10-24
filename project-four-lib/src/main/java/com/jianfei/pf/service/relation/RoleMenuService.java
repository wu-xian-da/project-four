/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月14日下午2:08:26
  */
package com.jianfei.pf.service.relation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jianfei.pf.dao.relation.RoleMenuDao;
import com.jianfei.pf.entity.relation.RoleMenu;
import com.jianfei.pf.service.base.CrudService;

@Service
public class RoleMenuService extends CrudService<RoleMenuDao, RoleMenu> {
	
	@Autowired
	private RoleMenuDao roleMenuDao;
	
	public List<RoleMenu> findRoleByRoleId(int id){
		return this.roleMenuDao.findRoleByRoleId(id);
	}
	
	public List<RoleMenu> findRolesRoleId(){
		return this.roleMenuDao.findRolesRoleId();
	}
	
	/***
	 * 查询角色与权限之间的关联
	 * @param roleId
	 * @return
	 */
	public List<RoleMenu> findTMBMenusByRoles(int roleId){
		return this.roleMenuDao.findTMBMenusByRoles(roleId);
	}

	public RoleMenu findByRoleIdAndMenuId(int roleId,int menusId){
		return this.dao.findByRoleIdAndMenuId(roleId, menusId);
	}
}
