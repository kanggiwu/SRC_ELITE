package com.srcelite.finalerp.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.srcelite.finalerp.web.logic.MyPageLogic;
import com.util.HashMapBinder;

public class MyPageController extends MultiActionController{
	Logger logger = Logger.getLogger(MyPageController.class);
	MyPageLogic myPageLogic = null;


	
	public void setMyPageLogic(MyPageLogic myPageLogic) {
		this.myPageLogic = myPageLogic;
	}
	public ModelAndView getMyInfo(HttpServletRequest request, HttpServletResponse response) {
		HashMapBinder hmb = new HashMapBinder(request);
		HttpSession session = request.getSession();
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		pmap.put("emp_no", session.getAttribute("login_no"));
		List<Map<String,Object>> infoList = null;
		ModelAndView mav = new ModelAndView();
		infoList = myPageLogic.getMyInfo(pmap);
		logger.info("licences value: "+infoList.get(0).get("LICENCES"));
		if( Integer.parseInt(String.valueOf(infoList.get(0).get("LICENCES"))) > 0) {
			logger.info("자격증 보유 중");
			List<Map<String,Object>> licenceList = null;
			licenceList = myPageLogic.getMyLicenceList(pmap);
			logger.info(licenceList);
			mav.addObject("licenceList", licenceList);
		}
		mav.setViewName("getMyInfo");
		mav.addObject("infoList", infoList);
		return mav;
	}
	public void updateMyInfo(HttpServletRequest req, HttpServletResponse res) 
	throws Exception
	{
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		int result = 0;
		result = myPageLogic.updateMyInfo(pmap);
		if(result == 1) {
			res.sendRedirect("getMyInfo.src1");
		}
		else {
			res.sendRedirect("../index.jsp");
		}
	}
	public ModelAndView getMySalary(HttpServletRequest request, HttpServletResponse response) {
		logger.info("getSalary 호출 성공");
		HttpSession session = request.getSession();
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String, Object>> mySalary = null;
		target.put("login_no", session.getAttribute("login_no"));
		logger.info("login_no : " + session.getAttribute("login_no"));
		target.put("sal_date", "2021-06-05");
		logger.info("target : " + target);
		mySalary = myPageLogic.getMySalary(target);
		logger.info("mySalary:"+mySalary);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getMySalary");
		mav.addObject("mySalary", mySalary);
		return mav;
	}
	public void getYearSalary(HttpServletRequest request, HttpServletResponse response) {
		
	}
	public void getRetirementPay(HttpServletRequest request, HttpServletResponse response) {
		
	}

}
