/**
  *project project-three-web
  *@author changchun.wu
  *2017年9月4日下午4:54:21
  */
package com.jianfei.pf.common;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.jianfei.pf.entity.common.LoginStatus;
import com.jianfei.pf.entity.system.LogLogin;
import com.jianfei.pf.service.system.LogLoginService;
import com.jianfei.pf.tools.utils.HttpUtils;

public class LogLoginInsert {
	
	@Autowired
	private LogLoginService logLoginService;
	
	public void loginSuccess(HttpServletRequest request,LoginStatus status) throws Exception{
		
		this.logLoginService.insert(new LogLogin((String)request.getSession().getAttribute("usernickname"),new Date(), 
						"Window 10.0 ,Eclipse 4.4, JDK 1.7,Chrome 57.0.2987.133",HttpUtils.getRemoteAddr(request),status.SUCCESS));
			
	}
	
	public void loginFial(HttpServletRequest request,LoginStatus status) throws Exception{
		
		this.logLoginService.insert(new LogLogin((String)request.getSession().getAttribute("usernickname"),new Date(), 
						"Window 10.0 ,Eclipse 4.4, JDK 1.7,Chrome 57.0.2987.133",HttpUtils.getRemoteAddr(request),status.FIAL));
			
	}
}