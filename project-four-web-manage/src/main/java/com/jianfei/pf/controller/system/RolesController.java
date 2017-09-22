/**
  *project project-frist
  *@author changchun.wu
  *2017年8月4日上午10:48:16
  */
package com.jianfei.pf.controller.system;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jianfei.pf.common.PageController;
import com.jianfei.pf.common.TMBSelect;
import com.jianfei.pf.entity.system.Roles;
import com.jianfei.pf.service.relation.RoleMenuService;
import com.jianfei.pf.service.relation.UserRoleService;
import com.jianfei.pf.service.system.MenusService;
import com.jianfei.pf.service.system.RolesService;


@Controller
@RequestMapping("/system/roles")
public class RolesController {
	
	@Autowired
	private RolesService rolesService;
	
	@Autowired
	private MenusService menusService;
	
	@Autowired
	private UserRoleService userRoleService;
	
	@Autowired
	private RoleMenuService roleMenuService;
	
	@Autowired
	protected PageController<Roles> pageController;
	
	@Autowired
	private TMBSelect tmbSelect;
	
	private void setModel (Model model) {
		//用户与角色关联
		model.addAttribute("userRole",userRoleService.findAllUserId());
		//根据类型父级菜单查询权限
		model.addAttribute("title",menusService.findTitlesByType());
		//根据类型子级菜单查询权限
		model.addAttribute("menu",menusService.findMenusByType());
		//根据类型按钮查询权限
		model.addAttribute("button",menusService.findButtonByType());
		
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String Forminsert(Model model){
		this.setModel(model);
		return "system/roles/form";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insert(Roles roles ,Model model,HttpServletRequest request){

		Roles role = this.rolesService.findRolesByRolename(roles.getRolename());
		if (role != null) {
			System.out.println("角色已经存在,请更换!");
			return "system/roles/form";
		} 
		int result = this.rolesService.insert(roles);
		if (result > 0) {
			//根据角色名称查询角色
			Roles roleid = this.rolesService.findRolesByRolename(roles.getRolename());
			//接收页面传参menubutton
			for (String roleMenuId : roles.getMenubutton()) {
				//添加角色与权限的关联 
				this.rolesService.insertRoleMenu(roleid.getId(),Integer.parseInt(roleMenuId));
			}
			
			System.out.println("保存角色成功");
		} else {
			System.out.println("保存角色失败");
		}
		return "redirect:/system/roles?roleId="+request.getParameter("roleId");
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String Formupdate(@PathVariable("id") int id,Model model){
		this.setModel(model);
		//根据角色ID查询角色
		model.addAttribute("roles",rolesService.findById(id));
		//根据角色ID查询角色与权限之间的关联
		model.addAttribute("menubutton",roleMenuService.findRoleByRoleId(id));
		return "system/roles/form";
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	public String update(@PathVariable("id") int id,Roles roles,Model model,HttpServletRequest request) {
		//根据角色名称查询角色是否已经存在
		Roles role = this.rolesService.findRolesByRolename(roles.getRolename());
		//判断角色名称已经存在及ID是否是与修改的ID相同
		if (role != null && role.getId() != id) {
			System.out.println("更新的角色名称已经存在,请更换");
			return "system/roles/form";
		}
		//修改角色
		int result = rolesService.update(roles);
		//修改角色与权限的关系,先删除后添加
		this.roleMenuService.delete(id);
		for (String rolemenuId : roles.getMenubutton()) {
			this.rolesService.insertRoleMenu(id,Integer.parseInt(rolemenuId));
		}
		
		if (result > 0) {
			System.out.println("更新成功");
		} else {
			System.out.println("更新失败");
			return "system/roles/form";
		}
		return "redirect:/system/roles?roleId="+request.getParameter("roleId");
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.GET)
	public String delete(@PathVariable("id") int id,HttpServletRequest request){
		int result = this.rolesService.delete(id);
		if (result > 0) {
			System.out.println("删除成功");
		} else {
			System.out.println("删除失败");
			return "error/error";
		}
		return "redirect:/system/roles?roleId="+request.getParameter("roleId");
	}

	@RequestMapping
	public String list(Model model,Roles roles,HttpServletRequest request){
		//页面传输的pn,ps
		pageController.setPNPS(model,roles);
		
		//判断页面传参是否为null
		if (roles.getRolename() == null ) {
			//查询总记录条数
			int totalRecord = rolesService.findCount();
			pageController.findPage(model, roles,totalRecord);
		} else {
			//条件查询总记录条数
			int totalRecord = rolesService.findCountByT(roles);
			pageController.findPageCondition(model, roles,totalRecord);
			
			model.addAttribute("jspurl","&rolename="+roles.getRolename());
		}
		//分页,条件查询,所有查询
		model.addAttribute("roles",this.rolesService.findCondition(roles));
		
		this.setModel(model);
		//查询按钮
		tmbSelect.findbuttons(request, model);
		
		return "system/roles/list";
	}
}
