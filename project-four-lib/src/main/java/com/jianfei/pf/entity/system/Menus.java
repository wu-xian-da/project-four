/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月10日下午5:27:27
  */
package com.jianfei.pf.entity.system;

import com.jianfei.pf.entity.base.BaseEntity;
import com.jianfei.pf.entity.common.MBType;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class Menus extends BaseEntity{
	
	private String name;//名称
	
	private String parenthref;//父级链接	
	
	private String childshref;//子级链接
	
	private String permission;//标识符
	
	private MBType type;//权限类型
	
	private int sort;//排序号
	
}
