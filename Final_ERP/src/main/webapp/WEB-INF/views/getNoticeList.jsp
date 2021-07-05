<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%! 
String whatNameIs(Object obj) {
	int type = Integer.parseInt(obj.toString());
	if(type == 1) { return "공통"; } else
	if(type == 2) { return "인사"; } else
	if(type == 3) { return "회계"; } else
	if(type == 4) { return "개발"; }
	return "";
}
%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
List<Map<String, Object>> noticeList = null;
noticeList = (List<Map<String, Object>>) request.getAttribute("noticeList");
int size = 0;
if (noticeList != null) {
	size = noticeList.size();
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
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
<!-- 검색에 필요한 코드 시작  -->
<script>
function search() {
	$('#search_form').submit();
} 
</script>
<!--검색에 필요한 코드 끝 -->

<title>공지사항</title>
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
						<h2>공지사항</h2>
					</div>
					<div id="page_contents"
						style="max-width: 1730px; margin: 10px 100px;">
						<!-- 컨텐츠 들어갈내용 시작-->


						<!--테이블 부분 시작  -->
						<table class="table table-bordered table-striped" id="products">
							<!-- 공지부분 -->
							<!--테이블 헤더 시작  -->
							<thead>
								<tr class="thead-dark">
									<th>번호</th>
									<th>분류</th>
									<th>공지제목</th>
									<th>등록일</th>
								</tr>
							</thead>
							<!--테이블 헤더 끝  -->
							<!--테이블 내용 시작  -->
							<tbody>
									<!-- 검색 조회 폼 시작-->
								<form id="search_form" enctype="multipart/form-data" action="/notice/searchNotice.src1" method='post' accept-charset="utf-8">
								<!-- 분류 선택부분 시작-->
								<div
									style="text-align: left; padding: 5px; display: inline-block; width: 40%;">
									<span class="input-group "> <select name="p_notice_type" class="form-control">
											<option>번호</option>
											<option>분류</option>
											<option selected >제목</option>
											<option>날짜</option>
									</select> <!-- 분류 선택부분 끝 --> 
									<!-- 검색 시작 --> 
									<input type="text" name="p_string" value=""
										class="form-control float-left " placeholder="검색"> <a
										class="btn btn-default float-left" href="javascript:search()" role="button"><i
											class="fas fa-search"></i></a>
									</span>
								</div>
								<!-- 검색 끝 -->
								</form>
									<!-- 검색 조회 폼 끝-->
								<!-- 추가버튼 시작 -->
								<div
									style="text-align: right; padding: 5px; display: inline-block; width: 59%">
									<button class="btn btn-primary"
										onclick="location.href='/notice/getNewNotice.src1'">
										공지 추가</button>
									<!-- 추가버튼 끝 -->
								</div>
								
								<%
								//조회 결과 X
								if (size == 0) {
								%>
								<tr>
									<td colspan="3">조회결과가 없습니다.</td>
								</tr>
								<%
								} else {//조회 결과 O
									for (int i = 0; i < size; i++) {
									Map<String, Object> rmap = noticeList.get(i);
									if (i == size)
										break;
								%>
								<tr
									onClick="location.href='/notice/getDetailNotice.src1?NOTICE_NO=<%=rmap.get("NOTICE_NO")%>'">
									<td><%=rmap.get("NOTICE_NO")%></td>
									<td><%=whatNameIs(rmap.get("NOTICE_TYPE"))%></td>
									<td><%=rmap.get("NOTICE_TITLE")%></td>
									<td><%=rmap.get("NOTICE_DATE")%></td>
								</tr>

								<!-- 페이징 처리 부분 //반드시 테이블 안에 넣어야됨// -->
								<form action="" id="setRows">
									<input type="hidden" name="rowPerPage" value="25"
										id="rowPerPage">
								</form>
								<!-- 페이징 처리부분 끝  -->


								<%
								} /////////////end of for
								} /////////////////end of else
								%>


							</tbody>
							<!--테이블 내용 끝  -->
						</table>
						<!--테이블 끝  -->

					</div>
				</div>
			</main>
		</div>
	</div>
	<!-- 컨텐츠 들어갈내용 끝   -->
	<!-- 페이징 처리 할때 필요한 부분  -->
	<script src="../common/js/paging.js"></script>
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
	<!-- 버거 메뉴 활성화 -->
</body>
</html>
