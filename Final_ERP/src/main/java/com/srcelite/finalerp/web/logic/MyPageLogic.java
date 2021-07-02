package com.srcelite.finalerp.web.logic;

import java.util.Map;

import org.apache.log4j.Logger;

import com.srcelite.finalerp.web.dao.MyPageDao;

public class MyPageLogic {
	MyPageDao myPageDao = null;
	Logger logger = Logger.getLogger(MainLogic.class);


	
	public void setMyPageDao(MyPageDao myPageDao) {
		this.myPageDao = myPageDao;
	}
	public void login(Map<String,Object> pmap){
		
	}
	public void logout(Map<String,Object> pmap){
		
	}

}
