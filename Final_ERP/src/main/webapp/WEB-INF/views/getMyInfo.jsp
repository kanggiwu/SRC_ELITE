<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
out.print(path);
List<Map<String, Object>> infoList = null;
List<Map<String, Object>> licenceList = null;
infoList = (List<Map<String, Object>>) request.getAttribute("infoList");
licenceList = (List<Map<String, Object>>) request.getAttribute("licenceList");
int size = 0;
String emp_no = null;
String emp_name = null;
String emp_pw = null;
String emp_year = null;
String dept_name = null;
String team_name = null;
String rank_name = null;
String emp_hiredate = null;
String emp_tel = null;
String emp_email = null;
String emp_status = null;
String emp_account = null;
String emp_picture_path = null;
String licence_no = null;
String licence_name = null;
if (infoList != null) {
	Map<String, Object> rmap = infoList.get(0);
	emp_no = rmap.get("EMP_NO").toString();
	emp_name = rmap.get("EMP_NAME").toString();
	emp_pw = rmap.get("EMP_PW").toString();
	emp_year = rmap.get("EMP_YEAR").toString();
	dept_name = rmap.get("DEPT_NAME").toString();
	team_name = rmap.get("TEAM_NAME").toString();
	rank_name = rmap.get("RANK_NAME").toString();
	emp_hiredate = rmap.get("EMP_HIREDATE").toString();
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


List<Map<String, Object>> insertLicenceList = null;

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

	//사원 수정을 위한 활성화
	function fieldsetDisable() {
		const fieldset = document.getElementById('btn_fieldset');
		fieldset.disabled = false;
		var empUpdReady = document.getElementById('InfoUpdReady');
		empUpdReady.style.visibility = 'hidden';
		document.getElementById('InfoUpdSubmit').style.display = ''
		document.getElementById('InfoUpdCancel').style.display = ''

	}
	//비밀번호 변경 확인 모달창
	function infoUpdateAction() {
/* 		Swal.fire({
		  title: '변경 되었습니다!',
		  confirmButtonColor: '#17a2b8'})
		$('#myInfo_update').submit(); */
		let emp_pw = $('#emp_pw').val();
		(async () => {	
	 const { value: password } = await Swal.fire({
		  title: '새 비밀번호를 다시 입력해주세요',
		  input: 'password',
		  confirmButtonColor: '#28a745',
		  confirmButtonText: '확인',
		  inputPlaceholder: 'Enter your password',
		  inputAttributes: {
		    maxlength: 10,
		    autocapitalize: 'off',
		    autocorrect: 'off'
		  }
		})
		if (password == emp_pw) {
		  Swal.fire({
			  title: '비밀번호가 확인되었습니다',
			  confirmButtonText: '확인',
			  confirmButtonColor: '#28a745'
			})
			setTimeout(() => $('#myInfo_update').submit() , 1500);
/* 			$('#myInfo_update').submit();
 */		}else{
		  Swal.fire({
			  title: '비밀번호가 맞지 않습니다',
			  confirmButtonText: '확인',
			  confirmButtonColor: '#dc3545',
			  timer: 1500
			  
			})
		}// if else 끝
		})()// async 끝
	}
</script>
<title>MyPage - ERP PROGRAM</title>
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
						<h2>내 정보 조회</h2>
					</div>
					<div id="page_contents"
						style="max-width: 1730px; margin: 10px 100px;">
						<!-- 컨텐츠 들어갈내용 시작-->
						<div class="container">
							<div class="col">
								<div style="text-align: right; padding: 5px;">
									<button class="btn btn-warning" id="InfoUpdReady"
										onclick="fieldsetDisable()">내 정보 변경</button>
									<button class="btn btn-warning" id="InfoUpdSubmit"
										onclick="infoUpdateAction();" style="display: none;">변경
										완료</button>
									<button class="btn btn-danger" id="InfoUpdCancel"
										onclick="location.href='getMyInfo.src1'" style="display: none;" >취소</button>
								</div>
								<fieldset id='btn_fieldset' disabled>
									<form id="myInfo_update" method="post" action="updateMyInfo.src1">
										<div class="row">
											<div class="col-lg-6">
												<div id="imgViewArea" style="width: 100%; height: 250px;">
													<img id="imgArea" src="../<%=emp_picture_path%>"
														style="width: 200px; left: 20%; position: relative;"
														alt="profile" onerror="imgAreaError()">
													<input value="<%=emp_no%>" name="emp_no" hidden>
												</div>
												<hr>
											</div>
											<div class="col-lg-6">
												<div id="emp_table" style="width: 100%; height: 250px;">
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">이름</span> <input
															type="text" class="form-control"
															value="<%=emp_name%>" aria-describedby="basic-addon1" disabled>
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">부서</span> <select
															class="form-control" id="dept_options"
															onchange="handleOnChange(this)" disabled>
															<option ><%=dept_name%></option>
														</select> <select class="form-control"
															id="team_options" disabled>
															<option ><%=team_name%></option>
														</select>
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">직위</span> <select
															class="form-control" name="rank_no" disabled>
															<option><%=rank_name%></option>
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
														<span class="input-group-addon" 
															style="display: inline-block; width: 25%">비밀번호</span> <input
															type="password" name="emp_pw" class="form-control" id="emp_pw"
															value="<%=emp_pw%>" aria-describedby="basic-addon1">
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">사원번호</span> <input
															type="text" class="form-control" value="<%=emp_no%>"
															aria-describedby="basic-addon1" disabled>
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">연차</span> <input
															type="text" class="form-control" value="<%=emp_year%>"
															aria-describedby="basic-addon1" disabled>
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">입사일자</span> <input
															type="date" class="form-control"
															value="<%=emp_hiredate%>"
															aria-describedby="basic-addon1" disabled>
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
															value="<%=emp_email%>" aria-describedby="basic-addon1" disabled>
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">고용상태</span> <select
															name="emp_status" class="form-control" disabled>
															<option><%=emp_status%></option>
														</select>
													</div>
													<br>
													<div class="input-group">
														<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 25%">급여계좌</span> <input
															type="text" class="form-control" placeholder="국민은행"
															aria-describedby="basic-addon1" disabled> <input
															type="text" class="form-control" 
															value="<%=emp_account%>" aria-describedby="basic-addon1" disabled>
													</div>
												</div>
											</div>
											</div>
									</form>
									<div class="col-lg-12">
													<div class="input-group">
													<span class="input-group-addon" id="basic-addon1"
															style="display: inline-block; width: 33%">
													<h5>보유 자격증</h5>
													</span>
													</div>									
										<table class="table table-bordered table-hover table-striped" id="testTable">
<!-- 											<thead>
												<tr style="background-color: #FFECB1">
													<th><h6>이름</h6></th>
												</tr>
											</thead> -->
											<tbody id="licence-tbody">
												<%
												if (licenceList != null) {
													size = licenceList.size();
													if (size > 0) {
														for (int i = 0; i < size; i++) {
													if (i == size)
														break;
													Map<String, Object> lmap = licenceList.get(i);
													licence_name = lmap.get("LICENCE_NAME").toString();		
												%>
												<tr >
													<td><%=licence_name%></td>
												</tr>
												<%
												} ///end of for
												} ///end of licenceList size check if
												} ///end of licenceList null check if
												%>											
											</tbody>
										</table>
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