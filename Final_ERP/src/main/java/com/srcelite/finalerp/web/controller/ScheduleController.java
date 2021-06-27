package com.srcelite.finalerp.web.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
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
	
	//일정 조회(월)
	public ModelAndView getCalendarSchedule(HttpServletRequest request, HttpServletResponse response)  {
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pMap =new HashMap<>();
		hmb.bind(pMap);
		List<Map<String,Object>> scheduleList = null;
		scheduleList=scheduleLogic.getCalendarSchedule(pMap);
		logger.info("쿼리스트링: "+pMap);
		logger.info("scheduleList: "+scheduleList);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("../index");
		mav.addObject("scheduleList",scheduleList);

		return mav;
	}
	//일정 상세조회
	public ModelAndView getDetailSchedule(HttpServletRequest request, HttpServletResponse response)    {return null;}
	//일정 추가
	public void insertSchedule(HttpServletRequest request, HttpServletResponse response){}
	//일정 수정
	public void updateSchedule(HttpServletRequest request, HttpServletResponse response){}
	//일정 삭제
	public void deleteSchedule(HttpServletRequest request, HttpServletResponse response){}
}
