<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
  	  rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous" ></script>
<link href="<%=path.toString() %>common/main.css" rel="stylesheet" />
<link href="<%=path.toString() %>common/css/custom.css" rel="stylesheet" />
<title>공지사항 화면</title>
</head>
<body>
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border: 1px solid #C82333; margin: 10px 30px;"><h2>Main Page</h2></div>
				<div id="page_contents" style="max-width: 1730px; border: 1px solid #5C80AB; margin: 50px 50px;">
     			<!-- 컨텐츠 들어갈내용 시작-->
			<div>
		      <h2 style="text-align:center;">공지 사항 화면</h2>
			  <div id="emp_table" style="width:100%; height:300px;">
			  	<div class="table-responsive">
	                 

	             </div>
			  </div>	
		    </div>
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
<script src="<%=path.toString() %>common/js/sideNav.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous" ></script>
<script src="<%=path.toString() %>common/scripts.js"></script>

</body>
</html>