package com.srcelite.finalerp.web.mvc;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class ProjectHistoryLogic {
	ProjectHistoryDao projectHistoryDao = null;

	public void setProjectHistoryDao(ProjectHistoryDao projectHistoryDao) {
		this.projectHistoryDao = projectHistoryDao;
	}
	
	
	//프로젝트이력관리 리스트 조회
	//public List<Map<String,Object>> getProjectHistoryList(HttpServletRequest request, HttpServletResponse response) {return null;}
	public List<Map<String, Object>> getProjectHistoryList(Map<String, Object> pmap) {
		return null;
	}
	
	//프로젝트이력관리 상세 조회
	public Map<String,Object> getDetailProjectHistory(HttpServletRequest request, HttpServletResponse response)     {return null;}
	// 프로젝트이력관리  추가
	public void insertProjectHistory(HttpServletRequest request, HttpServletResponse response)                      {}






	
	
}
