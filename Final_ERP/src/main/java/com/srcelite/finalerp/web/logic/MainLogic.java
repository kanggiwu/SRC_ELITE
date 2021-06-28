package com.srcelite.finalerp.web.logic;

import java.util.Map;

import org.apache.log4j.Logger;

import com.srcelite.finalerp.web.dao.MainDao;

public class MainLogic {
	MainDao mainDao = null;
	Logger logger = Logger.getLogger(MainLogic.class);

	public void setMainDao(MainDao mainDao) {
		this.mainDao = mainDao;
	}
	
	public void login(Map<String,Object> pmap){
		
	}
	public void logout(Map<String,Object> pmap){
		
	}
	public int insertAttendanceTime(Map<String,Object> pmap){
		logger.info("insertAttendanceTime 호출 성공");
		int result = 0;
		result = mainDao.insertAttendanceTime(pmap);
		result = 1;
		return result;
	}
}
