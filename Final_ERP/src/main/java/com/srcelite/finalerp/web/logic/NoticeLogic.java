package com.srcelite.finalerp.web.logic;

import java.util.List;
import java.util.Map;


import com.srcelite.finalerp.web.dao.NoticeDao;
import org.apache.log4j.Logger;


public class NoticeLogic {
	Logger logger = Logger.getLogger(NoticeLogic.class);
	NoticeDao noticeDao = null;

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	// 중요 공지 사항 조회
	public List<Map<String,Object>> getMainNoticeList(Map<String,Object> pmap)   {return null;}
	// 모든 공지 리스트 조회
	public List<Map<String, Object>> getAllNoticeList(Map<String, Object> pmap) {
		logger.info("NoticeLogic == getAllNoticeList == 호출");
		List<Map<String, Object>> noticeAllList = null;
		noticeAllList = noticeDao.getAllNoticeList(pmap);
		return noticeAllList;
		
	}
	//공지 검색
	public List<Map<String, Object>> searchNotice(Map<String, Object> pmap) {
		logger.info("searchNotice 호출");
		List<Map<String, Object>> foundNoticeList = null;
		foundNoticeList = noticeDao.searchNotice(pmap);
		return foundNoticeList;
	}
	// 공지 상세조회
	public List<Map<String,Object>> getDetailNotice(Map<String,Object> pmap) {
		logger.info("NoticeLogic ==  getDetailNotice == 호출");
			
		List<Map<String, Object>> NoticeDetail = null;
		logger.info("notice_no:"+pmap.get("NOTICE_NO"));
		int inotice_no = Integer.parseInt(String.valueOf(pmap.get("NOTICE_NO")));
		pmap.put("NOTICE_NO", inotice_no);
		NoticeDetail = noticeDao.getDetailNotice(pmap);
		return NoticeDetail;
	
	}
	// 공지 추가페이지
	public List<Map<String,Object>> getNewNotice(Map<String,Object> pmap) {
		logger.info("NoticeLogic ==  getNewNotice == 호출");
		
		List<Map<String, Object>> newNotice = null;
		newNotice = noticeDao.getNewNotice(pmap);
		return newNotice;
		
	}
	// 공지 추가
	public int insertNotice(Map<String,Object> pmap){
		logger.info("insertNotice 호출 성공");
		int result = 0;
		result = noticeDao.insertNotice(pmap);
		logger.info("logic result : " + result);
		return result;
		
		}
	// 공지 수정
	public int updateNotice(Map<String,Object> pmap) throws Exception {
	
		logger.info("updateNotice 호출 성공");
		int result = 0;
		result = noticeDao.updateNotice(pmap);
		return result;
	}
	
	// 공지 삭제
	public int deleteNotice(Map<String,Object> pmap) {
		
		logger.info("deleteNotice 호출 성공");
		int result = 0;
		result = noticeDao.deleteNotice(pmap);
		return result;
	}////////////////////////////end of deleteNotice
}
	

	