<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%! 
String whatNameIs(String type) {
	if("1".equals(type)) { return "인건비"; } else
	if("2".equals(type)) { return "교육훈련비"; } else
	if("3".equals(type)) { return "임차료"; } else
	if("4".equals(type)) { return "통신비"; } else
	if("5".equals(type)) { return "수도광열비"; } else
	if("6".equals(type)) { return "소모품비"; } else
	if("7".equals(type)) { return "기타"; }
	return "";
}
%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
List<Map<String, Object>> profitMonthList = null;
List<Map<String, Object>> expenseMonthList = null;
List<Map<String, Object>> totalMonthList = null;
profitMonthList = (List<Map<String, Object>>) request.getAttribute("profitMonthList");
expenseMonthList = (List<Map<String, Object>>) request.getAttribute("expenseMonthList");
totalMonthList = (List<Map<String, Object>>) request.getAttribute("totalMonthList");
int profitSize = 1;
int expenseSize = 1;
int totalSize = 1;
if ((profitMonthList != null) && (expenseMonthList != null)) {
	profitSize = profitMonthList.size();
	expenseSize = expenseMonthList.size();
	if(profitSize >= expenseSize) {
		totalSize = profitSize;
	} else {
		totalSize = expenseSize;
	}
} else {
	profitSize = 0;
	expenseSize = 0;
}
Map<String, Object> totalMap = totalMonthList.get(0);
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
							<div class="col-lg-6 no-right-padding">
							<table id="profit_table"
								class="table table-bordered table-hover">
								<thead>
									<tr class="thead-dark" style="text-align: center">
										<th colspan="2">수익</th>
									</tr>
									<tr class="thead-dark">
										<th style="width: 40% style="text-align: right">항목</th>
										<th style="width: 60% style="text-align: right">금액</th>
									</tr>
								</thead>
								<tbody>
									<%
									//조회 결과가 없는 거야?
										if (profitSize == 0) {
									%>
												<tr>
													<td colspan="2">조회결과가 없습니다.</td>
												</tr>
									<%
										} else {//조회 결과가 있을 때
											for (int i = 0; i < totalSize; i++) {
												if (i < profitSize) {
													Map<String, Object> profitMap = profitMonthList.get(i);
									%>
													<tr>
														<td><%= profitMap.get("PROJECT_NAME").toString()%></td>
														<td style="text-align: right"><%= profitMap.get("PROFIT_SUM").toString()%></td>
													</tr>
									<%
												} else {
									%>
													<tr>
														<td>  &nbsp; </td>
														<td>  &nbsp; </td>
													<tr>
									<%
												}
											} ///end of for
									%>
									
												</tbody>
												<tfoot>
													<tr style="text-align: right">
														<td>총 수익</td>
														<td><%= totalMap.get("BALANCE_PROFIT").toString() %></td>
													</tr>
													<tr style="text-align: right">
														<td colspan="2">합계</td>
													</tr>
												</tfoot>
									<%
										} ///end of if
									%>
							</table>
							</div>
							<div class="col-lg-6 no-left-padding">
							<table id="expense_table"
								class="table table-bordered table-hover">
								<thead>
									<tr class="thead-dark" style="text-align: center">
										<th colspan="2">지출</th>
									</tr>
									<tr class="thead-dark">
										<th style="width: 40% style="text-align: right">항목</th>
										<th style="width: 60% style="text-align: right">금액</th>
									</tr>
								</thead>
								<tbody>
									<%
										//조회 결과가 없는 거야?
										if (expenseSize == 0) {
									%>
											<tr>
												<td colspan="2">조회결과가 없습니다.</td>
											</tr>
									<%
										} else {//조회 결과가 있을 때
											for (int i = 0; i < totalSize; i++) {
												if (i < expenseSize) {
													Map<String, Object> expenseMap = expenseMonthList.get(i);
									%>
													<tr>
														<td><%= whatNameIs(expenseMap.get("EXPENSE_TYPE").toString()) %></td>
														<td style="text-align: right"><%= expenseMap.get("EXPENSE_SUM").toString()%></td>
													</tr>
									<%
												} else {
									%>
													<tr>
														<td> </td>
														<td> </td>
													<tr>
									<%
												}
											} ///end of for
									%>
									
											</tbody>
											<tfoot>
												<tr style="text-align: right">
													<td>총 지출</td>
													<td colspan="2"><%= totalMap.get("BALANCE_EXPENSE").toString() %></td> 
												</tr>
												<tr style="text-align: right">
													<td colspan="2"><%= totalMap.get("BALANCE_TOTAL").toString() %></td>
												</tr>
											</tfoot>
								<%
										} ///end of if
								%>
							</table>
							</div>
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