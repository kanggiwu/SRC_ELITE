package com.srcelite.finalerp.web.dao;

import org.mybatis.spring.SqlSessionTemplate;

public class NoticeDao {
	SqlSessionTemplate sqlSessionTemplate = null;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
}
