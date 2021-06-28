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
	public ModelAndView getDetailProjectHistory(HttpServletRequest request, HttpServletResponse response) 	{return null;}
	// 프로젝트이력관리  추가
	public ModelAndView insertProjectHistory(HttpServletRequest request, HttpServletResponse response)      {return null;}

}
