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
		logger.info("로그인한 사람 번호"+pmap.get("login_no"));
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
	/*
	 * public List<Map<String,Object>> getDetailSendApproval(Map<String,Object>
	 * pmap){ logger.info("getDetailSendApproval 호출 성공"); List<Map<String,Object>>
	 * getDetailSendApproval = null; getDetailSendApproval =
	 * approvalDao.getDetailSendApproval(pmap); return getDetailSendApproval; }
	 */

	public List<Map<String, Object>> getApproverEmp(Map<String, Object> pmap) {
		logger.info("getApproverEmp 호출 성공");
		List<Map<String,Object>> getApproverEmp = null;
		getApproverEmp = approvalDao.getApproverEmp(pmap);			
		return getApproverEmp;
	}
	
	//결재자 검색
	public List<Map<String, Object>> getEmpSearchList3(Map<String, Object> pmap) {
		logger.info("getEmpSearchList3 호출 성공");
		List<Map<String,Object>> empSearchList3 = null;
		empSearchList3 = approvalDao.getEmpSearchList3(pmap);			
		return empSearchList3;
	}
	
	//결재문서조회(휴가계획서)
	//public Map<String, Object> getDetailApproval(Map<String, Object> pmap) {
	public List<Map<String, Object>> getDetailApproval(Map<String, Object> pmap) {
		logger.info("getDetailApproval 호출 성공");
		//Map<String,Object> vacationPlan = null;
		List<Map<String,Object>> vacationPlan = null;
		vacationPlan = approvalDao.getDetailApproval(pmap);			
		return vacationPlan;
	}

	//결재문서조회(프로젝트계약확정서)
	public List<Map<String, Object>> getDetailApproval2(Map<String, Object> pmap) {
		logger.info("getDetailApproval2 호출 성공");
		List<Map<String,Object>> projectPlan = null;
		projectPlan = approvalDao.getDetailApproval2(pmap);			
		return projectPlan;
	}

	public List<Map<String, Object>> getSendApproverEmp(Map<String, Object> pmap) {
		logger.info("getSendApproverEmp 호출 성공");
		List<Map<String,Object>> getSendApproverEmp = null;
		getSendApproverEmp = approvalDao.getSendApproverEmp(pmap);			
		return getSendApproverEmp;
	}

	//전자결재신청 입력
	public List<Map<String, Object>> insertApproval(Map<String, Object> pmap) {
		logger.info("insertApproval 호출 성공");
		List<Map<String,Object>> insertApproval = null;
		//두개 넣어주기
		insertApproval = approvalDao.insertApproval(pmap);			
		return insertApproval;
	}

	//결재문서 반려/결재
	public int permissionApproval(Map<String, Object> pmap) {
	//public List<Map<String, Object>> permissionApproval(Map<String, Object> pmap) {
		logger.info("permissionApproval 호출 성공");
		int result = 0;
		//List<Map<String,Object>> permissionApproval = null;
		//permissionApproval = approvalDao.permissionApproval(pmap);
		approvalDao.permissionApproval(pmap);
		result = 1;
		return result;
	}
	
}
