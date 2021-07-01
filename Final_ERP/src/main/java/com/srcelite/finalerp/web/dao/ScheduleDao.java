package com.srcelite.finalerp.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class ScheduleDao {
	SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(ScheduleDao.class);
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public List<Map<String, Object>> getAttendance(Map<String, Object> pMap) {
		List<Map<String, Object>> attendancetList = null;
		attendancetList = sqlSessionTemplate.selectList("getAttendance",pMap);
		
		return attendancetList;
	}



	public List<Map<String, Object>> getScheduleList(Map<String, Object> pMap) {
		logger.info("다오 getScheduleList 호출 성공");
		List<Map<String, Object>> getScheduleList = null;
		getScheduleList = sqlSessionTemplate.selectList("getScheduleList",pMap);
		
		
		return getScheduleList;
	}

	public Map<String, Object> getDetailSchedule(Map<String, Object> pMap) {
		Map<String, Object> detailSchedule =null;
//		detailSchedule = sqlSessionTemplate.selectOne();
		
		return detailSchedule;
	}

	public int deleteSchedule(Map<String, Object> pMap) {
		int result = 0;
		logger.info("dao result: " + result);
		
		return 0;
	}

	public int insertSchedule(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSessionTemplate.insert("insertSchedule",pMap);
		logger.info("dao result: " + result);
		
		return result;
	}

	public int updateSchedule(Map<String, Object> pMap) {
		return 0;
	}


	public String getDept(Map<String, Object> pMap) {
		String emp_no = null;
		emp_no = sqlSessionTemplate.selectOne("getDept",pMap);
		
		return emp_no;
	}

}

