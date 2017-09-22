/**
  *project project-three-lib
  *@author changchun.wu
  *2017年9月15日上午9:37:45
  */
package com.jianfei.pf.entity.member;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import com.jianfei.pf.entity.base.BaseEntity;
import com.jianfei.pf.entity.common.Gender;
import com.jianfei.pf.entity.common.MemberStatus;

@Getter
@Setter
@ToString
public class Members extends BaseEntity{

	private String account;//账号
	
	private String username;//姓名
	
	private String password;//密码
	
	private Gender gender;//性别
	
	private String email;//邮箱
	
	private int age;//年龄
	
	private String address;//地址
	
	private String birthday;//出生日期
	
	private MemberStatus status;
}
