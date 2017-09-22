/**
  *project project-three-lib
  *@author changchun.wu
  *2017年9月6日上午9:57:58
  */
package com.jianfei.pf.common.interceptor;

import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Signature;

import com.mysql.jdbc.Connection;

@Intercepts(@Signature(type = StatementHandler.class,method = "prepare", args = {Connection.class,Integer.class}))
public class PageInterceptor {
	
	
	
}
