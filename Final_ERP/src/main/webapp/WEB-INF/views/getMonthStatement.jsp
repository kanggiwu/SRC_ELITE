<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
List<Map<String, Object>> profitMonthList = null;
List<Map<String, Object>> expenseMonthList = null;
profitMonthList = (List<Map<String, Object>>) request.getAttribute("profitMonthList");
expenseMonthList = (List<Map<String, Object>>) request.getAttribute("expenseMonthList");
int size = 1;
if ((profitMonthList != null) && (expenseMonthList != null)) {
	if(profitMonthList.size() >= expenseMonthList.size()) {
		size = profitMonthList.size();
	} else {
		size = expenseMonthList.size();
	}
} else {
	size = 0;
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

<!--페이징 처리   =================================================================================-->

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
						<h2>월말 결산</h2>
					</div>
					<div id="page_contents"
						style="max-width: 1730px; margin: 10px 100px;">
						<!--
******************************************* 컨텐츠 들어갈내용 시작************************************************
-->
						<h2></h2>
						<div class='row'>
							<table id="products"
								class="table table-bordered table-hover table-striped">
								<thead>
									<tr class="thead-dark" style="text-align: center">
										<th colspan="3">수익</th>
										<th colspan="3">지출</th>
									</tr>
									<tr class="thead-dark">
										<th style="width: 20%">항목</th>
										<th style="width: 30%">금액</th>
										<th style="width: 20%">항목</th>
										<th style="width: 30%">금액</th>
									</tr>
								</thead>
								<tbody>
									<%
									//조회 결과가 없는 거야?
									if (size == 0) {
									%>
									<tr>
										<td colspan="4">조회결과가 없습니다.</td>
									</tr>
									<%
									} else {//조회 결과가 있을 때
									for (int i = 0; i < size; i++) {
										Map<String, Object> profitMap = profitMonthList.get(i);
										Map<String, Object> expenseMap = expenseMonthList.get(i);
										if (i == size)
											break;
									%>
									<!-- 
			===============DB에서 데이터 가져와서 뿌려주기======================
			 -->
									<tr>
										<td><%= profitMap.get("PROJECT_NAME").toString()%></td>
										<td><%= profitMap.get("PROFIT_SUM").toString()%></td>
										<td><%= expenseMap.get("EXPENSE_TYPE").toString()%></td>
										<td><%= expenseMap.get("EXPENSE_SUM").toString()%></td>
									</tr>
									<%
									} ///end of for
									} ///end of if
									%>
								</tbody>
								<tfoot>
									<tr>
										<td>총 수익</td>
										<td>2억</td>
										<td>총 지출</td>
										<td>2백만</td>
									</tr>
								</tfoot>
							</table>
							<hr />
						</div>



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