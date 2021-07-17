package com.srcelite.finalerp.web.controller;

import java.util.HashMap;
import java.util.List;
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
		Map<String, Object> rmap = null;
		rmap = mainLogic.login(pmap);
		if(1 == Integer.parseInt(rmap.get("result").toString())) { //로그인 성공
			session.setAttribute("login_no", pmap.get("login_no").toString());
			session.setAttribute("login_name", rmap.get("EMP_NAME"));
			session.setAttribute("login_dept", rmap.get("DEPT_NAME"));
			logger.info("session login_no: " + session.getAttribute("login_no"));
			logger.info("session login_name: " + session.getAttribute("login_name"));
			logger.info("session login_dept: " + session.getAttribute("login_dept"));
			response.sendRedirect("login_success.jsp");
		} else { //로그인 실패 처리
			response.sendRedirect("login_failed.jsp");
		}
	}
	
	// 로그아웃
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("logout호출 성공");
		HttpSession session=request.getSession();
		session.removeAttribute("login_no");
		session.removeAttribute("login_name");
		session.removeAttribute("login_dept");
		session.invalidate();
		response.sendRedirect("logout.jsp");
	}
	
	// 출근
	public void insertAttendanceTime(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("insertAttendanceTime호출 성공");
		HttpSession session = request.getSession();
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		pmap.put("emp_no", session.getAttribute("login_no"));
		logger.info("pmap : " + pmap);
		int result = 0; 
		result  = mainLogic.insertAttendanceTime(pmap);
		logger.info("result : " + result);
		if(result == 0) {
			response.sendRedirect("insertAttendanceTime_already.jsp");
		} else {
			response.sendRedirect("insertAttendanceTime_success.jsp");
		}
	}
}
