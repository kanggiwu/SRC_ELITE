package com.srcelite.finalerp.web.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ApprovalDao {
	SqlSessionTemplate sqlSessionTemplate = null;

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
	public List<Map<String, Object>> getDetailSendApproval(Map<String, Object> pmap) {
		List<Map<String, Object>> getDetailSendApproval = null;
		getDetailSendApproval = sqlSessionTemplate.selectList("getDetailApproval",pmap);
	    return getDetailSendApproval;
	}
	
	//결재수신함
	public List<Map<String, Object>> getReceiveApproval(Map<String, Object> pmap) {
		List<Map<String, Object>> getReceiveApproval = null;
		getReceiveApproval = sqlSessionTemplate.selectList("getApprovalReception",pmap);
	    return getReceiveApproval;
	}
}
