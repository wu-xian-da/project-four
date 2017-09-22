/**
  *project project-three-forum
  *@author changchun.wu
  *2017年9月15日上午11:30:32
  */
package com.jianfei.pf.controller.forum;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jianfei.pf.entity.forum.Modules;
import com.jianfei.pf.service.forum.ModulesService;

@Controller
@RequestMapping("/forum/modules")
public class ModulesController {
	
	@Autowired
	private ModulesService modulesService;

	@RequestMapping
	public String list(Model model,Modules modules){
		model.addAttribute("allmodules",modulesService.findCondition(modules));
		return "forum/modules/list";
	}
}
