/**
  *project project-second-web
  *@author changchun.wu
  *2017年8月29日上午9:38:45
  */
package com.jianfei.pf.common.interceptor;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jianfei.pf.entity.system.LogAccess;
import com.jianfei.pf.service.system.LogAccessService;
import com.jianfei.pf.service.system.RolesService;
import com.jianfei.pf.tools.utils.HttpUtils;

public class LogAccessInterceptor extends HandlerInterceptorAdapter{
	
	public String defultLogin = "/";//默认页面

	@Autowired
	private LogAccessService logAccessService;
	
	@Autowired
	private RolesService rolesService;
	
	public void postHandle(HttpServletRequest request,HttpServletResponse response,Object handler,ModelAndView modelAndView) throws Exception{
		String loginStatus = (String) request.getSession().getAttribute("loginStatus");
		
		if (loginStatus == "success" || request.getRequestURI() .equals("/")) {
			//System.out.println(loginStatus);
			try {
				if (!request.getRequestURI() .equals("/log/access") && !request.getRequestURI() .equals("/") ) {
					this.logAccessService.insert(new LogAccess((String)request.getSession().getAttribute("usernickname"),request.getRequestURI(),
							new Date(),HttpUtils.getRemoteAddr(request)));
				} 
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println(loginStatus);
			response.sendRedirect(request.getContextPath()+defultLogin); 
			System.out.println(11111111);
		}
		
	}
	
	public String getDefultLogin() {  
        return defultLogin;  
    }  
  
    public void setDefultLogin(String defultLogin) {  
        this.defultLogin = defultLogin;  
    } 
}
