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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
<script>

	let myMap = new Map();
	//자격증 로우 추가
	function add_row() {
			var a="";
			let my_tbody = $('#licence-tbody');
			var selected = $("#licence-select option:selected").val();
				console.log(myMap.get(selected));
  			if(myMap.get(selected) !== undefined || selected==="선택")
				return; 
			myMap.set(selected,selected) 
			console.log(myMap.get(selected));
			let selectedText = document.querySelector("#licence-select");
			let licenceText = selectedText[selectedText.selectedIndex].text
		    /* let test = $('.test1').attr('class');  */
		   var a="";
                a+="<tr id='licence_"+selected+"'>";
                 a+="     <td><input name='licence_no' value='"+selected+"' type='hidden'/>"+licenceText+"</td>";
                a+="</tr>";
                document.querySelector("#licence-tbody").innerHTML += a;
		
	}
	function delete_row() {
			var my_tbody = document.getElementById('licence-tbody');
			var selected = $("#licence-select option:selected").val();
			var lname = "#licence_"+selected;
			if (my_tbody.rows.length < 1)
			return;
			console.log(lname);
			$(lname).remove();
			myMap.delete(selected); 
		
		// my_tbody.deleteRow(0); // 상단부터 삭제
/* 			var selected = $("#licence-select option:selected");
			selected.parentNode.removeChild(selected); */
		/* my_tbody.deleteRow(my_tbody.rows.length - 1); // 하단부터 삭제 */
			
	}


	/// 콤보박스 중분류 비활성화하기
	function handleOnChange(e) {
		// 선택된 데이터 가져오기
		const value = e.value;
		console.log(value);
		if (value != "20") {
			 $('#team_options').prop("disabled", true); 
			$("#team_options").val("").prop("selected", true);
		} else {
			
			 $('#team_options').prop("disabled", false); 
			$("#team_options").val(1).prop("selected", true);
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
	 
	 //사원 추가 이벤트
	function empInsertAction() {
		//추가 확인 모달창
		Swal.fire({
			  title: '추가 하시겠습니까?',
			  confirmButtonColor: '#17a2b8',
			  confirmButtonText: '확인'
			}).then((result) => {
			  if (result.isConfirmed) {
				$('#employee_insert').submit();
			  }
			})
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
															aria-describedby="basic-addon1" placeholder="휴대폰 뒷자리로 설정" readonly=>
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
															style="display: inline-block; width: 25%">급여계좌</span> <input
															type="text" class="form-control" placeholder="국민은행"
															aria-describedby="basic-addon1" disabled> <input
															type="text" name="emp_account" class="form-control"
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
												</div>
											</div>
											</div>
									</form>
							</fieldset>			
							</div>
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