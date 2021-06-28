<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	List<Map<String,Object>> attendanceList = null;
	attendanceList = (List<Map<String,Object>>) request.getAttribute("attendanceList");
	int size = 0;
	if (attendanceList != null && attendanceList.size() > 0) {
		size = attendanceList.size();
		out.print(size);
		out.print("<br>");
		for (Map<String, Object> attendance : attendanceList) {
			out.print(attendance.get("ATTENDANCE_CODE"));
			out.print("<br>");
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP 테스트</title>
</head>
<body>
	 final project ERP 테스트 화면


</body>
</html>