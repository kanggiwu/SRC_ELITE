package com.srcelite.finalerp.web.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.Gson;
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
		//프로젝트 인력 담을 리스트
		List<Map<String,Object>> projectParticipation = null;
		detailProjectHistory=projectHistoryLogic.getDetailProjectHistory(target);
		projectParticipation=projectHistoryLogic.getProjectParticipation(target);
		logger.info("detailProjectHistory:"+detailProjectHistory);//
		ModelAndView mav = new ModelAndView();
		//ModelAndView pmav = new ModelAndView();
		mav.setViewName("getDetailProjectHistory");
		mav.addObject("detailProjectHistory", detailProjectHistory);
		//pmav.addObject("projectParticipation", projectParticipation);
		mav.addObject("projectParticipation", projectParticipation);
		return mav;
	}
	
	// 프로젝트이력관리  추가
	//public ModelAndView insertProjectHistory(HttpServletRequest request, HttpServletResponse response) 
	public ModelAndView insertProjectHistory(HttpServletRequest request, HttpServletResponse response) 
	throws Exception
	{
		logger.info("insertProjectHistory 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String,Object>> projectNameList = null;
		projectNameList=projectHistoryLogic.getprojectNameList(target);
		logger.info("projectNameList:"+projectNameList);//
		ModelAndView mav = new ModelAndView();
		mav.setViewName("insertProjectHistory");
		mav.addObject("projectNameList", projectNameList);
		return mav;
	}
	
	//사원검색
	/*
	 * public ModelAndView getEmpSearchList2(HttpServletRequest request,
	 * HttpServletResponse response) throws Exception
	 */
	public void  getEmpSearchList2(HttpServletRequest request, HttpServletResponse response) 
			throws Exception
			{
				logger.info("getEmpSearchList2 호출 성공");
				HashMapBinder hmb = new HashMapBinder(request);
				Map<String,Object> target = new HashMap<>();
				hmb.bind(target);
				List<Map<String,Object>> empSearchList2 = null;
				empSearchList2=projectHistoryLogic.getEmpSearchList2(target);
				logger.info("empSearchList2:"+empSearchList2);//
				Gson g = new Gson();
				String imsi = g.toJson(empSearchList2);
				response.setContentType("application/json;charset=utf-8");
				PrintWriter out = response.getWriter();
				System.out.println("여기야");
				System.out.println(imsi);
				out.print(imsi);
				
				/*
				 * ModelAndView mav = new ModelAndView();
				 * mav.setViewName("insertProjectHistory"); mav.addObject("empSearchList2",
				 * empSearchList2); return mav;
				 */
			}

}
