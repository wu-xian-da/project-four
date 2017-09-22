/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月28日下午2:48:54
  */
package com.jianfei.pf.service.system;

import org.springframework.stereotype.Service;

import com.jianfei.pf.dao.system.LogLoginDao;
import com.jianfei.pf.entity.system.LogLogin;
import com.jianfei.pf.service.base.CrudService;

@Service
public class LogLoginService extends CrudService<LogLoginDao, LogLogin> {

}
