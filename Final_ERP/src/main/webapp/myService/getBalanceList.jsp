<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
List<Map<String, Object>> profitList = null;
profitList = (List<Map<String, Object>>) request.getAttribute("profitList");
int size = 1;
String pProjectNo = null;
if (profitList != null) {
	size = profitList.size();
}
out.print("size:" + size);
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
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->

<title>Account</title>
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
						<h2>손익 조회</h2>
					</div>
					<div id="page_contents"
						style="max-width: 1730px; margin: 10px 100px;">
						<!--
******************************************* 컨텐츠 들어갈내용 시작************************************************
-->
						<script type="text/javascript">
							document.getElementById('my_form').onsubmit = function() {
								var dat_period = this.dat_period.value
								alert(dat_period);
							}
						</script>

						<!-- -----------------------------------검색부분---------------------------------- -->
						<form id="myform" class="form-horizontal" role="form">
							<div
								style="text-align: left; padding: 5px; display: inline-block; width: 60%;">
								<span class="input-group"> <input type="date"
									class="form-control" id="date_period_first">&nbsp; ~
									&nbsp; <input type="date" class="form-control"
									id="date_period_last">&nbsp; <a
									href="javascript:empSearchAction()"
									class="btn btn-default float-left" role="button"><i
										class="fas fa-search"></i></a>
								</span>

							</div>
							<div
								style="text-align: right; padding: 5px; display: inline-block; width: 39%">
							</div>
						</form>
						<!-- -----------------------------------검색부분 끝----------------------------------- -->
						<div class='row'>
							<table id="products"
								class="table table-bordered table-hover table-striped">
								<thead>
									<tr class="thead-dark">
										<th></th>
										<th>2021년 4월</th>
										<th>2021년 5월</th>
										<th>2021년 6월</th>
										<th>2021년 7월</th>
									</tr>
								</thead>
								<tbody>
									<%
									//조회 결과가 없는 거야?
									if (size == 0) {
									%>
									<tr>
										<td colspan="3">조회결과가 없습니다.</td>
									</tr>
									<%
									} else {//조회 결과가 있을 때
									for (int i = 0; i < size; i++) {
										//Map<String, Object> pmap = profitList.get(i);
										if (i == size)
											break;
										//pProjectNo = pmap.get("PROJECT_NO").toString();
									%>
									<!-- 
			===============DB에서 데이터 가져와서 뿌려주기======================
			 -->
									<tr>
										<%-- 										<td><%=pmap.get("PROJECT_PERIOD").toString()%></td> --%>
										<td>수익금</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
									</tr>
									<tr>
										<%-- 										<td><%=pmap.get("PROJECT_PERIOD").toString()%></td> --%>
										<td>지출금</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
									</tr>
									<tr>
										<%-- 										<td><%=pmap.get("PROJECT_PERIOD").toString()%></td> --%>
										<td>순수익</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
										<td>100</td>
									</tr>

									<%
									} ///end of for
									} ///end of if
									%>
								</tbody>
							</table>
							<hr />
						</div>
						여긴 차트
						<!--
****************************************** 컨텐츠 들어갈내용 끝 *************************************************   
-->

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