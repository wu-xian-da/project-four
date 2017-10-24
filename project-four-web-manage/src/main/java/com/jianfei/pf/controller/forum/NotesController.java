/**
  *project project-three-web
  *@author changchun.wu
  *2017年9月15日上午10:38:18
  */
package com.jianfei.pf.controller.forum;

import java.io.IOException;
import java.util.Date;
import java.util.List;

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
import com.jianfei.pf.entity.common.NoteStatus;
import com.jianfei.pf.entity.forum.Modules;
import com.jianfei.pf.entity.forum.Notes;
import com.jianfei.pf.service.forum.ModulesService;
import com.jianfei.pf.service.forum.NotesService;
import com.jianfei.pf.service.member.MembersService;

@Controller
@RequestMapping("/forum/notes")
public class NotesController {
	
	@Autowired
	private NotesService notesService;
	
	@Autowired
	private MembersService membersService;
	
	@Autowired
	private ModulesService modulesService;
	
	@Autowired
	protected PageController<Notes> pageController;
	
	@Autowired
	private TMBSelect tmbSelect;
	
	public void setModel(Model model){
		model.addAttribute("allmembers",membersService.findAll());
		model.addAttribute("allmodules",modulesService.findAll());
	}
	
	/**
	 * 上刊
	 * @return
	 */
	@RequestMapping(value="/changestatusYFB/{id}",method=RequestMethod.GET)
	public String changestatusYFB(@PathVariable("id")int id){
		Notes note = notesService.findById(id);
		note.setStatus(NoteStatus.YFB);
		note.setReleasetime(new Date());
		notesService.update(note);
		return "redirect:/forum/notes";
	}
	
	/***
	 * 下刊
	 * @return
	 */
	@RequestMapping(value="/changestatusWFB/{id}",method=RequestMethod.GET)
	public String changestatusWFB(@PathVariable("id")int id){
		Notes note = notesService.findById(id);
		note.setStatus(NoteStatus.WFB);
		note.setReleasetime(null);
		notesService.update(note);
		return "redirect:/forum/notes";
	}

	@RequestMapping
	public String list(Notes notes,Model model,HttpServletResponse response,HttpServletRequest request){
		pageController.setPNPS(model, notes);
		
		if (notes.getTheme() == null && notes.getParentmodules() == 0 && notes.getChildsmodules() == 0 && notes.getMembersId() == 0 && notes.getBeginCreateTime() == null && notes.getEndCreateTime() == null) {
			//查询总记录条数
			int totalRecord = notesService.findCount();
			pageController.findPage(model, notes,totalRecord);
		}else{
			//条件查询总记录条数
			int totalRecord = notesService.findCountByT(notes);
			pageController.findPageCondition(model, notes,totalRecord);
			
			model.addAttribute("jspurl","&theme="+notes.getTheme()+"&parentmodules="+notes.getParentmodules()+"&childsmodules="+
			notes.getChildsmodules()+"&membersId="+notes.getMembersId()+"&beginCreateTime="+notes.getBeginCreateTime()+"&endCreateTime="+notes.getEndCreateTime());
		}
		//查询按钮
		tmbSelect.findbuttons(request, model,response);
		model.addAttribute("allnotes",notesService.findCondition(notes));
		this.setModel(model);
		return "forum/notes/list";
	}
	
	/***
	 * 根据论坛内容ID查询,预览页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/selectnotes/{id}" ,method=RequestMethod.GET)
	public String selectnotes(@PathVariable("id")int id,Model model){
		this.setModel(model);
		model.addAttribute("notescontent",notesService.findById(id));
		return "forum/notes/browse";
	}
	
	/***
	 * 二级联动
	 * @param model
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="/modules/{parentmodules}",method=RequestMethod.GET)
	public void modules(@PathVariable("parentmodules")int parentmodules,HttpServletResponse response){
		List<Modules> moduleslist = modulesService.findModulesByParentId(parentmodules);
		if(moduleslist.size()!=0){
	 		String str1 = "";
	 		for(Modules m:moduleslist){
	 			String childsmodules = m.getId()+"";
	 			String name = m.getName();
	 			str1 = str1+childsmodules+","+name+"-";
	 		}
	 		String str2 = str1.substring(0, str1.length()-1);
			try {
				response.getWriter().write(str2.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else{
			try {
				response.getWriter().write("0");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
