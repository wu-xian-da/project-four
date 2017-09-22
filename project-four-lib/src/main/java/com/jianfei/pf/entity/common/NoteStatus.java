/**
  *project project-three-lib
  *@author changchun.wu
  *2017年9月15日上午9:54:59
  */
package com.jianfei.pf.entity.common;

public enum NoteStatus {
	
	WFB("未发布"),YFB("已发布");
	
	private String name;
	
	private NoteStatus(String name){
		this.setName(name);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
