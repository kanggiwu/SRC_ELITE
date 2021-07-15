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

	/*
	 * // 일정 조회(월) -- 출근 시간 public List<Map<String, Object>>
	 * getAttendance(Map<String, Object> pMap) {
	 * logger.info("Logic getCalendarSchedule 호출 성공"); List<Map<String, Object>>
	 * attendanceList = null;
	 * 
	 * attendanceList = scheduleDao.getAttendance(pMap); return attendanceList; }
	 */

	// 일정 조회(월) -- 스케줄 타입별로 데이터 가져오기
	public List<Map<String, Object>> getScheduleList(Map<String, Object> pMap) {
		List<Map<String, Object>> scheduleList = null;
		scheduleList = scheduleDao.getScheduleList(pMap);

		return scheduleList;
	}

	// 일정 추가
	public int insertSchedule(Map<String, Object> pMap) {
		logger.info("inserSchedule 로직 호출");
		int result = 0;

		// 사원번호 가져오기
		int login_no = Integer.parseInt(pMap.get("login_no").toString());

		// 사원직위 가져오기
		String emp_rank = scheduleDao.getEmpRank(login_no);
		logger.info("getEmpRank=========================>" + emp_rank);

		logger.info("logic schedule_type 변환전: " + pMap.get("schedule_type"));
		int schedule_type = Integer.parseInt(pMap.get("schedule_type").toString());

		// 공통:1, 부서: 사원의 부서번호(10,20,30,40), 프로젝트: 2, 개인: 3
		switch (schedule_type % 10) {
		case 1: {// 공통
			logger.info("공통 호출");

			int dept_no = scheduleDao.getEmpDept(login_no);
			logger.info("getEmpDept=======================>" + dept_no);
			// 인사부인 경우 공통일정 추가 가능
			if (30 == dept_no) {
				pMap.put("schedule_type", 1);
				logger.info("logic schedule_type 변환 후: " + pMap.get("schedule_type"));

				result = scheduleDao.insertSchedule(pMap);
			} else {
				result = 3;
			}

			break;
		}
		case 0: {// 부서
			logger.info("부서 호출");
			// 사원직위 가져와서 부장인지 확인 후 부장이면 넘김
			logger.info("emp_rank=================>" + emp_rank);
			if ("부장".equals(emp_rank)) {
				pMap.put("schedule_type", scheduleDao.getEmpDept(login_no));
				logger.info("logic schedule_type 변환 후: " + pMap.get("schedule_type"));

				result = scheduleDao.insertSchedule(pMap);
			} else {
				result = 3;
			}
			break;
		}
		case 2: {// 프로젝트
			logger.info("프로젝트 호출");
			// 사원직책 가져와서 개발팀 팀장인지 확인 후 팀장이면 넘김
			// 사원직책 가져오기--개발부만 팀장 직책이 있기 때문에 직책만 불러와도 됨
			String emp_jop = scheduleDao.getEmpJob(login_no);
			logger.info("emp_jop=================>" + emp_jop);
			if ("T".equals(emp_jop)) {
				pMap.put("schedule_type", 2);
				logger.info("logic schedule_type 변환 후: " + pMap.get("schedule_type"));
				result = scheduleDao.insertSchedule(pMap);
			} else {
				result = 3;
			}
			break;
		}
		case 3: {// 개인
			logger.info("개인 호출");
			logger.info("logic schedule_type 변환 후: " + pMap.get("schedule_type"));
			logger.info("쿼리스트링 로직: " + pMap);
			result = scheduleDao.insertSchedule(pMap);
			break;
		}
		}
		logger.info("logic result: " + result);

		return result;
	}

	// 일정 수정
	public int updateSchedule(Map<String, Object> pMap) {
		logger.info("=================>updateSchedule 호출성공");

		int result = 0;
		// 로그인한 계정의 사원번호(아이디) 가져오기
		int login_no = Integer.parseInt(pMap.get("login_no").toString());
		logger.info("/로그인한 계정의 사원번호(아이디)=================>" + login_no);

		// 게시글 번호 가져오기
		int schedule_no = Integer.parseInt(pMap.get("schedule_no").toString());
		logger.info("schedule_no게시글번호=================>" + schedule_no);

		// 해당 게시글의 작성자 가져오기
		int scheduleWriter = Integer.parseInt(pMap.get("schedule_writer").toString());
		logger.info("scheduleWriter게시글 작성자 사원번호=================>" + scheduleWriter);

		// 게시글 타입 가져오기
		int schedule_type = Integer.parseInt(pMap.get("schedule_type").toString());

		switch (schedule_type) {
		case 1: {// 공통인 경우
			// 로그인한 사원이 인사부인 경우만 수정 가능-인사부면 누구나 수정 가능
			// 로그인한 사원의 부서 가져오기
			int dept_no = scheduleDao.getEmpDept(login_no);
			// 부서번호가 30 인 경우 update, 아닌 경우는 result = 3
			if (dept_no == 30) {
				result = scheduleDao.updateSchedule(pMap);
			} else {
				result = 3;
			}
			break;
		} // end of case1
		case 2: {// 프로젝트인 경우
			// 로그인한 사원이 개발부 팀장이고 작성자인 경우 수정 가능
			// 로그인한 사원의 직책 가져오기
			String emp_jop = scheduleDao.getEmpJob(login_no);
			// 사원의 직책이 'T'이고 작성자인 경우 update, 아닌 경우는 result = 3
			if ("T".equals(emp_jop) && scheduleWriter == login_no) {
				result = scheduleDao.updateSchedule(pMap);
			} else {
				result = 3;
			}
			break;
		} // end of case2
		default: {// 개인 또는 부서인 경우, 게시물 작성자인 경우 수정 가능 (부서는 등록할 때 해당 부서 부장들이 등록하기 떄문!)
			// 게시글 작성자와 로그인한 사원 번호가 같으면 updaate, 아닌경우 result = 3
			if (scheduleWriter == login_no) {
				result = scheduleDao.updateSchedule(pMap);
			} else {
				result = 3;
			}
			break;
		} // end of default

		}// end of switch

		logger.info("updateSchedule 반환값=================>" + result);

		return result;
	}
	public int updateDateSchedule(Map<String, Object> pMap) {
		logger.info("=================>updateSchedule 호출성공");
		
		int result = 0;
		// 로그인한 계정의 사원번호(아이디) 가져오기
		int login_no = Integer.parseInt(pMap.get("login_no").toString());
		logger.info("/로그인한 계정의 사원번호(아이디)=================>" + login_no);
		
		// 게시글 번호 가져오기
		int schedule_no = Integer.parseInt(pMap.get("schedule_no").toString());
		logger.info("schedule_no게시글번호=================>" + schedule_no);
		
		// 해당 게시글의 작성자 가져오기
		int scheduleWriter = Integer.parseInt(pMap.get("schedule_writer").toString());
		logger.info("scheduleWriter게시글 작성자 사원번호=================>" + scheduleWriter);
		
		// 게시글 타입 가져오기
		int schedule_type = Integer.parseInt(pMap.get("schedule_type").toString());
		
		switch (schedule_type) {
		case 1: {// 공통인 경우
			// 로그인한 사원이 인사부인 경우만 수정 가능-인사부면 누구나 수정 가능
			// 로그인한 사원의 부서 가져오기
			int dept_no = scheduleDao.getEmpDept(login_no);
			// 부서번호가 30 인 경우 update, 아닌 경우는 result = 3
			if (dept_no == 30) {
				result = scheduleDao.updateDateSchedule(pMap);
			} else {
				result = 3;
			}
			break;
		} // end of case1
		case 2: {// 프로젝트인 경우
			// 로그인한 사원이 개발부 팀장이고 작성자인 경우 수정 가능
			// 로그인한 사원의 직책 가져오기
			String emp_jop = scheduleDao.getEmpJob(login_no);
			// 사원의 직책이 'T'이고 작성자인 경우 update, 아닌 경우는 result = 3
			if ("T".equals(emp_jop) && scheduleWriter == login_no) {
				result = scheduleDao.updateDateSchedule(pMap);
			} else {
				result = 3;
			}
			break;
		} // end of case2
		default: {// 개인 또는 부서인 경우, 게시물 작성자인 경우 수정 가능 (부서는 등록할 때 해당 부서 부장들이 등록하기 떄문!)
			// 게시글 작성자와 로그인한 사원 번호가 같으면 updaate, 아닌경우 result = 3
			if (scheduleWriter == login_no) {
				result = scheduleDao.updateDateSchedule(pMap);
			} else {
				result = 3;
			}
			break;
		} // end of default
		
		}// end of switch
		
		logger.info("updateSchedule 반환값=================>" + result);
		
		return result;
	}

	// 일정 삭제
	public int deleteSchedule(Map<String, Object> pMap) {
		logger.info("=================>deleteSchedule 호출성공");

		int result = 0;
		// 로그인한 계정의 사원번호(아이디) 가져오기
		int login_no = Integer.parseInt(pMap.get("login_no").toString());
		logger.info("/로그인한 계정의 사원번호(아이디)=================>" + login_no);

		// 게시글 번호 가져오기
		int schedule_no = Integer.parseInt(pMap.get("schedule_no").toString());
		logger.info("schedule_no게시글번호=================>" + schedule_no);

		// 해당 게시글의 작성자 가져오기
		int scheduleWriter = Integer.parseInt(pMap.get("schedule_writer").toString());
		logger.info("scheduleWriter게시글 작성자 사원번호=================>" + scheduleWriter);

		// 게시글 타입 가져오기
		int schedule_type = Integer.parseInt(pMap.get("schedule_type").toString());

		switch (schedule_type) {
		case 1: {// 공통인 경우
			// 로그인한 사원이 인사부인 경우만 수정 가능-인사부면 누구나 수정 가능
			// 로그인한 사원의 부서 가져오기
			int dept_no = scheduleDao.getEmpDept(login_no);
			// 부서번호가 30 인 경우 update, 아닌 경우는 result = 3
			if (dept_no == 30) {
				result = scheduleDao.deleteSchedule(schedule_no);
			} else {
				result = 3;
			}
			break;
		} // end of case1
		case 2: {// 프로젝트인 경우
			// 로그인한 사원이 개발부 팀장이고 작성자인 경우 수정 가능
			// 로그인한 사원의 직책 가져오기
			String emp_jop = scheduleDao.getEmpJob(login_no);
			// 사원의 직책이 'T'이고 작성자인 경우 update, 아닌 경우는 result = 3
			if ("T".equals(emp_jop) && scheduleWriter == login_no) {
				result = scheduleDao.deleteSchedule(schedule_no);
			} else {
				result = 3;
			}
			break;
		} // end of case2
		default: {// 개인 또는 부서인 경우, 게시물 작성자인 경우 수정 가능 (부서는 등록할 때 해당 부서 부장들이 등록하기 떄문!)
			// 게시글 작성자와 로그인한 사원 번호가 같으면 updaate, 아닌경우 result = 3
			logger.info("type이 개인 또는 부서인 경우 게시글 작성자와 로그인 계정이 같으면 일정 삭제");
			
			if (scheduleWriter == login_no) {
				result = scheduleDao.deleteSchedule(schedule_no);
			} else {
				result = 3;
			}
			break;
		} // end of default

		}// end of switch

		logger.info("deleteSchedule 반환값=================>" + result);

		return result;
	}

}
