/**
  *project project-three-web
  *@author changchun.wu
  *2017年9月4日下午5:19:52
  */
package com.jianfei.pf.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.jianfei.pf.entity.relation.RoleMenu;
import com.jianfei.pf.entity.relation.UserRole;
import com.jianfei.pf.service.relation.RoleMenuService;
import com.jianfei.pf.service.relation.UserRoleService;
import com.jianfei.pf.service.system.UsersService;

public class TMBSelect extends BodyTagSupport{

	@Autowired
	private RoleMenuService roleMenuService;
	
	@Autowired
	private UserRoleService userRoleService;
	
	@Autowired
	private UsersService usersService;
	
	public void findtmbname(HttpServletRequest request,UserRole userRole){
		
		request.getSession().setAttribute("tmbname", this.roleMenuService.findTMBMenusByRoles(userRole.getRoleId()));
	}
	
	/***
	 * 1.先在方法里设置list集合
	 * 2.根据角色查询菜单,并且遍历所查询到的对象集合
	 * 3.将遍历的集合里权限标识符permission放入已经设置的集合中
	 * 4.再将集合list放入session中,带出
	 * @param request
	 * @param model
	 */
	public void findbuttons(HttpServletRequest request,Model model){
		List<String> list = new ArrayList<String>();
		
		List<RoleMenu> rm = this.roleMenuService.findTMBMenusByRoles(Integer.parseInt(request.getParameter("roleId")));
			Iterator<RoleMenu> it = rm.iterator();
			while (it.hasNext()) {
				RoleMenu roleMenu = (RoleMenu) it.next();
				list.add(roleMenu.getRoleTMB().getPermission());
			}
		request.getSession().setAttribute("power_button", list);
	}
	
	
	private String target;//设置标签内的属性
	
	/***
	 * 自定义标签中的方法
	 * doEndTag()方法是在遇到标签结束时呼叫的方法，其合法的返回值是EVAL_PAGE与SKIP_PAGE，
	 * EVAL_PAGE表示处理完标签后继续执行以下的JSP网页，
	 * SKIP_PAGE是表示不处理接下来的JSP网页 
	 */
	@Override
	public int doEndTag() throws JspException {
		String code = getTarget();
		Object power = pageContext.getSession().getAttribute("power_button");//获取权限参数
		if (power == null) {
			return SKIP_BODY;
		}
		List<String> privilege = (List<String>)power;
		//如果session中的privilege含有该权限，则显示其中的内容,否则跳过
		if (privilege.contains(code)) {
			try {
				pageContext.getOut().print(bodyContent.getString());//显示其中的内容
			} catch (IOException e) {
				e.printStackTrace();
			} 
			return EVAL_PAGE;
		}
		return SKIP_BODY;
		
	}
	
	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}
}
/* 
 * doStartTag()方法是遇到标签开始时会呼叫的方法，其合法的返回值是EVAL_BODY_INCLUDE与SKIP_BODY,前者表示将显示标签间的文字，后者表示不显示标签间的文字 
 * doEndTag()方法是在遇到标签结束时呼叫的方法，其合法的返回值是EVAL_PAGE与SKIP_PAGE，前者表示处理完标签后继续执行以下的JSP网页，后者是表示不处理接下来的JSP网页 
 * doAfterBody(),这个方法是在显示完标签间文字之后呼叫的，其返回值有EVAL_BODY_AGAIN与SKIP_BODY，前者会再显示一次标签间的文字，后者则继续执行标签处理的下一步 
 * EVAL_BODY_INCLUDE：把Body读入存在的输出流中，doStartTag()函数可用 
 * EVAL_PAGE：继续处理页面，doEndTag()函数可用 
 * SKIP_BODY：忽略对Body的处理，doStartTag()和doAfterBody()函数可用 
 * SKIP_PAGE：忽略对余下页面的处理，doEndTag()函数可用 
 * EVAL_BODY_BUFFERED：申请缓冲区，由setBodyContent()函数得到的BodyContent对象来处理tag的body，如果类实现了BodyTag，那么doStartTag()可用，否则非法 
 * EVAL_BODY_AGAIN：请求继续处理body，返回自doAfterBody()，这个返回值在你制作循环tag的时候是很有用的 
 * 预定的处理顺序是：doStartTag()返回SKIP_BODY,doAfterBodyTag()返回SKIP_BODY,doEndTag()返回EVAL_PAGE 
 * 如果继承了TagSupport之后，如果没有改写任何的方法，标签处理的执行顺序是：doStartTag() ->不显示文字 
 * ->doEndTag()->执行接下来的网页 如果您改写了doStartTag(),则必须指定返回值, 
 * 如果指定了EVAL_BODY_INCLUDE,则执行顺序是：doStartTag()->显示文字->doAfterBodyTag()->doEndTag()->执行下面的网页 
 */  
