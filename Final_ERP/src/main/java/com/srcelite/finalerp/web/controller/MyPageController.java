package com.srcelite.finalerp.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	public ModelAndView getMyInfo(HttpServletRequest req, HttpServletResponse res) {
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		pmap.put("emp_no", 5);
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
	public void updateMyInfo(HttpServletRequest request, HttpServletResponse response) {
		
	}
	public ModelAndView getSalary(HttpServletRequest request, HttpServletResponse response) {
		logger.info("getSalary 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> target = new HashMap<>();
		hmb.bind(target);
		Map<String, Object> mySalary = null;
		mySalary = myPageLogic.getSalary(target);
		logger.info("mySalary:"+mySalary);//
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getSalary");
		mav.addObject("mySalary", mySalary);
		return mav;
	}
	public void getYearSalary(HttpServletRequest request, HttpServletResponse response) {
		
	}
	public void getRetirementPay(HttpServletRequest request, HttpServletResponse response) {
		
	}

}
