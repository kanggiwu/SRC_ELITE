package com.srcelite.finalerp.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;


import com.srcelite.finalerp.web.logic.NoticeLogic;
import com.util.HashMapBinder;

public class NoticeController extends MultiActionController {


	NoticeLogic noticeLogic = null;

	public void setNoticeLogic(NoticeLogic noticeLogic) {
		this.noticeLogic = noticeLogic;
	}


	
	// 중요 공지 사항 조회
	public ModelAndView  getMainNoticeList(HttpServletRequest request, HttpServletResponse response) {
		
		return null;
	}
	// 모든 공지 리스트 조회
	public ModelAndView getAllNoticeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("NoticeController == getAllNoticeList == 호출");
		
		logger.info("NoticeController == getAllNoticeList == 호출");
		
		HashMapBinder hmb = new  HashMapBinder(request);

		Map<String, Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String, Object>> noticeList = null;
		noticeList = noticeLogic.getAllNoticeList(target);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getNoticeList");
		mav.addObject("noticeList", noticeList);
		return mav;
	}
		
	//공지 검색
	public ModelAndView searchNotice(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		logger.info("searchNotice 호출");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> target = new HashMap<>();
		hmb.multiBind(target);
		logger.info("target: "+target);
		List<Map<String, Object>> noticeList = null;
		noticeList = noticeLogic.searchNotice(target);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getNoticeList");
		mav.addObject("noticeList", noticeList);
		// RequestDispatcher view = req.getRequestDispatcher("getDetailNotice.jsp");
		// view.forward(request, res);
		return mav;
	}

	// 공지 상세조회
	public ModelAndView getDetailNotice(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		logger.info("getDetailNotice 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> target = new HashMap<>();
		hmb.bind(target);
		target.put("gubun", "detail");
		logger.info("notice_no : "+target.get("NOTICE_NO"));
		List<Map<String, Object>> noticeDetail = null;
		noticeDetail = noticeLogic.getDetailNotice(target);
		logger.info("noticeDetail:"+noticeDetail);//
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getDetailNotice");
		mav.addObject("NoticeDetail", noticeDetail);
		// RequestDispatcher view = req.getRequestDispatcher("getDetailNotice.jsp");
		// view.forward(request, res);
		return mav;
	}
	// 공지 추가 창 페이지
	public ModelAndView getNewNotice(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		logger.info("getNewNotice 호출 성공");
		
		HashMapBinder hmb = new  HashMapBinder(request);
		Map<String, Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String, Object>> newNotice = null;
		newNotice = noticeLogic.getNewNotice(target);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getNewNotice");
		mav.addObject("getNewNotice", newNotice);
		return mav;
	}

	// 공지 추가
	public void insertNotice(HttpServletRequest request, HttpServletResponse response) 
			throws Exception
	{
		
		logger.info("insertNotice호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pmap = new HashMap<>();
		//사용자가 입력한 값이나 서버에서 클라이언트에게 요청한 값 넘김.
		//hmb.bindPost(pmap);
		hmb.bind(pmap);
		int result = 0;
		result = noticeLogic.insertNotice(pmap);
		if(result == 1) {
			response.sendRedirect("/notice/getAllNoticeList.src1");
		}
		else {
			response.sendRedirect("/notice/insertNoticeFail.jsp");
		}
	}
	

	// 공지 수정
	public void updateNotice(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pmap = new HashMap<>();
		// 사용자가 입력한 값이나 서버에서 클라이언트에게 요청한 값 넘김.
		hmb.bind(pmap);
		logger.info("pmap: "+pmap);
		int result = 0;
		result = noticeLogic.updateNotice(pmap);
		logger.info("ctrl result : " + result);
		if(result == 1) {
			response.sendRedirect("/notice/getAllNoticeList.src1");
		}
		else {
			response.sendRedirect("/notice/updateNoticeFail.jsp");
		}
	}

	// 공지 삭제
	public void deleteNotice(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		logger.info("deleteNotice 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		int result = 0;
		result = noticeLogic.deleteNotice(pmap);//dnotice_no
		if(result == 1) {
			response.sendRedirect("/notice/getAllNoticeList.src1");
		}
		else {
			response.sendRedirect("/notice/deleteNoticeFail.jsp");
		}
	}

}
