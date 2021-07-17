<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.Gson" %>    
<%@ page import="java.util.*" %>
<%List<Map<String,Object>> scheduleList = null;
/* 	Map<String,Object> map = new HashMap<String,Object>(); */
	
	scheduleList = (List<Map<String,Object>>) request.getAttribute("scheduleList");
/*  	int scheduleListSize = 0;
	map.put("scheduleList",scheduleList); */

	Gson gson = new Gson();
 
	if (scheduleList != null && scheduleList.size() > 0) {
		/* scheduleListSize = scheduleList.size(); */
		String imsi = gson.toJson(scheduleList);
		out.print(imsi);
	} 
	
	/* List<Map<String,Object>> attendanceList = null;
	attendanceList = (List<Map<String,Object>>) request.getAttribute("attendanceList");
	int attendanceListSize = 0; 
	map.put("attendanceList",attendanceList);
	String outJson = gson.toJson(map);
	out.print(outJson);
	 */
	
	/* Gson gson2 = new Gson();
	if (attendanceList != null && attendanceList.size() > 0) {
		String imsi2 = gson2.toJson(attendanceList);
		out.print(imsi2);
	}   */
	
%>