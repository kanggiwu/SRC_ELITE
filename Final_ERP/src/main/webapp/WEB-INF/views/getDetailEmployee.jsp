<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
out.print(path);
List<Map<String, Object>> boardDetail = null;
List<Map<String, Object>> licenceList = null;
boardDetail = (List<Map<String, Object>>) request.getAttribute("boardDetail");
licenceList = (List<Map<String, Object>>) request.getAttribute("licenceList");
int size = 0;
String emp_no = null;
String emp_name = null;
String emp_year = null;
String dept_name = null;
String team_name = null;
String rank_name = null;
String emp_job = null;
String emp_hiredate = null;
String emp_retiredate = null;
String emp_tel = null;
String emp_email = null;
String emp_status = null;
String emp_account = null;
String emp_picture_path = null;
String licence_no = null;
String licence_name = null;
String licence_incentive = null;
if (boardDetail != null) {
	Map<String, Object> rmap = boardDetail.get(0);
	emp_no = rmap.get("EMP_NO").toString();
	emp_name = rmap.get("EMP_NAME").toString();
	emp_year = rmap.get("EMP_YEAR").toString();
	dept_name = rmap.get("DEPT_NAME").toString();
	team_name = rmap.get("TEAM_NAME").toString();
	rank_name = rmap.get("RANK_NAME").toString();
	emp_job = rmap.get("EMP_JOB").toString();
	emp_hiredate = rmap.get("EMP_HIREDATE").toString();
	if (rmap.get("EMP_RETIREDATE") != null) {
		emp_retiredate = rmap.get("EMP_RETIREDATE").toString();
	} else {
		emp_retiredate = "";
	}
	emp_tel = rmap.get("EMP_TEL").toString();
	emp_email = rmap.get("EMP_EMAIL").toString();
	emp_status = rmap.get("EMP_STATUS").toString();
	emp_account = rmap.get("EMP_ACCOUNT").toString();
	emp_picture_path = rmap.get("EMP_PICTURE_PATH").toString();

}

int dept_no = 0;
int team_no = 0;
int rank_no = 0;
int emp_status_no = 0;
switch(dept_name){
case "개발부": dept_no = 20; 
			break;
case "인사부": dept_no = 30; 
			break;
case "회계부": dept_no = 40; 
			break;
case "임원": dept_no = 10; 
			break;
}
switch(team_name){
case "개발1팀": team_no = 1; 
			break;
case "개발2팀": team_no = 2; 
			break;
case "개발3팀": team_no = 3; 
			break;
case "개발4팀": team_no = 4; 
			break;
}
switch(rank_name){
case "사원": rank_no = 8; 
			break;
case "대리": rank_no = 7; 
			break;
case "과장": rank_no = 6; 
			break;
case "차장": rank_no = 5; 
			break;
case "부장": rank_no = 4; 
			break;
case "이사": rank_no = 3; 
			break;
case "부사장": rank_no = 2; 
			break;
case "대표": rank_no = 1; 
			break;
}
switch(emp_status){
case "재직": emp_status_no = 0; 
			break;
case "휴직": emp_status_no = 1; 
			break;
case "퇴직": emp_status_no = 2; 
			break;
}

List<Map<String, Object>> insertLicenceList = null;
String jobCheck = "";

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<!--관리자 로그에 필요한 코드 시작=================================================================================-->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
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
             a+="     <td><input name='licence_no' value='"+selected+"' type='hidden'/>"+selected+"</td>";
             a+="     <td>"+licenceText+"</td>";
             a+="     <td>"+'35000'+"</td>";
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
	}

	//사원 수정을 위한 활성화
	function fieldsetDisable() {
		const fieldset = document.getElementById('btn_fieldset');
		fieldset.disabled = false;
		var empUpdReady = document.getElementById('EmpUpdReady');
		empUpdReady.style.visibility = 'hidden';
		/*   if(document.getElementById('dept_options') != "개발부"){
		 document.getElementById('team_options').disabled = true;	  
		 } */
		document.getElementById('EmpUpdSubmit').style.display = ''

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
	 
	 //수정 완료
	function empUpdateAction() {
		 //팀장 체크박스 변경
		 if($("input:checkbox[id=TT]").is(":checked") == true) {
			 $('#FF').prop("disabled", true);
		 }
		Swal.fire({
		  title: '수정 되었습니다!',
		  confirmButtonColor: '#17a2b8'})
		setTimeout(() => $('#employee_update').submit() , 1500);
		
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
					<div id="page_title"
						style="border-bottom: 2px solid gray; margin: 50px 30px;">
						<h2>사원 상세 조회</h2>
					</div>
					<div id="page_contents"
						style="max-width: 1730px; margin: 10px 100px;">
						<!-- 컨텐츠 들어갈내용 시작-->
						<div class="container">
							<div class="col">
								<div style="text-align: right; padding: 5px;">
									<button class="btn btn-warning" id="EmpUpdReady"
										onclick="fieldsetDisable()">수정</button>
									<button class="btn btn-warning" id="EmpUpdSubmit"
										onclick="empUpdateAction();" style="display: none;">수정
										완료</button>
									<button class="btn btn-danger"
										onclick="location.href='getEmployeeList.src1'">취소</button>
								</div>
								<fieldset id='btn_fieldset' disabled>
									<form id="employee_update" method="post"
										enctype="multipart/form-data" action="updateEmployee.src1">
										<div class="row">
											<div class="col-lg-6">
												<div id="imgViewArea" style="width: 100%; height: 250px;">
													<img id="imgArea" src="../<%=emp_picture_path%>"
														style="width: 200px; left: 20%; position: relative;"
														alt="profile" onerror="imgAreaError()">
													<div class="form-group"
														style="left: 20%; position: relative;">
														<input type="file" id="u_file" onchange="readURL(this);"
															name="emp_picture_path" accept="image/*"> <input
															type="text" value="<%=emp_picture_path%>"
															name="previous_emp_picture_path" readonly hidden>
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
															value="<%=emp_name%>" aria-describedby="basic-addon1">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">부서</span> <select
															class="form-control" name="dept_no" id="dept_options"
															onchange="handleOnChange(this)">
															<option value=<%=dept_no%> hidden><%=dept_name%></option>
															<option value=20>개발부</option>
															<option value=30>인사부</option>
															<option value=40>회계부</option>
															<option value=10>임원</option>
														</select> <select class="form-control" name="team_no"
															id="team_options">
															<option value=<%=team_no%> hidden><%=team_name%></option>
															<option value=1>개발1팀</option>
															<option value=2>개발2팀</option>
															<option value=3>개발3팀</option>
															<option value=4>개발4팀</option>
															<option value="" hidden>없음</option>
														</select>
													</div>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%"></span> 
														<lable>&nbsp;팀장&nbsp;
														<%
														if("T".equals(emp_job)){
														jobCheck = "checked";		
														} ///end of if
														%>
														<input type="checkbox" id="TT" name="emp_job" value="T" <%=jobCheck%>>
														<input type="checkbox" id="FF" name="emp_job" value="F" checked hidden>
														</lable>
													</div>														
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">직위</span> <select
															class="form-control" name="rank_no">
															<option value=<%=rank_no%> hidden><%=rank_name%></option>
															<option value=8>사원</option>
															<option value=7>대리</option>
															<option value=6>과장</option>
															<option value=5>차장</option>
															<option value=4>부장</option>
															<option value=3>이사</option>
															<option value=2>부사장</option>
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
															style="display: inline-block; width: 25%">사원번호</span> <input
															type="text" name="emp_no" class="form-control"
															value="<%=emp_no%>" aria-describedby="basic-addon1"
															readonly>
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">연차</span> <input
															type="text" class="form-control" value="<%=emp_year%>"
															aria-describedby="basic-addon1">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">입사일자</span> <input
															type="date" name="emp_hiredate" class="form-control"
															value="<%=emp_hiredate%>" aria-describedby="basic-addon1">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">퇴사일자</span> <input
															type="date" name="emp_retiredate" class="form-control"
															value="<%=emp_retiredate%>"
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
															value="<%=emp_tel%>" aria-describedby="basic-addon1">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">이메일</span> <input
															type="text" name="emp_email" class="form-control"
															value="<%=emp_email%>" aria-describedby="basic-addon1">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">고용상태</span> <select
															name="emp_status" class="form-control">
															<option value=<%=emp_status_no%> hidden><%=emp_status%></option>
															<option value=0>재직</option>
															<option value=1>휴직</option>
															<option value=2>퇴직</option>
														</select>
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">급여계좌</span> <input
															type="text" class="form-control" placeholder="국민은행"
															aria-describedby="basic-addon1" disabled> <input
															type="text" name="emp_account" class="form-control"
															value="<%=emp_account%>" aria-describedby="basic-addon1">
													</div>
												</div>
											</div>
										</div>
									<div class="col-lg-12">
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1"
												style="display: inline-block; width: 33%">
												<h5>보유 자격증</h5>
											</span> <select class="form-control" name="licence_name"
												id="licence-select">
												<option selected disabled>선택</option>
												<option value=1>정보처리산업기사</option>
												<option value=2>정보처리기사</option>
												<option value=3>정보보안산업기사</option>
												<option value=4>정보보안기사</option>
												<option value=5>리눅스마스터1급</option>
												<option value=6>리눅스마스터2급</option>
												<option value=7>데이터분석준전문가</option>
												<option value=8>데이터분석가</option>
												<option value=9>네트워크관리사2급</option>
												<option value=10>네트워크관리사1급</option>
												<option value=11>OCA</option>
												<option value=12>OCM</option>
											</select>
											<button type="button" class="btn btn-light" onclick="add_row()">추가</button>
											<button type="button" class="btn btn-light" onclick="delete_row()">삭제</button>
										</div>
											<table class="table table-bordered table-hover"
												id="testTable" id="table" data-toggle="table"
												data-height="650" data-search="true"
												data-show-columns="true" data-method="post"
												data-pagination="true" data-url="./member.json">
												<thead>
													<tr>
														<th><h6>번호</h6></th>
														<th><h6>이름</h6></th>
														<th><h6>수당</h6></th>
													</tr>
												</thead>
												<tbody id="licence-tbody">
													<%
												if (licenceList != null) {
													size = licenceList.size();
													if (size > 0) {
														for (int i = 0; i < size; i++) {
													if (i == size)
														break;
													Map<String, Object> lmap = licenceList.get(i);
													licence_no = lmap.get("LICENCE_NO").toString();
													licence_name = lmap.get("LICENCE_NAME").toString();
													licence_incentive = lmap.get("LICENCE_INCENTIVE").toString();		

												%>
													<tr id='licence_<%=licence_no%>'>
														<td value="<%=licence_no%>"><%=licence_no%>
														<input name = 'licence_no' value='<%=licence_no%>' hidden>"</td>
														<td value="<%=licence_name%>"><%=licence_name%></td>
														<td value="<%=licence_incentive%>"><%=licence_incentive%></td>
													</tr>
													<%
												} ///end of for
												} ///end of licenceList size check if
												} ///end of licenceList null check if
												%>
												</tbody>
											</table>
									</div>

									</form>
								</fieldset>
								<!-- 컨텐츠 들어갈내용 끝   -->
							</div>
						</div>
					</div>
					</div>
			</main>
		</div>
	</div>

	<!-- 슬라이드바 사용할때 필요 -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<!-- 탑메뉴 사용 -->
	<script src="../common/js/topNav.js"></script>
	<!-- 사이드 메뉴 사용 -->
	<script src="../common/js/sideNav.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script src="../common/scripts.js"></script>
</body>
</html>