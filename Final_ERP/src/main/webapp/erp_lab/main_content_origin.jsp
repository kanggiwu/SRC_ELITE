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

<script type="text/javascript">
    var interver = null;
	var x = 0;
	function clockAutoLoad(){
		var today = new Date();
		var hh = today.getHours().toString(); // 시
		var mm = today.getMinutes().toString();  // 분
		var ss = today.getSeconds().toString();  //초
		var getTime = (hh[1] ? hh : "0" + hh[0]) + ":" + (mm[1] ? mm : "0" + mm[0]) + ":" + (ss[1] ? ss : "0" + ss[0]);
		$('#clock').text(getTime);
	}
	function menAutoLoad(){
		if(x < 630){
		x += 70;
		men = document.getElementById("men");
		mar = document.getElementById("mar");
		clock = document.getElementById("clock");
		men.style.left = x + "px";
		mar.style.left = x + "px";
		clock.style.left = 20+x + "px";
		//$("#text").text(x);
		//$('#men').css('left', x);
		//$('#men1').animate({left:30}, "slow");
		}else{
			x = 0;
		}
	}
</script>

</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border: 1px solid red; margin: 10px 30px;"><h2>main page</h2></div>
				<div id="page_contents" style="max-width: 1730px; border: 1px solid yellow; margin: 50px 50px;">
     			<!-- 컨텐츠 들어갈내용 시작-->

	   			<div class="row">
		    <div class="col-lg-6">
		      One of three columns 첫번째
		      <h2 style="text-align:center;">출근|퇴근|외출 상황</h2>
			  <div id="emp_table" style="width:100%; height:300px;">
			  	<div class="table-responsive">
				  	 <table id="testTable"
				  	 		class="table table-hover"
				  	 		data-toggle="table"
				  	 		data-url="../home/SearchJson.json">
		                 <thead class="thead-light">
		                     <tr>
		                         <th data-field="CF_NAME">상태</th>
		                         <th data-field="DEPT_NAME">시간</th>
		                     </tr>
		                 </thead>
		             </table>
	             </div>
			  </div>	
			  <hr>
		    </div>
		    
		    <div class="col-lg-6">
		      One of three columns 두번째
		      <h2 style="text-align:center;">회의실</h2>
		      <div id="cf_table" style="width:100%;; height:300px;"></div>
			<script src="../js/react/cfTableContainer.bundle.js"></script>
		    <hr>
		    </div>
		  </div>
		  
		  <div class="row">
		  
		    <div class="col-lg-6">
		      One of three columns 세번째
		      <div id="todo_table"></div>
			  <script src="../js/react/todoContainer.bundle.js"></script>
		    </div>
		    
		    
		<div class="col-lg-6">
		 	<div id="text"></div>
		      One of three columns 네번째<br>
		      <div class="container">
		      	<div class="row">
		      		<div class="col-lg-12" style="height:100px;">
						<img id="mar" src="./img/mar.png" style="width: 100px; left: 0px; bottom: 30px; position: absolute;">
						<div id="clock" style="left: 20px; width: 100px; bottom: 60px; font-size: 1em; font-weight: bold; position: absolute;">현재시간</div>
					</div>
		      	</div>
			      <div class="row">
				      <div class="col-lg-12">
				      <img id="men" alt="달리는 사람" src="./img/run2.gif" style="width:80px; height:100px; left: 0px; position: absolute;"/><!-- float:left; -->
				      <i class="fas fa-home" style="width:100px; height:100px; float:right;"></i>
				      </div>
			      </div>
				  <div class="row">
				      <div class="col-lg-12">
				      <table style="width:100%;">
				     	<tbody>
					      	<tr style="font-size:20px; float:center;">
					      	<td style="width:10%;">출근</td>
					      	<td style="width:10%;">1시간</td>
					      	<td style="width:10%;">2시간</td>
					      	<td style="width:10%;">3시간</td>
					      	<td style="width:10%;">4시간</td>
					      	<td style="width:10%;">5시간</td>
					      	<td style="width:10%;">6시간</td>
					      	<td style="width:10%;">7시간</td>
					      	<td style="width:20%;">퇴근(8시간)</td>
					      	</tr>
				      	</tbody>
				      </table>
				      </div>
			      </div>
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
<!-- 버거 메뉴 활성화 -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			function clockStart(){
				intervel = setInterval(clockAutoLoad, 1000); //3초마다 autoLoad함수 호출 - 타임라인 걸기성공
			}
			clockStart();
			
			function menStart(){
				intervel = setInterval(menAutoLoad, 1000);
			}
			menStart();
		});
	</script>
</body>
</html>
