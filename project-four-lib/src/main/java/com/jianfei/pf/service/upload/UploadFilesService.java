/**
  *project project-four-lib
  *@author changchun.wu
  *2017年10月17日下午4:40:44
  */
package com.jianfei.pf.service.upload;

import org.springframework.stereotype.Service;

import com.jianfei.pf.dao.upload.UploadFilesDao;
import com.jianfei.pf.entity.upload.UploadFiles;
import com.jianfei.pf.service.base.CrudService;

@Service
public class UploadFilesService extends CrudService<UploadFilesDao, UploadFiles> {

	public int insertlist(UploadFiles uploadFiles){
		return this.dao.insertlist(uploadFiles);
	}
}
