package com.srcelite.finalerp.web.logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.srcelite.finalerp.web.dao.ScheduleDao;

public class ScheduleLogic {
	ScheduleDao scheduleDao = null;
	Logger logger = Logger.getLogger(ScheduleLogic.class);
	public void setScheduleDao(ScheduleDao scheduleDao) {
		this.scheduleDao = scheduleDao;
	}
	
	
	//일정 조회(월)
	public List<Map<String,Object>> getAttendance(Map<String,Object> pmap)   {
		logger.info("Logic getCalendarSchedule 호출 성공");
		List<Map<String,Object>> attendanceList = null;
		
		attendanceList = scheduleDao.getAttendance(pmap);
		
		return attendanceList;
		}

	//일정 상세조회
	public Map<String,Object> getDetailSchedule(Map<String,Object> pmap)    {return null;}
	//일정 추가
	public void insertSchedule(Map<String,Object> pmap) {}
	//일정 수정
	public void updateSchedule(Map<String,Object> pmap) {}
	//일정 삭제
	public void deleteSchedule(Map<String,Object> pmap) {}
	
	
	
	
	
}
