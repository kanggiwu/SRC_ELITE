package com.srcelite.finalerp.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.srcelite.finalerp.web.logic.MyPageLogic;

public class MyPageController extends MultiActionController{
	MyPageLogic myPageLogic = null;


	
	public void setMyPageLogic(MyPageLogic myPageLogic) {
		this.myPageLogic = myPageLogic;
	}
	public void getMyInfo(HttpServletRequest request, HttpServletResponse response) {
		
	}
	public void updateMyInfo(HttpServletRequest request, HttpServletResponse response) {
		
	}
	public void getMonthSalary(HttpServletRequest request, HttpServletResponse response) {
		
	}
	public void getYearSalary(HttpServletRequest request, HttpServletResponse response) {
		
	}
	public void getRetirementPay(HttpServletRequest request, HttpServletResponse response) {
		
	}
	
	// 출근

}
