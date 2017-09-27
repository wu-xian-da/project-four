/**
  *project project-four-web-forum
  *@author changchun.wu
  *2017年9月24日下午5:39:20
  */
package com.jianfei.pf.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogoutInterceptor extends HandlerInterceptorAdapter{
	
	public String defultLogin = "/";//默认页面
	
	
	@Override
	public void postHandle(HttpServletRequest request,HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
		String url = (String) request.getRequestURI();
		System.out.println(url+"--");
	}
	
	
	public String getDefultLogin() {  
        return defultLogin;  
    }  
  
    public void setDefultLogin(String defultLogin) {  
        this.defultLogin = defultLogin;  
    }  
	
}
