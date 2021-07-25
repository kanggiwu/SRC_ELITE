package com.srcelite.finalerp.web.controller;

import java.io.IOError;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.Gson;
import com.srcelite.finalerp.web.logic.ScheduleLogic;
import com.util.HashMapBinder;

public class ScheduleController extends MultiActionController {
	ScheduleLogic scheduleLogic = null;
	HttpSession session = null;

	public void setScheduleLogic(ScheduleLogic scheduleLogic) {
		this.scheduleLogic = scheduleLogic;
	}

	/*
	 * <prop key="/schedule/getCalendarSchedule.src1">getCalendarSchedule</prop> 
	 * <prop key="/schedule/insertSchedule.src1">insertSchedule</prop> 
	 * <prop key="/schedule/updateSchedule.src1">updateSchedule</prop> 
	 * <prop key="/schedule/updateDateSchedule.src1">schedule-controller</prop>
	 * <prop key="/schedule/deleteSchedule.src1">deleteSchedule</prop>
	 */
	
	
	public ModelAndView getCalendarSchedule(HttpServletRequest request, HttpServletResponse response) {
		logger.info("캘린더 url로 불러오기");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("empSchedule");

		return mav;
	}
	
	public ModelAndView getJsonSchedule(HttpServletRequest request, HttpServletResponse response) {
		HashMapBinder hmb = new HashMapBinder(request);
		List<Map<String, Object>> scheduleList = null; //스케줄 정보 저장 변수 선언
		
		Map<String, Object> pMap = new HashMap<>();
		hmb.bind(pMap);
		
		//로그인한 사원번호를 map에 넣어준다.
		session = request.getSession(true); 
		int login_no=Integer.parseInt(session.getAttribute("login_no").toString());
		logger.info("로그인한 사원 번호: "+login_no);
		pMap.put("login_no", login_no);
		logger.info("일정데이터를 불러오기 위해 필요한 데이터들: " + pMap);
		
		//일정 받아오기
		scheduleList = scheduleLogic.getJsonScheduleList(pMap);
		logger.info("scheduleList: " + scheduleList);


		//json형식으로 페이지 이동
		ModelAndView mav = new ModelAndView();
		response.setContentType("application/json;charset=utf-8");
		mav.addObject("scheduleList", scheduleList);
		mav.setViewName("jsonSchedule");

		return mav;
	}


	// 일정 추가
	public void insertSchedule(HttpServletRequest request, HttpServletResponse response) throws  Exception {
		logger.info("--------------------insertSchedule 메소드 호출 ");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pMap = new HashMap<>();
		hmb.bindAjax(pMap);
		/* 로그인 시 session에 사원번호(아이디)를 저장하고 그걸 불러온다. */ 
		session = request.getSession(true);
		int login_no=Integer.parseInt(session.getAttribute("login_no").toString());
		
		
		pMap.put("login_no", login_no);
		logger.info("쿼리스트링: " + pMap);
		int result = 0;
		result = scheduleLogic.insertSchedule(pMap);
		logger.info("Controller result: " + result);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/text");
		try {
			PrintWriter writer= response.getWriter();
			writer.print(result);
		}catch(IOException e) {
			e.printStackTrace();
		}
		

	}

	// 일정 수정
	public void updateSchedule(HttpServletRequest request, HttpServletResponse response) {
		logger.info("%%%%%%%%%%%%%%%%%%%%updateSchedule 메소드 호출 ");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pMap = new HashMap<>();
		hmb.bindAjax(pMap);
		/* 로그인 시 세션에 저장된 사원번호를 불러옴*/ 
		session = request.getSession(true); 
		int login_no=Integer.parseInt(session.getAttribute("login_no").toString());
		
		
		pMap.put("login_no", login_no);
		logger.info("쿼리스트링: " + pMap);
		int result = 0;
		result = scheduleLogic.updateSchedule(pMap);
		logger.info("result: " +result);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/text");
		try {
			PrintWriter writer= response.getWriter();
			writer.print(result);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	// 일정 수정
	public void updateDateSchedule(HttpServletRequest request, HttpServletResponse response) {
		logger.info("%%%%%%%%%%%%%%%%%%%%updateSchedule 메소드 호출 ");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pMap = new HashMap<>();
		hmb.bindAjax(pMap);
		/* 로그인 시 세션에 저장된 사원번호를 불러옴 */
		session = request.getSession(true); 
		int login_no=Integer.parseInt(session.getAttribute("login_no").toString());
		
		pMap.put("login_no", login_no);
		logger.info("쿼리스트링: " + pMap);
		int result = 0;
		result = scheduleLogic.updateDateSchedule(pMap);
		logger.info("result: " +result);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/text");
		try {
			PrintWriter writer= response.getWriter();
			writer.print(result);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	// 일정 삭제
	public void deleteSchedule(HttpServletRequest request, HttpServletResponse response) {
		logger.info("@*@*@*@*@*@*@*@*@*@*deleteSchedule 메소드 호출 ");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pMap = new HashMap<>();
		hmb.bindAjax(pMap);
		logger.info("쿼리스트링: " + pMap);

		/* 로그인 시 세션에 저장된 사원번호를 불러옴*/ 
		session = request.getSession(true); 
		int login_no=Integer.parseInt(session.getAttribute("login_no").toString());
		
		pMap.put("login_no", login_no);
		logger.info("쿼리스트링: " + pMap);
		int result = 0;
		result = scheduleLogic.deleteSchedule(pMap);
		logger.info("result: " +result);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/text");
		try {
			logger.info("result값 출력하기");
			PrintWriter writer= response.getWriter();
			writer.print(result);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
}
