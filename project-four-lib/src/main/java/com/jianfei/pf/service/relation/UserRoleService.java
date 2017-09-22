/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月12日下午1:09:06
  */
package com.jianfei.pf.service.relation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jianfei.pf.dao.relation.UserRoleDao;
import com.jianfei.pf.entity.relation.UserRole;
import com.jianfei.pf.service.base.CrudService;

@Service
public class UserRoleService extends CrudService<UserRoleDao, UserRole> {

	@Autowired
	private UserRoleDao userRoleDao;
	
	/***
	 * 查角色ID
	 * @return
	 */
	public List<UserRole> findAllRoleId(){
		return this.userRoleDao.findAllRoleId();
	}
	
	/***
	 * 查询用户ID
	 * @return
	 */
	public List<UserRole> findAllUserId(){
		return this.userRoleDao.findAllUserId();
	}
	
}
