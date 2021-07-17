package com.srcelite.finalerp.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class AccountDao {
	Logger logger = Logger.getLogger(AccountDao.class);
	SqlSessionTemplate sqlSessionTemplate = null;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	
	// 급여 정보 변경
	public int updateSalary(Map<String,Object> pmap){
		logger.info("DAO updateSalary 호출:" + pmap);
		int result = 0;
		result = sqlSessionTemplate.update("updateSalary",pmap);
		logger.info("result:"+result);
		return result;
	}
	
	// 급여 정보 추가
	public int insertSalary(Map<String,Object> pmap){
		logger.info("DAO insertSalary 호출:" + pmap);
		int result = 0;
		result = sqlSessionTemplate.insert("insertSalary",pmap);
		logger.info("result:"+result);
		return result;
	}
	

	// 수익 관리 조회
	public List<Map<String,Object>> getProfitList(Map<String,Object> pmap) {
		logger.info("Dao getProfitList 호출:" + pmap);
		List<Map<String, Object>> profitList = null;
		profitList = sqlSessionTemplate.selectList("getProfitList",pmap);
		return profitList;
	}
	
	// 수익 관리 수정
	public int updateProfit(Map<String,Object> pmap) {
		logger.info("DAO updateProfit 호출:" + pmap);
		int result = 0;
		result = sqlSessionTemplate.update("updateProfit",pmap);
		logger.info("result:"+result);
		return result;
	}                          
	
	// 수익 관리 추가
	public int insertProfit(Map<String,Object> pmap){
		logger.info("DAO insertProfit 호출:" + pmap);
		int result = 0;
		result = sqlSessionTemplate.insert("insertProfit",pmap);
		logger.info("result:"+result);
		return result;
	}                          
	

	// 지출 관리 조회
	public List<Map<String,Object>> getExpenseList(Map<String,Object> pmap) {
		logger.info("Dao getExpenseList 호출:" + pmap);
		List<Map<String, Object>> expenseList = null;
		expenseList = sqlSessionTemplate.selectList("getExpenseList",pmap);
		return expenseList;
	}
	
	// 지출 관리 수정
	public int updateExpense(Map<String,Object> pmap) {
		logger.info("DAO updateExpense 호출:" + pmap);
		int result = 0;
		result = sqlSessionTemplate.update("updateExpense",pmap);
		logger.info("result:"+result);
		return result;
	}                         
	
	// 지출 관리 추가
	public int insertExpense(Map<String,Object> pmap) {
		logger.info("DAO insertExpense 호출:" + pmap);
		int result = 0;
		result = sqlSessionTemplate.insert("insertExpense",pmap);
		logger.info("result:"+result);
		return result;
	}
	
	
	// 손익 조회
	public List<Map<String,Object>> getBalanceList(Map<String,Object> pmap) {
		logger.info("Dao getBalanceList 호출:" + pmap);
		List<Map<String, Object>> balanceList = null;
		balanceList = sqlSessionTemplate.selectList("getBalanceList",pmap);
		return balanceList;
	}
	// 연말 결산
	public List<Map<String,Object>> getMonthStatement(Map<String,Object> pmap) {List<Map<String,Object>> list = null; return list;}
	
}
