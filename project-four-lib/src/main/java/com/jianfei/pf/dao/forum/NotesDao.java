/**
  *project project-three-lib
  *@author changchun.wu
  *2017年9月15日上午10:15:28
  */
package com.jianfei.pf.dao.forum;

import java.util.List;

import com.jianfei.pf.dao.base.CrudDao;
import com.jianfei.pf.entity.forum.Notes;

public interface NotesDao extends CrudDao<Notes> {

	public List<Notes> findNotesByMembersId(int modulesId);
	
	public List<Notes> findAllMemberNotesByMembersId(int modulesId, int pn, int ps);
	
	public List<Notes> findNotesByChildsModules(int childsmodules,int pn,int ps);

	/***
	 * 根据状态查询论坛文章
	 * @param notes
	 * @return
	 */
	public List<Notes> findConditionByStatus(Notes notes);
	
	/**
	 * 根据状态查询论坛文章的数量
	 * @param notes
	 * @return
	 */
	public int findCountByStatus();
	
	public int findCountBychildsmodules(int childsmodules);

	public int findCountBymembersId(int membersId);

	public int findCountByParentModules(int parentmodules);

	public List<Notes> findNotesByParentModules(int parentmodules, int pn,int ps);

	public List<Notes> findNotesStatusYFBByMembersId(int membersId, int pn, int ps);

	public int findCountStatusYFBBymembersId(int membersId);

}
