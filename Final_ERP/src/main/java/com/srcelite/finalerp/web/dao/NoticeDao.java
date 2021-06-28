package com.srcelite.finalerp.web.dao;

import java.util.List;
import java.util.Map;


import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.dao.DataAccessException;

public class NoticeDao {
	Logger logger = Logger.getLogger(NoticeDao.class);

	SqlSessionTemplate sqlSessionTemplate = null;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}


	public List<Map<String, Object>> getAllNoticeList(Map<String, Object> pmap) {
		logger.info("NoticeDao == getAllNoticeList == 호출");

		List<Map<String, Object>> noticeAllList = null;
		noticeAllList = sqlSessionTemplate.selectList("getNoticeList",pmap);
		return noticeAllList;
	}

	public int insertNotice(Map<String, Object> pmap) throws DataAccessException{
	
		int result = 0;
		result = 1;
		sqlSessionTemplate.insert("noticeInsert",pmap);
		return result;
	}
	public void bmStepUpdate(Map<String, Object> pmap) {
	
		sqlSessionTemplate.update("bmStepUpdate",pmap);		
	}
	public void hitCount(int bm_no) {
		
		sqlSessionTemplate.update("hitCount",bm_no);		
	}
	public int getBmGroup() {
		int result = 0;
		result = sqlSessionTemplate.selectOne("getBmGroup");		
		return result;
	}
	public int getBmNo() {
		int result = 0;
		result = sqlSessionTemplate.selectOne("getBmNo");		
		return result;
	}
	public int updateNotice(Map<String, Object> pmap) {
		int result = 0;
		result = sqlSessionTemplate.update("noitceUpdate",pmap);	
		return result;
	}
	public int deleteNotice(Map<String, Object> pmap) {
				int result = 0;
				result = sqlSessionTemplate.delete("noticeDelete",pmap);
		return result;	
	}

}
