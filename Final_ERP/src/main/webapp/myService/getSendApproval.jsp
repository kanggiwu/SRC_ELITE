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

<title>전자결재 발신함</title>
</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
				<h2>전자결재 발신함</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
<!--================================= 컨텐츠 들어갈내용 시작===============================================-->
		<table id="appSend" class="table table-hover">
			<thead>
				<tr style="background-color:lightgray">					
					<th style="width: 15%">결재번호</th>
					<th style="width: 20%">작성일</th>
					<th style="width: 25%">문서제목</th>
					<th style="width: 20%">결재상태</th>
					<th style="width: 10%"></th>
					<th style="width: 10%"></th>
				</tr>
			</thead>
			<tbody class="sendBody" id="recievePlan">
				<tr>
					<td>12345</td>
					<td>2021-06-21</td>
					<td>휴가계획서</td>
					<td>결재완료</td>
					<td><button type="button" class="btn btn-info btn-sm" id="btn_sel2"
						onclick="openModal2()">결재자조회</button></td>
					<td><button type="button" class="btn btn-info btn-sm" id="btn_detail"
						onclick="openPop2()">결재문서조회</button></td>
				</tr>
				<tr>
					<td>12346</td>
					<td>2021-06-21</td>
					<td>휴가계획서</td>
					<td>결재완료</td>
					<td><button type="button" class="btn btn-info btn-sm" id="btn_sel2"
						onclick="openModal2()">결재자조회</button></td>
					<td><button type="button" class="btn btn-info btn-sm" id="btn_detail"
						onclick="openPop2()">결재문서조회</button></td>
				</tr>
				<tr>
					<td>12347</td>
					<td>2021-06-21</td>
					<td>프로젝트 계약확정서</td>
					<td>결재완료</td>
					<td><button type="button" class="btn btn-info btn-sm" id="btn_sel2"
						onclick="openModal2()">결재자조회</button></td>
					<td><button type="button" class="btn btn-info btn-sm" id="btn_detail"
						onclick="openPop2()">결재문서조회</button></td>
					<!-- <td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" 
						data-target="#mod_appLine">조회</button></td> -->
				</tr>
			</tbody>
		</table>
					
<!--============================== 결재라인 상세조회 Modal 시작 =======================================-->
<div class="modal fade" id="mod_appLine2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">        
        <h4 class="modal-title" id="myModalLabel">결재라인검색</h4>
      </div>
      <div class="modal-body">
			<table class="table table-hover" >
				<thead>
					<tr style="background-color:lightgray">						
						<th style="width: 20%">결재순서</th>
						<th style="width: 20%">부서</th>
						<th style="width: 20%">직위</th>
						<th style="width: 20%">사원명</th>
						<th style="width: 20%">결재상태</th>
					</tr>
					</tr>
				</thead>
				<tbody>
				<!-- 
				===============DB에서 데이터 가져와서 뿌려주기======================
				 -->
					<tr>						
						<td>1차 결재자</td>
						<td>개발1팀</td>
						<td>팀장</td>
						<td>김현진</td>
						<td>승인완료</td>
					</tr>
					<tr>						
						<td>1차 결재자</td>
						<td>개발1팀</td>
						<td>팀장</td>
						<td>김현진</td>
						<td>승인완료</td>
					</tr>
					<tr>						
						<td>1차 결재자</td>
						<td>개발1팀</td>
						<td>팀장</td>
						<td>김현진</td>
						<td>승인완료</td>
					</tr>
				</tbody>	
			</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
 </div>

<!--============================== 결재라인 상세조회 Modal 시작 =======================================-->
			
<!--================================= 컨텐츠 들어갈내용 끝  ============================================== -->
     			</div>
			</div>
		</main>
	</div>
</div>
<!-- 결재창 -->
<script type="text/javascript">
	//$("#approvalPlan").on("click", "btn_app", function(){
	let appPlan2 = "";
	//모달창 오픈
 	function openModal2(){
		//alert("모달창 오픈");
		$("#recievePlan").off("click").on('click',"tr", function(){
        	$("#mod_appLine2").modal();
		});
	}
	 
	function openPop2(){
		$("#recievePlan").off("click").on('click',"tr", function(){
			//alert( $(this).find("td:eq(1)").text() );
			appPlan2 = $(this).find("td:eq(2)").text();	
			//alert(appPlan);
			openPopup2(appPlan2);
		});
	}
    function openPopup2(appPlan2){
    //function openPopup(){
    	//alert("팝업");
    	let url1 = "/myService/sendVacationPlan.jsp";
    	let url2 = "/myService/sendProjectPlan.jsp";
    	//alert(appPlan);
    	if (appPlan2 == "휴가계획서") {
    		//alert ("여기여기");
    		window.open(url1, "new", "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=1000, height=700, left=0, top=0" );  
    	}else if (appPlan2 == "프로젝트 계약확정서"){
    		window.open(url2, "new", "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=1000, height=700, left=0, top=0" );   		
    		
    	}
    }
    
</script>
<!-- 슬라이드바 사용할때 필요 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!-- 탑메뉴 사용 -->
<script src="../common/js/topNav.js"></script>
<!-- 사이드 메뉴 사용 -->
<script src="../common/js/sideNav.js"></script>
<script src="../common/scripts.js"></script>
</body>
</html>