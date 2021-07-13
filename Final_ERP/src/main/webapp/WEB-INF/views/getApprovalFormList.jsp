<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>전자결재 신청</title>
<!-- ==========================전자결재신청서========================================= -->
<script>
function approvalForm(){
	//alert("여기");
	let appTarget = $("#appline_name option:selected").val();
	//alert(appTarget);
	if (appTarget == "휴가계획서"){
		$.ajax({
			type:"post",
			  data:{"appList":appTarget},
			  url: "/myService/getApprovalFormList.jsp",
			  dataType:"text",
		          success:function(data){
		        	  result2(data);
		  	       },
		          error:function(e){
		        	  let x = e.responseXML;
		        	  alert("fail ===> "+e)
		          } 
		});
	}else if(appTarget == "프로젝트 계약확정서"){
		$.ajax({
			type:"post",
			  data:{"appList":appTarget},
			  url: "/myService/getApprovalFormList.jsp",
			  dataType:"text",
		          success:function(data){
		        	  result3(data);
		  	       },
		          error:function(e){
		        	  let x = e.responseXML;
		        	  alert("fail ===> "+e)
		          } 
		});
	}else if(appTarget == "전체"){
		//$("#aaa").remove();
		let a="";
		$('#aaa').html(a);
	}//////end of if
}///////end of function
//////휴가계획서 인 경우//////////////
	function result2(data){
	let a="";
			a+="<div class='form-group'>";
			a+="<label for='lab_deptName'>부서명</label>";				
			a+="<input type='text' class='form-control' id='txt_deptName'>";				
			a+="</div>";
			a+="<div class='form-group'>";
			a+="<label for='lab_empName'>사원명</label>";
			a+="<input type='text' class='form-control' id='txt_empName'>";
			a+="</div>";
			a+="<div class='form-group'>";
			a+="<label for='lab_period'>기간</label>";
			a+="<div class='form-inline'>";
			a+="<input type='date' class='form-control' id='dat_peri' name='dat_peri'>&nbsp; ~ &nbsp;";
			a+="<input type='date' class='form-control' id='dat_peri1' name='dat_peri1'>";
			a+="</div>";
			//a+="<input type='text' class='form-control' id='txt_period' value=''>";
			a+="</div>";
			a+="<div class='form-group'>";
			a+="<label for='lab_reason'>내용(사유)</label>";
			a+="<textarea class='form-control' id='txt_reason' rows='5' cols='50'></textarea>";
			a+="</div>";
			a+="<div class='col text-center'>";	
			a+="</div>";
			a+="<div class='col text-right'>";
			a+="<button type='submit' id='addApproval' class='btn btn-warning btn-lg'"; 
			a+="onclick='/myService/getLineApproval.jsp'>결재자 선택</button>";	
			a+="</div>";
		//document.querySelector(".aaa").innerHTML = a;
  	 	$('#aaa').html(a);  	        
}
///////프로젝트 계약확정서 인 경우/////////////
	function result3(data){
		let b="";
			b+="<div class='form-group' >";
			b+="	<label for='lab_projectName'>프로젝트명</label>";				
			b+="	<input type='text' class='form-control' id='txt_projectName'>";				
			b+="</div>";
			b+="<div class='form-group'>";
			b+="	<label for='lab_company'>발주사</label>";
			b+="	<input type='text' class='form-control' id='txt_company'>";
			b+="</div>";
			b+="<div class='form-group'>";
			b+="	<label for='lab_period2'>기간</label>";
			b+="<div class='form-inline'>";
			b+="<input type='date' class='form-control' id='dat_peri2' name='dat_peri2'>&nbsp; ~ &nbsp;";
			b+="<input type='date' class='form-control' id='dat_peri3' name='dat_peri3'>";
			b+="</div>";
			//b+="	<input type='text' class='form-control' id='txt_period2'>";
			b+="</div>";
			b+="<div class='form-group'>";
			b+="	<label for='lab_benefit'>수익금</label>";
			b+="	<input type='text' class='form-control' id='txt_benefit'>";
			b+="</div>";
			b+="<div class='form-group'>";
			b+="	<label for='lab_kind'>종류</label>";
			b+="	<input type='text' class='form-control' id='txt_kind'>";
			b+="</div>";
			b+="<div class='form-group'>";
			b+="	<label for='lab_context'>개발내용</label>";
			b+="	<textarea class='form-control' id='txt_context' rows='5' cols='50'></textarea>";
			b+="</div>";
			b+="<div class='col text-right'>";
			b+="<button type='submit' id='addApproval' class='btn btn-warning btn-lg'"; 
			b+="onclick='/myService/getLineApproval.jsp'>결재자 선택</button>";	
			b+="</div>";
		$('#aaa').html(b);
}
</script>
<!-- ==========================전자결재신청서 끝========================================= -->
</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
				<h2>전자결재 신청</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
<!--================================= 컨텐츠 들어갈내용  ============================================== -->
     			<div class="form-inline form-group">
				<div class= "col text-center">
     				<select id = "appline_name" class="form-control" id="appline_options">
						<option value="전체">==전자결재신청종류==</option>
						<option value="휴가계획서">휴가계획서</option>
						<option value="프로젝트 계약확정서">프로젝트 계약확정서</option>
					</select>
					&nbsp;&nbsp;
					<!-- <button type="button" class="btn btn-info">확인</button> -->
					<a href="javascript:void(0)" onclick="approvalForm()" class="btn btn-info">확인</a>
     			</div>
     			</div>
<!--================================= 휴가계획서인 경우 시작  ============================================== -->
<div class="container">
	<form class="form-horizontal" role="form" id="aaa">
	<!-- 내용 들어가는 곳 -->
	</form>
</div>
<!--================================= 프로젝트 계약확정서 경우 끝  ============================================== -->
     		<!-- <div class="col text-right">
				<button type="submit" id="addApproval" class="btn btn-warning btn-lg" 
				onclick="/myService/getLineApproval.jsp">결재자 선택</button>	
			</div> -->
<!--================================= 컨텐츠 들어갈내용 끝  ============================================== -->
     			</div>
			</div>
		</main>
	</div>
</div>

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