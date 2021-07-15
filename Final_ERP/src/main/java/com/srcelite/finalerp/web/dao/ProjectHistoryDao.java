package com.srcelite.finalerp.web.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ProjectHistoryDao {
	SqlSessionTemplate sqlSessionTemplate = null;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	//프로젝트 이려관리 조회
	public List<Map<String, Object>> getProjectHistoryList(Map<String, Object> pmap) {
		
		List<Map<String, Object>> projectHistoryList = null;
		projectHistoryList = sqlSessionTemplate.selectList("getProjectHistoryList",pmap);
		return projectHistoryList;
	}
	//상세조회
	public List<Map<String, Object>> getDetailProjectHistoryList(Map<String, Object> pmap) {
		
		List<Map<String, Object>> detailProjectHistory = null;
		detailProjectHistory = sqlSessionTemplate.selectList("getDetailProject",pmap);
		return detailProjectHistory;
	}
	//인력조회
	public List<Map<String, Object>> getProjectParticipation(Map<String, Object> pmap) {
		List<Map<String, Object>> projectParticipation = null;
		projectParticipation = sqlSessionTemplate.selectList("getProjectParticipation",pmap);
		return projectParticipation;
	}
	//프로젝트 추가
	public List<Map<String, Object>> getprojectNameList(Map<String, Object> pmap) {
		List<Map<String, Object>> projectNameList = null;
		projectNameList = sqlSessionTemplate.selectList("getprojectNameList",pmap);
		return projectNameList;
	}
	public List<Map<String, Object>> getEmpSearchList2(Map<String, Object> pmap) {
		List<Map<String, Object>> empSearchList2 = null;
	    sqlSessionTemplate.selectList("getEmpListProc2",pmap);
	    empSearchList2 = (List<Map<String, Object>>) pmap.get("e_cursor");
	    return empSearchList2;
	}
	//프로젝트 이력 조회 검색
	public List<Map<String, Object>> getProjectListProc(Map<String, Object> pmap) {
		List<Map<String, Object>> projectListProc = null;
	    sqlSessionTemplate.selectList("getProjectListProc",pmap);
	    projectListProc = (List<Map<String, Object>>) pmap.get("e_cursor");
	    return projectListProc;
	}
	
}
