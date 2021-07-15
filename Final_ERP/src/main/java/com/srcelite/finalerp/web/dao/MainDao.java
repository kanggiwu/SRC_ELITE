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
	
	public String login(Map<String,Object> pmap) {
		logger.info("login 호출 성공 : "+pmap);
		String emp_pw = sqlSessionTemplate.selectOne("getPassword", pmap);
		return emp_pw;
	}
	public void logout() {}
	
	public int insertAttendanceTime(Map<String,Object> pmap) {
		logger.info("insertAttendanceTime 호출 성공 : "+pmap);
		int result = 0;
		sqlSessionTemplate.insert("insertAttendanceTime",pmap);
		result = 1;
		return result;
	}
}
