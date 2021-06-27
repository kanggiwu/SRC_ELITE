<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	List<Map<String,Object>> scheduleList = null;
	scheduleList = (List<Map<String,Object>>) request.getAttribute("scheduleList");
	int size = 0;
	if (scheduleList != null && scheduleList.size() > 0) {
		size = scheduleList.size();
		out.print(size);
		out.print("<br>");
		for (Map<String, Object> schedule : scheduleList) {
			out.print(schedule.get("SCHEDULE_NO"));
			out.print("<br>");
		}
	}
	
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>ERP 테스트</title>
</head>
<body>
	 final project ERP 테스트 화면
=======
<title>파이널 index.jsp</title>
</head>
<body>
	파이널 index.jsp
>>>>>>> DH_01
</body>
</html>