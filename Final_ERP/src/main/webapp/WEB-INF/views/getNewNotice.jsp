<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
List<Map<String, Object>> newNotice = null;
newNotice = (List<Map<String, Object>>) request.getAttribute("newNotice");
int size = 0;
String notice_no = null;
String notice_type = null;
String notice_title = null;
String notice_content = null;
if (newNotice != null) {
	size = newNotice.size();
	Map<String, Object> rmap = newNotice.get(0);
	notice_no = rmap.get("NOTICE_NO").toString();
	notice_type = rmap.get("NOTICE_TYPE").toString();
	notice_title = rmap.get("NOTICE_TITLE").toString();
	notice_content = rmap.get("NOTICE_CONTENT").toString();
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
<!-- 삭제에 필요한 코드 시작 -->
<script type="text/javascript">
	function insertNotice(){
		/* alert(""); */
		$("#notice_ins").attr("method","post");
		$("#notice_ins").attr("action","/notice/insertNotice.src1");
		$("#notice_ins").submit();	
	}	
</script>
<!-- 삭제에 필요한 코드 끝 -->
<title>공지사항 추가</title>
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
						<h2>공지사항 추가</h2>
					</div>
					<div id="page_contents"
						style="max-width: 1730px; margin: 10px 100px;">
						<!-- 컨텐츠 들어갈내용 시작-->
						<div>
						<form id="notice_ins" accept-charset="utf-8">
						<!-- 테이블 시작  -->
							<table>
								<tr>
							
									<td>분류 <select name="notice_type">
											<option value="1" selected readonly >분류</option>
											<option value="1">공통</option>
											<option value="2">인사</option>
											<option value="3">회계</option>
											<option value="4">개발</option>
									</select>
									</td>
								</tr>


								<tr>
									<td>제목<input id="notice_title" name="notice_title"
										style="width: 480px;"></td>
								</tr>
								<tr>
									<th>내용</th>
								</tr>
							<tr>
									<td><textarea id="notice_content" name="notice_content"
											style="width: 780px; height: 350px;" placeholder="내용 작성"></textarea>
									</td>
								</tr>
							</table>
							<button type="button" class="btn btn-primary pull-right"
								onclick="location.href='javascript:insertNotice();'">추가</button>
							<!--테이블 끝  -->

						</form>
						</div>
					</div>
			</main>
		</div>
	</div>
	<!-- 컨텐츠 들어갈내용 끝   -->

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
	<!-- 버거 메뉴 활성화 -->
	<script src="../common/scripts.js"></script>
</body>
</html>
