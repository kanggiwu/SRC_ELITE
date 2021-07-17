package com.srcelite.finalerp.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.dao.DataAccessException;

public class HumanResourceDao {
	Logger logger = Logger.getLogger(HumanResourceDao.class);
	SqlSessionTemplate sqlSessionTemplate = null;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public List<Map<String, Object>> getEmployeeList(Map<String, Object> pmap) {
		List<Map<String, Object>> boardList = null;
		boardList = sqlSessionTemplate.selectList("getEmpList",pmap);
		logger.info("List: "+ boardList);
		return boardList;
	}
	public List<Map<String, Object>> getEmployeeDetail(Map<String, Object> pmap) {
		List<Map<String, Object>> boardDetail = null;
		boardDetail = sqlSessionTemplate.selectList("getDetailEmpInfo",pmap);
		return boardDetail;
	}
	public int insertEmployee(Map<String, Object> pmap) 
			throws DataAccessException{
		int result = 0;
		result = sqlSessionTemplate.insert("insertEmpInfo",pmap);
		return result;
	}
	public int updateEmployee(Map<String, Object> pmap) {
		int result = 0;
		sqlSessionTemplate.update("updateEmpInfo",pmap);
		result = 1;
		return result;
	}
	public List<Map<String, Object>> getEmpLicenceList(Map<String, Object> pmap) {
		List<Map<String, Object>> licenceList = null;
		licenceList = sqlSessionTemplate.selectList("getLicenceInfo",pmap);
		return licenceList;
	}
	public List<Map<String, Object>> getEmpSearchList(Map<String, Object> pmap) {
		List<Map<String, Object>> boardList = null;
		sqlSessionTemplate.selectList("getEmpListProc",pmap);
		logger.info("1: "+ pmap.get("e_cursor"));
		boardList = (List<Map<String, Object>>) pmap.get("e_cursor");
		return boardList;
	}
	public List<Map<String, Object>> getOrganizationChart(Map<String, Object> pmap) {
		List<Map<String, Object>> organizationChartPath = null;
		organizationChartPath = sqlSessionTemplate.selectList("getOrganizationChart",pmap);
		return organizationChartPath;
	}
	public int updateOrganizationChart(Map<String, Object> pmap) {
		int result = 0;
		sqlSessionTemplate.update("updateOrganizationChart",pmap);
		result = 1;
		return result;
	}
}
