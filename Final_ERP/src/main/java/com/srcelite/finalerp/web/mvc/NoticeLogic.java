package com.srcelite.finalerp.web.mvc;

import java.util.List;
import java.util.Map;

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
	// 공지 상세조회
	public List<Map<String,Object>> getDetailNotice(Map<String,Object> pmap)   	 {return null;}
	// 공지 추가
	public void insertNotice(Map<String,Object> pmap){}
	// 공지 수정
	public void updateNotice(Map<String,Object> pmap){}
	// 공지 삭제
	public void deleteNotice(Map<String,Object> pmap){}
	
}
