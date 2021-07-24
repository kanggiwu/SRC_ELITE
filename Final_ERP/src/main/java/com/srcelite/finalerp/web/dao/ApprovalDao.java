package com.srcelite.finalerp.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class ApprovalDao {
	SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(ApprovalDao.class);
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	//결재발신함
	public List<Map<String, Object>> getSendApproval(Map<String, Object> pmap) {
		List<Map<String, Object>> sendApprovalList = null;
		sendApprovalList = sqlSessionTemplate.selectList("getApprovalSend",pmap);
	    return sendApprovalList;
	}
	
	//결재자조회
	public List<Map<String, Object>> getApproverEmp(Map<String, Object> pmap) {
		List<Map<String, Object>> getApproverEmp = null;
		getApproverEmp = sqlSessionTemplate.selectList("getApproverEmp",pmap);
	    return getApproverEmp;
	}
	
	//결제문서조회(휴가계획서)
	/*
	 * public List<Map<String, Object>> getDetailSendApproval(Map<String, Object>
	 * pmap) { List<Map<String, Object>> getDetailSendApproval = null;
	 * getDetailSendApproval =
	 * sqlSessionTemplate.selectList("getDetailApproval",pmap); return
	 * getDetailSendApproval; }
	 */
	
	//결재수신함
	public List<Map<String, Object>> getReceiveApproval(Map<String, Object> pmap) {
		List<Map<String, Object>> getReceiveApproval = null;
		logger.info("로그인한 사람 번호"+pmap.get("login_no"));
		getReceiveApproval = sqlSessionTemplate.selectList("getApprovalReception",pmap);
	    return getReceiveApproval;
	}

	//결재자검색(결재라인 선택)
	public List<Map<String, Object>> getEmpSearchList3(Map<String, Object> pmap) {
		List<Map<String, Object>> empSearchList3 = null;
	    sqlSessionTemplate.selectList("getEmpListProc3",pmap);
	    empSearchList3 = (List<Map<String, Object>>) pmap.get("e_cursor");
	    return empSearchList3;
	}
	
	//결재문서조회(휴가계획서)
	public List<Map<String, Object>> getDetailApproval(Map<String, Object> pmap) {
		List<Map<String, Object>> vacationPlan = null; 
		vacationPlan = sqlSessionTemplate.selectList("getDetailApproval",pmap); 
		return vacationPlan;
	}

	//결재문서조회(프로젝트 계약확정서)
	public List<Map<String, Object>> getDetailApproval2(Map<String, Object> pmap) {
		List<Map<String, Object>> projectPlan = null;
		projectPlan = sqlSessionTemplate.selectList("getDetailApproval",pmap);
	    return projectPlan;
	}

	public List<Map<String, Object>> getSendApproverEmp(Map<String, Object> pmap) {
		List<Map<String, Object>> getSendApproverEmp = null;
		getSendApproverEmp = sqlSessionTemplate.selectList("getApproverEmp",pmap);
	    return getSendApproverEmp;
	}
	
	//결재신청 완료
	public List<Map<String, Object>> insertApproval(Map<String, Object> pmap) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//결재신청 반려/결재
	public int permissionApproval(Map<String, Object> pmap) {
	//public List<Map<String, Object>> permissionApproval(Map<String, Object> pmap) {
		//List<Map<String, Object>> getSendApproverEmp = null;
		int result = 0;
		sqlSessionTemplate.selectList("permissionProc",pmap);
	    return result;
	}
}
