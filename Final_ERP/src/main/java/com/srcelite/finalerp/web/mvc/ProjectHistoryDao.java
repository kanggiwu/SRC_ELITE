package com.srcelite.finalerp.web.mvc;

import org.mybatis.spring.SqlSessionTemplate;

public class ProjectHistoryDao {
	SqlSessionTemplate sqlSessionTemplate = null;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
}
