/**
  *project project-second-web
  *@author changchun.wu
  *2017年8月11日上午10:31:35
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
import com.jianfei.pf.entity.common.MBType;
import com.jianfei.pf.entity.system.Menus;
import com.jianfei.pf.service.relation.RoleMenuService;
import com.jianfei.pf.service.system.MenusService;

@Controller
@RequestMapping("/system/menus")
public class MenusController {
	
	@Autowired
	private MenusService menusService;
	
	@Autowired
	private RoleMenuService roleMenuService;
	
	@Autowired
	protected PageController<Menus> pageController;
	
	@Autowired
	private TMBSelect tmbSelect;
	
	private void setModel(Model model){
		//菜单枚举
		model.addAttribute("type",MBType.values());
		//角色与权限关联
		model.addAttribute("rolename",this.roleMenuService.findRolesRoleId());
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.GET)
	public String Forminsert(Model model){
		this.setModel(model);
		return "system/menus/form";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insert(Menus menus ,Model model,HttpServletRequest request){
		Menus menu = this.menusService.findMenusByPermission(menus.getPermission());
		if (menu != null) {
			System.out.println("权限标识已经存在,请更换!");
			return "system/menus/form";
		}
		
		int result = this.menusService.insert(menus);
		if (result <= 0) {
			System.out.println("保存权限失败");
			return "system/menus/form";
		} 
		
		System.out.println("保存权限成功");
		return "redirect:/system/menus?roleId="+request.getParameter("roleId");
	}

	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String Formupdate(@PathVariable("id") int id,Model model){
		this.setModel(model);
		model.addAttribute("menus",menusService.findById(id));
		return "system/menus/form";
	}
	
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	public String update(@PathVariable("id") int id,Menus menus,Model model,HttpServletRequest request){
		Menus menu = this.menusService.findMenusByPermission(menus.getPermission());
		if (menu != null && menu.getId() != id) {
			System.out.println("权限标识已经存在,请更换!");
			return "system/menus/form";
		}
		int result = this.menusService.update(menus);
		if (result <= 0) {
			System.out.println("修改权限失败");
			return "system/menus/form";
		} 
		System.out.println("修改权限成功");
		return "redirect:/system/menus?roleId="+request.getParameter("roleId");
	}
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.GET)
	public String delete(@PathVariable("id") int id,HttpServletRequest request){
		int result = this.menusService.delete(id);
		if (result > 0) {
			System.out.println("删除成功");
		} else {
			System.out.println("删除失败");
			return "error/error";
		}
		return "redirect:/system/menus?roleId="+request.getParameter("roleId");
	}
	
	@RequestMapping
	public String list(Model model,Menus menus,HttpServletRequest request){
		//页面传输的pn,ps
		pageController.setPNPS(model,menus);
		
		if (menus.getName() == null && menus.getPermission() == null) {
			//查询总记录条数
			int totalRecord = menusService.findCount();
			pageController.findPage(model, menus,totalRecord);
			
		} else {
			//条件查询总记录条数
			int totalRecord = menusService.findCountByT(menus);
			pageController.findPageCondition(model, menus,totalRecord);
			
			model.addAttribute("jspurl","&name="+menus.getName()+"&permission="+menus.getPermission());
		}
		//分页,条件查询,所有查询
		model.addAttribute("menus",this.menusService.findCondition(menus));
		
		
		this.setModel(model);
		//查询按钮
		tmbSelect.findbuttons(request, model);
		
		return "system/menus/list";
	}
}
