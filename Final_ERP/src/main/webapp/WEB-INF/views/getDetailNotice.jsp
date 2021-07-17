<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%! 
String whatNameIs(int type) {
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
List<Map<String, Object>> NoticeDetail = null;
NoticeDetail = (List<Map<String, Object>>) request.getAttribute("NoticeDetail");
int size = 0;
String notice_no = null;
String notice_type = null;
int inotice_type = 0;
String notice_title = null;
String notice_content = null;
if (NoticeDetail != null) {
	size = NoticeDetail.size();
	Map<String, Object> rmap = NoticeDetail.get(0);
	notice_no = rmap.get("NOTICE_NO").toString();
	notice_type = rmap.get("NOTICE_TYPE").toString();
	inotice_type = Integer.parseInt(notice_type);
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
<!-- 수정에 필요한 코드 시작 -->
<script type="text/javascript">
	function updateNotice(){
		/* alert("updateNotice호출"); */
		$("#notice_upd").attr("method","post");
		$("#notice_upd").attr("action","/notice/updateNotice.src1");
		$("#notice_upd").submit();
	}
<!-- 수정에 필요한 코드 끝 -->
	
<!-- 삭제에 필요한 코드 시작 -->
	function deleteNotice(){
		/* alert("삭제확인 호출"); */
		$("#notice_del").attr("method","get");
		$("#notice_del").attr("action","/notice/deleteNotice.src1");
		$("#notice_del").submit();	
	}		
<!-- 삭제에 필요한 코드 끝 -->
</script>
<title>공지 상세페이지</title>
<body class="sb-nav-fixed">
	<nav id="topNav"></nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav"></div>
		<div id="layoutSidenav_content">
			<main id="input_div">
				<div id="frame_div" style="border: 1px solid black;">
					<div id="page_title"
						style="border-bottom: 2px solid gray; margin: 50px 30px;">
						<h2>공지 상세조회</h2>
					</div>
					<div id="page_contents""
						style="max-width: 1730px; margin: 10px 100px;"></div>

					<!-- 컨텐츠 들어갈내용 시작-->
					<div style="padding-left: 20%; padding-right: 20%;">
						<!-- 수정 시작-->
						<form id="notice_upd">
										<table>
									<tr>

										<td>분류 <select id="notice_type" name="notice_type"
													style="text-align: left;">
									<%
										String sel = "selected";
										switch(inotice_type) {
											case 1:
									%>
											<option <%=sel%> value="1">공통</option>
									<%
											break;
											case 2:
									%>
											<option <%=sel%> value="2">인사</option>
									<%
											break;
											case 3:
									%>
											<option <%=sel%> value="3">회계</option>
									<%
											break;
											case 4:
									%>
											<option <%=sel%> value="4">개발</option>
									<%
											break;
										}
									%>
										</select>
										</td>
									</tr>
									<tr>
										<td>제목<input id="notice_title" value="<%=notice_title%>"
											name="notice_title" 
													style="text-align: left; width: 500px;"></td>
									</tr>
									<tr>
										<th>내용</th>
									</tr>
									<tr>
										<td><textarea id="notice_content" name="notice_content"
												style="width: 780px; height: 350px;"><%=notice_content%></textarea>
										</td>
									</tr>
								</table>
								<input type="hidden" name="notice_no" id="notice_no" value="<%=notice_no%>"/>
							</form>
					<div style="text-align: right; padding: 10px;">
					<button type="button" class="btn btn-primary pull-right"
						onclick="location.href='/notice/getAllNoticeList.src1'">목록</button>
					<!-- 목록이동 버튼  끝-->
					<!-- 수정 버튼 시작-->
					<button type="button" class="btn btn-primary pull-right"
						onclick="location.href='javascript:updateNotice();'"
						value="<%=notice_no%>">수정</button>
					<!-- 수정 버튼 끝-->
					<!-- 삭제 버튼 시작-->
					<button type="button" class="btn btn-primary pull-right"
						onclick="location.href='javascript:deleteNotice();'">삭제</button>
					<!-- 삭제 버튼 끝-->
					</div>
							</div>
					<!-- 내용 상세끝  -->
					<!-- 삭제 시작-->
					<form id="notice_del">
						<input type="hidden" name="dnotice_no" value="<%=notice_no%>">
					</form>
					<!-- 삭제  끝-->
					
					<div>
					</div>
					
					<!-- 목록이동 버튼 시작 -->


					<%
					/////////////end of for
					/////////////////end of else
					%>

					<!-- 컨텐츠 들어갈내용 끝   -->
				</div>
			</main>
		</div>
	</div>

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