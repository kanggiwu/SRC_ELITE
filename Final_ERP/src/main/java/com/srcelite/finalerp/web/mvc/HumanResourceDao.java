package com.srcelite.finalerp.web.mvc;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class HumanResourceDao {
	SqlSessionTemplate sqlSessionTemplate = null;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	public List<Map<String, Object>> getEmployeeList(Map<String, Object> pmap) {
		List<Map<String, Object>> boardList = null;
		boardList = sqlSessionTemplate.selectList("getEmpList",pmap);
		return boardList;
	}
	public List<Map<String, Object>> getEmployeeDetail(Map<String, Object> pmap) {
		List<Map<String, Object>> boardDetail = null;
		boardDetail = sqlSessionTemplate.selectList("getDetailEmpInfo",pmap);
		return boardDetail;
	}
}
