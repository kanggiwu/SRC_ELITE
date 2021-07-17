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
//	공지조회 페이지
	}
	
	public List<Map<String, Object>> getAllNoticeList(Map<String, Object> pmap) {
		logger.info("NoticeDao == getAllNoticeList == 호출");

		List<Map<String, Object>> noticeAllList = null;
		noticeAllList = sqlSessionTemplate.selectList("getNoticeList",pmap);
		return noticeAllList;
		
//	공지 검색기능
		
		}
	public List<Map<String, Object>> searchNotice(Map<String, Object> pmap) {
		logger.info("NoticeDao == searchNotice == 호출");
		List<Map<String, Object>> searchNotice = null;
		sqlSessionTemplate.selectList("getNoticeListProc",pmap);
		searchNotice = (List<Map<String, Object>>) pmap.get("n_cursor");
		return searchNotice;
		
//	공지 상세조회
	}
	public List<Map<String, Object>> getDetailNotice(Map<String, Object> pmap) {
		logger.info("NoticeDao == getDetailNotice == 호출");
		
		List<Map<String, Object>> NoticeDetail = null;
		NoticeDetail = sqlSessionTemplate.selectList("getNoticeList",pmap);
		logger.info("NoticeDao == getDetailNotice == 호출:"+NoticeDetail);
		
		return NoticeDetail;
//		공지추가 페이지
	}
	public List<Map<String, Object>> getNewNotice(Map<String, Object> pmap) {
		logger.info("NoticeDao == getNewNotice == 호출");

		List<Map<String, Object>> newNotice = null;
		newNotice = sqlSessionTemplate.selectList("getNoticeList",pmap);
		return newNotice;
	}
//	공지추가
	public int insertNotice(Map<String, Object> pmap) {
		logger.info("notice_no:"+pmap.get("notice_no"));
		logger.info("notice_type:"+pmap.get("notice_type"));
		logger.info("notice_tltle:"+pmap.get("notice_title"));
		logger.info("notice_content:"+pmap.get("notice_content"));
		int result=0;
		result = sqlSessionTemplate.insert("insertNotice",pmap);
		logger.info("dao result : " + result);
		return result;
	}
//	공지 수정
	public int updateNotice(Map<String, Object> pmap) {
		logger.info("notice_no:"+pmap.get("notice_no"));
		logger.info("notice_type:"+pmap.get("notice_type"));
		logger.info("notice_tltle:"+pmap.get("notice_title"));
		logger.info("notice_content:"+pmap.get("notice_content"));
		int result = 0;
		result = sqlSessionTemplate.update("updateNotice",pmap);
		logger.info("result:"+result);
		return result;
	}
//	공지삭제
	public int deleteNotice(Map<String, Object> pmap) {
		logger.info("notice_no:"+pmap.get("dnotice_no"));
		int result = 0;
		int inotice_no = 0;
		inotice_no = Integer.parseInt(pmap.get("dnotice_no").toString());
		logger.info("notice_no:"+inotice_no);
		
		result = sqlSessionTemplate.delete("deleteNotice",inotice_no);
		//sqlSessionTemplate.commit();
		logger.info("result:"+result);
		return result;
	}
}
