/**
  *project project-three-lib
  *@author changchun.wu
  *2017年9月1日上午10:59:30
  */
package com.jianfei.pf.entity.page;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PageParam {
	
    public static final String PAGE_SIZE_NAME = "ps"; //页面大小参数
   
    public static final String PAGE_NO_NAME = "pn"; //页码参数
    
    private int ps = 10; //默认值
    
    private int pn = 1; //默认值
    
    private long totalRecord; //总记录数
    
}