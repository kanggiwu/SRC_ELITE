package com.srcelite.finalerp.web.mvc;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

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
}
