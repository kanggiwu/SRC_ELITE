package com.srcelite.finalerp.web.mvc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.util.HashMapBinder;

public class NoticeController extends MultiActionController{
	Logger logger = Logger.getLogger(NoticeController.class);
	NoticeLogic noticeLogic = null;

	public void setNoticeLogic(NoticeLogic noticeLogic) {
		this.noticeLogic = noticeLogic;
	}
	
	// 중요 공지 사항 조회
	public ModelAndView  getMainNoticeList(HttpServletRequest request, HttpServletResponse response){return null;}
	// 모든 공지 리스트 조회
	public ModelAndView getAllNoticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("NoticeController == getAllNoticeList == 호출");
		
		HashMapBinder hmb = new  HashMapBinder(request);
		Map<String, Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String, Object>> noticeAllList = null;
		noticeAllList = noticeLogic.getAllNoticeList(target);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/getAllNoticeList");
		mav.addObject("noticeAllList",noticeAllList);
		return mav;
	}
	// 공지 상세조회
	public ModelAndView  getDetailNotice(HttpServletRequest request, HttpServletResponse response){return null;}
	// 공지 추가
	public void insertNotice(HttpServletRequest request, HttpServletResponse response){}
	// 공지 수정
	public void updateNotice(HttpServletRequest request, HttpServletResponse response){}
	// 공지 삭제
	public void deleteNotice(HttpServletRequest request, HttpServletResponse response){}
	
	
}
