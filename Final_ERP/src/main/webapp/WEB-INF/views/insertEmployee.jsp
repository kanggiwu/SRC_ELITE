<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
out.print(path);
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
<script>
	//자격증 로우 추가
	function add_row() {
		console
				.log("1" + document.getElementById('AddLicenseRow1').value
						+ "1");
		console.log(document.getElementById('AddLicenseRow2').value);
		console.log(document.getElementById('AddLicenseRow3').value);
		console.log(document.getElementById('AddLicenseRow4').value);
		console.log(document.getElementById('AddLicenseRow5').value);
		console.log(document.getElementById('AddLicenseRow6').value);
		if (document.getElementById('AddLicenseRow1').value !== null
				|| document.getElementById('AddLicenseRow2').value !== null
				|| document.getElementById('AddLicenseRow3').value !== null
				|| document.getElementById('AddLicenseRow4').value !== null
				|| document.getElementById('AddLicenseRow5').value !== null
				|| document.getElementById('AddLicenseRow6').value !== null) {
			var my_tbody = document.getElementById('licence-tbody');
			// var row = my_tbody.insertRow(0); // 상단에 추가
			var row = my_tbody.insertRow(my_tbody.rows.length); // 하단에 추가
			var cell1 = row.insertCell(0);
			var cell2 = row.insertCell(1);
			var cell3 = row.insertCell(2);
			var cell4 = row.insertCell(3);
			var cell5 = row.insertCell(4);
			var cell6 = row.insertCell(5);
			cell1.innerHTML = document.getElementById('AddLicenseRow1').value;
			cell2.innerHTML = document.getElementById('AddLicenseRow2').value;
			cell3.innerHTML = document.getElementById('AddLicenseRow3').value;
			cell4.innerHTML = document.getElementById('AddLicenseRow4').value;
			cell5.innerHTML = document.getElementById('AddLicenseRow5').value;
			cell6.innerHTML = document.getElementById('AddLicenseRow6').value;
		} else {
			alert("X");
		}
	}
	function delete_row() {
		var my_tbody = document.getElementById('licence-tbody');
		if (my_tbody.rows.length < 1)
			return;
		// my_tbody.deleteRow(0); // 상단부터 삭제
		my_tbody.deleteRow(my_tbody.rows.length - 1); // 하단부터 삭제
	}


	/// 콤보박스 중분류 비활성화하기
	function handleOnChange(e) {
		// 선택된 데이터 가져오기
		const value = e.value;
		console.log(value);
		if (value != "20") {
			document.getElementById('team_options').disabled = true;
			$("#team_options").val("").prop("selected", true);
		} else {
			document.getElementById('team_options').disabled = false;
			$("#team_options").val("1").prop("selected", true);
		}
	}
	// 콘텐츠 수정 :: 사진 수정 시 이미지 미리보기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#imgArea').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	/* $(":input[name='u_file']").change(function() {
	 if( $(":input[name='u_file']").val() == '' ) {
	 $('#imgArea').attr('src' , '');  
	 }
	 $('#imgViewArea').css({ 'display' : '' });
	 readURL(this);
	 }); */

	// 이미지 에러 시 미리보기영역 미노출
	/* function imgAreaError(){
	 $('#imgViewArea').css({ 'display' : 'none' });
	 } */
	function empInsertAction() {
		console.log("입력 액션 호출");
		Swal.fire({
			  title: '추가 되었습니다!',
			  confirmButtonColor: '#17a2b8'
		})
		$('#employee_insert').submit();
		location.href = 'getEmployeeList.src1'
	}
</script>
<title>HR - ERP PROGRAM</title>
</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
				<h2>사원 추가</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
     			<!-- 컨텐츠 들어갈내용 시작-->
				   						<div class="container">
							<div class="col">
								<div style="text-align: right; padding: 5px;">
									<button class="btn btn-info" id="EmpUpdReady"
										onclick="empInsertAction()">추가</button>
									<button class="btn btn-danger"
										onclick="location.href='getEmployeeList.src1'">취소</button>
								</div>
								<fieldset id='btn_fieldset'>
									<form id="employee_insert" method="post"
										enctype="multipart/form-data" action="insertEmployee.src1">
										<div class="row">
											<div class="col-lg-6">
												<div id="imgViewArea" style="width: 100%; height: 250px;">
													<img id="imgArea" src="../../erp_lab/img/img_avatar.png"
														style="width: 200px; left: 20%; position: relative;"
														alt="profile" onerror="imgAreaError()">
													<div class="form-group"
														style="left: 20%; position: relative;">
														<input type="file" id="u_file" onchange="readURL(this);"
															name="emp_picture_path" accept="image/*">
													</div>
												</div>
												<hr>
											</div>
											<div class="col-lg-6">
												<div id="emp_table" style="width: 100%; height: 250px;">
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">이름</span> <input
															type="text" name="emp_name" class="form-control"
															aria-describedby="basic-addon1">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">부서</span> <select
															class="form-control" name="dept_no" id="dept_options"
															onchange="handleOnChange(this)">
															<option value=20 selected>개발부</option>
															<option value=30>인사부</option>
															<option value=40>회계부</option>
															<option value=10>임원</option>
														</select> <select class="form-control" name="team_no"
															id="team_options">
															<option value=1 selected>개발1팀</option>
															<option value=2>개발2팀</option>
															<option value=3>개발3팀</option>
															<option value=4>개발4팀</option>
															<option value="" hidden>없음</option>
														</select>
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">직위</span> <select
															class="form-control" name="rank_no">
															<option value=8 selected>사원</option>
															<option value=7>대리</option>
															<option value=6>차장</option>
															<option value=5>과장</option>
															<option value=4>부장</option>
															<option value=3>부사장</option>
															<option value=2>이사</option>
															<option value=1>대표</option>
														</select>
													</div>
												</div>
												<hr>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-6">
												<div id="emp_table" style="width: 100%; height: 300px;">
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">비밀번호</span> <input
															type="text" name="emp_pw" class="form-control"
															aria-describedby="basic-addon1">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">연차</span> <input
															type="text" class="form-control"
															aria-describedby="basic-addon1">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">입사일자</span> <input
															type="date" name="emp_hiredate" class="form-control"
															aria-describedby="basic-addon1">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">퇴사일자</span> <input
															type="date" name="emp_retiredate" class="form-control"
															aria-describedby="basic-addon1">
													</div>
												</div>
											</div>
											<div class="col-lg-6">
												<div id="emp_table"
													style="width: 100%; height: 300px; vertical-align: middle;">
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">전화번호</span> <input
															type="text" name="emp_tel" class="form-control"
															aria-describedby="basic-addon1">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">이메일</span> <input
															type="text" name="emp_email" class="form-control"
															aria-describedby="basic-addon1">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">고용상태</span> <select
															name="emp_status" class="form-control">
															<option value="0" selected>재직</option>
															<option value="1">휴직</option>
															<option value="2">퇴직</option>
														</select>
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">급여계좌</span> <input
															type="text" class="form-control" placeholder="국민은행"
															aria-describedby="basic-addon1" disabled> <input
															type="text" name="emp_account" class="form-control"
															aria-describedby="basic-addon1">
													</div>
												</div>
											</div>
											</div>
									</form>
									<form id="licence_add" method="post"
										enctype="multipart/form-data" action="updateEmployee.src1">
										<table class="table table-bordered table-hover" id="testTable"
											id="table" data-toggle="table" data-height="650"
											data-search="true" data-show-columns="true"
											data-method="post" data-pagination="true"
											data-url="./member.json">
											<thead>
												<tr>
													<th colspan="6">보유 자격증</th>
												</tr>
												<tr>
													<th>번호</th>
													<th>이름</th>
													<th>분류</th>
													<th>레벨</th>
													<th>취득일</th>
													<th>만기일</th>
												</tr>
											</thead>
											<tbody id="licence-tbody">
												<tr>
													<td><input type="text" name="licence_no"
														id="AddLicenseRow1" class="form-control" /></td>
													<td><input type="text" name="licence_name"
														id="AddLicenseRow2" class="form-control" /></td>
													<td><input type="text" name="licence_type"
														id="AddLicenseRow3" class="form-control" /></td>
													<td><input type="text" name="licence_level"
														id="AddLicenseRow4" class="form-control" /></td>
													<td><input type="text" name="licence_date"
														id="AddLicenseRow5" class="form-control" /></td>
													<td><input type="text" name="licence_expire"
														id="AddLicenseRow6" class="form-control" /></td>
												</tr>
											</tbody>
										</table>
									</form>
							</div>
							<div style="text-align: right; padding: 5px;">
								<button class="btn btn-light" onclick="add_row()">자격증
									추가</button>
								<button class="btn btn-light" onclick="delete_row()">자격증
									삭제</button>
							</div>
							</fieldset>			
				<!-- 컨텐츠 들어갈내용 끝   -->
     			</div>
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