/**
  *project project-three-lib
  *@author changchun.wu
  *2017年9月15日上午9:51:22
  */
package com.jianfei.pf.entity.forum;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import com.jianfei.pf.entity.base.BaseEntity;

@Getter
@Setter
@ToString
public class Modules extends BaseEntity{
	
	private String name;//模块名称
	
	private String content;//模块内容
	
	private int parentId;//父ID
}
