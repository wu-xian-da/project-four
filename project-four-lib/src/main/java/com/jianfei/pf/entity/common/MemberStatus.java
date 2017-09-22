/**
  *project project-three-lib
  *@author changchun.wu
  *2017年9月21日下午3:14:57
  */
package com.jianfei.pf.entity.common;

public enum MemberStatus {
	
	QY("启用"),JY("禁用");
	
	private String name;
	
	private MemberStatus(String name){
		this.setName(name);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
