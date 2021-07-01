package com.srcelite.finalerp.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.srcelite.finalerp.web.logic.MainLogic;
import com.util.HashMapBinder;

public class MainController extends MultiActionController{
	MainLogic mainLogic = null;

	public void setMainLogic(MainLogic mainLogic) {
		this.mainLogic = mainLogic;
	}
	
	// 로그인
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	// 로그아웃
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
	// 출근
	public void insertAttendanceTime(HttpServletRequest request, HttpServletResponse response) {
		logger.info("insertAttendanceTime호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pmap = new HashMap<>();
		hmb.multiBind(pmap);
		int result = 0; 
		result = mainLogic.insertAttendanceTime(pmap);
		if(result == 1) {
//			response.sendRedirect("");
		}
		else {
//			response.sendRedirect("");
		}
	}
}
