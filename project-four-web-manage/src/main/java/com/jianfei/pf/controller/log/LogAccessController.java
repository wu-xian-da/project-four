/**
  *project project-second-web
  *@author changchun.wu
  *2017年8月29日上午9:08:35
  */
package com.jianfei.pf.controller.log;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jianfei.pf.common.PageController;
import com.jianfei.pf.common.TMBSelect;
import com.jianfei.pf.entity.system.LogAccess;
import com.jianfei.pf.service.system.LogAccessService;

@Controller
@RequestMapping("/log/access")
public class LogAccessController {

	@Autowired
	protected PageController<LogAccess> pageController;
	
	@Autowired
	private LogAccessService logAccessService;
	
	@Autowired
	private TMBSelect tmbSelect;
	
	@RequestMapping
	public String list(Model model,LogAccess logAccess,HttpServletRequest request,HttpServletResponse response){
		
		pageController.setPNPS(model,logAccess);
		
		if (logAccess.getLoginname() == null && logAccess.getIp() ==null) {
			//查询总记录条数
			int totalRecord = logAccessService.findCount();
			pageController.findPage(model, logAccess,totalRecord);
			
		} else {
			//条件查询总记录条数
			int totalRecord = logAccessService.findCountByT(logAccess);
			pageController.findPageCondition(model, logAccess,totalRecord);
			model.addAttribute("jspurl","&loginname="+logAccess.getLoginname()+"&ip="+logAccess.getIp());
		}
		
		//分页,条件查询,所有查询
		model.addAttribute("logAccess",this.logAccessService.findCondition(logAccess));
				
		//查询按钮
		tmbSelect.findbuttons(request, model,response);
		return "log/access/access";
	}
}
