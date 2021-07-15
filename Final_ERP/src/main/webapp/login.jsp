<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>로그인</title>
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
</head>
<!-- 컨텐츠 들어갈내용 시작-->
<body class="text-center">

	<form class="form-signin" action="/main/login.src1" method="post" accept-charset="utf-8">
		<div class="container row col-md-3 form-signin-heading"
			style="position: absolute; top: 25%; left: 55%; transform: translate(-50%, -50%);">
			<h2>소스정예</h2>
		</div>
		<!-- 화면 중앙정렬 -->
		<div class="container row col-md-5"
			style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
			
			<!-- 일반, 관리자 탭 이동 시작 -->
			<ul class="nav nav-tabs">
				<!-- 일반 로그인  -->
				<li class="nav-item class"><a class="nav-link" data-toggle="tab" href="">일반</a></li>
				<!-- 관리자 로그인 -->
				<li class="nav-item"><a class="nav-link" data-toggle="tab" href="">관리자</a></li>
			</ul>
			<!-- 일반, 관리자 탭 이동 끝 -->
			 <!-- 아이디 확인 시작 -->
			<label for="inputID" class="sr-only">아이디</label> 
			<input type="text" name="login_no" class="form-control" placeholder="ID" required autofocus>
			<!-- 아이디 확인 끝 -->
             <!-- 비밀번호 확인 시작 -->
			<label for="inputPassword" class="sr-only">비밀번호</label>
			<input
				type="password" name="emp_pw" class="form-control"
				placeholder="Password" required>
			<!-- 로그인 시작 -->
			<div class="checkbox mb-3"></div>
			 <!-- 아이디 확인 끝 -->
			 <!-- 비밀번호 확인 끝 -->
			<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
		</div> 
		
	</form>
		<!-- 로그인 끝 -->
		
		
<!-- 		<form action="/main/login.src1" method="POST">
			<label>ID : </label><input type="text" name="login_no" />
			<label>PW : </label><input type="password" name="emp_pw" />
			<button type="submit">로그인</button>
		</form> -->
</body>

<!-- 컨텐츠 들어갈내용 끝   -->

<!-- 슬라이드바 사용할때 필요 -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script> -->
<!-- 탑메뉴 사용 -->
<!-- <script src="../common/js/topNav.js"></script> -->
<!-- 사이드 메뉴 사용 -->
<!-- <script src="../common/js/sideNav.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous" ></script>
<script src="../common/scripts.js"></script> -->
<!-- </body> -->
</html>