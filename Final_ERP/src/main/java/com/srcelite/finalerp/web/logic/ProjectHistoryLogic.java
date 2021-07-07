package com.srcelite.finalerp.web.logic;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.srcelite.finalerp.web.dao.ProjectHistoryDao;

public class ProjectHistoryLogic {
	ProjectHistoryDao projectHistoryDao = null;
	Logger logger = Logger.getLogger(ProjectHistoryLogic.class);

	public void setProjectHistoryDao(ProjectHistoryDao projectHistoryDao) {
		this.projectHistoryDao = projectHistoryDao;
	}
	
	
	//프로젝트이력관리 리스트 조회
	//public List<Map<String,Object>> getProjectHistoryList(HttpServletRequest request, HttpServletResponse response) {return null;}
	public List<Map<String, Object>> getProjectHistoryList(Map<String, Object> pmap) {
		logger.info("getProjectHistoryList 호출 성공");
		List<Map<String,Object>> projectHistoryList = null;
		projectHistoryList = projectHistoryDao.getProjectHistoryList(pmap);			
		return projectHistoryList;
	}
	
	//프로젝트이력관리 상세 조회
	//public Map<String,Object> getDetailProjectHistory(HttpServletRequest request, HttpServletResponse response)     
	public List<Map<String,Object>> getDetailProjectHistory(Map<String, Object> pmap)     
	{
		logger.info("getDetailProjectHistory 호출 성공");
		List<Map<String,Object>> detailProjectHistory = null;
		detailProjectHistory = projectHistoryDao.getDetailProjectHistoryList(pmap);			
		return detailProjectHistory;
	}
	
	//프로젝트이력관리 인력 조회
	//public Map<String,Object> getDetailProjectHistory(HttpServletRequest request, HttpServletResponse response)     
	public List<Map<String,Object>> getProjectParticipation(Map<String, Object> pmap)     
	{
		logger.info("getProjectParticipation 호출 성공");
		List<Map<String,Object>> projectParticipation = null;
		projectParticipation = projectHistoryDao.getProjectParticipation(pmap);			
		return projectParticipation;
	}
	
	// 프로젝트이력관리  추가
	//public void insertProjectHistory(HttpServletRequest request, HttpServletResponse response)                      {}
	public List<Map<String,Object>> insertProjectHistory(Map<String, Object> pmap)             
	{
		logger.info("insertProjectHistory 호출 성공");
		int result = 0;
		int bm_no = 0;
		return null;
	}


	public List<Map<String, Object>> getprojectNameList(Map<String, Object> pmap) {
		logger.info("getprojectNameList 호출 성공");
		//로딩시 프로젝트명 가져와서 콤보박스에 넣기
		List<Map<String,Object>> projectNameList = null;
		projectNameList = projectHistoryDao.getprojectNameList(pmap);			
		return projectNameList;		
	}


	public List<Map<String, Object>> getEmpSearchList2(Map<String, Object> pmap) {
		logger.info("getEmpSearchList2 호출 성공");
		List<Map<String,Object>> empSearchList2 = null;
		empSearchList2 = projectHistoryDao.getEmpSearchList2(pmap);			
		return empSearchList2;	
	}

	//프로젝트 이력조회 검색
	public List<Map<String, Object>> getProjectListProc(Map<String, Object> pmap) {
		logger.info("getProjectListProc 호출 성공");
		List<Map<String,Object>> projectListProc = null;
		projectListProc = projectHistoryDao.getProjectListProc(pmap);			
		return projectListProc;
	}


	public int updateProjectInfo(Map<String, Object> pmap) {
		logger.info("updateProjectInfo 호출 성공");
		int result = 0;
		//List<Map<String,Object>> updateProjectInfo = null;
		result = projectHistoryDao.updateProjectInfo(pmap);			
		return result;
	}






	
	
}
