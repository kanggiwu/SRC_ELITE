package com.srcelite.finalerp.web.logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.srcelite.finalerp.web.dao.MainDao;

public class MainLogic {
	MainDao mainDao = null;
	Logger logger = Logger.getLogger(MainLogic.class);

	public void setMainDao(MainDao mainDao) {
		this.mainDao = mainDao;
	}
	
	public Map<String, Object> login(Map<String,Object> pmap) throws Exception {
		logger.info("login 호출 성공");
		logger.info("pmap : " + pmap);
		int inputedEmpNo = 0;
		inputedEmpNo = Integer.parseInt(pmap.get("login_no").toString());
		logger.info("pmap.get(emp_pw) : " + pmap.get("emp_pw"));
		String inputedPw = (String) pmap.get("emp_pw");
		Map<String, Object> rmap = mainDao.login(pmap);
		logger.info("rmap.get(EMP_PW) : " + rmap.get("EMP_PW"));
		String loadedPw = (String) rmap.get("EMP_PW");
		if(inputedEmpNo == 0) {
			rmap.put("result", -1); //아이디 없음
		} else if(inputedPw.equals(loadedPw)) {
			rmap.put("result", 1); // 비밀번호가 일치;
		} else {
			rmap.put("result", 0); // 비밀번호가 틀림;
		}
		return rmap;
	}
	public void logout(Map<String,Object> pmap){ }

	public int insertAttendanceTime(Map<String,Object> pmap){
		logger.info("insertAttendanceTime 호출 성공");
		int checkResult = 0;
		int insertResult = 0;
		checkResult = mainDao.checkAttendance(pmap);
		logger.info("checkResult : " + checkResult);
		if(checkResult == 0) { //출근정보가 없으면 출근정보를 등록
			insertResult = mainDao.insertAttendanceTime(pmap);
			logger.info("insertResult : " + insertResult);
			return insertResult;
		} else {
			return 0; //출근정보가 있으면 0을 반환
		}
	}
}
