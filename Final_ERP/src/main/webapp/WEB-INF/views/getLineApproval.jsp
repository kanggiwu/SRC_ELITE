<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%
	request.setCharacterEncoding("UTF-8");
	String aprv_title = request.getParameter("aprv_title");
	String vacationSql = "";
	String projectSql = "";
	//휴가계획서
	String deptName = request.getParameter("txt_deptName");
	String empName = request.getParameter("txt_empName");
	String dat_peri = request.getParameter("dat_peri");
	String dat_peri1 = request.getParameter("dat_peri1");
	String reason = request.getParameter("txt_reason");
	vacationSql = aprv_title+"|"+deptName+"|"+empName+"|"+dat_peri+"|"+dat_peri1+"|"+reason;
	//프로젝트계약확정서
	String projectName = request.getParameter("txt_projectName");
	String company = request.getParameter("txt_company");
	String dat_peri2 = request.getParameter("dat_peri2");
	String dat_peri3 = request.getParameter("dat_peri3");
	String benefit = request.getParameter("txt_benefit");
	String kind = request.getParameter("txt_kind");
	String context = request.getParameter("txt_context");
	projectSql = aprv_title+"|"+projectName+"|"+company+"|"+dat_peri2+"|"+dat_peri3+"|"+benefit+"|"+kind+"|"+context;
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

<title>결재라인 선택</title>
<script>
	function empSchAction(){
		//alert("여기")
		let deptTarget = $("#dept_options option:selected").val();
		let rankTarget = $("#rank_options option:selected").val();
		let companyTarget = $("#txt_company").val();
		//alert(companyTarget)
     	$.ajax({
  		  type:"post",
  		  //type:"get"
  		  data:{"dept_name":deptTarget,"rank_name":rankTarget,"emp_name":companyTarget},
  		  url: "/approval/getEmpSearchList3.src1",
  		  //data:{"dept":개발부} getparameter("dept")
  		  dataType:"json",
	          success:function(data){
	        	  result1(data);
	  	       },
	          error:function(e){
	        	  let x = e.responseXML;
	        	  alert("fail ===> "+e)
	          }
  	}); 
 
	}
	
function result1(data){
	let a="";
      //조회 결과가 없는 거야?
      if(data.size==0){	
    	  console.log("df");
    	a+="        <td colspan='6'>조회결과가 없습니다.</td>";
      }
      else{//조회 결과가 있을 때
      	for(let i=0;i<data.length;i++){
      		console.log(data[i]['RANK_NAME']);
      				a+="<tr>";
       				a+="	<td>"+data[i]['EMP_NO']+"</td>";
      				a+="	<td>"+data[i]['DEPT_NAME']+"</td>";
      				a+="	<td>"+data[i]['RANK_NAME']+"</td>";
      				a+="	<td>"+data[i]['EMP_NAME']+"</td>"; 
      				a+="	<td><select name = 'app_name' class='form-control'  id="+data[i]['EMP_NO']+">";
      				a+="  		<option value='전체'>==결재라인==</option>";
      				a+="  		<option value='1차결재자'>1차결재자</option>";
      				a+="  		<option value='2차결재자'>2차결재자</option>";
      				a+="  		<option value='3차결재자'>3차결재자</option>";
      				a+="		</select>";
      				a+="	</td>";
      				a+="	<td><a href='javascript:void(0)' onclick='selectBtn()' class='btn btn-info btn-sm'>선택</a></td>"
      				a+="</tr>";
      	}///end of for
      } ///end of if
      document.querySelector(".empTab").innerHTML = a;
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
				<h2>결재라인 선택</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
<!--================================= 컨텐츠 들어갈내용 시작===============================================-->
			<div class="form-inline form-group">
				<select name = "dept_name" class="form-control" id="dept_options">
				  <option value="전체">===부서===</option>
				  <option value="임원">임원</option>
				  <option value="개발부">개발부</option>
				  <option value="인사부">인사부</option>
				  <option value="회계부">회계부</option>
				</select>
				&nbsp;
				<select name = "rank_name" class="form-control" id="rank_options">
				  <option value="전체">===직위===</option>
				  <option value="대표">대표</option>
				  <option value="부사장">부사장</option>
				  <option value="이사">이사</option>
				  <option value="부장">부장</option>
				  <option value="차장">차장</option>
				  <option value="과장">과장</option>
				  <option value="대리">대리</option>
				  <option value="사원">사원</option>
				</select>
				&nbsp;
				<input type="text" name = "emp_name" class="form-control" id="txt_company">
				&nbsp;

				<a href="javascript:void(0)" onclick="empSchAction()" class="btn btn-info">결재자검색</a>
<!-- ==========================사원정보테이블 만들기===============================-->
			<div style="overflow:scroll; width:100%; height:400px;">
			<br>
			<table class="table table-hover" id = "empTbl">
				<thead>
					<tr style="background-color:lightgray">						
						<th style="width: 20%">사원번호</th>
						<th style="width: 20%">부서명</th>
						<th style="width: 20%">직위명</th>
						<th style="width: 20%">결재자명</th>
						<th style="width: 10%">결재라인</th>
						<th style="width: 10%">선택</th>
					</tr>
				</thead>
				<tbody class="empTab">
				<!-- DB에서 데이터 뿌려주기 -->
				</tbody>	
			</table>
			</div>
<!-- ==========================사원정보테이블 만들기 끝===============================-->
<!-- ==========================결재라인테이블 만들기 ===============================-->
		<div style="width:100%;">
			<br>
			<!-- ******post방식으로 값보내기****** -->
			<!-- <form class="form-horizontal" role="form" id="appLine" method="post" action="getLineApproval.src1"> -->
			<input type="hidden" id="aprv_title2" value="<%=aprv_title%>">
			<input type="hidden" id="vacationSql2" value="<%=vacationSql%>">
			<input type="hidden" id="projectSql2" value="<%=projectSql%>">
			<table class="table table-hover" id = "appTbl">
				<thead>
					<tr style="background-color:lightgray">						
						<th style="width: 20%">결재라인</th>
						<th style="width: 20%">사원번호</th>
						<th style="width: 20%">부서명</th>
						<th style="width: 20%">직위명</th>
						<th style="width: 20%">결재자명</th>
					</tr>
				</thead>
				<tbody class="appTab">
 					<tr>
						<td id='SIGN_LEVEL1'>1차결재자</td>
						<td id="a1" name='txt_empNo1'></td>
						<td id="a2" name='txt_deptName1'></td>
						<td id="a3" name='txt_rankName1'></td>
						<td id="a4" name='txt_name1'></td>
					</tr>
					<tr>
						<td id='SIGN_LEVEL2'>2차결재자</td>
						<td id="b1" name='txt_empNo2'></td>
						<td id="b2" name='txt_deptName2'></td>
						<td id="b3" name='txt_rankName2'></td>
						<td id="b4" name='txt_name2'></td>
					</tr>
					<tr>
						<td id='SIGN_LEVEL3'>3차결재자</td>
						<td id="c1" name='txt_empNo3'></td>
						<td id="c2" name='txt_deptName3'></td>
						<td id="c3" name='txt_rankName3'></td>
						<td id="c4" name='txt_name3'></td>
					</tr>
				</tbody>	
			</table>
			<!-- </form>	 -->		
			</div>
			<div class="col text-right">
				<a href='javascript:addApprovalAction()' class='btn btn-warning btn-lg'>결재신청 완료</a>
				<!-- <button type="submit" id="addApproval" class="btn btn-warning btn-lg" onclick="addApprovalAction()"> -->
				<!-- 결재신청 완료</button>	 -->
			</div>
<!-- ==========================결재라인테이블 만들기 끝===============================-->
	</div>		
<%-- 	<input type="text"><%=vacationSql%></input>
	<input type="text"><%=projectSql%></input> --%>
<!--================================= 컨텐츠 들어갈내용 끝  ============================================== -->
     			</div>
			</div>
		</main>
		
	</div>
</div>

<script>
//let EMP_NO = 0;
//결재라인을 선택하고 선택버튼을 눌렀을 때
function selectBtn(){
	$("#empTbl").off("click").on('click',"tr", function(){
		let str = ""
		let tdArr = new Array();
		//현재 로우값 가져오기
	    let tr = $(this);
		let td = tr.children();
		
		//EMP_NO = td.eq(0).text();
		let EMP_NO = td.eq(0).text();
		//alert (EMP_NO);
		let DEPT_NAME = td.eq(1).text();
		let RANK_NAME = td.eq(2).text();
		let EMP_NAME = td.eq(3).text(); 
		let elem = document.getElementById(EMP_NO);
		let SIGN_LEVEL = elem.options[elem.selectedIndex].value;
		
		tdArr.push(EMP_NO);
		tdArr.push(DEPT_NAME);
		tdArr.push(RANK_NAME);
		tdArr.push(EMP_NAME);
		if(SIGN_LEVEL == "전체"){   
	  		alert("결재자를 선택하세요");
	    	return;   				  		
	  	}else {
	  		tdArr.push(SIGN_LEVEL);
	  	}
		tabResult(tdArr);	
		tdArr = new Array();
		$("#empTbl").off("click") //클릭이벤트 중첩발생 금지
	});
}
function tabResult(data){
	let b="";
	let appLine = "";
	appLine = data[4];
	
	if (appLine == "1차결재자"){
 		for(let i=0;i<4;i++){
			document.getElementById("a"+(i+1)).innerHTML = data[i];
		} 
	}else if (appLine == "2차결재자"){
 		for(let i=0;i<4;i++){
 			document.getElementById("b"+(i+1)).innerHTML = data[i];
		} 
	}else if (appLine == "3차결재자"){
 		for(let i=0;i<4;i++){
 			document.getElementById("c"+(i+1)).innerHTML = data[i];
		} 
	}
}

//결재신청완료
function addApprovalAction(){
	//alert("결재신청완료버튼 클릭!");
	let aprvTitle = $("#aprv_title2").val();
	//alert(aprvTitle);
	let APRV_CONTENT = "";
	if (aprvTitle == "휴가계획서"){ //휴가계획서
		APRV_CONTENT = $("#vacationSql2").val();
	}else { //프로젝트계약확정서
		//alert("여기여기");
		APRV_CONTENT = $("#projectSql2").val();		
	}
	let SIGN_PERMISSION = "W";
	let empNo1 = $("#a1").text();
	//alert(empNo1);
	let empNo2 = $("#b1").text();
	let empNo3 = $("#c1").text();
	let SIGN_LEVEL1 = "1";
	let SIGN_LEVEL2 = "2";
	let SIGN_LEVEL3 = "3";	
	//결재라인
	let lineApp =[
		{EMP_NO:empNo1, SIGN_PERMISSION:"W", SIGN_LEVEL:"1"},
		{EMP_NO:empNo2, SIGN_PERMISSION:"W", SIGN_LEVEL:"2"},
		{EMP_NO:empNo3, SIGN_PERMISSION:"W", SIGN_LEVEL:"3"},		
	];
	
	$.ajax({
		type:"post",
		  /* data:{"aprvTitle":aprvTitle,"APRV_CONTENT":APRV_CONTENT,"SIGN_PERMISSION":SIGN_PERMISSION
			  ,"empNo1":empNo1,"empNo2":empNo2,"empNo3":empNo3
			  ,"SIGN_LEVEL1":SIGN_LEVEL1,"SIGN_LEVEL2":SIGN_LEVEL2,"SIGN_LEVEL3":SIGN_LEVEL3}, */
		  data:{"aprvTitle":aprvTitle,"APRV_CONTENT":APRV_CONTENT},
		  data:JSON.stringify(lineApp),
		  url: "/approval/insertApproval.src1",
		  dataType:"json",
		      success:function(data){
		    	  alert("입력되었습니다!");
		       },
		      error:function(e){
		    	  let x = e.responseXML;
		    	  alert("fail ===> "+e);
		      } 
	});
	
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