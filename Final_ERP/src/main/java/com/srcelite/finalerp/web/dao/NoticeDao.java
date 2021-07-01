package com.srcelite.finalerp.web.dao;

import java.sql.Date;
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

	public List<Map<String, Object>> getNoticeDetail(Map<String, Object> pmap) {
		List<Map<String, Object>> NoticeDetail = null;
		NoticeDetail = sqlSessionTemplate.selectList("getNoticeDetail",pmap);
		return NoticeDetail;
	}
	public int insertNotice(Map<String, Object> pmap) {
		int result = 0;
		result = 1;
		sqlSessionTemplate.insert("insertNotice",pmap);
		return result;
	}
}
