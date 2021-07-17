package com.srcelite.finalerp.web.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class MyPageDao {
	SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(MyPageDao.class);

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public int insertAttendanceTime(Map<String,Object> pmap) {
		logger.info("insertAttendanceTime 호출 성공 : "+pmap);
		int result = 0;
		sqlSessionTemplate.insert("insertAttendanceTime",pmap);
		result = 1;
		return result;
	}

	public List<Map<String, Object>> getMyInfo(Map<String, Object> pmap) {
		List<Map<String, Object>> infoList = null;
		infoList = sqlSessionTemplate.selectList("getDetailEmp",pmap);
		return infoList;
	}

	public List<Map<String, Object>> getMyLicenceList(Map<String, Object> pmap) {
		List<Map<String, Object>> licenceList = null;
		licenceList = sqlSessionTemplate.selectList("getLicenceInfo",pmap);
		return licenceList;
	}

	public int updateMyInfo(Map<String, Object> pmap) {
		int result = 0;
		sqlSessionTemplate.update("updatePassword",pmap);
		result = 1;
		return result;
	}

	public List<Map<String, Object>> getMySalary(Map<String, Object> pmap) {
		List<Map<String, Object>> mySalaryList = null;
		mySalaryList = sqlSessionTemplate.selectList("getSalary",pmap);
		return mySalaryList;
	}
	
	/*
	 * public Map<String, Object> getRetirementPay(Map<String, Object> pmap) {
	 * 
	 * }
	 */
}
