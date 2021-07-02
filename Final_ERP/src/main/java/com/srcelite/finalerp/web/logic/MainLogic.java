package com.srcelite.finalerp.web.logic;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.srcelite.finalerp.web.dao.MainDao;

public class MainLogic {
	MainDao mainDao = null;
	Logger logger = Logger.getLogger(MainLogic.class);

	public void setMainDao(MainDao mainDao) {
		this.mainDao = mainDao;
	}
	
	public int login(Map<String,Object> pmap) {
		logger.info("login 호출 성공");
		int inputedEmpNo = 0;
		inputedEmpNo = (int) pmap.get("emp_no");
		String inputedPw = (String) pmap.get("emp_pw");
		String loadedPw = mainDao.login(pmap);
		if(inputedEmpNo == 0) {
			return -1; // 없는 사번
		} else if(inputedPw.equals(loadedPw)) {
			return 1; // 비밀번호가 일치
		} else {
			return 0; //비밀번호가 틀림
		}
	}
	public void logout(Map<String,Object> pmap){ }

	public int insertAttendanceTime(Map<String,Object> pmap){
		logger.info("insertAttendanceTime 호출 성공");
		int result = 0;
		result = mainDao.insertAttendanceTime(pmap);
		return result;
	}
}
