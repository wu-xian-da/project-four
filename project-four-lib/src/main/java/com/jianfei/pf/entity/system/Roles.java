/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月10日下午5:26:06
  */
package com.jianfei.pf.entity.system;

import java.util.List;

import com.jianfei.pf.entity.base.BaseEntity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class Roles extends BaseEntity{

	private String rolename;
	
	private String counts;
	
	private List<Integer> titleId;
	
	private List<Integer> menuId;
	
	private List<Integer> buttonId;
	
	private List<String> menubutton;
	
}
