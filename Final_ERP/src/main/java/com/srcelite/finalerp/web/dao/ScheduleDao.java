package com.srcelite.finalerp.web.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ScheduleDao {
	SqlSessionTemplate sqlSessionTemplate = null;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	

	public List<Map<String, Object>> getAttendanceThisMonth(int emp_no) {
		List<Map<String, Object>> scheduleList = null;
		scheduleList = sqlSessionTemplate.selectList("getAttendanceThisMonth",emp_no);
		
		return scheduleList;
	}
}
