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
	 * <prop key="/schedule/getStartWorktime.src1">getStartWorktime</prop> 
	 * <prop key="/schedule/getCalendarSchedule.src1">getCalendarSchedule</prop> 
	 * <prop key="/schedule/insertSchedule.src1">insertSchedule</prop> 
	 * <prop key="/schedule/updateSchedule.src1">updateSchedule</prop> 
	 * <prop key="/schedule/updateDateSchedule.src1">schedule-controller</prop>
	 * <prop key="/schedule/deleteSchedule.src1">deleteSchedule</prop>
	 */
	public ModelAndView getCalendarSchedule(HttpServletRequest request, HttpServletResponse response) {
		HashMapBinder hmb = new HashMapBinder(request);
		
		Map<String, Object> pMap = new HashMap<>();
		hmb.bind(pMap);
		
		session = request.getSession(true); 
		int login_no=Integer.parseInt(session.getAttribute("login_no").toString());
		
		logger.info("♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥로그인한 사원 번호: "+login_no+"♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥♥");
		pMap.put("login_no", login_no);
		/* pMap.put("schedule_type", 3); */
		// ?emp_no=#{emp_no}&schedule_type=[1,20,3]&date=#{yy/mm}

		logger.info("쿼리스트링: " + pMap);
		ModelAndView mav = new ModelAndView();
		response.setContentType("application/json;charset=utf-8");

		// 개인일정인 경우 출석 시간 받아오기
		/*
		 * if ("3".equals(pMap.get("schedule_type").toString())) { List<Map<String,
		 * Object>> attendanceList = null; attendanceList =
		 * scheduleLogic.getAttendance(pMap); logger.info("attendanceList: " +
		 * attendanceList); mav.addObject("attendanceList", attendanceList); }
		 */
		List<Map<String, Object>> scheduleList = null;
		scheduleList = scheduleLogic.getScheduleList(pMap);
		logger.info("scheduleList: " + scheduleList);
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
