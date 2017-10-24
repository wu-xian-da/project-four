/**
  *project project-three-web
  *@author changchun.wu
  *2017年9月15日上午10:37:46
  */
package com.jianfei.pf.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jianfei.pf.common.PageController;
import com.jianfei.pf.common.TMBSelect;
import com.jianfei.pf.entity.common.MemberStatus;
import com.jianfei.pf.entity.member.Members;
import com.jianfei.pf.service.member.MembersService;

@Controller
@RequestMapping("/member/members")
public class MembersController {

	@Autowired
	private MembersService membersService;
	
	@Autowired
	protected PageController<Members> pageController;
	
	@Autowired
	private TMBSelect tmbSelect;
	
	public void setModel(Model model){
		model.addAttribute("status",MemberStatus.values());
	}
	
	/**
	 * 启用
	 * @return
	 */
	@RequestMapping(value="/changestatusQY/{id}",method=RequestMethod.GET)
	public String changestatusQY(@PathVariable("id")int id){
		Members member = membersService.findById(id);
		member.setStatus(MemberStatus.QY);
		membersService.update(member);
		return "redirect:/member/members";
	}
	
	/***
	 * 禁用
	 * @return
	 */
	@RequestMapping(value="/changestatusJY/{id}",method=RequestMethod.GET)
	public String changestatusJY(@PathVariable("id")int id){
		Members member = membersService.findById(id);
		member.setStatus(MemberStatus.JY);
		membersService.update(member);
		return "redirect:/member/members";
	}
	
	@RequestMapping
	public String list(Model model,Members members,HttpServletRequest request,HttpServletResponse response){
		//页面传输的pn,ps
		pageController.setPNPS(model,members);
		
		//判断页面传参是否为null
		if (members.getUsername() == null && members.getAccount() == null) {
			//查询总记录条数
			int totalRecord = membersService.findCount();
			pageController.findPage(model, members,totalRecord);
		} else {
			//条件查询总记录条数
			int totalRecord = membersService.findCountByT(members);
			pageController.findPageCondition(model, members,totalRecord);
			
			model.addAttribute("jspurl","&account="+members.getAccount()+"&username="+members.getUsername());
		}
		
		//查询按钮
		tmbSelect.findbuttons(request, model,response);
		model.addAttribute("allmembers",membersService.findCondition(members));
		this.setModel(model);
		return "member/members/list";
	}
}
