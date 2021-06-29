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
		hmb.bind(pmap);
		List<Map<String,Object>> boardList = null;
		boardList = humanResourceLogic.getEmployeeList(pmap);
		ModelAndView mav = new ModelAndView();
//		List<Map<String,Object>> boardList = new ArrayList<Map<String,Object>>();
//		pmap.put("emp_no", "1111");
//		pmap.put("emp_name", "개구리");
//		pmap.put("dept_name", "인사부");
//		pmap.put("rank_name", "사장");
//		pmap.put("emp_status", "재직");
//		boardList.add(pmap);
//		pmap = new HashMap<String, Object>();
//		pmap.put("emp_no", "1112");
//		pmap.put("emp_name", "왕눈이");
//		pmap.put("dept_name", "회계부");
//		pmap.put("rank_name", "사원");
//		pmap.put("emp_status", "휴직");
//		boardList.add(pmap);
//		pmap = new HashMap<String, Object>();
//		pmap.put("emp_no", "1113");
//		pmap.put("emp_name", "투투");
//		pmap.put("dept_name", "개발부");
//		pmap.put("rank_name", "과장");
//		pmap.put("emp_status", "퇴직");
//		boardList.add(pmap);
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
			if(boardDetail.get(0).get("LICENCES") != "0") {
				List<Map<String,Object>> licenceList = null;
				licenceList = humanResourceLogic.getEmpLicenceList(pmap);
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
		hmb.bind(pmap);
		int result = 0;
		result = humanResourceLogic.insertEmployee(pmap);
		if(result == 1) {
			res.sendRedirect("");
		}
		else {
			res.sendRedirect("등록실패 페이지 이동처리");
		}
	}	

}
