<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
	List<Map<String,Object>> detailProjectHistory = null;
	List<Map<String,Object>> projectParticipation = null;
	detailProjectHistory = (List<Map<String,Object>>)request.getAttribute("detailProjectHistory");
	projectParticipation = (List<Map<String,Object>>)request.getAttribute("projectParticipation");
	int size = 0;
	int psize = 0;
	String project_name 		= null;
	String project_client		= null;
	String project_manager 		= null;
	String emp_name		 		= null;
	String project_tech 		= null;
	String project_period		= null;
	String project_profit 		= null;
	String project_type 		= null;
	String project_content 		= null;	
	//String emp_name		 	= null;
	String emp_name2		 	= null;
	String DEPT_NO		 		= null;
	String TEAM_NO		 		= null;
	String RANK_NO		 		= null;
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
	if(projectParticipation!=null){
		psize = projectParticipation.size();
		Map<String,Object> pmap2 = projectParticipation.get(0);
		emp_name2 = pmap2.get("EMP_NAME").toString();
		DEPT_NO = pmap2.get("DEPT_NO").toString();
		TEAM_NO = pmap2.get("TEAM_NO").toString();
		RANK_NO = pmap2.get("RANK_NO").toString();		
	}
	//out.print("detailProjectHistory:"+detailProjectHistory);
%>       
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- ??? 3?????? ?????? ????????? *?????????* head ????????? ????????? ???????????????; ?????? ?????? ??????????????? ????????? ??? ????????? *?????????* ?????? ????????? -->  
<!--????????? ????????? ????????? ?????? ??????=================================================================================-->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
  	  rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous" ></script>
<link href="../common/main.css" rel="stylesheet" />
<link href="../common/css/custom.css" rel="stylesheet" />
<title>???????????? ?????? ????????????</title>
<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
<h2>???????????? ?????? ????????????</h2></div>
</head>
<div class="container">
<div class="row">
    <div class='col-sm-6'  > 
		<form class="form-horizontal" role="form">
			<div class="form-group" >
				<label for="txt_proName">???????????????</label>				
				<input type="text" class="form-control" id="txt_proName" value="<%=project_name%>" readonly>				
			</div>
			<div class="form-group">
				<label for="dat_period">??????</label>
				<input type="text" class="form-control" id="txt_period" value="<%=project_period%>" readonly>
			</div>
			<div class="form-group">
				<label for="txt_company">?????????</label>
				<input type="text" class="form-control" id="txt_company" value="<%=project_client%>" readonly>
			</div>
		</form>
		</div>	
		<div class='col-sm-6'>
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label for="txt_emp">?????????</label>
				<input type="text" class="form-control" id="txt_emp" value="<%=emp_name%>" readonly>	
			</div>
			<div class="form-group">
				<label for="txt_kind">??????</label>
				<input type="text" class="form-control" id="txt_kind" value="<%=project_type%>" readonly>
			</div>
			<div class="form-group">
				<label for="txt_prodeeds">?????????</label>
				<input type="text" class="form-control" id="txt_prodeeds"  value="<%=project_profit%>" readonly>
			</div>
		</form>	
		</div>
	</div>
	</div> 	
	
		<div class="container">
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<label for="txt_tech">??????</label>
				<textarea class="form-control" id="txt_tech" rows="3" cols="50" readonly><%=project_tech%></textarea>					
			</div>
			<div class="form-group">
				<label for="txt_content">????????????</label>
				<textarea class="form-control" id="txt_content" rows="3" cols="50" readonly><%=project_content%></textarea>					
			</div>
		</form>
		</div>
<!-- ===========================???????????? ??????==================================== -->
	<div class="container">
	<div class='row'>
		<table id="products" class="table table-hover">
            <form action="" id="setRows">
            	<input type="hidden" name="rowPerPage" value="1" id="rowPerPage">
            </form>		
			<thead>
				<tr style="background-color:lightgray">
					<th style="width: 25%">????????????</th>
					<th style="width: 25%">?????????</th>
					<th style="width: 25%">?????????</th>
					<th style="width: 25%">?????????</th>
				</tr>
			</thead>

			<tbody> 
<%
//?????? ????????? ?????? ???????
if(psize==0){		
%>    
        <tr>
            <td colspan="4">??????????????? ????????????.</td>
        </tr>
<%
}
else{//?????? ????????? ?????? ???
	for(int i=0;i<psize;i++){
		Map<String,Object> pmap = projectParticipation.get(i);
		if(i==psize) break;
%>    	
				<tr>
					<td><%=pmap.get("EMP_NAME").toString()%></td>
					<td><%=pmap.get("DEPT_NO").toString()%></td>
					<td><%=pmap.get("TEAM_NO").toString()%></td>
					<td><%=pmap.get("RANK_NO").toString()%></td>
				</tr>
<% 
	}///end of for
} ///end of if
%>
			</tbody>			
		</table> 
	</div>
<!-- ===========================???????????? ???==================================== -->
		<div class="text-right container">
		<button type="button" class="btn btn-info" onClick="self.close()">??????</button>	
		<br><br>
	</div>		

</html>