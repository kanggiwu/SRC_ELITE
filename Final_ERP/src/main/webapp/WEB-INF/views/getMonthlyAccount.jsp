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
						<h2>2021년 7월</h2>
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
										<th style="width: 10%">일자</th>
										<th style="width: 20%">금액</th>
										<th style="width: 20%">항목</th>
										<th style="width: 10%">일자</th>
										<th style="width: 20%">금액</th>
									</tr>
								</thead>
								<tbody>
									<%
									//조회 결과가 없는 거야?
									if (size == 0) {
									%>
									<tr>
										<td colspan="6">조회결과가 없습니다.</td>
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
										<td>프로젝트a</td>
										<td>1</td>
										<td>억</td>
										<td>소모품</td>
										<td></td>
										<td>백만</td>
									</tr>
									<tr>
										<%-- 										<td><%=pmap.get("PROJECT_PERIOD").toString()%></td> --%>
										<td>프로젝트b</td>
										<td>20</td>
										<td>억</td>
										<td>사무용품</td>
										<td>2</td>
										<td>이백만</td>
									</tr>
									<tr>
										<%-- 										<td><%=pmap.get("PROJECT_PERIOD").toString()%></td> --%>
										<td></td>
										<td></td>
										<td></td>
										<td>간식비</td>
										<td>15</td>
										<td>백만</td>
									</tr>
									<%
									} ///end of for
									} ///end of if
									%>
								</tbody>
								<tfoot>
									<tr>
										<td>총 합계</td>
										<td colspan="2" style="text-align: right;">2억</td>
										<td>총 합계</td>
										<td colspan="2" style="text-align: right;">2백만</td>
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