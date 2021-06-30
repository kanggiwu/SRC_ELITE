<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
	List<Map<String,Object>> detailProjectHistory = null;
	detailProjectHistory = (List<Map<String,Object>>)request.getAttribute("detailProjectHistory");
	int size = 0;
	String project_name 		= null;
	String project_client		= null;
	String project_manager 		= null;
	String emp_name		 		= null;
	String project_tech 		= null;
	String project_period	= null;
	String project_profit 		= null;
	String project_type 		= null;
	String project_content 		= null;	
	if(detailProjectHistory!=null){
		size = detailProjectHistory.size();
		Map<String,Object> pmap = detailProjectHistory.get(0);
		project_name = pmap.get("PROJECT_NAME").toString();
		project_client = pmap.get("PROJECT_CLIENT").toString();
		project_manager = pmap.get("PROJECT_MANAGER").toString();
		emp_name = pmap.get("EMP_NAME").toString();
		project_tech = pmap.get("PROJECT_TECH").toString();
		project_period = pmap.get("PROJECT_PERIOD").toString();
		project_profit = pmap.get("PROJECT_PROFIT").toString();
		project_type = pmap.get("PROJECT_TYPE").toString();
		project_content = pmap.get("PROJECT_CONTENT").toString();
	}
	//out.print("detailProjectHistory:"+detailProjectHistory);
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
<title>Insert title here</title>
</head>
<br><br>
<div class="container">
<div class="row">
    <div class='col-sm-6'  > 
		<form class="form-horizontal" role="form">
			<div class="form-group" >
				<label for="txt_proName">프로젝트명</label>				
				<input type="text" class="form-control" id="txt_proName" value="<%=project_name%>">				
			</div>
			<div class="form-group">
				<label for="dat_period">기간</label>
				<input type="text" class="form-control" id="txt_period" value="<%=project_period%>">
			</div>
			<div class="form-group">
				<label for="txt_company">발주사</label>
				<input type="text" class="form-control" id="txt_company" value="<%=project_client%>">
			</div>
		</form>
		</div>	
		<div class='col-sm-6'>
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label for="txt_emp">담당자</label>
				<input type="text" class="form-control" id="txt_emp" value="<%=emp_name%>">	
			</div>
			<div class="form-group">
				<label for="txt_kind">종류</label>
				<input type="text" class="form-control" id="txt_kind" value="<%=project_type%>">
			</div>
			<div class="form-group">
				<label for="txt_prodeeds">수익금</label>
				<input type="text" class="form-control" id="txt_prodeeds"  value="<%=project_profit%>">
			</div>
		</form>	
		</div>
	</div>
	</div> 	
	
		<div class="text-right container">
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label for="txt_tech">기술</label>
				<textarea class="form-control" id="txt_tech" rows="3" cols="50"><%=project_tech%></textarea>					
			</div>
			<div class="form-group">
				<label for="txt_content">개발내용</label>
				<textarea class="form-control" id="txt_content" rows="3" cols="50"><%=project_content%></textarea>					
			</div>
		</form>
		</div>
<!-- ===========================인력부분 시작==================================== -->
	<div class="text-right container">
	<div class='row'>
		<table id="products" class="table table-hover">
            <form action="" id="setRows">
            	<input type="hidden" name="rowPerPage" value="1" id="rowPerPage">
            </form>		
			<thead>
				<tr style="background-color:lightgray">
					<th style="width: 25%">사원번호</th>
					<th style="width: 25%">부서명</th>
					<th style="width: 25%">직위명</th>
					<th style="width: 25%">사원명</th>
				</tr>
			</thead>

			<tbody> 
				<tr>
					<%-- <td><%=pmap.get("PROJECT_NAME").toString()%></td>
					<td><%=pmap.get("PROJECT_PERIOD").toString()%></td>
					<td><%=pmap.get("EMP_NAME").toString()%></td>
					<td><%=pmap.get("PROJECT_TYPE").toString()%></td> --%>
				</tr>
			</tbody>			
		</table> 
	</div>
<!-- ===========================인력부분 끝==================================== -->
		<div class="text-right container">
		<button type="button" class="btn btn-info" onClick="self.close()">확인</button>	
	</div>		

</html>