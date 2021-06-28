package com.srcelite.finalerp.web.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ScheduleDao {
	SqlSessionTemplate sqlSessionTemplate = null;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public List<Map<String, Object>> getCalendarSchedule(Map<String, Object> pmap) {
		List<Map<String, Object>> scheduleInfo = null;
		scheduleInfo = sqlSessionTemplate.selectList("getAttendanceThisMonth",pmap);
		return scheduleInfo;
	}
}

