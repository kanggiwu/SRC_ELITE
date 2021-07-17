<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<% 
	List<Map<String,Object>> attendanceList = null;
	attendanceList = (List<Map<String,Object>>) request.getAttribute("attendanceList");
	int attendanceListSize = 0;
	if (attendanceList != null && attendanceList.size() > 0) {
		attendanceListSize = attendanceList.size();
		out.print("attendanceListSize"+attendanceListSize);
		out.print("<br>");
		for (Map<String, Object> attendance : attendanceList) {
			out.print(attendance.get("ATTENDANCE_NO"));
			out.print(attendance.get("ATTENDANCE_START_WORK"));
			out.print("<br>");
		}
	}
	
	List<Map<String,Object>> scheduleList = null;
	scheduleList = (List<Map<String,Object>>) request.getAttribute("scheduleList");
	int scheduleListSize = 0;
	if (scheduleList != null && scheduleList.size() > 0) {
		scheduleListSize = scheduleList.size();
		out.print("scheduleList: "+scheduleListSize);
		out.print("<br>");
		out.print("일정 출력");
		out.print("<br>");
		for (Map<String, Object> schedule : scheduleList) {
			out.print("일정번호: " +schedule.get("SCHEDULE_NO"));
		out.print("<br>");
			out.print("일정타입: " +schedule.get("SCHEDULE_TYPE"));
			out.print("<br>");
			out.print("일정내용: " +schedule.get("SCHEDULE_CONTENT"));
			out.print("<br>");
			out.print("====================================");
			out.print("<br>");
		}
	}
	
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP 테스트[WEB-INF]</title>
</head>
<body>
	 final project ERP 테스트 화면


</body>
</html>