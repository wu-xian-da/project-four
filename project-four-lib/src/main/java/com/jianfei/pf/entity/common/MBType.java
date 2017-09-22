/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月11日上午9:44:11
  */
package com.jianfei.pf.entity.common;

public enum MBType {
	
	TITLE("父级菜单"),MENU("子级菜单"),BUTTON("按钮");
	
	private String name;
	
	private MBType(String name){
		this.name = name;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
