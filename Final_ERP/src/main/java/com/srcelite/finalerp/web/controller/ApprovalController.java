package com.srcelite.finalerp.web.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.google.gson.Gson;
import com.srcelite.finalerp.web.logic.ApprovalLogic;
import com.util.HashMapBinder;

public class ApprovalController extends MultiActionController {
	ApprovalLogic approvalLogic = null;

	public void setApprovalLogic(ApprovalLogic approvalLogic) {
		this.approvalLogic = approvalLogic;
	}
	
	// 결재양식리스트 조회
	public ModelAndView getApprovalFormList(HttpServletRequest request,HttpServletResponse response) 
	throws Exception
	{ 
		//logger.info("getApprovalFormList 호출 성공");
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("getApprovalFormList");
		/* mav.addObject("getApprovalFormList", getApprovalFormList); */
		return mav; 
	}
	
	// 결재 라인 조회
	public ModelAndView getLineApproval(HttpServletRequest request, HttpServletResponse response)
	throws Exception
	{ 
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("getLineApproval"); 
		//mav.addObject("getDetailSendApproval", getDetailSendApproval);
		return mav;
	}
	
	// 결재양식리스트에서 선택한 양식 출력
	public ModelAndView getApprovalForm(HttpServletRequest request, HttpServletResponse response) { ModelAndView mav = new ModelAndView(); return mav;}
	
	// 결재 신청
	public void submitApproval(HttpServletRequest request, HttpServletResponse response) {}
	
	// 미확인 결재 수량 표시
	public ModelAndView getNumUnsignedApproval(HttpServletRequest request, HttpServletResponse response){ModelAndView mav = new ModelAndView(); return mav;}
	
	// 수신 결재 조회
	public ModelAndView getReceiveApproval(HttpServletRequest request, HttpServletResponse response)
	{
		logger.info("getReceiveApproval 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> target = new HashMap<>();
		hmb.bind(target);
		HttpSession session = request.getSession(true);
		target.put("login_no", session.getAttribute("login_no"));
		logger.info("컨트롤러에서 세션에서 로그인한 사번:"+target.get("login_no"));
		List<Map<String,Object>> getReceiveApproval = null;
		getReceiveApproval=approvalLogic.getReceiveApproval(target);
		logger.info("getReceiveApproval:"+getReceiveApproval);//
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("getReceiveApproval");
		mav.addObject("getReceiveApproval", getReceiveApproval);
		return mav;	
	}
	
	// 수신 결재 상세조회
	public ModelAndView getDetailReceiveApproval(HttpServletRequest request, HttpServletResponse response){ModelAndView mav = new ModelAndView(); return mav;}
	
	// 발신 결재 조회
	public ModelAndView getSendApproval(HttpServletRequest request, HttpServletResponse response)
	throws Exception
	{
		logger.info("getSendApproval 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> target = new HashMap<>();
		hmb.bind(target);
		HttpSession session = request.getSession(true);
		//Map<String,Object> pmap = new HashMap<>();
		target.put("login_no", session.getAttribute("login_no"));
		logger.info(session.getAttribute("login_no"));
		List<Map<String,Object>> sendApprovalList = null;
		sendApprovalList=approvalLogic.getSendApproval(target);
		logger.info("sendApprovalList:"+sendApprovalList);//
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("getSendApproval");
		mav.addObject("sendApprovalList", sendApprovalList);
		return mav;
	}
	
	// 결재자 조회
	public void getApproverEmp(HttpServletRequest request, HttpServletResponse response)
	throws Exception
	{		
		logger.info("getApproverEmp 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> target = new HashMap<>();
		hmb.bind(target);
		HttpSession session = request.getSession(true);
		target.put("login_no", session.getAttribute("login_no"));
		logger.info(session.getAttribute("login_no"));
		List<Map<String,Object>> getApproverEmp = null;
		getApproverEmp=approvalLogic.getApproverEmp(target);
		logger.info("getApproverEmp:"+getApproverEmp);//
		Gson g = new Gson();
		String imsi = g.toJson(getApproverEmp);
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("여기야");
		System.out.println(imsi);
		out.print(imsi);
	} 
	
	// 발신결재자 조회
	public void getSendApproverEmp(HttpServletRequest request, HttpServletResponse response)
			throws Exception
	{		
		logger.info("getSendApproverEmp 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> target = new HashMap<>();
		hmb.bind(target);
		HttpSession session = request.getSession(true);
		target.put("login_no", session.getAttribute("login_no"));
		logger.info(session.getAttribute("login_no"));
		List<Map<String,Object>> getSendApproverEmp = null;
		getSendApproverEmp=approvalLogic.getSendApproverEmp(target);
		logger.info("getSendApproverEmp:"+getSendApproverEmp);//
		Gson g = new Gson();
		String imsi = g.toJson(getSendApproverEmp);
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("여기야");
		System.out.println(imsi);
		out.print(imsi);
	}
	

	
	//결재자검색(결재라인에서)
	public void  getEmpSearchList3(HttpServletRequest request, HttpServletResponse response) 
	throws Exception
	{
		logger.info("getEmpSearchList3 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String,Object>> empSearchList3 = null;
		empSearchList3=approvalLogic.getEmpSearchList3(target);
		logger.info("empSearchList2:"+empSearchList3);//
		Gson g = new Gson();
		String imsi = g.toJson(empSearchList3);
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("여기야");
		System.out.println(imsi);
		out.print(imsi);
	}
	
	// 수신 결재 상세조회(휴가계획서인 경우)
	public ModelAndView getDetailApproval(HttpServletRequest request, HttpServletResponse response)
	throws Exception
	{
		logger.info("getDetailApproval 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> target = new HashMap<>();
		hmb.bind(target);
		HttpSession session = request.getSession(true);
		target.put("login_no", session.getAttribute("login_no"));
		logger.info(session.getAttribute("login_no"));
		List<Map<String,Object>> getDetailApproval = null;
		getDetailApproval=approvalLogic.getDetailApproval(target);
		logger.info("getDetailApproval:::"+getDetailApproval);//
		Map<String,Object> pmap = getDetailApproval.get(0);
		String vacationDetail = pmap.get("APRV_CONTENT").toString();
		logger.info("vacationDetail:"+vacationDetail);//
		StringTokenizer st = new StringTokenizer(vacationDetail,"|");//문자열로 들어온값 잘라주기
		int count = st.countTokens();
		String[] token = new String[count];
		logger.info("Tokens count:"+count);
		for (int i=0; i<count; i++) {
			token[i] = st.nextToken();
			//logger.info("token:"+token);
		}
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("vacationPlan");
		mav.addObject("token", token);
		//mav.addObject("getDetailApproval", getDetailApproval);
		return mav;
	}
	
	// 수신 결재 상세조회(프로젝트계약확정서 경우)
	public ModelAndView getDetailApproval2(HttpServletRequest request, HttpServletResponse response)
	throws Exception
	{			
		logger.info("getDetailApproval2 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> target = new HashMap<>();
		hmb.bind(target);
		HttpSession session = request.getSession(true);
		target.put("login_no", session.getAttribute("login_no"));
		logger.info(session.getAttribute("login_no"));
		List<Map<String,Object>> getDetailApproval2 = null;
		getDetailApproval2=approvalLogic.getDetailApproval2(target);
		logger.info("getDetailApproval2:::"+getDetailApproval2);//
		Map<String,Object> pmap = getDetailApproval2.get(0);
		String projectDetail = pmap.get("APRV_CONTENT").toString();
		logger.info("projectDetail:"+projectDetail);//
		StringTokenizer st = new StringTokenizer(projectDetail,"|");//문자열로 들어온값 잘라주기
		int count = st.countTokens();
		String[] token = new String[count];
		logger.info("Tokens count:"+count);
		for (int i=0; i<count; i++) {
			token[i] = st.nextToken();
			//logger.info("token:"+token);
		}
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName("projectPlan");
		mav.addObject("token", token);
		//mav.addObject("getDetailApproval2", getDetailApproval2);
		return mav;
	}
	
	// 발신 결재 상세조회(휴가계획서인 경우)
		public ModelAndView sendVacationPlan(HttpServletRequest request, HttpServletResponse response)
		throws Exception
		{
			logger.info("sendVacationPlan 호출 성공");
			HashMapBinder hmb = new HashMapBinder(request);
			Map<String,Object> target = new HashMap<>();
			hmb.bind(target);
			HttpSession session = request.getSession(true);
			target.put("login_no", session.getAttribute("login_no"));
			logger.info(session.getAttribute("login_no"));
			List<Map<String,Object>> sendVacationPlan = null;
			sendVacationPlan=approvalLogic.getDetailApproval(target);
			logger.info("sendVacationPlan:::"+sendVacationPlan);//
			Map<String,Object> pmap = sendVacationPlan.get(0);
			String vacationDetail = pmap.get("APRV_CONTENT").toString();
			logger.info("vacationDetail:"+vacationDetail);//
			StringTokenizer st = new StringTokenizer(vacationDetail,"|");//문자열로 들어온값 잘라주기
			int count = st.countTokens();
			String[] token = new String[count];
			logger.info("Tokens count:"+count);
			for (int i=0; i<count; i++) {
				token[i] = st.nextToken();
				//logger.info("token:"+token);
			}
			ModelAndView mav = new ModelAndView(); 
			mav.setViewName("sendVacationPlan");
			mav.addObject("token", token);
			//mav.addObject("getDetailApproval", getDetailApproval);
			return mav;
		}
		
		// 발신 결재 상세조회(프로젝트 상세조회 경우)
		public ModelAndView sendProjectPlan(HttpServletRequest request, HttpServletResponse response)
		throws Exception
		{
			logger.info("sendProjectPlan 호출 성공");
			HashMapBinder hmb = new HashMapBinder(request);
			Map<String,Object> target = new HashMap<>();
			hmb.bind(target);
			HttpSession session = request.getSession(true);
			target.put("login_no", session.getAttribute("login_no"));
			logger.info(session.getAttribute("login_no"));
			List<Map<String,Object>> sendProjectPlan = null;
			sendProjectPlan=approvalLogic.getDetailApproval(target);
			logger.info("sendProjectPlan:::"+sendProjectPlan);//
			Map<String,Object> pmap = sendProjectPlan.get(0);
			String projectDetail = pmap.get("APRV_CONTENT").toString();
			logger.info("vacationDetail:"+projectDetail);//
			StringTokenizer st = new StringTokenizer(projectDetail,"|");//문자열로 들어온값 잘라주기
			int count = st.countTokens();
			String[] token = new String[count];
			logger.info("Tokens count:"+count);
			for (int i=0; i<count; i++) {
				token[i] = st.nextToken();
				//logger.info("token:"+token);
			}
			ModelAndView mav = new ModelAndView(); 
			mav.setViewName("sendProjectPlan");
			mav.addObject("token", token);
			//mav.addObject("getDetailApproval", getDetailApproval);
			return mav;
		}
	// 결재신청입력
	public void insertApproval(HttpServletRequest request,HttpServletResponse response) 
	throws Exception 
	/*
	 * public ModelAndView insertApproval(HttpServletRequest
	 * request,HttpServletResponse response) throws Exception
	 */	{
		logger.info("insertApproval 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> target = new HashMap<>();
		hmb.bind(target);
		HttpSession session = request.getSession(true);
		logger.info(session.getAttribute("login_no"));
		target.put("P_LOGIN_NO", session.getAttribute("login_no"));
		int seq_aprv_max = 0;
		/////////////lineApp2의 값만 따로 읽어서 넣어야해~~~
		Map<String,Object> pmap = new HashMap<>();
		
		try {
			seq_aprv_max = approvalLogic.insertApproval(target); //결재문서내용 저장
			for (int i=0;i<3;i++) {
				pmap.put("SEQ_APRV_MAX",seq_aprv_max);
				pmap.put("EMP_NO",target.get("lineApp["+i+"][EMP_NO]"));
				pmap.put("SIGN_PERMISSION",target.get("lineApp["+i+"][SIGN_PERMISSION]"));
				pmap.put("SIGN_LEVEL",target.get("lineApp["+i+"][SIGN_LEVEL]"));
				//pmap.put("login_no",target.get("login_no"));
				logger.info(pmap.get("SEQ_APRV_MAX"));
				logger.info(pmap.get("EMP_NO"));
				logger.info(pmap.get("SIGN_PERMISSION"));
				logger.info(pmap.get("SIGN_LEVEL"));
				approvalLogic.insertApproverEmp(pmap); //결재라인 저장
			}
			
		} catch (Exception e) {
			throw e;
		}
//		logger.info("insertApproval:"+insertApproval);//
		//ModelAndView mav = new ModelAndView(); 
		//mav.setViewName("getApprovalFormList");
//		mav.addObject("insertApproval", insertApproval);
		//return mav;
		response.sendRedirect("/approval/getSendApproval.src1");
	 }

	//결재문서 반려/결재
	public void  permissionApproval(HttpServletRequest request, HttpServletResponse response) 
	throws Exception
	{
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> target = new HashMap<>();
		hmb.bind(target);
		HttpSession session = request.getSession(true);
		target.put("p_login_no", session.getAttribute("login_no"));
		logger.info(target.get("P_APRV_NO"));
		logger.info(target.get("P_SIGN_PERMISSION"));
		logger.info(session.getAttribute("login_no"));
		logger.info("permissionApproval 호출 성공");
		int result = 0;
		result = approvalLogic.permissionApproval(target);
		if(result == 1) {
			response.sendRedirect("./getReceiveApproval.src1");
		}
	}
	//결재신청완료/결재라인 저장
	//public void  insertApproverEmp(HttpServletRequest request, HttpServletResponse response) 
	//		throws Exception
	//{
	//	HashMapBinder hmb = new HashMapBinder(request);
	//	Map<String,Object> target = new HashMap<>();
	//	hmb.bind(target);
	//	HttpSession session = request.getSession(true);
	//	target.put("p_login_no", session.getAttribute("login_no"));
	//	logger.info("insertApproverEmp 호출 성공");
	//	int result = 0;
	//	result = approvalLogic.insertApproverEmp(target);
	//	if(result == 1) {
	//		response.sendRedirect("./getApprovalForm.src1");
	//	}
	//}
}
