package com.srcelite.finalerp.web.controller;

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
	 * <prop key="/schedule/getStartWorktime.src1">getStartWorktime</prop> <prop
	 * key="/schedule/getCalendarSchedule.src1">getCalendarSchedule</prop> <prop
	 * key="/schedule/getDetailSchedule.src1">getDetailSchedule</prop> <prop
	 * key="/schedule/insertSchedule.src1">insertSchedule</prop> <prop
	 * key="/schedule/updateSchedule.src1">updateSchedule</prop> <prop
	 * key="/schedule/deleteSchedule.src1">deleteSchedule</prop>
	 */
	public ModelAndView getCalendarSchedule(HttpServletRequest request, HttpServletResponse response) {
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pMap = new HashMap<>();
		hmb.bind(pMap);
		
		//로그인 시 session에 사원번호(아이디)를 저장하고 그걸 불러온다.
		/*
		 * session = request.getSession(true); String
		 * emp_no=(String)session.getAttribute("emp_no");
		 */
		int emp_no = 34;
		pMap.put("emp_no", emp_no);
		// ?emp_no=#{emp_no}&schedule_type=[1,20,3]&yy/mm=#{yy/mm}

		logger.info("쿼리스트링: " + pMap);
		ModelAndView mav = new ModelAndView();

		// 개인일정인 경우 출석 시간 받아오기
		if ("3".equals(pMap.get("schedule_type").toString())) {
			List<Map<String, Object>> attendanceList = null;
			attendanceList = scheduleLogic.getAttendance(pMap);
			logger.info("attendanceList: " + attendanceList);
			mav.addObject("attendanceList", attendanceList);
		}

		List<Map<String, Object>> scheduleList = null;
		scheduleList = scheduleLogic.getScheduleList(pMap);
		logger.info("scheduleList: " + scheduleList);
		mav.addObject("scheduleList", scheduleList);
		mav.setViewName("../index");

		return mav;
	}
	public void getCalendarSchedule222222222(HttpServletRequest request, HttpServletResponse response)throws Exception  {
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pMap = new HashMap<>();
		hmb.bind(pMap);
		Gson g = new Gson();
	//로그인 시 session에 사원번호(아이디)를 저장하고 그걸 불러온다. session = request.getSession(true);
		/*
		 * String emp_no=(String)session.getAttribute("emp_no"); 
		 * pMap.put("emp_no",emp_no);
		 */
		// ?emp_no=#{emp_no}&schedule_type=[1,20,3]&yy/mm=#{yy/mm}
		
		logger.info("쿼리스트링: " + pMap);
		
		int emp_no = 34;
		pMap.put("emp_no",emp_no);
		
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 개인일정인 경우 출석 시간 받아오기
		if ("3".equals(pMap.get("schedule_type").toString())) {
			List<Map<String, Object>> attendanceList = null;
			attendanceList = scheduleLogic.getAttendance(pMap);
			logger.info("attendanceList: " + attendanceList);
			String imsi2 = g.toJson(attendanceList);
			out.print(imsi2);
		}
		
		List<Map<String, Object>> scheduleList = null;
		scheduleList = scheduleLogic.getScheduleList(pMap);
		logger.info("scheduleList: " + scheduleList);
		
		String imsi = g.toJson(scheduleList);
		
		out.print(imsi);
		
	}

	// 일정 상세조회
	public ModelAndView getDetailSchedule(HttpServletRequest request, HttpServletResponse response) {
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pMap = new HashMap<>();
		hmb.bind(pMap);
		logger.info("쿼리스트링: " + pMap);
		Map<String, Object> detailSchedule = null;
		detailSchedule = scheduleLogic.getDetailSchedule(pMap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("../index");
		mav.addObject("detailSchedule", detailSchedule);

		return mav;

	}

	// 일정 추가
	public void insertSchedule(HttpServletRequest request, HttpServletResponse response) throws  Exception {
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pMap = new HashMap<>();
		hmb.bind(pMap);
		//로그인 시 session에 사원번호(아이디)를 저장하고 그걸 불러온다.
		session = request.getSession(true);
		int emp_no=(int)session.getAttribute("emp_no");
		pMap.put("emp_no", emp_no);
		logger.info("쿼리스트링: " + pMap);
		int result = 0;
		result = scheduleLogic.insertSchedule(pMap);
		logger.info("result: " + result);
		

	}

	// 일정 수정
	public void updateSchedule(HttpServletRequest request, HttpServletResponse response) {
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pMap = new HashMap<>();
		hmb.bind(pMap);
		logger.info("쿼리스트링: " + pMap);
	}

	// 일정 삭제
	public void deleteSchedule(HttpServletRequest request, HttpServletResponse response) {
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pMap = new HashMap<>();
		hmb.bind(pMap);
		logger.info("쿼리스트링: " + pMap);
	}
}
