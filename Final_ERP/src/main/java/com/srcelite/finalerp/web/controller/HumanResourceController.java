package com.srcelite.finalerp.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.srcelite.finalerp.web.logic.HumanResourceLogic;
import com.util.HashMapBinder;


public class HumanResourceController extends MultiActionController {
	Logger logger = Logger.getLogger(HumanResourceController.class);
	HumanResourceLogic humanResourceLogic = null;

	public void setHumanResourceLogic(HumanResourceLogic humanResourceLogic) {
		this.humanResourceLogic = humanResourceLogic;
	}
	public ModelAndView getEmployeeList(HttpServletRequest req, HttpServletResponse res)
	throws Exception
	{
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<String, Object>();
		logger.info(req.getParameter("emp_name"));
		hmb.bind(pmap);
		List<Map<String,Object>> boardList = null;
		logger.info("emp_name value: "+pmap.get("emp_name"));
		logger.info("dept_name value: "+pmap.get("dept_name"));
		logger.info("rank_name value: "+pmap.get("rank_name"));
		if(pmap.get("dept_name") != null) {
			boardList = humanResourceLogic.getEmpSearchList(pmap);
		}else {
		boardList = humanResourceLogic.getEmployeeList(pmap);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getEmployeeList");
		mav.addObject("boardList", boardList);
		return mav;
	}
	public ModelAndView getDetailEmployee(HttpServletRequest req, HttpServletResponse res)
	throws Exception
	{
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		List<Map<String,Object>> boardDetail = null;
		ModelAndView mav = new ModelAndView();
		logger.info("emp_no value: "+pmap.get("emp_no"));
		if(pmap.get("emp_no") != null) {
			boardDetail = humanResourceLogic.getDetailEmployee(pmap);
			logger.info("licences value: "+boardDetail.get(0).get("LICENCES"));
			if( Integer.parseInt(String.valueOf(boardDetail.get(0).get("LICENCES"))) > 0) {
				logger.info("자격증 보유 중");
				List<Map<String,Object>> licenceList = null;
				licenceList = humanResourceLogic.getEmpLicenceList(pmap);
				logger.info(licenceList);
				mav.addObject("licenceList", licenceList);
			}
			mav.setViewName("getDetailEmployee");
			mav.addObject("boardDetail", boardDetail);
			return mav;
		}else {
			mav.setViewName("insertEmployee");
			return mav;
		}
	}	
	public void insertEmployee(HttpServletRequest req, HttpServletResponse res)
			throws Exception
	{
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.multiBind(pmap);
		int result = 0;
		result = humanResourceLogic.insertEmployee(pmap);
		if(result == 1) {
			res.sendRedirect("getEmployeeList.src1");
		}
		else {
			res.sendRedirect("등록실패 페이지 이동처리");
		}
	}	
	public ModelAndView getOrganizationChart(HttpServletRequest req, HttpServletResponse res)
	throws Exception
	{

		ModelAndView mav = new ModelAndView();
		mav.setViewName("getOrganizationChart");
		return mav;
		
	}
//	public void updateOrganizationChart(HttpServletRequest req, HttpServletResponse res)
//			throws Exception
//	{
//		HashMapBinder hmb = new HashMapBinder(req);
//		Map<String,Object> pmap = new HashMap<>();
//		hmb.bind(pmap);
//		int result = 0;
//		result = humanResourceLogic.insertEmployee(pmap);
//		if(result == 1) {
//			res.sendRedirect("");
//		}
//		else {
//			res.sendRedirect("등록실패 페이지 이동처리");
//		}
//	}
	public ModelAndView getEmpSearchList(HttpServletRequest req, HttpServletResponse res)
	throws Exception
	{
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<String, Object>();
		hmb.multiBind(pmap);
		List<Map<String,Object>> boardList = null;
		logger.info("emp_name value: "+pmap.get("emp_name"));
		logger.info("dept_name value: "+pmap.get("dept_name"));
		logger.info("rank_name value: "+pmap.get("rank_name"));
			boardList = humanResourceLogic.getEmpSearchList(pmap);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("getEmployeeList");
		mav.addObject("boardList", boardList);
		return mav;
	}
	public void updateEmployee(HttpServletRequest req, HttpServletResponse res)
			throws Exception
	{
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.multiBind(pmap);
		int result = 0;
		result = humanResourceLogic.updateEmployee(pmap);
		if(result == 1) {
			res.sendRedirect("getEmployeeList.src1");
		}
		else {
			res.sendRedirect("등록실패 페이지 이동처리");
		}
	}	
}
