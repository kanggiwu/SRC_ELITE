package com.srcelite.finalerp.web.logic;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.srcelite.finalerp.web.dao.AccountDao;

public class AccountLogic {
	AccountDao accountDao = null;


	// AccountManagerDao setter 메소드
	public void setAccountDao(AccountDao accountDao) {
		this.accountDao = accountDao;
	}
	
	// 급여 정보 변경
	public int updateSalary(Map<String,Object> pmap){
		int result = 0;
		result = accountDao.updateSalary(pmap);
		return result;
	}
	
	// 급여 정보 추가
	public int insertSalary(Map<String,Object> pmap){
		int result = 0;
		result = accountDao.insertSalary(pmap);
		return result;
	}
	

	// 수익 관리 조회
	public List<Map<String,Object>> getProfitList(Map<String,Object> pmap) {
		List<Map<String, Object>> profitList = null;
		profitList = accountDao.getProfitList(pmap);
		return profitList;
	}

	// 수익 관리 수정
	public int updateProfit(Map<String,Object> pmap) {
		int result = 0;
		result = accountDao.updateProfit(pmap);
		return result;
	}                          
	
	// 수익 관리 추가
	public int insertProfit(Map<String,Object> pmap) {
		int result = 0;
		result = accountDao.insertProfit(pmap);
		return result;
	}                          
	

	// 지출 관리 조회
	public List<Map<String,Object>> getExpenseList(Map<String,Object> pmap) {
		List<Map<String, Object>> expenseList = null;
		expenseList = accountDao.getExpenseList(pmap);
		return expenseList;
	}
	
	// 지출 관리 수정
	public int updateExpense(Map<String,Object> pmap) {
		int result = 0;
		result = accountDao.updateExpense(pmap);
		return result;
	}                         
	
	// 지출 관리 추가
	public int insertExpense(Map<String,Object> pmap) {
		int result = 0;
		result = accountDao.insertExpense(pmap);
		return result;
	} 
	
	
	// 손익 조회
	public List<Map<String,Object>> getBalanceList(Map<String,Object> pmap) {
		List<Map<String, Object>> expenseList = null;
		expenseList = accountDao.getBalanceList(pmap);
		return expenseList;
	}
	// 월말 결산
	public List<Map<String,Object>> getMonthStatement(Map<String,Object> pmap) {
		List<Map<String, Object>> expenseList = null;
		expenseList = accountDao.getBalanceList(pmap);
		return expenseList;
	}

}
