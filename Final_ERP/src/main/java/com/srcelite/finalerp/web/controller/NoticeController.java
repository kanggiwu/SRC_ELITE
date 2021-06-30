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
		mav.addObject("noticeAllList", noticeAllList);
		return mav;
	}

	// 공지 상세조회
	public ModelAndView getDetailNotice(HttpServletRequest request, HttpServletResponse response) {
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> target = new HashMap<>();
		hmb.bind(target);
		target.put("gubun", "detail");
		List<Map<String, Object>> noticeDetail = null;
		noticeDetail = noticeLogic.getDetailNotice(target);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myService/notice_detail_admin");
		mav.addObject("NoticeDetail", noticeDetail);
		// RequestDispatcher view = req.getRequestDispatcher("getDetailNotice.jsp");
		// view.forward(request, res);
		return mav;
	}

	// 공지 추가
	public void insertNotice(HttpServletRequest request, HttpServletResponse response) {
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pmap = new HashMap<>();
		hmb.multiBind(pmap);
		int result = 0;
			
	}

	// 공지 수정
	public void updateNotice(HttpServletRequest request, HttpServletResponse response) {
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pmap = new HashMap<>();
		// 사용자가 입력한 값이나 서버에서 클라이언트에게 요청한 값 넘김.
		// hmb.bindPost(pmap);
		hmb.multiBind(pmap);
		int result = 0;
		}

	// 공지 삭제
	public void deleteNotice(HttpServletRequest request, HttpServletResponse response) {
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pmap = new HashMap<>();
<<<<<<< HEAD
//		hmb.bindPost(pmap);
=======
		hmb.bind(pmap);
>>>>>>> origin/main
		int result = 0;
	
	}

}
