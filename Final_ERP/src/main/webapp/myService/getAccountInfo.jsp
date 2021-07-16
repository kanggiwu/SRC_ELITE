<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
List<Map<String, Object>> AccountList = null;
AccountList = (List<Map<String, Object>>) request.getAttribute("AccountList");
Map<String, Object> Amap = new HashMap<>();
//Amap = AccountList.get(1);
int size = 0;
String emp_no = null;
String emp_name = null;
String dept_name = null;
String rank_name = null;
String emp_account = null;
String emp_hiredate = null;
int sal_no = 0;
int sal_date = 0;
int sal_base = 0;
int sal_incentive = 0;
int sal_position = 0;
int sal_tech = 0;
int sal_etc = 0;
int sal_meal = 0;
int sal_commu = 0;
int sal_payment = 0;
int sal_nation_pension = 0;
int sal_health = 0;
int sal_industrial_insurance = 0;
int sal_employ_insurance = 0;
int sal_income_tax = 0;
int sal_local_tax = 0;
int sal_deduction_etc = 0;
int sal_deductions = 0;
int sal_total = 0;
if (Amap != null) {
	if(Amap.get("SAL_NO") != null) sal_no = Integer.parseInt(Amap.get("SAL_NO").toString());
	if(Amap.get("SAL_BASE") != null) sal_base = Integer.parseInt(Amap.get("SAL_BASE").toString());
	if(Amap.get("SAL_INCENTIVE") != null) sal_incentive = Integer.parseInt(Amap.get("SAL_INCENTIVE").toString());
	if(Amap.get("SAL_POSITION") != null)sal_position = Integer.parseInt(Amap.get("SAL_POSITION").toString());
	if(Amap.get("SAL_TECH") != null)sal_tech = Integer.parseInt(Amap.get("SAL_TECH").toString());
	if(Amap.get("SAL_ETC") != null)sal_etc = Integer.parseInt(Amap.get("SAL_ETC").toString());
	if(Amap.get("SAL_MEAL") != null)sal_meal = Integer.parseInt(Amap.get("SAL_MEAL").toString());
	if(Amap.get("SAL_COMMU") != null)sal_commu = Integer.parseInt(Amap.get("SAL_COMMU").toString());
	if(Amap.get("SAL_PAYMENT") != null)sal_payment = Integer.parseInt(Amap.get("SAL_PAYMENT").toString());
	if(Amap.get("SAL_NATION_PENSION") != null)sal_nation_pension = Integer.parseInt(Amap.get("SAL_NATION_PENSION").toString());
	if(Amap.get("SAL_HEALTH") != null)sal_health = Integer.parseInt(Amap.get("SAL_HEALTH").toString());
	if(Amap.get("SAL_INDUSTRIAL_INSURANCE") != null)sal_industrial_insurance = Integer.parseInt(Amap.get("SAL_INDUSTRIAL_INSURANCE").toString());
	if(Amap.get("SAL_EMPLOY_INSURANCE") != null)sal_employ_insurance = Integer.parseInt(Amap.get("SAL_EMPLOY_INSURANCE").toString());
	if(Amap.get("SAL_INCOME_TAX") != null)sal_income_tax = Integer.parseInt(Amap.get("SAL_INCOME_TAX").toString());
	if(Amap.get("SAL_LOCAL_TAX") != null)sal_local_tax = Integer.parseInt(Amap.get("SAL_LOCAL_TAX").toString());
	if(Amap.get("SAL_DEDUCTION_ETC") != null)sal_deduction_etc = Integer.parseInt(Amap.get("SAL_DEDUCTION_ETC").toString());
	if(Amap.get("SAL_DEDUCTIONS") != null)sal_deductions = Integer.parseInt(Amap.get("SAL_DEDUCTIONS").toString());
	if(Amap.get("SAL_TOTAL") != null)sal_total = Integer.parseInt(Amap.get("SAL_TOTAL").toString());
}
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

<title>Account - ERP PROGRAM</title>
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
						<h2>급여 정산</h2>
					</div>
					<div id="page_contents"
						style="max-width: 1730px; margin: 10px 100px;">
						<!-- 컨텐츠 들어갈내용 시작-->
						<div class="container">
							<div class="row">
								<div class="col-lg-12">
									<div style="text-align: right; padding: 5px;">
										<button class="btn btn-success" id="getYearSalary"
											onclick="openPopup()">사원 검색</button>
										<button class="btn btn-success" id="retirementCalc"
											data-toggle="modal" data-target="#mod_addEmp">급여 정보 수정</button>
									</div>
									<div class="input-group">
										<div
											style="text-align: left; width: 40%; display: inline-block">
											<h5>사원 정보</h5>
										</div>

									</div>
									<div id="emp_table" style="width: 100%; height: 85px;">
										<div class="input-group">
											<input type="text" name="emp_" class="form-control"
												value="소속" aria-describedby="basic-addon1" readonly>
											<input type="text" name="emp_" class="form-control"
												value="<%=dept_name%>" aria-describedby="basic-addon1"
												readonly> <input type="text" name="emp_"
												class="form-control" value="직위"
												aria-describedby="basic-addon1" readonly> <input
												type="text" name="emp_" class="form-control"
												value="<%=rank_name%>" aria-describedby="basic-addon1"
												readonly> <input type="text" name="emp_"
												class="form-control" value="사번"
												aria-describedby="basic-addon1" readonly> <input
												type="text" name="emp_" class="form-control"
												value="<%=emp_hiredate%>" aria-describedby="basic-addon1"
												readonly> <input type="text" name="emp_"
												class="form-control" value="이름"
												aria-describedby="basic-addon1" readonly> <input
												type="text" name="emp_" class="form-control"
												value="<%=emp_name%>" aria-describedby="basic-addon1"
												readonly>
										</div>
										<div class="input-group">
											<input type="text" name="emp_" class="form-control"
												value="입사일" aria-describedby="basic-addon1" readonly>
											<input type="text" name="emp_" class="form-control"
												value="<%=sal_total%>" aria-describedby="basic-addon1"
												readonly> <input type="text" name="emp_"
												class="form-control" value="계좌번호"
												aria-describedby="basic-addon1" readonly> <input
												type="text" name="emp_" class="form-control"
												value="<%=sal_deductions%>" aria-describedby="basic-addon1"
												readonly> <input type="text" name="emp_"
												class="form-control" value="지급계"
												aria-describedby="basic-addon1" readonly> <input
												type="text" name="emp_" class="form-control"
												value="<%=sal_payment%>" aria-describedby="basic-addon1"
												readonly> <input type="text" name="emp_"
												class="form-control" value="공제계"
												aria-describedby="basic-addon1" readonly> <input
												type="text" name="emp_" class="form-control"
												value="<%=emp_account%>" aria-describedby="basic-addon1"
												readonly>
										</div>
									</div>
									<hr>
								</div>
							</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1"
												style="display: inline-block; width: 50%">
												<h5>정산 항목</h5>
											</span>
										</div>
									</div>
									<div class="col-lg-6">

										<div id="emp_table" style="width: 100%;">
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">기본급</span> <input
													type="text" name="emp_no" class="form-control"
													value="<%=emp_no%>" aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">성과금</span> <select
															class="form-control" name="rank_no">
															<option value=1>프로젝트1</option>
															<option value=2>프로젝트2</option>
														</select><input
													type="text" class="form-control" value=""
													aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">직책수당</span> <select
															class="form-control" name="rank_no">
															<option value=1>비적용</option>
															<option value=2>부서장</option>
															<option value=2>팀장</option>
														</select>
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">기술수당</span> <input
													type="text" class="form-control" value=""
													aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">식비</span> <select
															class="form-control" name="rank_no">
															<option value=1 selected>비적용</option>
															<option value=2>적용</option>
														</select>
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">통신비</span> <select
															class="form-control" name="rank_no">
															<option value=1 selected>비적용</option>
															<option value=2>적용</option>
														</select>
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">기타수당</span> <input
													type="text" class="form-control" value=""
													aria-describedby="basic-addon1">
											</div>
										</div>
									</div>
									<div class="col-lg-6">

										<div id="emp_table"
											style="width: 100%; vertical-align: middle;">
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">국민연금</span> <input
													type="text" name="emp_tel" class="form-control" value=""
													aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">건강보험</span> <input
													type="text" name="emp_tel" class="form-control" value=""
													aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">산재보험</span> <input
													type="text" name="emp_tel" class="form-control" value=""
													aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">고용보험</span> <input
													type="text" name="emp_tel" class="form-control" value=""
													aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">소득세</span> <input
													type="text" name="emp_email" class="form-control" value=""
													aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">지방세</span> <input
													type="text" name="emp_account" class="form-control"
													value="<%=emp_account%>" aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">기타공제</span><input
													type="text" name="emp_account" class="form-control"
													value="<%=emp_account%>" aria-describedby="basic-addon1">
											</div>
										</div>
									</div>
									<div class="col-lg-12">
											<br>
										<div style="text-align: right; padding: 5px;">
											<button class="btn btn-info" id="">정산 확인</button>
										</div>
									</div>

								</div>


								<!-- 컨텐츠 들어갈내용 끝   -->
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<!---------------- 급여정보수정 Modal 시작 --------------------------------------->
	<div class="modal fade" id="mod_addEmp" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">급여 정보 수정</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<div class="input-group-addon" id="basic-addon1">연봉 변동</div> 
						<br>
						<div class="input-group">
								<br><input
								type="text" class="form-control" id="txt_company"
								value="<%=sal_base%>" readonly><i class="fas fa-arrow-right" style="width: 10%"></i><input
								type="text" class="form-control" id="txt_company"
								value="">
								</div>
						</div>
						<br>
						<div class="form-group">
							<div class="input-group-addon" id="basic-addon1">계좌정보 변경</div> 
						<br>
						<div class="input-group">
								<br><input
								type="text" class="form-control" id="txt_company"
								value="<%=emp_account%>" readonly><i class="fas fa-arrow-right" style="width: 10%"></i><input
								type="text" class="form-control" id="txt_company"
								value="">
								</div>
						</div>

						<br>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success">수정</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
function openPopup(){
	window.open("getAccountEmpSearch.jsp", "window_name", "width=1000, height=1000");
}
    var _width = '1050';
    var _height = '1000';
    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
    var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2);
/* 	window.open('getYearSalary.jsp', 'window_name', 'width=' + _width
				+ ', height=' + _height + ', left=' + _left ); */
    var popupX = (window.screen.width / 2) - (200 / 2);
 // 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
 var popupY= (window.screen.height /2) - (300 / 2);
 // 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
</script>
	<!----------------급여정보수정 Modal 끝 ----------------------------------------------->
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