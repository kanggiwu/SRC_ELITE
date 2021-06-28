package com.srcelite.finalerp.web.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ScheduleDao {
	SqlSessionTemplate sqlSessionTemplate = null;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	


	public List<Map<String, Object>> getAttendance(Map<String, Object> pmap) {
		List<Map<String, Object>> attendancetList = null;
		
		attendancetList = sqlSessionTemplate.selectList("getAttendance",pmap);
		
		return attendancetList;
	}



	public List<Map<String, Object>> getScheduleList(Map<String, Object> pMap) {
		
		return null;
	}

}
