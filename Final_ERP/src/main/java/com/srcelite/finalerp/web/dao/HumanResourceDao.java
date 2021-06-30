package com.srcelite.finalerp.web.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class HumanResourceDao {
	SqlSessionTemplate sqlSessionTemplate = null;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public List<Map<String, Object>> getEmployeeList(Map<String, Object> pmap) {
		List<Map<String, Object>> boardList = null;
		boardList = sqlSessionTemplate.selectList("getEmpList",pmap);
		return boardList;
	}
	public List<Map<String, Object>> getEmployeeDetail(Map<String, Object> pmap) {
		List<Map<String, Object>> boardDetail = null;
		boardDetail = sqlSessionTemplate.selectList("getDetailEmpInfo",pmap);
		return boardDetail;
	}
	public int insertEmployee(Map<String, Object> pmap) {
		int result = 0;
		result = 1;
//		sqlSessionTemplate.insert("insertEmpInfo",pmap);
		return result;
	}
	public int updateEmployee(Map<String, Object> pmap) {
		int result = 0;
		result = 1;
//		sqlSessionTemplate.insert("insertEmpInfo",pmap);
		return result;
	}
	public List<Map<String, Object>> getEmpLicenceList(Map<String, Object> pmap) {
		List<Map<String, Object>> licenceList = null;
		licenceList = sqlSessionTemplate.selectList("getLicenceInfo",pmap);
		return licenceList;
	}
	public List<Map<String, Object>> getEmpSearchList(Map<String, Object> pmap) {
		List<Map<String, Object>> boardList = null;
		boardList = sqlSessionTemplate.selectList("getEmpListProc",pmap);
		return boardList;
	}
}
