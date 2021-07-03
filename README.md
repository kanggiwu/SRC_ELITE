# ERP_Program

ERP 프로그램 만들기

==> Preparing: SELECT SEQ_SCHEDULE.NEXTVAL FROM DUAL
[2021-06-30 20:16:31,241] [DEBUG] (JakartaCommonsLoggingImpl.java:54) - ==> Parameters:
[2021-06-30 20:16:31,263] [TRACE] (JakartaCommonsLoggingImpl.java:59) - <== Columns: NEXTVAL
[2021-06-30 20:16:31,272] [TRACE] (JakartaCommonsLoggingImpl.java:59) - <== Row: 8
[2021-06-30 20:16:31,277] [DEBUG] (JakartaCommonsLoggingImpl.java:54) - <== Total: 1
[2021-06-30 20:16:31,278] [DEBUG] (JakartaCommonsLoggingImpl.java:54) - ==> Preparing: INSERT INTO schedule (schedule_no, emp_no, schedule_type , schedule_title, schedule_startdate, schedule_enddate, schedule_content) VALUES (?, ?, ?, ? , ?, ?, ?)
[2021-06-30 20:16:31,279] [DEBUG] (JakartaCommonsLoggingImpl.java:54) - ==> Parameters: 8(Integer), 34(String), 3(Integer), 개발부 팀장입니다.(String), 2021-06-22 20:16(String), 2021-06-25 21:16(String), 개인일정 추가해보겠습니다.(String)
[2021-06-30 20:16:31,350] [INFO] (XmlBeanDefinitionReader.java:317) - Loading XML bean definitions from class path resource [org/springframework/jdbc/support/sql-error-codes.xml]
6월 30, 2021 8:16:31 오후 org.apache.catalina.core.StandardWrapperValve invoke
심각: 경로 []의 컨텍스트 내의 서블릿 [appServlet]을(를) 위한 Servlet.service() 호출이, 근본 원인(root cause)과 함께, 예외 [Request processing failed; nested exception is org.springframework.dao.DuplicateKeyException:

### Error updating database. Cause: java.sql.SQLIntegrityConstraintViolationException: ORA-00001: 무결성 제약 조건(SRC_FINAL.PK_SCHEDULE)에 위배됩니다

17번까지 schedule_no가 있는데, 마지막 seq를 7로 받아와서 무결성 제약 조건에 걸렸다.