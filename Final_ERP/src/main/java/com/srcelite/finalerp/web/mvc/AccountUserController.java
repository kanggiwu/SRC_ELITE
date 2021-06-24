package com.srcelite.finalerp.web.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

public class AccountUserController extends MultiActionController {
	AccountUserLogic accountUserLogic = null;
	
		
	public void setAccountUserLogic(AccountUserLogic accountUserLogic) {
		this.accountUserLogic = accountUserLogic;
	}

	//급여조회
	public ModelAndView getMonthSalary(HttpServletRequest req,HttpServletResponse res){ModelAndView mav = new ModelAndView(); return mav;}
	
	//연간급여조회
	public ModelAndView getYearSalary(HttpServletRequest req,HttpServletResponse res){ModelAndView mav = new ModelAndView(); return mav;}
	
	//퇴직금계산
	public ModelAndView getReirementPay(HttpServletRequest req,HttpServletResponse res){ModelAndView mav = new ModelAndView(); return mav;}

}
