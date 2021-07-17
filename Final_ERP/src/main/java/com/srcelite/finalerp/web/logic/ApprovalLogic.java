package com.srcelite.finalerp.web.logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;

import com.srcelite.finalerp.web.dao.ApprovalDao;

public class ApprovalLogic {
	ApprovalDao approvalDao = null;
	Logger logger = Logger.getLogger(ApprovalLogic.class);

	public void setApprovalDao(ApprovalDao approvalDao) {
		this.approvalDao = approvalDao;
	}
	
	// 결재양식 조회
	public List<Map<String,Object>> getApprovalFormList(Map<String,Object> pmap){
		List<Map<String,Object>> list = null; return list;
	}
	// 결재양식 출력
	public Map<String,Object> getApprovalForm(Map<String,Object> pmap){
		Map<String,Object> map = null; return map;
	}
	// 결재 신청
	public void submitApproval(Map<String,Object> pmap) {}
	
	// 결재 라인 조회
	public List<Map<String,Object>> getLineApproval(Map<String,Object> pmap){
		List<Map<String,Object>> list = null; return list;
	}
	
	// 미확인 결재 수량 표시
	public int getNumUnsignedApproval(Map<String,Object> pmap) {
		int num = 0;
		return num;
	}
	// 수신 결재 조회
	public List<Map<String,Object>> getReceiveApproval(Map<String,Object> pmap){
		logger.info("getReceiveApproval 호출 성공");
		List<Map<String,Object>> getReceiveApproval = null;
		getReceiveApproval = approvalDao.getReceiveApproval(pmap);			
		return getReceiveApproval;
	}
	
	// 수신 결재 상세조회
	public Map<String,Object> getDetailReceiveApproval(Map<String,Object> pmap){
		Map<String,Object> map = null; return map;
	}
	
	// 발신 결재 조회
	public List<Map<String,Object>> getSendApproval(Map<String,Object> pmap){
		logger.info("getSendApproval 호출 성공");
		List<Map<String,Object>> sendApprovaltList = null;
		sendApprovaltList = approvalDao.getSendApproval(pmap);			
		return sendApprovaltList;
	}
	
	// 발신 결재 상세조회
	public List<Map<String,Object>> getDetailSendApproval(Map<String,Object> pmap){
		logger.info("getDetailSendApproval 호출 성공");
		List<Map<String,Object>> getDetailSendApproval = null;
		getDetailSendApproval = approvalDao.getDetailSendApproval(pmap);			
		return getDetailSendApproval;		
	}

	public List<Map<String, Object>> getApproverEmp(Map<String, Object> pmap) {
		logger.info("getApproverEmp 호출 성공");
		List<Map<String,Object>> getApproverEmp = null;
		getApproverEmp = approvalDao.getApproverEmp(pmap);			
		return getApproverEmp;
	} 
	
	
	
}
