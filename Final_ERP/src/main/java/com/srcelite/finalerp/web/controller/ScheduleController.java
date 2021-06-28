package com.srcelite.finalerp.web.controller;

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
	
	//일정 조회(월)
	public ModelAndView getCalendarSchedule(HttpServletRequest request, HttpServletResponse response)  {
		logger.info("getCalendarSchedule 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String,Object>> scheduleInfo = null;
		scheduleInfo=scheduleLogic.getCalendarSchedule(target);
		logger.info("scheduleInfo:"+scheduleInfo);//
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myService/empSchedule");
		mav.addObject("scheduleInfo", scheduleInfo);
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
