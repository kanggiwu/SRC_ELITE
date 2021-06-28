package com.srcelite.finalerp.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.srcelite.finalerp.web.logic.ScheduleLogic;
import com.util.HashMapBinder;

public class ScheduleController extends MultiActionController {
	ScheduleLogic scheduleLogic = null;

	public void setScheduleLogic(ScheduleLogic scheduleLogic) {
		this.scheduleLogic = scheduleLogic;
	}
	

	//일정 조회(월)--해당월만 바로 가져오지 않고 사용자가 선택한 월로 조회하면 될듯 합니다.
	public ModelAndView getCalendarSchedule(HttpServletRequest request, HttpServletResponse response)  {
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pMap =new HashMap<>();
		hmb.bind(pMap);
		List<Map<String,Object>> attendanceOptionalList = null;
		logger.info("쿼리스트링: "+pMap);
		attendanceOptionalList=scheduleLogic.getAttendance(pMap);
		logger.info("attendanceOptionalList: "+attendanceOptionalList);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("../index");
		mav.addObject("attendanceOptionalList",attendanceOptionalList);

		return mav;
	}
	//일정 상세조회
	public ModelAndView getDetailSchedule(HttpServletRequest request, HttpServletResponse response)    {
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pMap =new HashMap<>();
		hmb.bind(pMap);
		logger.info("쿼리스트링: "+pMap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("../index");

		return mav;
		
		
		
	}
	//일정 추가
	public void insertSchedule(HttpServletRequest request, HttpServletResponse response){
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pMap =new HashMap<>();
		hmb.bindPost(pMap);
		logger.info("쿼리스트링: "+pMap);
		
		
		
		
	}
	//일정 수정
	public void updateSchedule(HttpServletRequest request, HttpServletResponse response){
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pMap =new HashMap<>();
		hmb.bindPost(pMap);
		logger.info("쿼리스트링: "+pMap);
	}
	//일정 삭제
	public void deleteSchedule(HttpServletRequest request, HttpServletResponse response){
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pMap =new HashMap<>();
		hmb.bindPost(pMap);
		logger.info("쿼리스트링: "+pMap);
	}
}
