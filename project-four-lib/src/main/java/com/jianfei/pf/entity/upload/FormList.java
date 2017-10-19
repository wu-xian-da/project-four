/**
  *project project-four-lib
  *@author changchun.wu
  *2017年10月18日上午10:38:35
  */
package com.jianfei.pf.entity.upload;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FormList{

	private List<UploadFiles> uploadFiles;
}
