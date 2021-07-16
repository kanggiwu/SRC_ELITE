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

<title>결재라인 선택</title>
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
					<tr>						
						<td>1234</td>
						<td>개발1팀</td>
						<td>부장</td>
						<td>유재석</td>
						<td><select name = "app_name" class="form-control" id="app_options">
							  <option value="전체">==결재라인==</option>
							  <option value="1차결재자">1차결재자</option>
							  <option value="2차결재자">2차결재자</option>
							  <option value="3차결재자">3차결재자</option>
							</select>
						</td>
						<td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" 
						data-target="#mod_sel">선택</button></td>
					</tr>
					<tr>						
						<td>1234</td>
						<td>개발1팀</td>
						<td>부장</td>
						<td>유재석</td>
						<td><select name = "app_name" class="form-control" id="app_options">
							  <option value="전체">==결재라인==</option>
							  <option value="1차결재자">1차결재자</option>
							  <option value="2차결재자">2차결재자</option>
							  <option value="3차결재자">3차결재자</option>
							</select>
						</td>
						<td><button type="button" class="btn btn-info btn-sm" data-toggle="modal" 
						data-target="#mod_sel">선택</button></td>
					</tr>
				</tbody>	
			</table>
			</div>
<!-- ==========================사원정보테이블 만들기 끝===============================-->
<!-- ==========================결재라인테이블 만들기 ===============================-->
		<div style="width:100%;">
			<br>
			<table class="table table-hover" id = "appTbl">
				<thead>
					<tr style="background-color:lightgray">						
						<th style="width: 20%">결재라인</th>
						<th style="width: 30%">부서명</th>
						<th style="width: 20%">직위명</th>
						<th style="width: 20%">결재자명</th>
					</tr>
				</thead>
				<tbody class="appTab">
					<tr>
						<td>1차 결재자</td>
						<td>개발1팀</td>
						<td>부장</td>
						<td>유재석</td>
					</tr>
					<tr>
						<td>2차 결재자</td>
						<td>개발1팀</td>
						<td>부장</td>
						<td>유재석</td>
					</tr>
					<tr>
						<td>3차 결재자</td>
						<td>개발1팀</td>
						<td>부장</td>
						<td>유재석</td>
					</tr>
				</tbody>	
			</table>
			</div>
			<div class="col text-right">
				<button type="submit" id="addApproval" class="btn btn-warning btn-lg" onclick="addApprovalAction()">
				결재신청 완료</button>	
			</div>
<!-- ==========================결재라인테이블 만들기 끝===============================-->
	</div>
			
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