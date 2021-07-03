package com.srcelite.finalerp.web.logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.dao.support.DaoSupport;

import com.srcelite.finalerp.web.dao.ScheduleDao;

public class ScheduleLogic {
	ScheduleDao scheduleDao = null;
	Logger logger = Logger.getLogger(ScheduleLogic.class);
	public void setScheduleDao(ScheduleDao scheduleDao) {
		this.scheduleDao = scheduleDao;
	}
	
	
	//일정 조회(월) -- 출근 시간
	public List<Map<String,Object>> getAttendance(Map<String,Object> pMap)   {
		logger.info("Logic getCalendarSchedule 호출 성공");
		List<Map<String,Object>> attendanceList = null;
		
		attendanceList = scheduleDao.getAttendance(pMap);
		return attendanceList;
	}
	//일정 조회(월) -- 스케줄 타입별로 데이터 가져오기
	public List<Map<String, Object>> getScheduleList(Map<String, Object> pMap) {
		List<Map<String,Object>> scheduleList = null;
		
		
		scheduleList=scheduleDao.getScheduleList(pMap);
		
		return scheduleList;
	}

	//일정 상세조회
	public Map<String,Object> getDetailSchedule(Map<String,Object> pMap)    {
		Map<String,Object> detailSchedule = null;
		detailSchedule = scheduleDao.getDetailSchedule(pMap);
		
		return detailSchedule;
	}
	
	//일정 추가
	public int insertSchedule(Map<String,Object> pMap) {
		logger.info("inserSchedule 로직 호출");
		int result = 0;
		
		logger.info("logic schedule_type 변환전: "+pMap.get("schedule_type"));
		String schedule_type = (String) pMap.get("schedule_type");

		switch (schedule_type) {
		case "공통": 
			pMap.put("schedule_type",1);
			break;
		case "부서": 
			pMap.put("schedule_type",scheduleDao.getDept(pMap));
			break;
		case "프로젝트": 
			pMap.put("schedule_type",2);
			break;
		case "개인": 
			pMap.put("schedule_type",3);
			break;
		}
		logger.info("logic schedule_type 변환 후: "+pMap.get("schedule_type"));
		result = scheduleDao.insertSchedule(pMap);
		logger.info("logic result: "+result);
		
		return result;
	}
	//일정 수정
	public int updateSchedule(Map<String,Object> pMap) {
		int result = 0;
		result = scheduleDao.updateSchedule(pMap);
		return result;
	}
	//일정 삭제
	public int deleteSchedule(Map<String,Object> pMap) {
		int result = 0;
		result = scheduleDao.deleteSchedule(pMap);
		return result;
	}


	
	
	
	
	
}
