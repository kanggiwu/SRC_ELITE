package com.srcelite.finalerp.web.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class NoticeController extends MultiActionController{
	NoticeLogic noticeLogic = null;

	public void setNoticeLogic(NoticeLogic noticeLogic) {
		this.noticeLogic = noticeLogic;
	}
	
	// 중요 공지 사항 조회
	public ModelAndView  getMainNoticeList(HttpServletRequest request, HttpServletResponse response){return null;}
	// 모든 공지 리스트 조회
	public ModelAndView  getAllNoticeList(HttpServletRequest request, HttpServletResponse response){return null;}
	// 공지 상세조회
	public ModelAndView  getDetailNotice(HttpServletRequest request, HttpServletResponse response){return null;}
	// 공지 추가
	public void insertNotice(HttpServletRequest request, HttpServletResponse response){}
	// 공지 수정
	public void updateNotice(HttpServletRequest request, HttpServletResponse response){}
	// 공지 삭제
	public void deleteNotice(HttpServletRequest request, HttpServletResponse response){}
	
	
}
