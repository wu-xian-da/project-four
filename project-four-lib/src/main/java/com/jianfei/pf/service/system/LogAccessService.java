/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月29日上午9:06:51
  */
package com.jianfei.pf.service.system;

import org.springframework.stereotype.Service;

import com.jianfei.pf.dao.system.LogAccessDao;
import com.jianfei.pf.entity.system.LogAccess;
import com.jianfei.pf.service.base.CrudService;

@Service
public class LogAccessService extends CrudService<LogAccessDao, LogAccess>{

}
