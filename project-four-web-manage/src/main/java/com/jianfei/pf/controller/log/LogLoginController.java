/**
  *project project-second-web
  *@author changchun.wu
  *2017年8月28日下午3:26:59
  */
package com.jianfei.pf.controller.log;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jianfei.pf.common.PageController;
import com.jianfei.pf.common.TMBSelect;
import com.jianfei.pf.entity.system.LogLogin;
import com.jianfei.pf.service.system.LogLoginService;

@Controller
@RequestMapping("/log/logins")
public class LogLoginController {
	
	@Autowired
	private LogLoginService logLoginService;
	
	@Autowired
	protected PageController<LogLogin> pageController;
	
	@Autowired
	private TMBSelect tmbSelect;
	
	@RequestMapping
	public String list(Model model,LogLogin logLogin,HttpServletRequest request){
		//页面传输的pn,ps
		pageController.setPNPS(model,logLogin);
		
		if (logLogin.getLoginname() == null && logLogin.getIp() ==null) {
			//查询总记录条数
			int totalRecord = logLoginService.findCount();
			pageController.findPage(model, logLogin,totalRecord);

		} else {
			//条件查询总记录条数
			int totalRecord = logLoginService.findCountByT(logLogin);
			pageController.findPageCondition(model, logLogin,totalRecord);
			model.addAttribute("jspurl","&loginname="+logLogin.getLoginname()+"&ip="+logLogin.getIp());
		}
		//分页,条件查询,所有查询
		model.addAttribute("logLogin",this.logLoginService.findCondition(logLogin));
		
		//查询按钮
		tmbSelect.findbuttons(request, model);
		
		return "log/logins";
	}
}
