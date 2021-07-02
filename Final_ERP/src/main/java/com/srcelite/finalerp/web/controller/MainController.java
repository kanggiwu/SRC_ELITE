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
		int result = mainLogic.login(pmap);
		if(result == 1) { //로그인 성공
			session.setAttribute("emp_no", (String)pmap.get("emp.no"));
			response.sendRedirect("board/getBoardList");
		} else { //로그인 실패 처리
			if(result == -1) {
				response.sendRedirect("없는 사번입니다 처리");
			} else {
				response.sendRedirect("비밀번호가 틀립니다 처리");
			}
		}
	}
	
	// 로그아웃
	public void logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("logout호출 성공");
		HttpSession session=request.getSession();
		session.removeAttribute("emp_no");
		session.invalidate();
		response.sendRedirect("로그인페이지");
	}
	
	// 출근
	public void insertAttendanceTime(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("insertAttendanceTime호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		pmap.put("emp_no", 1);
		int result = 0; 
		result = mainLogic.insertAttendanceTime(pmap);
		if(result == 1) {
			response.sendRedirect("/erp_lab/main_content.jsp");
		}
		else {

		}
	}
}
