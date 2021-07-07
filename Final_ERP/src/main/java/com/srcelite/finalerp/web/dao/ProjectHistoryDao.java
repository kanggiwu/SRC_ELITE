package com.srcelite.finalerp.web.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class ProjectHistoryDao {
	Logger logger = Logger.getLogger(ProjectHistoryDao.class);
	SqlSessionTemplate sqlSessionTemplate = null;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	//프로젝트 이려관리 조회
	public List<Map<String, Object>> getProjectHistoryList(Map<String, Object> pmap) {
		
		List<Map<String, Object>> projectHistoryList = null;
		projectHistoryList = sqlSessionTemplate.selectList("getProjectHistoryList",pmap);
		return projectHistoryList;
	}
	//상세조회
	public List<Map<String, Object>> getDetailProjectHistoryList(Map<String, Object> pmap) {
		
		List<Map<String, Object>> detailProjectHistory = null;
		detailProjectHistory = sqlSessionTemplate.selectList("getDetailProject",pmap);
		return detailProjectHistory;
	}
	//인력조회
	public List<Map<String, Object>> getProjectParticipation(Map<String, Object> pmap) {
		List<Map<String, Object>> projectParticipation = null;
		projectParticipation = sqlSessionTemplate.selectList("getProjectParticipation",pmap);
		return projectParticipation;
	}
	//프로젝트 추가
	public List<Map<String, Object>> getprojectNameList(Map<String, Object> pmap) {
		List<Map<String, Object>> projectNameList = null;
		projectNameList = sqlSessionTemplate.selectList("getprojectNameList",pmap);
		return projectNameList;
	}
	public List<Map<String, Object>> getEmpSearchList2(Map<String, Object> pmap) {
		List<Map<String, Object>> empSearchList2 = null;
	    sqlSessionTemplate.selectList("getEmpListProc2",pmap);
	    empSearchList2 = (List<Map<String, Object>>) pmap.get("e_cursor");
	    return empSearchList2;
	}
	//프로젝트 이력 조회 검색
	public List<Map<String, Object>> getProjectListProc(Map<String, Object> pmap) {
		List<Map<String, Object>> projectListProc = null;
	    sqlSessionTemplate.selectList("getProjectListProc2",pmap);
	    projectListProc = (List<Map<String, Object>>) pmap.get("pro_cursor");
	    return projectListProc;
	}
	//프로젝트 추가
	public int updateProjectInfo(Map<String, Object> pmap) {
		logger.info("updateProjectInfo===>"+pmap);
		int result = 0;
		result = 1;
		List<Map<String,Object>> plist = new ArrayList<>();
		String empnos[] = (String[])pmap.get("arr_peno");
		Map<String, Object> pmap2 = new HashMap<>();
		for(int i=0;i<empnos.length;i++) {
			pmap2.put("emp_no",empnos[i]);
			pmap2.put("project_no", pmap.get("project_no"));
			pmap2.put("project_profit", pmap.get("project_profit"));
			pmap2.put("project_tech", pmap.get("project_tech"));
			pmap2.put("project_content", pmap.get("project_content"));
			pmap2.put("project_type", pmap.get("project_type"));
			plist.add(pmap2);
		}
	    result = sqlSessionTemplate.insert("updateProjectInfo",plist);
	    return result;
	}

   public void updateProjectInfo2(Map<String, Object> pmap) {
	   int result = 0;
        logger.info("updateProjectInfo2");
        List<Map<String,Object>> list = new ArrayList<>();
        list.add(pmap);
        result = sqlSessionTemplate.update("updateProjectInfo",pmap);
        System.out.println("result ===> "+result);
	}
	
}
