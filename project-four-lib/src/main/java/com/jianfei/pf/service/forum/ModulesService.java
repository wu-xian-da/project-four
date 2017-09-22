/**
  *project project-three-lib
  *@author changchun.wu
  *2017年9月15日上午10:20:33
  */
package com.jianfei.pf.service.forum;

import java.util.List;

import org.springframework.stereotype.Service;

import com.jianfei.pf.dao.forum.ModulesDao;
import com.jianfei.pf.entity.forum.Modules;
import com.jianfei.pf.service.base.CrudService;

@Service
public class ModulesService extends CrudService<ModulesDao, Modules> {
	
	/***
	 * 根据父级ID查询父模块下的子模块
	 * @param parentId
	 * @return
	 */
	public List<Modules> findModulesByParentId(int parentId){
		return this.dao.findModulesByParentId(parentId);
	}
}
