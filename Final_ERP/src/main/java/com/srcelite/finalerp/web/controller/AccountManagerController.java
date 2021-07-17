package com.srcelite.finalerp.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.srcelite.finalerp.web.logic.AccountManagerLogic;

public class AccountManagerController extends MultiActionController {
	
	AccountManagerLogic accountManagerLogic = null;
	
	// AccountManagerLogic setter 메소드
	public void setAccountManagerLogic(AccountManagerLogic accountManagerLogic) {
		this.accountManagerLogic = accountManagerLogic;
	}

	// 급여 정보 조회
	public void getAccountInfo(HttpServletRequest request, HttpServletResponse response) {}
	
	// 급여 정보 변경
	public void updateAccountInfo(HttpServletRequest request, HttpServletResponse response) {}
	
	// 급여 정보 추가
	public void insertMonthSalary(HttpServletRequest request, HttpServletResponse response) {}
	
	// 수익 관리 조회
	public ModelAndView getProfitList (HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	// 수익 관리 수정
	public void updateProfit(HttpServletRequest request, HttpServletResponse response) {}
	
	// 수익 관리 추가
	public void insertProfit(HttpServletRequest request, HttpServletResponse response) {}
	
	// 지출 관리 조회
	public ModelAndView getExpenseList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	// 지출 관리 수정
	public void updateExpense(HttpServletRequest request, HttpServletResponse response) {}
	
	// 지출 관리 추가
	public void insertExpense(HttpServletRequest request, HttpServletResponse response) {}
	
	// 손익 조회
	public ModelAndView getBalanceLIst(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
}
