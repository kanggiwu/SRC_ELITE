package com.srcelite.finalerp.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.srcelite.finalerp.web.logic.AccountLogic;
import com.util.HashMapBinder;

public class AccountController extends MultiActionController {
	
	AccountLogic accountLogic = null;
	
	// AccountManagerLogic setter 메소드
	public void setAccountLogic(AccountLogic accountLogic) {
		this.accountLogic = accountLogic;
	}

	// 급여 정산 조회
	public ModelAndView getAccountInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("getAccountInfo호출 성공");
		HashMapBinder hmb = new  HashMapBinder(request);
		Map<String, Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String, Object>> accountList = null;
//		accountList = accountLogic.getAccount(target);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getAccountInfo");
//		mav.addObject("accountList", accountList);
		return mav;
	}
	
	// 급여 정산 변경
	public void updateAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("updateAccountInfo호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		logger.info("pmap: "+pmap);
		int result = 0;
		result = accountLogic.updateAccount(pmap);
		logger.info("ctrl result : " + result);
		if(result == 1) {
			response.sendRedirect("");
		}
		else {
			response.sendRedirect("");
		}
	}
	
	// 급여 정산 추가
	public void insertAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("insertMonthAccount호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		int result = 0;
		result = accountLogic.insertAccount(pmap);
		if(result == 1) {
			response.sendRedirect("");
		}
		else {
			response.sendRedirect("");
		}
	}
	
	// 수익 관리 조회
	public ModelAndView getProfitList (HttpServletRequest request, HttpServletResponse response) {
		logger.info("getProfitList 호출");
		HashMapBinder hmb = new  HashMapBinder(request);
		Map<String, Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String, Object>> profitList = null;
		profitList = accountLogic.getProfitList(target);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getProfitList");
		mav.addObject("profitList", profitList);
		return mav;
	}
	// 수익 관리 수정
	public void updateProfit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("updateProfit호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		logger.info("pmap: "+pmap);
		int result = 0;
		result = accountLogic.updateProfit(pmap);
		logger.info("ctrl result : " + result);
		if(result == 1) {
			response.sendRedirect("");
		}
		else {
			response.sendRedirect("");
		}
	}
	
	// 수익 관리 추가
	public void insertProfit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("insertProfit호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		int result = 0;
		result = accountLogic.insertProfit(pmap);
		if(result == 1) {
			response.sendRedirect("");
		}
		else {
			response.sendRedirect("");
		}
	}
	


	// 지출 관리 조회
	public ModelAndView getExpenseList(HttpServletRequest request, HttpServletResponse response) {
		logger.info("getExpenseList 호출");
		HashMapBinder hmb = new  HashMapBinder(request);
		Map<String, Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String, Object>> expenseList = null;
		expenseList = accountLogic.getExpenseList(target);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getExpenseList");
		mav.addObject("expenseList", expenseList);
		return mav;
	}
	// 지출 관리 수정
	public void updateExpense(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("updateExpense호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String, Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		logger.info("pmap: "+pmap);
		int result = 0;
		result = accountLogic.updateExpense(pmap);
		logger.info("ctrl result : " + result);
		if(result == 1) {
			response.sendRedirect("getExpenseList.src1");
		}
		else {
			response.sendRedirect("");
		}
	}
	
	// 지출 관리 추가
	public void insertExpense(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("insertExpense호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> pmap = new HashMap<>();
		hmb.bind(pmap);
		int result = 0;
		result = accountLogic.insertExpense(pmap);
		if(result == 1) {
			response.sendRedirect("getExpenseList.src1");
		}
		else {
			response.sendRedirect("");
		}
	}
	

	// 손익 조회
	public ModelAndView getBalanceList(HttpServletRequest request, HttpServletResponse response) {
		logger.info("getBalanceList 호출");
		HashMapBinder hmb = new  HashMapBinder(request);
		Map<String, Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String, Object>> balanceList = null;
//		balanceList = accountLogic.getBalanceList(target);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getBalanceList");
//		mav.addObject("balanceList", balanceList);
		return mav;
	}
	//월말결산
	public ModelAndView getMonthStatement(HttpServletRequest request, HttpServletResponse response) {
		logger.info("getMonthStatement 호출");
		HashMapBinder hmb = new  HashMapBinder(request);
		Map<String, Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String, Object>> monthStatement = null;
		monthStatement = accountLogic.getMonthStatement(target);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getMonthStatement");
		mav.addObject("monthStatement", monthStatement);
		return mav;
	}

}
