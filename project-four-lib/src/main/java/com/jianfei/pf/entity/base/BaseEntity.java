/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月11日上午9:05:18
  */
package com.jianfei.pf.entity.base;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@EqualsAndHashCode(of={"id"})
public class BaseEntity implements Serializable{
	
	private Integer id;
	
	private int[] defaultPageSizeSelect = {10,20,30,40,50};//显示当前页面的数据条数
	
	private int pageNo;//页码
	
	public int pageSize = 5;//默认页展示记录数
	
	private long totalRecord;//总记录数
	
	public int ps = 5;//默认值
	
	public int pn = 0;//默认值
	
}
