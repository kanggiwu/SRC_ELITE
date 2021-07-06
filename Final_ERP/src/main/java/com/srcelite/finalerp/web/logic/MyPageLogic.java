package com.srcelite.finalerp.web.logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.srcelite.finalerp.web.dao.MyPageDao;

public class MyPageLogic {
	MyPageDao myPageDao = null;
	Logger logger = Logger.getLogger(MyPageLogic.class);


	
	public void setMyPageDao(MyPageDao myPageDao) {
		this.myPageDao = myPageDao;
	}
	public void login(Map<String,Object> pmap){
		
	}
	public void logout(Map<String,Object> pmap){
		
	}
	public List<Map<String, Object>> getMyInfo(Map<String, Object> pmap) {
		List<Map<String,Object>> infoList = null;
		infoList = myPageDao.getMyInfo(pmap);
		return infoList;
	}
	public List<Map<String, Object>> getMyLicenceList(Map<String, Object> pmap) {
		List<Map<String,Object>> licenceList = null;
		licenceList = myPageDao.getMyLicenceList(pmap);
		return licenceList;
	}
	public int updateMyInfo(Map<String, Object> pmap) {
		int result = 0;
			result = myPageDao.updateMyInfo(pmap);
			return result;
	}

}
