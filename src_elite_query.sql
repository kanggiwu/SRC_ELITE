/* UI정의서 v0.0.4기준 */

/***********************공통 사항***********************/

/* PAGE 8 */ 
/* login 시 DB에서 아이디에 해당하는 비번을 불러와서 사용자가 입력한 비번과 일치하면 로그인*/
/*--------getPassword*/
SELECT emp_pw
  FROM emp
WHERE emp_no = "#입력된 직원번호";


/* PAGE 9 */

/* 사원의 이름, 직위, 부서명 가져오기*/
/* getEMPInfoHead*/
SELECT e.emp_name|| " - " || r.rank_name || " - " ||  d.dept_name /* 상단 정보 가져오기 */
FROM emp e, dept d, rank r
WHERE n.emp_no = e.emp_no AND e.dept_no = d.deptno AND e.emp_no = "#현재 접속중인 사원의 사원번호";


/*insertAttendanceTime */
INSERT INTO attendance (attendance_code, emp_no, attendance_start_work) VALUES( "#시퀀스 사용예정",  "#현재 접속중인 사원의 사원번호", SYSDATE); /* 출근 버튼을 누를 경우*/

/*최신의 공지 3건 불러오기 */
/*getMainNoticeList*/
SELECT notice_title, notice_date
  FROM notice
WHERE ROWNUM <= 3
ORDER BY notice_date DESC;

/* PAGE10 */
/* getMenuName */
SELECT menu_name 
    FROM Menu;
    

/* PAGE11 */

/***********************공지*******************************/

/* PAGE14 */

SELECT DECODE(n.notice_type, '부서', d.dept_name, '공통') as notice_type, n.notice_title, d.dept_name, n.emp_name, n.notice_date
  FROM      notice n, emp e, dept d
WHERE n.emp_no = e.emp_no AND e.dept_no = d.deptno
          /*AND ROWNUM > "시작지점" AND ROWNUM < "끝나는 지점" ----- 리스트하단 번호를 누를 때마다 목록을 바꿔주기위한 부분,일단 대강 생각, 더 좋은 아이디어 있을듯, 보완 필요 */
ORDER BY notice_date DESC;

/* PAGE15 */
SELECT n.notice_title, d.dept_name||' '||e.emp_name, n.notice_date, n.notice_content
  FROM notice n, emp e, dept d
WHERE n.emp_no = e.emp_no AND e.dept_no = d.deptno AND n.notice_no = #{선택된 공지번호};

/* PAGE17 */
INSERT INTO notice (notice_no, notice_type, notice_title, emp_no, notice_content, notice_date)
                  VALUES ( #{시퀀스},    #{공지분류입력},     #{공지제목입력}  ,#{작성 사원},               #{공지 내용},  SYSDATE);

/* PAGE19 */
UPDATE notice
SET
notice_type = #{입력받은 값} ,           /*검토필요: 화면에는 나와있지 않지만 공지의 분류를 변경가능하게 할것인가?*/
notice_title = "#입력받은 제목",
notice_content = "#입력받은 공지내용",
notice_date = "#수정한 시각?"        /*수정할때 시간을 수정한 시간으로 수정할 것인가?*/
WHERE notice_no = "#현재 공지상세로 들어올때 받은 공지 번호";

/* PAGE23 */
DELETE notice
WHERE notice_no =  "#현재 공지상세로 들어올때 받은 공지 번호";

/***********************마이 페이지**********************/

/* PAGE26 */
SELECT e.emp_name, TRUNC(MONTHS_BETWEEN(SYSDATE, m_lunch_date)/12)||'년차', d.dept_name, r.rank_name, e.emp_hiredate, emp_status, e.emp_pw, e.emp_tel, e.emp_email
  FROM emp e, dept d, rank r
WHERE e.dept_no = d.dept_no AND e.rank_no = r.rank_no AND emp_no = "#현재 접속 사원의 사원번호";

/* PAGE28   지금버전에서는 프로시저를 사용하지 않으므로 자바단에서 패스워드와 패스워드확인이 일치하는 지 확인후 일차히면 비밀번호를 업데이트*/
UPDATE emp
SET
emp_pw = "#입력받은 변경할 패스워드"
WHERE emp_no = "#현재 접속중인 사원의 사원번호";

/***********************일정********************************/

/* PAGE31 */
SELECT attendance_code, emp_no, attendance_start_work
  FROM attendance
WHERE emp_no = "#현재 접속중인 사원의 사원번호"
    AND attendance_start_work BETWEEN TRUNC(SYSDATE+1)-TO_CHAR(SYSDATE,'DD') AND TRUNC(LAST_DAY(SYSDATE))+0.99999421; /*처음 들어왔을 때의 달의 일정*/

SELECT attendance_code, emp_no, attendance_start_work
  FROM attendance
WHERE emp_no = "#현재 접속중인 사원의 사원번호"
    AND attendance_start_work BETWEEN TRUNC("#입력받은 날짜의 달" +1)-TO_CHAR("#입력받은 날짜의 달", 'DD') AND TRUNC(LAST_DAY("#입력받은 날짜의 달")) + 0.9999942;

/* PAGE32 */
    /*공통 일정 조회 */
SELECT schedule_code, emp_no, schedule_type, schedule_title, schedule_startdate, schedule_enddate, schedule_content
  FROM schedule
WHERE schedule_type = '공통';

    /*부서 일정 조회 */
SELECT s.schedule_code, s.emp_no, s.schedule_type, s.schedule_title, 
                s.schedule_startdate, s.schedule_enddate, s.schedule_content d.dept_name
  FROM schedule s, emp e, dept d
WHERE s.emp_no = e.emp_no AND e.dept_no = d.dept_no AND schedule_type = '부서';

    /*사원 일정 조회 */
SELECT schedule_code, emp_no, schedule_type, schedule_title, 
                schedule_startdate, schedule_enddate, schedule_content
  FROM schedule
WHERE emp_no = emp_no AND emp_no = "#접속중인 사원의 사원번호" AND schedule_type = '사원';

/* PAGE33 */
INSERT INTO schedule (schedule_code, emp_no, schedule_type, schedule_title, schedule_startdate, schedule_enddate, schedule_content)
                        VALUES ("#시퀀스 추가예정", "#현재 접속중인 사원번호", "#콤보박스로 선택된 일정분류", "#스케쥴 제목", "#시작일", "#종료일", "#일정 내용");

/* PAGE34 */
SELECT emp_no FROM schedule WHERE schedule_code = "선택한 일정의 일정번호"; /*일정의 작성자가 맞는지 확인하기 위해 일정작성시 저장된 사원번호 불러오기 */

UPDATE schedule
SET 
    emp_no = "#현재 접속중인 수정자",
    schedule_type = "#콤보박스에서 선택된 일정분류",
    schedule_title = "#일정 제목",
    schedule_startdate = "#시작일",
    schedule_enddate = "#종료일",
    schedule_content = "#일정 내용"
WHERE  schedule_code = "#선택한 일정번호";

/* PAGE35 */
DELETE schedule WHERE schedule_code = "#선택한 일정의 일정번호";




/**************************회계********************************/




/***************************인사*******************************/

/* PAGE56 */
SELECT e.emp_no, e.emp_name, d.dept_name, r.rank_name, e.emp_status
  FROM emp e, dept d, rank r
WHERE e.dept_no = d.dept_no AND e.rank_no = r.rank_no  /* 이 페이지에 사원 조건 검색이 추가 될 경우 where절 수정 필요*/
ORDER BY emp_no ASC;

/* PAGE57 */
INSERT INTO emp (emp_no, emp_name, emp_pw, emp_status, dept_no, rank_no, emp_job, emp_hiredate, emp_retiredate, emp_email, emp_tel, emp_auth, emp_picture_path)
                VALUES("시퀀스", "사원이름", "사원전화번호 뒤4자리?", "재직", "콤보박스에서 매핑된 부서번호", "콤보박스에서 매핑된 직위번호", "고용일", NULL, "이메일", "전화번호", "일단 최소권한?", "파일첨부에서 받아온 경로");

/* PAGE59 */
INSERT INTO licence_emp (emp_no, licence_no) VALUES( "현재 수정중인 사원정보의 사원번호", "화면에서 선택된 자격증번호");

/* PAGE 63 */
UPDATE emp
SET
    emp_name = "수정된이름"
    ,emp_status = "수정된 고용상태"
    ,dept_no = "수정된 콤보박스로 부터 입력받은 매핑된 부서번호"
    ,rank_no = "수정된 콤보박스로 부터 입력받은 매핑된 직위번호"
    /*,emp_job = "직책을 바꾸는 부분이 화면에 없음"*/
    ,emp_retiredate = "퇴직이나 해고인 경우 설정된 퇴직일"
    ,emp_email = "변경된 이메일"
    ,emp_tel = "변경된 전화번호"
    /*,emp_auth = "권한설정에 관한 부분이 없음" */
    ,emp_picture_path = "파일 첨부에서 받아온 변경된 사진 파일의 경로"
WHERE emp_no = "해당 상세페이지의 사원번호";


/**************************전자결재********************************/



/**************************프로젝트 관리***************************/






 /* emp_no, emp_name, emp_pw, emp_status, rank_no, dept_no, emp_job, emp_hiredate, emp_retiredate, emp_email, emp_tel, emp_auth, emp_picture_path*/
 
 /* sal_code, emo_no, sal_date, sal_base, sal_incentive, sal_position, sal_tech, sal_etc, sal_meal, sal_commu, sal_payment, sal_nation_pension, sal_health, sal_industrial_insurance, sal_employ_insurance, sal_income_tax, sal_local_tax, sal_deduction_etc, sal_deductions, sal_total */
 
 /* licence_no, licence_name, licence_type, licence_level, licence_date, licence_expire, licence_incentive */