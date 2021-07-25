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
		logger.info("emp_no : "+target.get("emp_no"));
		if(target.get("emp_no") != null) {
			accountList = accountLogic.getAccount(target);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getAccountInfo");
		mav.addObject("accountList", accountList);
		return mav;
	}
	
	// 급여 정산 사원 조회
	public ModelAndView getAccountEmpList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("getAccountInfo호출 성공");
		HashMapBinder hmb = new  HashMapBinder(request);
		Map<String, Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String, Object>> empList = null;
		//empList = accountLogic.getAccountEmpList(target);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getAccountEmpList");
		mav.addObject("empList", empList);
		return mav;
	}
	
	// 급여 정산 사원 검색
	public ModelAndView getAccountEmpSearch(HttpServletRequest req, HttpServletResponse res)
	throws Exception
	{
		HashMapBinder hmb = new HashMapBinder(req);
		Map<String, Object> pmap = new HashMap<String, Object>();
		hmb.bind(pmap);
		List<Map<String,Object>> empList = null;
		logger.info("emp_name value: "+pmap.get("emp_name"));
		logger.info("dept_name value: "+pmap.get("dept_name"));
		logger.info("rank_name value: "+pmap.get("rank_name"));
		//empList = accountLogic.getAccountEmpSearch(pmap);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getAccountEmpList");
		mav.addObject("empList", empList);
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
			response.sendRedirect("getAccountEmpList");
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
		//result = accountLogic.insertAccount(pmap);
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
		List<Map<String, Object>> projectList = null;
		profitList = accountLogic.getProfitList(target);
		projectList = accountLogic.getProjectList(target);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getProfitList");
		mav.addObject("profitList", profitList);
		mav.addObject("projectList", projectList);
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
			response.sendRedirect("getProfitList.src1");
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
		logger.info(target.get("expense_date_year")+"-"+target.get("expense_date_month"));
		if(target.get("expense_date_year") != null && target.get("expense_date_month") != null) {
			String expense_date = "";
			expense_date = target.get("expense_date_year").toString()+"-"+target.get("expense_date_month").toString();
			target.put("EXPENSE_DATE", expense_date);
			logger.info(expense_date);
			
		}
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
		balanceList = accountLogic.getBalanceList(target);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getBalanceList");
		mav.addObject("balanceList", balanceList);
		return mav;
	}
	//월말결산
	public ModelAndView getMonthStatement(HttpServletRequest request, HttpServletResponse response) {
		logger.info("getMonthStatement 호출");
		HashMapBinder hmb = new  HashMapBinder(request);
		Map<String, Object> target = new HashMap<>();
		hmb.bind(target);
		//target.put("STATE_MONTH", "2021-07");
		List<Map<String, Object>> profitMonthList = null;
		List<Map<String, Object>> expenseMonthList = null;
		List<Map<String, Object>> totalMonthList = null;
		profitMonthList = accountLogic.getMonthProfitList(target);
		expenseMonthList = accountLogic.getMonthExpenseList(target);
		totalMonthList = accountLogic.getMonthTotalList(target);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getMonthStatement");
		mav.addObject("profitMonthList", profitMonthList);
		mav.addObject("expenseMonthList", expenseMonthList);
		mav.addObject("totalMonthList", totalMonthList);
		return mav;
	}

}
