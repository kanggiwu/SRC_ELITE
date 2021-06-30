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
		detailProjectHistory = projectHistoryDao.getProjectHistoryList(pmap);			
		return detailProjectHistory;
	}
	
	// 프로젝트이력관리  추가
	//public void insertProjectHistory(HttpServletRequest request, HttpServletResponse response)                      {}
	public int insertProjectHistory(Map<String, Object> pmap)             
	{
		logger.info("insertProjectHistory 호출 성공");
		int result = 0;
		int bm_no = 0;
		
		return result;
	}






	
	
}
