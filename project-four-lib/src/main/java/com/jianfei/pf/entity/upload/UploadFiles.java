/**
  *project project-four-lib
  *@author changchun.wu
  *2017年10月17日下午4:29:03
  */
package com.jianfei.pf.entity.upload;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import com.jianfei.pf.entity.base.BaseEntity;

@Getter
@Setter
@ToString
public class UploadFiles extends BaseEntity{

	private List<String> fileName;
	
	private List<String> fileIcon;
	
	private List<String> fileUrl;
}
