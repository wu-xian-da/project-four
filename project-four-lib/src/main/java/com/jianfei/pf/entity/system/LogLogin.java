/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月28日下午2:43:01
  */
package com.jianfei.pf.entity.system;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidPooledConnection;
import com.jianfei.pf.entity.base.BaseEntity;
import com.jianfei.pf.entity.common.LoginStatus;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class LogLogin extends BaseEntity{

	private String loginname;
	
	private Date date;
	
	private String userAgent;
	
	private String ip;
	
	private LoginStatus status;
}
