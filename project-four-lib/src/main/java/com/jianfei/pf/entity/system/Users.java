/**
  *project project-second-lib
  *@author changchun.wu
  *2017年8月10日下午5:25:57
  */
package com.jianfei.pf.entity.system;

import java.util.Date;
import java.util.List;

import com.jianfei.pf.entity.base.BaseEntity;
import com.jianfei.pf.entity.common.Gender;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Users extends BaseEntity{
	
	private String username;//用户名
	
	private String password;//密码
	
	private String nickname;//昵称
	
	private Gender gender;//性别
	
	private int age;//年龄
	
	private Date createTime;//创建时间
	
	private Date loginTime;//最近登录时间
	
	private String ip;//登录IP
	
    private String beginCreateTime;//检索时间
    
    private String endCreateTime;//检索时间
    
    private List<Integer> roleIds;
    
}
