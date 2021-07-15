<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
List<Map<String, Object>> infoList = null;
List<Map<String, Object>> licenceList = null;
infoList = (List<Map<String, Object>>) request.getAttribute("infoList");
int size = 0;
String emp_no = null;
String emp_name = null;
String dept_name = null;
String rank_name = null;
String emp_account = null;
String emp_hiredate = null;
if (infoList != null) {
	Map<String, Object> rmap = infoList.get(0);
	emp_no = rmap.get("EMP_NO").toString();
	emp_name = rmap.get("EMP_NAME").toString();
	dept_name = rmap.get("DEPT_NAME").toString();
	rank_name = rmap.get("RANK_NAME").toString();
	emp_account = rmap.get("EMP_ACCOUNT").toString();
	emp_hiredate = rmap.get("EMP_HIREDATE").toString();
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
<script type="text/javascript">

</script>
<title>MyPage - ERP PROGRAM</title>
</head>
<body class="sb-nav-fixed">
			<main id="input_div">
				<div id="frame_div" style="border: 1px solid black;">
					<div id="page_title"
						style="border-bottom: 2px solid gray; margin: 50px 30px;">
						<h2>내 급여 조회</h2>
					</div>
					<div id="page_contents"
						style="max-width: 1730px; margin: 10px 100px;">
						<!-- 컨텐츠 들어갈내용 시작-->
						<div class="container">
							<div class="col">
									<div class="row"></div>
									<div class="col-lg-12">
										<br>
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1"
												style="display: inline-block; width: 50%">
												<h5>연간 급여 조회</h5>
											</span> <select class="form-control" name="yearSalary"
												id="yearSearch">
												<option selected disabled>2021년</option>
											</select> 
											<button class="btn btn-light" onclick="searchMonthSalary()">검색</button>
										</div>
										<table class="table table-bordered table-hover table-striped"
											id="testTable" id="table" data-toggle="table"
											data-height="650" data-search="true" data-show-columns="true"
											data-method="post" data-pagination="true"
											data-url="./member.json">
											<thead>
												<tr class="thead-dark">
													<th><h6>항목</h6></th>
													<th><h6>1월</h6></th>
													<th><h6>2월</h6></th>
													<th><h6>3월</h6></th>
													<th><h6>4월</h6></th>
													<th><h6>5월</h6></th>
													<th><h6>6월</h6></th>
													<th><h6>7월</h6></th>
													<th><h6>8월</h6></th>
													<th><h6>9월</h6></th>
													<th><h6>10월</h6></th>
													<th><h6>11월</h6></th>
													<th><h6>12월</h6></th>
												</tr>
											</thead>
											<tbody id="yearSalary-tbody">
												<tr><td>기본급</td></tr>
												<tr><td>성과금</td></tr>
												<tr><td>직책수당</td></tr>
												<tr><td>기술수당</td></tr>
												<tr><td>식비</td></tr>
												<tr><td>통신비</td></tr>
												<tr><td>지급계</td></tr>
												<tr><td>국민연금</td></tr>
												<tr><td>건강보험</td></tr>
												<tr><td>산재보험</td></tr>
												<tr><td>고용보험</td></tr>
												<tr><td>소득세</td></tr>
												<tr><td>지방세</td></tr>
												<tr><td>공제</td></tr>
												<tr><td>공제계</td></tr>
												<tr><td>총지급계</td></tr>
											</tbody>
										</table>
									</div>

								</div>
								<!-- 컨텐츠 들어갈내용 끝   -->
							</div>
						</div>
					</div>
			</main>
