/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月11日上午10:00:36
  */
package com.jianfei.pf.service.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jianfei.pf.dao.system.MenusDao;
import com.jianfei.pf.entity.system.Menus;
import com.jianfei.pf.service.base.CrudService;

@Service
public class MenusService extends CrudService<MenusDao, Menus> {

	@Autowired
	private MenusDao menusDao;
	
	/**
	 * 根据类型菜单查询权限
	 * @return
	 */
	public List<Menus> findMenusByType(){
		return this.menusDao.findMenusByType();
	}
	
	/**
	 * 根据类型按钮查询权限
	 * @return
	 */
	public List<Menus> findButtonByType(){
		return this.menusDao.findButtonByType();
	}
	
	public List<Menus> findTitlesByType(){
		return this.menusDao.findTitlesByType();
	}
	
	public Menus findMenusByPermission(String permission){
		return this.menusDao.findMenusByPermission(permission);
	}

}
