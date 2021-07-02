package com.srcelite.finalerp.web.logic;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.dao.support.DaoSupport;

import com.srcelite.finalerp.web.dao.ScheduleDao;

public class ScheduleLogic {
	ScheduleDao scheduleDao = null;
	Logger logger = Logger.getLogger(ScheduleLogic.class);
	public void setScheduleDao(ScheduleDao scheduleDao) {
		this.scheduleDao = scheduleDao;
	}
	
	
	//일정 조회(월) -- 출근 시간
	public List<Map<String,Object>> getAttendance(Map<String,Object> pMap)   {
		logger.info("Logic getCalendarSchedule 호출 성공");
		List<Map<String,Object>> attendanceList = null;
		
		attendanceList = scheduleDao.getAttendance(pMap);
		return attendanceList;
	}
	//일정 조회(월) -- 스케줄 타입별로 데이터 가져오기
	public List<Map<String, Object>> getScheduleList(Map<String, Object> pMap) {
		List<Map<String,Object>> scheduleList = null;
		
		
		scheduleList=scheduleDao.getScheduleList(pMap);
		
		return scheduleList;
	}

	//일정 상세조회
	public Map<String,Object> getDetailSchedule(Map<String,Object> pMap)    {
		Map<String,Object> detailSchedule = null;
		detailSchedule = scheduleDao.getDetailSchedule(pMap);
		
		return detailSchedule;
	}
	
	//일정 추가
	public int insertSchedule(Map<String,Object> pMap) {
		logger.info("inserSchedule 로직 호출");
		int result = 0;
		
		int emp_no = Integer.parseInt(pMap.get("emp_no").toString());
		
		logger.info("logic schedule_type 변환전: "+pMap.get("schedule_type"));
		String schedule_type = pMap.get("schedule_type").toString();

		switch (schedule_type) {
			case "공통": {
				logger.info("inserSchedule 로직 호출");
				int dept_no = scheduleDao.getEmpDept(emp_no);
				logger.info("getEmpDept=======================>"+dept_no);
				String emp_rank = scheduleDao.getEmpRank(emp_no);
				logger.info("getEmpRank=========================>"+emp_rank);
				if("부장".equals(emp_rank)&&30==dept_no) {
					pMap.put("schedule_type",1);
					logger.info("logic schedule_type 변환 후: "+pMap.get("schedule_type"));
					
					result = scheduleDao.insertSchedule(pMap);
				}
				break;
			}
			case "부서":{
				//사원직위 가져와서 부장인지 확인 후 부장이면 넘김
				String emp_rank = scheduleDao.getEmpRank(emp_no);
				logger.info("emp_rank=================>"+emp_rank);
				if("부장".equals(emp_rank)) {
					pMap.put("schedule_type",scheduleDao.getEmpDept(emp_no));
					logger.info("logic schedule_type 변환 후: "+pMap.get("schedule_type"));
					
					result = scheduleDao.insertSchedule(pMap);
				}
				break;
			}
			case "프로젝트": {
				//사원직책 가져와서 개발팀 팀장인지 확인 후 팀장이면 넘김
				//사원직책 가져오기
				String emp_jop = scheduleDao.getEmpJob(emp_no);
				logger.info("emp_jop=================>"+emp_jop);
				if("T".equals(emp_jop)) {
					pMap.put("schedule_type",2);
					logger.info("logic schedule_type 변환 후: "+pMap.get("schedule_type"));
					result = scheduleDao.insertSchedule(pMap);
				}
				break;
			}
			case "개인": {
				pMap.put("schedule_type",3);
				logger.info("logic schedule_type 변환 후: "+pMap.get("schedule_type"));
				
				result = scheduleDao.insertSchedule(pMap);
				break;
			}
		}
		logger.info("logic result: "+result);
		
		return result;
	}
	//일정 수정
	public int updateSchedule(Map<String,Object> pMap) {
		logger.info("=================>updateSchedule 호출성공");
		int result = 0;
		
		//게시글 번호 가져오기
		int schedule_no = Integer.parseInt(pMap.get("schedule_no").toString());
		logger.info("schedule_no게시글번호=================>"+schedule_no);
		
		//해당 게시글의 작성자 가져오기
		int scheduleWriter = scheduleDao.getScheduleWriter(schedule_no);
		logger.info("scheduleWriter게시글 작성자 사원번호=================>"+scheduleWriter);
		
		//로그인한 계정의 사원번호(아이디) 가져오기
		int emp_no = Integer.parseInt(pMap.get("emp_no").toString());
		logger.info("/로그인한 계정의 사원번호(아이디)=================>"+emp_no);
		
		if(scheduleWriter==emp_no) {
			logger.info("$$$$$$$$$$$$$$$작성자와 로그인한 계정이 같다");
			
			result = scheduleDao.updateSchedule(pMap);
		}
		
		logger.info("updateSchedule 반환값=================>"+result);
		

		//사원번호랑 게시글 번호가 같다면
		/*
		 * if(empId==scheduleWriter) { result = scheduleDao.updateSchedule(pMap);
		 * 
		 * }
		 */
		
		
		return result;
	}
	//일정 삭제
	public int deleteSchedule(Map<String,Object> pMap) {
		int result = 0;
		result = scheduleDao.deleteSchedule(pMap);
		return result;
	}


	
	
	
	
	
}
