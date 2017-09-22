/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月28日下午2:45:32
  */
package com.jianfei.pf.entity.common;

public enum LoginStatus {
	
	SUCCESS("成功"),FIAL("失败");
	
	private String name;
	
	private LoginStatus(String name){
		this.name = name;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
