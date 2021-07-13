package com.srcelite.finalerp.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.srcelite.finalerp.web.logic.ApprovalLogic;
import com.util.HashMapBinder;

public class ApprovalController extends MultiActionController {
	ApprovalLogic approvalLogic = null;

	public void setApprovalLogic(ApprovalLogic approvalLogic) {
		this.approvalLogic = approvalLogic;
	}
	
	// 결재양식리스트 조회
	public ModelAndView getApprovalFormList(HttpServletRequest request, HttpServletResponse response) 
	{ 
		logger.info("getApprovalFormList 호출 성공");
		HashMapBinder hmb = new HashMapBinder(request);
		Map<String,Object> target = new HashMap<>();
		hmb.bind(target);
		List<Map<String,Object>> getApprovalFormList = null;
		getApprovalFormList=ApprovalLogic.getApprovalFormList(target);
		logger.info("getApprovalFormList:"+getApprovalFormList);//
		ModelAndView mav = new ModelAndView();
		mav.setViewName("getApprovalFormList");
		mav.addObject("getApprovalFormList", getApprovalFormList);
		return mav;
	}
	
	// 결재양식리스트에서 선택한 양식 출력
	public ModelAndView getApprovalForm(HttpServletRequest request, HttpServletResponse response) { ModelAndView mav = new ModelAndView(); return mav;}
	
	// 결재 신청
	public void submitApproval(HttpServletRequest request, HttpServletResponse response) {}
	
	// 미확인 결재 수량 표시
	public ModelAndView getNumUnsignedApproval(HttpServletRequest request, HttpServletResponse response){ModelAndView mav = new ModelAndView(); return mav;}
	
	// 수신 결재 조회
	public ModelAndView getReceiveApproval(HttpServletRequest request, HttpServletResponse response){ModelAndView mav = new ModelAndView(); return mav;}
	
	// 수신 결재 상세조회
	public ModelAndView getDetailReceiveApproval(HttpServletRequest request, HttpServletResponse response){ModelAndView mav = new ModelAndView(); return mav;}
	
	// 발신 결재 조회
	public ModelAndView getSendApproval(HttpServletRequest request, HttpServletResponse response){ ModelAndView mav = new ModelAndView(); return mav;}
	
	// 발신 결재 상세조회
	public ModelAndView getDetailSendApproval(HttpServletRequest request, HttpServletResponse response){ModelAndView mav = new ModelAndView(); return mav;}
	
	// 결재 라인 조회
	public ModelAndView getLineApproval(HttpServletRequest request, HttpServletResponse response){ ModelAndView mav = new ModelAndView(); return mav;}
}
