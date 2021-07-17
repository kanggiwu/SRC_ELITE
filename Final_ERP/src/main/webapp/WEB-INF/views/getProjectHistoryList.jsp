<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
	List<Map<String,Object>> projectHistoryList = null;
	List<Map<String,Object>> projectListProc = null;
	projectHistoryList = (List<Map<String,Object>>)request.getAttribute("projectHistoryList");
	int size = 0;
	String pProjectNo = null;
	if(projectHistoryList!=null){
		size = projectHistoryList.size();
	}
	out.print("size:"+size);
	projectListProc = (List<Map<String,Object>>)request.getAttribute("projectListProc");
	int size2 = 0;
	//String empSearch2 = null;
	if(projectListProc!=null){
		size2 = projectListProc.size();
	}
	out.print("size2:"+size2);
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
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->

<title>프로젝트 이력 조회</title>
<script>
	function projectSearchAction(){
		//let a ={"d":a,"d1":b};
		//alert("여기")
		//var deptTarget = document.getElementById("dept_options")
		var typeTarget = $("#type_options option:selected").val();
		var startTarget = $("#start_period").val();
		var endTarget = $("#end_period").val();
		var nameTarget = $("#txt_name").val();
		//alert(companyTarget)
		console.log("ddddd");
     	$.ajax({
  		  type:"post",
  		  //type:"get"
  		  data:{"project_type":typeTarget,"project_startline":startTarget
  			  ,"project_deadline":endTarget,"project_name":nameTarget},
  		  url: "/projecthistory/getProjectListProc.src1",
  		  //data:{"dept":개발부} getparameter("dept")
  		  dataType:"json",
	          success:function(data){
	        	  searchResult(data);
	  	       },
	          error:function(e){
	        	  let x = e.responseXML;
	        	  alert("fail ===> "+e)
	          }
  	}); 
 
	}
	
function searchResult(data){
	let a="";
      //조회 결과가 없는 거야?
      if(data.size==0){	
    	  console.log("df");
    	a+="        <td colspan='5'>조회결과가 없습니다.</td>";
      }
      else{//조회 결과가 있을 때
      	for(let i=0;i<data.length;i++){
      		console.log(data[i]['RANK_NAME']);
      				a+="<tr onclick='openPopup()'>";
       				a+="		<td>"+data[i]['PROJECT_NAME']+"</td>";
      				a+="		<td>"+data[i]['PROJECT_PERIOD']+"</td>";
      				a+="		<td>"+data[i]['EMP_NAME']+"</td>"; 
      				a+="		<td>"+data[i]['PROJECT_TYPE']+"</td>";
      				a+="</tr>";
      	}///end of for
      } ///end of if
      document.querySelector(".aaaa").innerHTML = a;
}

</script>
</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
				<h2>프로젝트 이력 조회</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
<!--
******************************************* 컨텐츠 들어갈내용 시작************************************************
-->

<!-- -----------------------------------검색부분---------------------------------- -->
<form class="form-horizontal" role="form">
<div class="form-inline form-group">
	<select class="form-control" id="type_options">
		<option value="===종류===">===종류===</option>
		<option>SI</option>
		<option>SM</option>
	</select>
	&nbsp;
	<div class="form-group">
		<div class="form-inline">
			<input type="date" class="form-control" id="start_period">&nbsp; ~ &nbsp;
			<input type="date" class="form-control" id="end_period">
		</div>
	</div>
	&nbsp;
	<input type="text" class="form-control" id="txt_name">
	&nbsp;
	<!-- <button type="button" class="btn btn-info" onclick="location.href='getProjectListProc.src1'">검색</button> -->
	<!-- <button type="button" name="btn_sel" class="btn btn-info" onclick="projectSearchAction()">검색</button> -->
	
	<a type="button" href="javascript:void(0)" onclick="projectSearchAction()" class="btn btn-info btn-sm">검색</a>
	</div>
<!-- -----------------------------------검색부분 끝----------------------------------- -->
	<div class='row'>
		<table id="products" class="table table-hover">
                  <form action="" id="setRows">
                    <input type="hidden" name="rowPerPage" value="1" id="rowPerPage">
                  </form>		
			<thead>
				<tr style="background-color:lightgray">
					<th style="width: 35%">프로젝트명</th>
					<th style="width: 35%">프로젝트기간</th>
					<th style="width: 15%">담당자</th>
					<th style="width: 15%">종류</th>
				</tr>
			</thead>

			<tbody class="aaaa">
<%
//조회 결과가 없는 거야?
if(size==0){		
%>    
        <tr>
            <td colspan="5">조회결과가 없습니다.</td>
        </tr>
<%
}
else{//조회 결과가 있을 때
	for(int i=0;i<size;i++){
		Map<String,Object> pmap = projectHistoryList.get(i);
		if(i==size) break;
		pProjectNo = pmap.get("PROJECT_NO").toString();
%>    	
			<!-- 
			===============DB에서 데이터 가져와서 뿌려주기======================
			 -->
				<tr onclick="openPopup()">
					<%-- <tr onclick="location.href='getDetailProjectHistory.src1?project_no=<%=pmap.get("PROJECT_NO")%>'"> --%>
					<%-- <tr onclick="location.href='getDetailProjectHistory.src1?project_no=<%=pProjectNo%>'"> --%>
					<!--<td onclick="openPopup()">부트스트랩</td>  -->
					<td><%=pmap.get("PROJECT_NAME").toString()%></td>
					<td><%=pmap.get("PROJECT_PERIOD").toString()%></td>
					<td><%=pmap.get("EMP_NAME").toString()%></td>
					<td><%=pmap.get("PROJECT_TYPE").toString()%></td>
				</tr>
<% 
	}///end of for
} ///end of if
%>
			</tbody>
			
		</table> 
		<!-- 
		
		<div class="col text-center">
		  <ul class="pagination pagination justify-content-center">
		    <li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1">Previous</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#">Next</a>
		    </li>
		  </ul>
		</div>
		 -->
		<hr/>
	</div>
	<div class="text-right">
		<button type="button" class="btn btn-warning btn-lg" onclick="location.href='insertProjectHistory.src1'">
			프로젝트 추가</button>	
	</div>


<!--
****************************************** 컨텐츠 들어갈내용 끝 *************************************************   
-->

     			</div>
			</div>
		</main>
	</div>
</div>

<script>
    function openPopup(){
        window.open("getDetailProjectHistory.src1?project_no=<%=pProjectNo%>", "new", "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=1000, height=700, left=0, top=0" );
    }
</script>
<!-- 슬라이드바 사용할때 필요 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!-- 탑메뉴 사용 -->
<script src="../common/js/topNav.js"></script>
<!-- 사이드 메뉴 사용 -->
<script src="../common/js/sideNav.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous" ></script>
<script src="../common/scripts.js"></script>
</body>
</html>