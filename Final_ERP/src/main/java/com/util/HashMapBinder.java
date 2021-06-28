package com.util;

import java.io.File;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class HashMapBinder {
	Logger logger = Logger.getLogger(HashMapBinder.class);
	//첨부 파일 처리에 필요한 변수 선언
	//첨부파일은 반드시 post방식으로 전송해야 한다.
	MultipartRequest multi = null;//기존의 request로는 값을 가져오지 못하게 됨.
	String realFolder = "";
	//첨부파일 한글처리
	String encType = "utf-8";
	//첨부파일 크기 제한
	int maxSize = 5*1024*1024;//5MB
	HttpServletRequest request = null;
	public HashMapBinder() {}
	public HashMapBinder(HttpServletRequest request) {
		this.request = request;
//		realFolder = "C:\\portfolio_kosmo\\lab_spring4\\spring4_1_1\\WebContent\\pds";
		realFolder = "C:\\bbigal_programing\\workspace_web\\SRC_ELITE\\Final_ERP\\src\\main\\webapp\\pds";
	}
	public void bind(Map<String,Object> target) {
		Enumeration en = request.getParameterNames();//배열 구조체 묶음
		while(en.hasMoreElements()) {
			String key = (String)en.nextElement();
			logger.info("value:"+request.getParameter(key));
			target.put(key, request.getParameter(key));
		}
	}////////end of bind
}
