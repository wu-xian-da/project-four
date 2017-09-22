/**
  *project project-frist
  *@author changchun.wu
  *2017年7月26日下午3:11:36
  */
package com.jianfei.pf.entity.common;

public enum Gender {

	NAN("男"),NV("女");
	
	private String name;
	
	private Gender(String name){
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
