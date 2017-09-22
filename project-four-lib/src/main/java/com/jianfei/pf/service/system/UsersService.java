/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月11日上午9:57:55
  */
package com.jianfei.pf.service.system;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jianfei.pf.dao.system.UsersDao;
import com.jianfei.pf.entity.system.Users;
import com.jianfei.pf.service.base.CrudService;

@Service
public class UsersService extends CrudService<UsersDao, Users>{
	
	@Autowired
	private UsersDao usersDao;
	
	public Users findUsersByNcikname(String nickname){
		return this.usersDao.findUsersByNickname(nickname);
	}
	
	public int insertLoginTime(Date loginTime){
		return this.usersDao.insertLoginTime(loginTime);
	}
	
	public int updateLoginTimeAndIp(Users users){
		return this.usersDao.updateLoginTimeAndIp(users);
	}
	
	public int insertUserRoleId(int userId,int roleId){
		return this.usersDao.insertUserRoleId(userId, roleId);
	}
	
}
