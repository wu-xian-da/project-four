/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月29日上午9:02:06
  */
package com.jianfei.pf.entity.system;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import com.jianfei.pf.entity.base.BaseEntity;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class LogAccess extends BaseEntity{
	
	private String loginname;//登录名
	
	private String requestUrl;//请求参数
	
	private Date date;//时间
	
	private String ip;//IP

}
