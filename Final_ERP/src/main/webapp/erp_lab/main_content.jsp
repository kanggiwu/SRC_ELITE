<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
	List<Map<String, Object>> noticeList = null;
	noticeList = (List<Map<String, Object>>) request.getAttribute("NoticeDetail");
	int size = 0;
	String notice_no = null;
	String notice_type = null;
	int inotice_type = 0;
	String notice_title = null;
	String notice_content = null;
	if (noticeList != null) {
		size = noticeList.size();
		Map<String, Object> rmap = noticeList.get(0);
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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
  	  rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous" ></script>
<link href="<%=path.toString() %>common/main.css" rel="stylesheet" />
<link href="<%=path.toString() %>common/css/custom.css" rel="stylesheet" />
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
<title>ERP PROGRAM</title>
</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
     			<!-- 컨텐츠 들어갈내용 시작-->
		<!--<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border: 1px solid #C82333; margin: 10px 30px;"><h2>Main Page</h2></div>
				<div id="page_contents" style="max-width: 1730px; border: 1px solid #5C80AB; margin: 50px 50px;">
			 <div>
		      <h2 style="text-align:center;">공지 사항</h2>
			  <div id="emp_table" style="width:100%; height:300px;">
			  	<div class="table-responsive">
				  	 <table id="testTable"
				  	 		class="table table-hover"
				  	 		data-toggle="table"
				  	 		data-url="../home/SearchJson.json">
		                 <thead class="thead-light">
							<tr>
	     						<th colspan="2">공지 사항</th>
	     					</tr>		                 
		                     <tr>
		                         <th data-field="CF_NAME">제목</th>
		                         <th data-field="DEPT_NAME">날짜</th>
		                     </tr>
		                 </thead>
	     				<tbody>
	     					<tr>
	     						<td>1</td>
	     						<td>2</td>
	     					</tr>
	     					<tr>
	     						<td>3</td>
	     						<td>4</td>
	     					</tr>
	     					<tr>
	     						<td>5</td>
	     						<td>6</td>
	     					</tr>
	     				</tbody>		                 
		             </table>
	             </div>
			  </div>	
		    </div> -->
     			<!-- 컨텐츠 들어갈내용 끝   -->
     			
     			</div>
			</div>
		</main>
		
	</div>
</div>
<!-- 슬라이드바 사용할때 필요 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!-- 탑메뉴 사용 -->
<script src="<%=path.toString() %>common/js/topNav.js"></script>
<!-- 사이드 메뉴 사용 -->
<script src="<%=path.toString() %>common/js/sideNav.js?ver2"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous" ></script>
<script src="<%=path.toString() %>common/scripts.js"></script>

</body>
</html>
