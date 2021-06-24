package com.srcelite.finalerp.web.mvc;

import java.util.List;
import java.util.Map;

public class AccountUserLogic {
	AccountUserDao accountUserDao = null;
	
	public void setAccountUserDao(AccountUserDao accountUserDao) {
		this.accountUserDao = accountUserDao;
	}

	//급여조회
	public Map<String,Object> getMonthSalary(Map<String,Object> pmap){
		Map<String,Object> map = null; 
		return map;
	}
	
	//연간급여조회
	public List<Map<String,Object>> getYearSalary(Map<String,Object> pamp)	{
		List<Map<String,Object>> list = null; 
		return list;
	}
	
	//퇴직금계산
	public int calculateRetirementPay(Map<String,Object> pmap){
		int num = 0; 
		return num;
	}
}