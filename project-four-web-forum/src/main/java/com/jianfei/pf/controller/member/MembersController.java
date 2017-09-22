/**
  *project project-three-forum
  *@author changchun.wu
  *2017年9月15日上午11:29:50
  */
package com.jianfei.pf.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jianfei.pf.entity.common.Gender;
import com.jianfei.pf.entity.common.MemberStatus;
import com.jianfei.pf.entity.forum.Notes;
import com.jianfei.pf.entity.member.Members;
import com.jianfei.pf.service.forum.NotesService;
import com.jianfei.pf.service.member.MembersService;

@Controller
@RequestMapping("/member/members")
public class MembersController {
	
	@Autowired
	private MembersService membersService;
	
	@Autowired
	private NotesService notesService;
	
	/***
	 * 跳转用户编辑页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/update/{id}",method=RequestMethod.GET)
	public String Formupdate(@PathVariable("id")int id,Model model){
		model.addAttribute("gender",Gender.values());
		model.addAttribute("membersform",membersService.findById(id));
		return "member/members/form";
	}

	/***
	 * 用户编辑提交表单
	 * @param model
	 * @param members
	 * @return
	 */
	@RequestMapping(value="/update/{id}",method=RequestMethod.POST)
	public String update (Model model,Members members){
		members.setStatus(MemberStatus.QY);
		membersService.update(members);
		model.addAttribute("memberslist",membersService.findById(members.getId()));
		return "member/members/list";
	}
	
	/****
	 * 用户信息页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{id}",method=RequestMethod.GET)
	public String findMembers(@PathVariable("id")int id,Model model){
		model.addAttribute("memberslist",membersService.findById(id));
		return "member/members/list";
	}
	
	/**
	 * 用户展示页面
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping
	public String list(Model model,HttpServletRequest request){
		List<Notes> notes = notesService.findNotesByMembersId(Integer.parseInt((String) request.getSession().getAttribute("membersId")));
		request.getSession().setAttribute("notes", notes);
		return "member/memfor/mem_main";
	}
}
