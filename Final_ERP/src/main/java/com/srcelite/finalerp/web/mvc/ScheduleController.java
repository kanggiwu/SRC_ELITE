package com.srcelite.finalerp.web.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class ScheduleController extends MultiActionController {
	ScheduleLogic scheduleLogic = null;

	public void setScheduleLogic(ScheduleLogic scheduleLogic) {
		this.scheduleLogic = scheduleLogic;
	}
	
	//일정 조회(월)
	public ModelAndView getCalendarSchedule(HttpServletRequest request, HttpServletResponse response)  {return null;}
	//일정 상세조회
	public ModelAndView getDetailSchedule(HttpServletRequest request, HttpServletResponse response)    {return null;}
	//일정 추가
	public void insertSchedule(HttpServletRequest request, HttpServletResponse response){}
	//일정 수정
	public void updateSchedule(HttpServletRequest request, HttpServletResponse response){}
	//일정 삭제
	public void deleteSchedule(HttpServletRequest request, HttpServletResponse response){}
}
