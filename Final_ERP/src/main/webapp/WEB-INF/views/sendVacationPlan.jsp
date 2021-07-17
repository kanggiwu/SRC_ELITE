<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
	List<Map<String,Object>> getDetailSendApproval = null;
	getDetailSendApproval = (List<Map<String,Object>>)request.getAttribute("getDetailSendApproval");
	int size = 0;
	//String pProjectNo = null;
	if(getDetailSendApproval!=null){
		size = getDetailSendApproval.size();
	}
	out.print("size:"+size);
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->  
<!--관리자 로그에 필요한 코드 시작=================================================================================-->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
  	  rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous" ></script>
<link href="../common/main.css" rel="stylesheet" />
<link href="../common/css/custom.css" rel="stylesheet" />
<title>휴가계획서</title>
<div id="page_vacationPlan" style="border-bottom: 2px solid gray; margin: 50px 30px;">
<h2>휴가계획서</h2></div>
</head>
<body>
<div class="container">
	<form class="form-horizontal" role="form">
		<%
		//조회 결과가 없는 거야?
		if(size==0){		
		%>    
			alert("조회결과가 없습니다");
		<%
		}
		else{//조회 결과가 있을 때
			for(int i=0;i<size;i++){
				Map<String,Object> pmap = getDetailSendApproval.get(i);
				if(i==size) break;
		%>   
		<div class="form-group" >
			<label for="lab_deptName">부서명</label>				
			<input type="text" class="form-control" id="txt_deptName" value="<%=pmap.get("APRV_NO").toString()%>" readonly>				
		</div>
		<div class="form-group">
			<label for="lab_empName">사원명</label>
			<input type="text" class="form-control" id="txt_empName" value="" readonly>
		</div>
		<div class="form-group">
			<label for="lab_period">기간</label>
			<input type="text" class="form-control" id="txt_period" value="" readonly>
		</div>
		<div class="form-group">
			<label for="lab_reason">내용(사유)</label>
			<textarea class="form-control" id="txt_reason" rows="5" cols="50" readonly></textarea>
		</div>
		<div class="col text-center">
			<button type="button" id="sendConfirm" class="btn btn-info btn-lg" onclick="self.close()">
			확인</button>	
		</div>
	</form>
	
</div>
</body>
</html>