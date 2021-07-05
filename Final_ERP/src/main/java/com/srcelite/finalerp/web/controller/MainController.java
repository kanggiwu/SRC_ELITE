package com.srcelite.finalerp.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.srcelite.finalerp.web.logic.MainLogic;
import com.util.HashMapBinder;

public class MainController extends MultiActionController{
	MainLogic mainLogic = null;

	public void setMainLogic(MainLogic mainLogic) {
		this.mainLogic = mainLogic;
	}
	
	// 로그인
	public void login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("login호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		HttpSession session = request.getSession();
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		logger.info("emp_no:"+pmap.get("login_no"));
		int result = mainLogic.login(pmap);
		if(result == 1) { //로그인 성공
			session.setAttribute("login_no", Integer.parseInt(pmap.get("login_no").toString()));
			response.sendRedirect("login_success.jsp");
		} else { //로그인 실패 처리
			response.sendRedirect("login_failed.jsp");
		}
	}
	
	// 로그아웃
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("logout호출 성공");
		HttpSession session=request.getSession();
		session.removeAttribute("emp_no");
		session.invalidate();
		response.sendRedirect("logout.jsp");
	}
	
	// 출근
	public void insertAttendanceTime(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("insertAttendanceTime호출 성공");
		HttpSession session = request.getSession();
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pmap = new HashMap<>();
		pmap.put("emp_no", 1);
		hmb.bind(pmap);
		if(session.getAttribute("attandanced") == null) {
			int result = 0; 
			result = mainLogic.insertAttendanceTime(pmap);
			session.setAttribute("attandanced", result);
			response.sendRedirect("insertAttendanceTime_success.jsp");
		} else {
			response.sendRedirect("insertAttendanceTime_already.jsp");
		}
	}
}
