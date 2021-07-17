package com.util;

import java.io.File;
import java.nio.file.Path;
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
	String myFolder = "";
	//첨부파일 한글처리
	String encType = "utf-8";
	//첨부파일 크기 제한
	int maxSize = 5*1024*1024;//5MB
	HttpServletRequest request = null;
	public HashMapBinder() {}
	public HashMapBinder(HttpServletRequest request) {
		this.request = request;
		String path = request.getSession().getServletContext().getRealPath("/");
		realFolder = path+"\\pds";
		myFolder = "/pds";
	}
	public void bind(Map<String,Object> target) {
		target.clear();
		Enumeration en = request.getParameterNames();//배열 구조체 묶음
		String[] arr_peno = request.getParameterValues("emp_no");
		while(en.hasMoreElements()) {
			String key = (String)en.nextElement();
			logger.info("key:"+key);
			logger.info("value:"+request.getParameter(key));
			target.put(key, HangulConversion.toUTF(request.getParameter(key)));
		}
	}////////end of bind
	public void bindAjax(Map<String,Object> target) {
		target.clear();
		Enumeration en = request.getParameterNames();//배열 구조체 묶음
		String[] arr_peno = request.getParameterValues("emp_no");
		while(en.hasMoreElements()) {
			String key = (String)en.nextElement();
			logger.info("key:"+key);
			logger.info("value:"+request.getParameter(key));
			target.put(key, HangulConversion.toUTF4Ajax(request.getParameter(key)));
		}
	}////////end of bind
	
	public void multiBind(Map<String,Object> target) {
		try {
			multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		} catch (Exception e) {
			logger.info("Exception : "+e.toString());
		}
		Enumeration en = multi.getParameterNames();//배열 구조체 묶음

		//<input type="text" name="mem_id"
		if(multi.getParameterValues("licence_no") != null) {
			String[] licences = multi.getParameterValues("licence_no");
			logger.info("자격증이 있습니다. 개수는 = "+licences.length);
			target.put("licences", licences);
			String[] a = (String[]) target.get("licences");
		}
		while(en.hasMoreElements()) {
			String key = (String)en.nextElement();
			logger.info("value:"+multi.getParameter(key));
			target.put(key, multi.getParameter(key));
			logger.info("value:"+target);
		}
		//첨부파일에 대한 정보를 받아오기
		Enumeration<String> files = multi.getFileNames();
		if(files !=null) {
			File file = null;//파일명을 객체로 만들 어 줄 뿐 안에 내용까지 생성되는 것은 아님.
			while(files.hasMoreElements()) {
				String fname = files.nextElement();
				String filename = multi.getFilesystemName(fname);
				String previousFile = (String)target.get("previous_emp_picture_path");
//				target.put("emp_picture_path", filename);
				if(filename !=null && filename.length()>1) {
					logger.info("첨부 파일 있음");
					file = new File(realFolder+"\\"+filename);
					target.put("emp_picture_path", (myFolder+"/"+filename));
				}else {
					logger.info("첨부 파일 없음 -> 기존 파일 유지");
					target.put("emp_picture_path", previousFile);
				}
			}///////////end of while
			//첨부파일의 크기를 담을 변수
//			double size = 0;
//			if(file !=null) {
//				size = file.length();
//				size = file.length();
//				target.put("bs_size", size);
//			}
			
		}
	}////////end of multiBind
	
		
	
	
}