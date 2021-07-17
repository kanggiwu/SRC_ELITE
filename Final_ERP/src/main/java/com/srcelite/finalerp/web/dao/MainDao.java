package com.srcelite.finalerp.web.dao;

import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class MainDao {
	SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(MainDao.class);

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public Map<String, Object> login(Map<String,Object> pmap) {
		logger.info("login 호출 성공 : "+pmap);
		Map<String, Object> emp_info = null;
		emp_info = sqlSessionTemplate.selectOne("getLoginInfo", pmap);
		return emp_info;
	}
	public void logout() {}
	
	public int insertAttendanceTime(Map<String,Object> pmap) {
		logger.info("insertAttendanceTime 호출 성공 : "+pmap);
		int result = 0;
		result = sqlSessionTemplate.insert("insertAttendanceTime",pmap);
		return result;
	}
	public int checkAttendance(Map<String,Object> pmap) {
		logger.info("checkAttendance 호출 성공 : " + pmap);
		logger.info("pmap : " + pmap);
		logger.info("pmap.get(\"emp_no\").toString() : " + pmap.get("emp_no").toString());
		int result = 0;
		try {
		result = sqlSessionTemplate.selectOne("checkAttendance", pmap.get("emp_no").toString());
		} catch(NullPointerException ne) {
			return 0;
		}
		if(result == 0) {
			return 0;
		} else {
			return result;
		}
		
	}
}
