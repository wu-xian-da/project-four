/**
  *project project-four-web-forum
  *@author changchun.wu
  *2017年9月26日上午11:07:19
  */
package com.jianfei.pf.controller.ueditor;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baidu.ueditor.ActionEnter;

@Controller
@RequestMapping("/forum/notes")
public class InitUeditorController {

	private Logger logger = Logger.getLogger(InitUeditorController.class);
	
	@RequestMapping("/ueditor/init")
	public void initUeditor(HttpServletRequest request, HttpServletResponse response){
		
		response.setContentType("application/json");
		
		String rootPath = request.getSession().getServletContext().getRealPath("/resources");
		PrintWriter writer = null;
		try {
			String exec = new ActionEnter(request,rootPath).exec();
			System.out.println(exec+"===========");
			writer = response.getWriter();
			writer.write(exec);
			writer.flush();
		} catch (IOException e) {
			logger.error("百度编辑器初始化错误!",e);
		}finally{
			if (writer != null) {
				writer.close();
			}
		}
	}
}
