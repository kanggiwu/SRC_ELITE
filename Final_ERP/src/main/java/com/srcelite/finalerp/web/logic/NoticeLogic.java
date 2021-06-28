package com.srcelite.finalerp.web.logic;

import java.util.List;
import java.util.Map;

import com.srcelite.finalerp.web.dao.NoticeDao;

public class NoticeLogic {
	NoticeDao noticeDao = null;

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	// 중요 공지 사항 조회
	public List<Map<String,Object>> getMainNoticeList(Map<String,Object> pmap)   {return null;}
	// 모든 공지 리스트 조회
	public List<Map<String,Object>> getAllNoticeList(Map<String,Object> pmap)    {return null;}
	// 공지 상세조회
	public List<Map<String,Object>> getDetailNotice(Map<String,Object> pmap)   	 {return null;}
	// 공지 추가
	public void insertNotice(Map<String,Object> pmap){}
	// 공지 수정
	public void updateNotice(Map<String,Object> pmap){}
	// 공지 삭제
	public void deleteNotice(Map<String,Object> pmap){}
	
}
