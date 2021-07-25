<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
List<Map<String, Object>> balanceList = null;
balanceList = (List<Map<String, Object>>) request.getAttribute("balanceList");
int size = 0;
if (balanceList != null) {
	size = balanceList.size();
}
out.print("size:" + size);
String total_date_year =  balanceList.get(0).get("TOTAL_DATE").toString().substring(1, 4);
String total_date = "";
String month_profit = "";
String month_expense = "";
String month_balance = "";
String total_date_month = "";
out.print(total_date_year);
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
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<link href="../common/main.css" rel="stylesheet" />
<link href="../common/css/custom.css" rel="stylesheet" />
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'line' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {

		var data = new google.visualization.DataTable();
		data.addColumn('number', 'Month');
		data.addColumn('number', '수익금');
		data.addColumn('number', '지출금');
		data.addColumn('number', '순수익');

		data.addRows([ 
			<%
			//조회 결과가 없는 거야?
			if (size == 0) {
			%>
			<%
			} else {//조회 결과가 있을 때
			for (int i = 0; i < size; i++) {
				Map<String, Object> smap = balanceList.get(i);
				if (i == size)
					break;
				
				total_date = smap.get("TOTAL_DATE").toString();
				total_date_month = total_date.substring(5, 7);
				month_profit = smap.get("MONTH_PROFIT").toString();
				month_expense = smap.get("MONTH_EXPENSE").toString();
				month_balance = smap.get("MONTH_BALANCE").toString();
			%>
			[ <%=total_date_month%>, <%=month_profit%>, <%=month_expense%>, <%=month_balance%> ] ,
			<%
			} ///end of for
			} //end of else
			%>
			]);
		console.log(<%=total_date_month%>);
		var options = {
			chart : {
				title : 'SourceELITE 연별 손익 그래프',
				subtitle : 'in millions of Won (KRW)'
			},
			width : 900,
			height : 500,
			axes : {
				x : {
					0 : {
						side : 'bottom'
					}
				}
			}
		};

		var chart = new google.charts.Line(document.getElementById('lineChart'));

		chart.draw(data, google.charts.Line.convertOptions(options));
	}
</script>
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
						<!-- -----------------------------------검색부분---------------------------------- -->
						<form id="myform" class="form-horizontal" role="form">
							<div
								style="text-align: left; padding: 5px; display: inline-block; width: 40%;">
								<span class="input-group"> <select
									name="expense_date_year" class="form-control" id="dept_options">
										<option value="전체">년</option>
										<option value=2021>2021</option>
								</select> <a href="javascript:empSearchAction()"
									class="btn btn-default float-left" role="button"><i
										class="fas fa-search"></i></a>
								</span>

							</div>
							<div
								style="text-align: right; padding: 5px; display: inline-block; width: 59%">
							</div>
						</form>
						<!-- -----------------------------------검색부분 끝----------------------------------- -->
						<div class='row'>
							<table id="products"
								class="table table-bordered table-hover table-striped">
								<thead>
									<tr class="thead-dark">
										<th></th>
										<%
										//조회 결과가 없는 거야?
										if (size == 0) {
										%>
										<th></th>
										<%
										} else {//조회 결과가 있을 때
										for (int i = 0; i < size; i++) {
											Map<String, Object> hmap = balanceList.get(i);
											if (i == size)
												break;
											total_date = hmap.get("TOTAL_DATE").toString();
										%>
										<th><%=total_date%></th>

										<%
										} ///end of for
										} ///end of if
										%>
									</tr>
								</thead>
								<tbody>
									<!-- 
			===============DB에서 데이터 가져와서 뿌려주기======================
			 -->
									<tr>
										<td>수익금</td>
										<%
										//조회 결과가 없는 거야?
										if (size == 0) {
										%>
										<td rowspan="3">조회결과가 없습니다.</td>
										<%
										} else {//조회 결과가 있을 때
										for (int i = 0; i < size; i++) {
											Map<String, Object> bmap = balanceList.get(i);
											if (i == size)
												break;
											month_profit = bmap.get("MONTH_PROFIT").toString();
										%>
										<td><%=month_profit%></td>
										<%
										} ///end of for
										%>
									</tr>
									<tr>
										<td>지출금</td>
										<%
										for (int i = 0; i < size; i++) {
											Map<String, Object> bmap = balanceList.get(i);
											if (i == size)
												break;
											month_expense = bmap.get("MONTH_EXPENSE").toString();
										%>
										<td><%=month_expense%></td>
										<%
										} ///end of for
										%>
									</tr>
									<tr>
										<td>순수익</td>
										<%
										for (int i = 0; i < size; i++) {
											Map<String, Object> bmap = balanceList.get(i);
											if (i == size)
												break;
											month_balance = bmap.get("MONTH_BALANCE").toString();
										%>
										<td><%=month_balance%></td>
										<%
										} ///end of for
										%>
									</tr>
									<%
									} ///end of if
									%>
								</tbody>
							</table>
							<hr />
						</div>
						<div id="lineChart" style="width: 900px; height: 500px"></div>
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