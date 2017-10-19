/**
  *project project-four-lib
  *@author changchun.wu
  *2017年10月17日下午4:39:13
  */
package com.jianfei.pf.dao.upload;

import com.jianfei.pf.dao.base.CrudDao;
import com.jianfei.pf.entity.upload.UploadFiles;

public interface UploadFilesDao extends CrudDao<UploadFiles>{

	public int insertlist(UploadFiles uploadFiles);

}
