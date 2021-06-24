package com.srcelite.finalerp.web.mvc;

import java.util.List;
import java.util.Map;

public class ScheduleLogic {
	ScheduleDao scheduleDao = null;

	public void setScheduleDao(ScheduleDao scheduleDao) {
		this.scheduleDao = scheduleDao;
	}
	
	
	//일정 조회(월)
	public List<Map<String,Object>> getCalendarSchedule(Map<String,Object> pamp)   {return null;}
	//일정 상세조회
	public Map<String,Object> getDetailSchedule(Map<String,Object> pmap)    {return null;}
	//일정 추가
	public void insertSchedule(Map<String,Object> pmap) {}
	//일정 수정
	public void updateSchedule(Map<String,Object> pmap) {}
	//일정 삭제
	public void deleteSchedule(Map<String,Object> pmap) {}
	
	
	
	
	
}
