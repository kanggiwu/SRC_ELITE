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
<title>프로젝트 이력 추가</title>
</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
				<h2>프로젝트 이력 추가</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
     			<!-- 컨텐츠 들어갈내용 시작-->
 <!-- ====================================================================================================== --> 
   <div class="row">
   <div class='col-sm-6'>
		<form class="form-horizontal" role="form">
			<div class="form-group">
<!-- =========프로젝트명 DB에서 가져와서 뿌려주기 ========================== -->
				<label for="txt_proName">프로젝트명</label>
				<select class="form-control">
				  <option></option>
<!-- =========프로젝트명 DB에서 가져와서 뿌려주기끝 ========================== -->				  
				  <option></option>
				  <option></option>
				  <option></option>
				  <option></option>
				</select>
			</div>
			
			<div class="form-group">
				<label for="dat_period">기간</label>
				<div class="form-inline">
					<input type="date" class="form-control" id="dat_period">&nbsp; ~ &nbsp;
					<input type="date" class="form-control" id="dat_period">
				</div>
			</div>
			<div class="form-group">
				<label for="txt_company">발주사</label>
				<input type="text" class="form-control" id="txt_company">
			</div>
			<div class="form-group">
				<label for="txt_emp">담당자</label>
				<input type="text" class="form-control" id="txt_emp">
			</div>
			<div class="form-group">
				<label for="txt_prodeeds">수익금</label>
				<input type="text" class="form-control" id="txt_prodeeds">
			</div>
			<div class="form-group">
				<label for="txt_kind">종류</label>
				<input type="text" class="form-control" id="txt_kind">
			</div>
		</form>
		</div>
		
		<div class='col-sm-6'>
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<div>
					<label for="txt_emps">인력</label>&nbsp;&nbsp;
					<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#mod_addEmp">
						인력추가</button>
				</div>				
				<textarea class="form-control" id="txt_emps" rows="3" cols="50"></textarea>					
			</div>
			<div class="form-group">
				<label for="txt_skills">기술</label>
				<textarea class="form-control" id="txt_skills" rows="3" cols="50"></textarea>					
			</div>
			<div class="form-group">
				<label for="txt_content">개발내용</label>
				<textarea class="form-control" id="txt_content" rows="10" cols="50"></textarea>					
			</div>
		</form>
		</div>
	</div> 	
		<div class="text-right">
		<button type="button" class="btn btn-warning btn-lg">프로젝트 추가</button>	
	</div>	

<!---------------- 사원검색 Modal 시작 --------------------------------------->
<div class="modal fade" id="mod_addEmp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">        
        <h4 class="modal-title" id="myModalLabel">사원검색</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" role="form">
			<div class="form-inline form-group">
				<select class="form-control">
				  <option value="none">===직위===</option>
				  <option></option>
				  <option></option>
				  <option></option>
				  <option></option>
				</select>
				&nbsp;
				<select class="form-control">
				  <option value="none">===부서===</option>
				  <option></option>
				  <option></option>
				  <option></option>
				  <option></option>
				</select>
				&nbsp;
				<input type="text" class="form-control" id="txt_company">
				&nbsp;
				<button type="button" class="btn btn-info btn-sm">사원검색</button>
			</div>
			<!-- 
				===============사원정보테이블 만들기======================
			-->
			<div class="form-group"'></div>
			<div style="overflow:scroll; width:100%; height:300px;">
			<table class="table table-hover" >
				<thead>
					<tr style="background-color:lightgray">						
						<th style="width: 10%">선택</th>
						<th style="width: 30%">사원번호</th>
						<th style="width: 20%">부서명</th>
						<th style="width: 20%">직위명</th>
						<th style="width: 20%">사원명</th>
					</tr>
				</thead>
				<tbody>
				<!-- 
				===============DB에서 데이터 가져와서 뿌려주기======================
				 -->
					<tr>						
						<td>
        					<input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
        				</td>
						<td>123456</td>
						<td>개발부</td>
						<td>팀장</td>
						<td>유재석</td>
					</tr>
					<tr>
						<td>
        					<input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
        				</td>
						<td>123456</td>
						<td>개발부</td>
						<td>팀장</td>
						<td>유재석</td>
					</tr>
					<tr>
						<td>
        					<input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
        				</td>
						<td>123456</td>
						<td>개발부</td>
						<td>팀장</td>
						<td>유재석</td>
					</tr>
					<tr>
						<td>
        					<input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
        				</td>
						<td>123456</td>
						<td>개발부</td>
						<td>팀장</td>
						<td>유재석</td>
					</tr>
					<tr>
						<td>
        					<input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
        				</td>
						<td>123456</td>
						<td>개발부</td>
						<td>팀장</td>
						<td>유재석</td>
					</tr>
					<tr>
						<td>
        					<input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
        				</td>
						<td>123456</td>
						<td>개발부</td>
						<td>팀장</td>
						<td>유재석</td>
					</tr>
					<tr>
						<td>
        					<input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
        				</td>
						<td>123456</td>
						<td>개발부</td>
						<td>팀장</td>
						<td>유재석</td>
					</tr>
					<tr>
						<td>
        					<input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
        				</td>
						<td>123456</td>
						<td>개발부</td>
						<td>팀장</td>
						<td>유재석</td>
					</tr>
					<tr>
						<td>
        					<input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
        				</td>
						<td>123456</td>
						<td>개발부</td>
						<td>팀장</td>
						<td>유재석</td>
					</tr>
					<tr>
						<td>
        					<input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
        				</td>
						<td>123456</td>
						<td>개발부</td>
						<td>팀장</td>
						<td>유재석</td>
					</tr>
					<tr>
						<td>
        					<input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
        				</td>
						<td>123456</td>
						<td>개발부</td>
						<td>팀장</td>
						<td>유재석</td>
					</tr>
					<tr>
						<td>
        					<input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
        				</td>
						<td>123456</td>
						<td>개발부</td>
						<td>팀장</td>
						<td>유재석</td>
					</tr>
					<tr>
						<td>
        					<input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
        				</td>
						<td>123456</td>
						<td>개발부</td>
						<td>팀장</td>
						<td>유재석</td>
					</tr>
				</tbody>	
			</table>
			</div>
			<div>
			<table class="table table-hover" >
				<thead>
					<tr style="background-color:lightgray">						
						<th style="width: 10%">선택</th>
						<th style="width: 30%">사원번호</th>
						<th style="width: 20%">부서명</th>
						<th style="width: 20%">직위명</th>
						<th style="width: 20%">사원명</th>
					</tr>
				</thead>
				<tbody>
				<!-- ==============위에서 선택된 데이터 가져와서 뿌려주기======================-->
					<tr>						
						<td>
        					<input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
        				</td>
						<td>123456</td>
						<td>개발부</td>
						<td>팀장</td>
						<td>유재석</td>
					</tr>
				<!-- ==============위에서 선택된 데이터 가져와서 뿌려주기 끝======================-->
				</tbody>
			</table>
			</div>
		</form>	
			<!-- 
				===============사원정보테이블 만들기 끝======================
			--> 
			<div class="col text-center">
				<button  type="button" class="btn btn-info btn-sm">추가</button>
				<button  type="button" class="btn btn-info btn-sm">제거</button>
			</div>
			<div class="form-group">
				<textarea class="form-control" id="txt_content" rows="5" cols="50"></textarea>					
			</div>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-warning">인력추가</button>
        <button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div></div>

<!----------------사원검색 Modal 끝 ----------------------------------------------->	
		
		
 <!-- ====================================================================================================== -->				
				<!-- 컨텐츠 들어갈내용 끝   -->
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