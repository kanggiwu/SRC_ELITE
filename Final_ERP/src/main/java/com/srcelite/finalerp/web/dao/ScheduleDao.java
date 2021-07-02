package com.srcelite.finalerp.web.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;

public class ScheduleDao {
	SqlSessionTemplate sqlSessionTemplate = null;
	Logger logger = Logger.getLogger(ScheduleDao.class);
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public List<Map<String, Object>> getAttendance(Map<String, Object> pMap) {
		List<Map<String, Object>> attendancetList = null;
		attendancetList = sqlSessionTemplate.selectList("getAttendance",pMap);
		
		return attendancetList;
	}



	public List<Map<String, Object>> getScheduleList(Map<String, Object> pMap) {
		logger.info("다오 getScheduleList 호출 성공");
		List<Map<String, Object>> getScheduleList = null;
		getScheduleList = sqlSessionTemplate.selectList("getScheduleList",pMap);
		
		
		return getScheduleList;
	}

	public Map<String, Object> getDetailSchedule(Map<String, Object> pMap) {
		Map<String, Object> detailSchedule =null;
//		detailSchedule = sqlSessionTemplate.selectOne();
		
		return detailSchedule;
	}

	public int deleteSchedule(Map<String, Object> pMap) {
		int result = 0;
		logger.info("dao result: " + result);
		
		return 0;
	}

	public int insertSchedule(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSessionTemplate.insert("insertSchedule",pMap);
		logger.info("dao result: " + result);
		
		return result;
	}

	public int updateSchedule(Map<String, Object> pMap) {
		int result = 0;
		result = sqlSessionTemplate.update("updateSchedule",pMap);
		return result;
	}


	public int getEmpDept(int emp_no) {
		int dept_no = -1;
		dept_no = sqlSessionTemplate.selectOne("getEmpDept",emp_no);
		
		return dept_no;
	}

	//게시글 작성장의 사원번호 가져오기
	public int getScheduleWriter(int schedule_no) {
		int empId = 0;
		empId = sqlSessionTemplate.selectOne("getScheduleWriter",schedule_no);
		return empId;
	}
	//해당 사원의 직책을 받아온다.
	public String getEmpJob(int emp_no) {
		String emp_jop = null;
		emp_jop = sqlSessionTemplate.selectOne("getEmpJob",emp_no);
		return emp_jop;
	}
	//해당 사원의 직위를 받아온다.
	public String getEmpRank(int emp_no) {
		String emp_rank = null; 
		emp_rank = sqlSessionTemplate.selectOne("getEmpRank",emp_no);
		return emp_rank;
	}

}

