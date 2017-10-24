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

import com.jianfei.pf.entity.relation.RoleMenu;
import com.jianfei.pf.entity.system.LogAccess;
import com.jianfei.pf.entity.system.Menus;
import com.jianfei.pf.service.relation.RoleMenuService;
import com.jianfei.pf.service.system.LogAccessService;
import com.jianfei.pf.service.system.MenusService;
import com.jianfei.pf.service.system.RolesService;
import com.jianfei.pf.tools.utils.HttpUtils;

public class LogAccessInterceptor extends HandlerInterceptorAdapter{
	
	public String defultLogin = "/";//默认页面

	@Autowired
	private LogAccessService logAccessService;
	
	@Autowired
	private RolesService rolesService;
	
	@Autowired
	private MenusService menusService;
	
	@Autowired
	private RoleMenuService roleMenuService;
	
	public void postHandle(HttpServletRequest request,HttpServletResponse response,Object handler,ModelAndView modelAndView) throws Exception{
		String powerstr = null;
		String loginStatus = (String) request.getSession().getAttribute("loginStatus");
		
		/*List<String> list = (List<String>) request.getSession().getAttribute("power_button");
		Iterator<String> it = list.iterator();
		while (it.hasNext()) {
			String string = (String) it.next();
			//String strings[] = string.split(":");
			
			//System.out.println(strings[0]+"/"+strings[1]+"/"+strings[2]+"================");
				
			
			System.out.println(string+"-=-=-=+");
			if (string.equals(powerstr)) {
				//response.sendRedirect(request.getContextPath()+defultLogin); 
				break;
			}
			
		}*/
		if (loginStatus == "success" || request.getRequestURI() .equals("/")) {
			//System.out.println(loginStatus);
			try {
				if (!request.getRequestURI().equals("/log/access") && !request.getRequestURI() .equals("/") ) {
					String str = request.getRequestURI();
					String strs[] = str.split("/");
					
					if (strs.length > 3) {
						powerstr = strs[2]+":"+strs[3];
						System.out.println(powerstr);
						Integer roleId = Integer.parseInt((String) request.getSession().getAttribute("roleId"));
						Menus menus = menusService.findMenusByPermission(powerstr);
						if (menus != null) {
							RoleMenu roleMenu = roleMenuService.findByRoleIdAndMenuId(roleId, menus.getId());
							System.out.println(roleMenu);
							if (roleMenu == null) {
								response.sendRedirect(request.getContextPath()+defultLogin);
								System.out.println("对不起!你没有该权限操作");
							} 
						}
					}
					this.logAccessService.insert(new LogAccess((String)request.getSession().getAttribute("usernickname"),
							request.getRequestURI(),new Date(),HttpUtils.getRemoteAddr(request)));
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
