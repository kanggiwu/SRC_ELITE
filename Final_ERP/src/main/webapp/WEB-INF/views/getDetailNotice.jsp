<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
List<Map<String,Object>> noticeDetail = null;
noticeDetail = (List<Map<String,Object>>)request.getAttribute("noticeDetail");
int size = 0;
	String notice_type 	= null;
	String notice_title 	= null;
	String notice_content 	= null;
	String notice_no 		= null;

if(noticeDetail!=null){
	size = noticeDetail.size();
	Map<String,Object> rmap = noticeDetail.get(0);
	notice_type = rmap.get("NOTICE_TYPE").toString();
	notice_title = rmap.get("NOTICE_TITLE").toString();
	notice_content = rmap.get("NOTICE_CONTENT").toString();
	notice_no = rmap.get("NOTICE_NO").toString();


}
out.print("noticeDetail:"+noticeDetail);
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
	<input class="form-control" type="text" placeholder="공통" readonly>
	<!-- 내용 상세보기 -->
	<div class="tabcon on tabcon">
	<h4>
		[ 공지사항 ] <span>홈페이지 점검 안내</span>
	</h4>
	<p>
		7월 5일 하루동안 홈페이지 점검 및 리뉴얼 예정입니다. <br> 양해 부탁드립니다.
	</p>
	<a class="btn btn-primary" onClick="location.href='notice_admin.jsp'">목록이동</a>
	

		


			<%
			 /////////////end of for
			 /////////////////end of else
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