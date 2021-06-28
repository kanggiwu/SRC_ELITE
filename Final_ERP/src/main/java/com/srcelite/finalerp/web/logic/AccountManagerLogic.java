package com.srcelite.finalerp.web.logic;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.srcelite.finalerp.web.dao.AccountManagerDao;

public class AccountManagerLogic {
	AccountManagerDao accountManagerDao = null;


	// AccountManagerDao setter 메소드
	public void setAccountManagerDao(AccountManagerDao accountManagerDao) {
		this.accountManagerDao = accountManagerDao;
	}
	
	// 급여 정보 변경
	public void updateAccountInfo(Map<String,Object> pmap){}
	
	// 급여 정보 추가
	public void insertMonthSalary(Map<String,Object> pmap){}
	
	// 수익 관리 조회
	public List<Map<String,Object>> getProfitList(Map<String,Object> pmap){List<Map<String,Object>> list = null; return list;}
	
	// 수익 관리 수정
	public void updateProfit(Map<String,Object> pmap){}                          
	
	// 수익 관리 추가
	public void insertProfit(Map<String,Object> pmap){}                          
	
	// 지출 관리 조회
	public List<Map<String,Object>> getExpenseList(Map<String,Object> pmap){List<Map<String,Object>> list = null; return list;}
	
	// 지출 관리 수정
	public void updateExpense(Map<String,Object> pmap){}                         
	
	// 지출 관리 추가
	public void insertExpense(Map<String,Object> pmap){}                         
	
	// 손익 조회
	public List<Map<String,Object>> getBalanceLIst(Map<String,Object> pmap){List<Map<String,Object>> list = null; return list;}

}
