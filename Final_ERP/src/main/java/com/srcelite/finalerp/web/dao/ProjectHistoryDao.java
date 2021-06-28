package com.srcelite.finalerp.web.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ProjectHistoryDao {
	SqlSessionTemplate sqlSessionTemplate = null;
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List<Map<String, Object>> getProjectHistoryList(Map<String, Object> pmap) {
		
		List<Map<String, Object>> projectHistoryList = null;
		projectHistoryList = sqlSessionTemplate.selectList("getProjectHistoryList",pmap);
		return projectHistoryList;
	}
}
