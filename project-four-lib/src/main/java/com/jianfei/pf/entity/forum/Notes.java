/**
  *project project-three-lib
  *@author changchun.wu
  *2017年9月15日上午9:53:19
  */
package com.jianfei.pf.entity.forum;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import com.jianfei.pf.entity.base.BaseEntity;
import com.jianfei.pf.entity.common.NoteStatus;

@Getter
@Setter
@ToString
public class Notes extends BaseEntity{

	private String theme;
	
	private int parentmodules;
	
	private int childsmodules;
	
	private String content;
	
	private NoteStatus status;
	
	private int membersId;
	
	private Date releasetime;
	
	private String uploadFiles;
	
	private String beginCreateTime;//检索时间
    
    private String endCreateTime;//检索时间
}
