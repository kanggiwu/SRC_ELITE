<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
List<Map<String, Object>> noticeAllList = null;
noticeAllList = (List<Map<String, Object>>) request.getAttribute("noticeAllList");
int size = 0;
if (noticeAllList != null) {
	size = noticeAllList.size();
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
<title>공지사항</title>
</head>
<body class="sb-nav-fixed">
	<nav id="topNav"></nav>
	<div id="layoutSidenav"></div>
	<div id="layoutSidenav_nav"></div>
	<div id="layoutSidenav_content"></div>
	<main id="input_div"></main>
	<div id="frame_div" style="border: 1px solid black;"></div>
	<div id="page_title"
		style="border-bottom: 2px solid gray; margin: 50px 30px;">
		<h2>공지사항</h2>
	</div>
	<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;"></div>
	<link rel="stylesheet"
		href="{{ url_for('static', filename='bootstrap.min.css') }}">
	<!-- 컨텐츠 들어갈내용 시작-->
	<!-- 검색버튼 -->
	<div class=col-xs-2
		style="text-align: left; padding: 5px; display: inline-block; width: 15%;">
		<span class="input-group"> <select class="form-control">
				<option selected disabled>분류</option>
				<option>공통</option>
				<option>인사</option>
				<option>회계</option>
				<option>개발</option>
		</select>
		</span>
		</div>
	<div class="col-xs-3">
		<input type="text" class="form-control " placeholder="검색" style = width:30%;>
	</div>
	<a class="btn btn-default" href="" role="button"><i
		class="fas fa-search"></i></a>
	<!-- 추가버튼 클릭시 내용 추가 창으로 이동 -->
	<div
		style="text-align: right; padding: 5px; display: inline-block; width: 40%">
		<button class="btn btn-primary btn-sm pull-right"
			onClick="location.href='notice_insert.jsp'">추가</button>
	</div>
	<table class="table table-bordered table-striped" id="products">
		<!-- 페이징 처리 부분 //반드시 테이블 안에 넣어야됨// -->
		<form action="" id="setRows">
			<input type="hidden" name="rowPerPage" value="30" id="rowPerPage">
		</form>
		<!-- 공지부분 -->
		<thead>
			<tr class="thead-dark">
				<th>분류</th>
				<th>공지제목</th>
				<th>등록일</th>
				<th>번호</th>
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
			} else {//조회 결과가 있는데....
			for (int i = 0; i < size; i++) {
				Map<String, Object> rmap = noticeAllList.get(i);
				if (i == size)
					break;
			%>
			<tr onClick="location.href='/notice/getDetailNotice.src1?NOTICE_NO=<%=rmap.get("NOTICE_NO")%>'">
				<td><%=rmap.get("NOTICE_TYPE")%></td>
				<td><%=rmap.get("NOTICE_TITLE")%></td>
				<td><%=rmap.get("NOTICE_DATE")%></td>
				<td><%=rmap.get("NOTICE_NO")%></td>
			</tr>



			<%
			} /////////////end of for
			} /////////////////end of else
			%>

		</tbody>
	</table>


	<!-- 컨텐츠 들어갈내용 끝   -->
	<!-- 페이징 처리 부분  -->
	<script src="../common/js/paging.js"></script>
	<!-- 슬라이드바 사용할때 필요 -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<!-- 탑메뉴 사용 -->
	<script src="../common/js/topNav_admin.js"></script>
	<!-- 사이드 메뉴 사용 -->
	<script src="../common/js/sideNav_admin.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script src="../common/scripts.js"></script>
</body>
</html>