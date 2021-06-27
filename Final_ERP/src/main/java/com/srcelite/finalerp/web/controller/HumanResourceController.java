package com.srcelite.finalerp.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.srcelite.finalerp.web.logic.HumanResourceLogic;
import com.util.HashMapBinder;


public class HumanResourceController extends MultiActionController {
	HumanResourceLogic humanResourceLogic = null;

	public void setHumanResourceLogic(HumanResourceLogic humanResourceLogic) {
		this.humanResourceLogic = humanResourceLogic;
	}
	public ModelAndView getEmployeeList(HttpServletRequest req, HttpServletResponse res)
	throws Exception
	{
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> rmap = new HashMap<String, Object>();
//		hmb.bind(rmap);
//		List<Map<String,Object>> boardList = null;
//		boardList = humanResourceLogic.getEmployeeList(rmap);
		ModelAndView mav = new ModelAndView();
		List<Map<String,Object>> boardList = new ArrayList<Map<String,Object>>();
		rmap.put("emp_no", "1111");
		rmap.put("emp_name", "개구리");
		rmap.put("dept_name", "인사부");
		rmap.put("rank_name", "사장");
		rmap.put("emp_status", "재직");
		boardList.add(rmap);
		rmap = new HashMap<String, Object>();
		rmap.put("emp_no", "1112");
		rmap.put("emp_name", "왕눈이");
		rmap.put("dept_name", "회계부");
		rmap.put("rank_name", "사원");
		rmap.put("emp_status", "휴직");
		boardList.add(rmap);
		rmap = new HashMap<String, Object>();
		rmap.put("emp_no", "1113");
		rmap.put("emp_name", "투투");
		rmap.put("dept_name", "개발부");
		rmap.put("rank_name", "과장");
		rmap.put("emp_status", "퇴직");
		boardList.add(rmap);
		mav.setViewName("myService/getEmployeeList");
		mav.addObject("boardList", boardList);
		return mav;
	}
	public ModelAndView getDetailEmployee(HttpServletRequest req, HttpServletResponse res)
	throws Exception
	{
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String,Object>> boardDetail = null;
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myService/getDetailEmployee");
		mav.addObject("boardDetail", boardDetail);
		return mav;
	}	
}
