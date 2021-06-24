package com.srcelite.finalerp.web.mvc;

import java.time.chrono.HijrahChronology;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class MainController extends MultiActionController{
	MainLogic mainLogic = null;

	public void setMainLogic(MainLogic mainLogic) {
		this.mainLogic = mainLogic;
	}
	
	// 로그인
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		return mav;}
	
	// 로그아웃
	public void logout(HttpServletRequest request, HttpServletResponse response) {}
	
	// 출근
	public void insertAttendanceTime(HttpServletRequest request, HttpServletResponse response) {}
	
}
