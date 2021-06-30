package com.srcelite.finalerp.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.srcelite.finalerp.web.logic.ProjectHistoryLogic;
import com.util.HashMapBinder;

public class ProjectHistoryController extends MultiActionController {
	Logger logger = Logger.getLogger(ProjectHistoryController.class);
	ProjectHistoryLogic projectHistoryLogic = null;

	public void setProjectHistoryLogic(ProjectHistoryLogic projectHistoryLogic) {
		this.projectHistoryLogic = projectHistoryLogic;
	}
	
	//프로젝트이력관리 리스트 조회
	public ModelAndView getProjectHistoryList(HttpServletRequest request, HttpServletResponse response) 
	throws Exception
	{
		logger.info("getProjectHistoryList 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String,Object>> projectHistoryList = null;
		projectHistoryList=projectHistoryLogic.getProjectHistoryList(target);
		logger.info("projectHistoryList:"+projectHistoryList);//
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getProjectHistoryList");
		mav.addObject("projectHistoryList", projectHistoryList);
		return mav;
	}
	
	//프로젝트이력관리 상세 조회
	public ModelAndView getDetailProjectHistory(HttpServletRequest request, HttpServletResponse response)
	throws Exception
	{
		logger.info("getDetailProjectHistory 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> target = new HashMap<>();
		hmb.bind(target);		
		//logger.info("emp_no : "+target.get("emp_no"));
		logger.info("project_no : "+target.get("project_no"));
		List<Map<String,Object>> detailProjectHistory = null;
		detailProjectHistory=projectHistoryLogic.getDetailProjectHistory(target);
		logger.info("detailProjectHistory:"+detailProjectHistory);//
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getDetailProjectHistory");
		mav.addObject("detailProjectHistory", detailProjectHistory);
		return mav;
	}
	
	// 프로젝트이력관리  추가
	//public ModelAndView insertProjectHistory(HttpServletRequest request, HttpServletResponse response) 
	public void insertProjectHistory(HttpServletRequest request, HttpServletResponse response) 
	throws Exception
	{
		logger.info("insertProjectHistory 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		int result = 0;
		result = projectHistoryLogic.insertProjectHistory(pmap);
		if(result == 1) {
			response.sendRedirect("getProjectHistoryList.src1");
		}
		else {
			response.sendRedirect("등록실패 페이지 이동처리");
		}
		//return null;
	}

}
