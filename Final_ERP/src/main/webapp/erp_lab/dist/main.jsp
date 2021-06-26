<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
      <script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <link href="main.css?after" rel="stylesheet" />
		<%@include file ="../../common/bootStrap4UI.jsp" %>
		<%@include file ="../../common/fontAwesomeUI.jsp" %>
		<link href="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.css" rel="stylesheet">
		<script src="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.js"></script>
<title>2RP PROGRAM</title>
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
        <nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color:#282828; text-align: center;">
           <!-- 버거바 -->
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- 메인 이름 -->
            <a class="navbar-brand" href="main.jsp" style="width:100%;" >2RP PROGRAM</a>
            <!-- 홈버튼 위치 -->
            
      </nav>
       <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="background-color:#323232 ">
                
                    <div class="sb-sidenav-footer" style="background-color:#323232; margin-top:10px;">
                       <div class="container">
                          <div class="row">
                              <div class="col" style="width:40%; left:5px;"><img class="rounded-circle" alt="사원얼굴" src="111111.jpg" style="width:60px; height:60px;"></div>
                              <div class="col" style="width:60%; left:-15px; text-align:center; padding: 20px 0px;">개구리 사원</div>
                           </div>
                           <div class="row">
                              <div style="width:50%; padding: 5px 5px;"><button class="bg-dark">회원수정</button></div>
                              <div style="width:50%; padding: 5px 5px;"><button class="bg-white">로그아웃</button></div>
                           </div>
                       </div>
                    </div>
                    
                    
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                                 My Service
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>
                            
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                               <nav class="sb-sidenav-menu-nested nav">
                              <!--  <a class="nav-link" href="javascript:nextClick()">출|퇴관리</a> -->
                              <a class="nav-link" href="#">출|퇴관리</a>
                               <a class="nav-link" onclick="empSal()">급여관리</a>
                               <a class="nav-link" href="../cal/EmpSchedule.jsp">개인일정</a>
                               </nav>
                            </div>
               
                          <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                               Work    
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                     		                     전자결제
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="login.html">내 결제함</a>
                                        <a class="nav-link" href="register.html">결제양식</a>
                                        <a class="nav-link" href="password.html">결제신청</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                 		      인사
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div></a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="401.html">조직도</a>
                                        <a class="nav-link" href="404.html">사원관리</a>
                                        <a class="nav-link" href="500.html">파견사원</a>
                                        </nav>
                                    </div>
                                     <a class="nav-link" href="../cal/deptSchedule.jsp" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                      	 부서일정
                                     <div class="sb-sidenav-collapse-arrow"></div></a>
                                     <a class="nav-link" href="#" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                 		     관리자
                                     <div class="sb-sidenav-collapse-arrow"></div></a>
                                </nav>
                            </div>
                            
                            <a class="nav-link" href="../cal/conference.jsp"><div class="sb-nav-link-icon"><i class="fas fa-calendar"></i></div>Conference</a>
                            <a class="nav-link" href="tables.html"><div class="sb-nav-link-icon"><i class="fas fa-comments"></i></div>Chat</a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main id="input_div" >
                <!-- insert here -->
                <div id="frame_div" style="border: 1px solid black;">
	   				<div id="page_title" style="border: 1px solid red; margin: 10px 30px;"><h2>Main</h2></div>
	  				<div id="page_contents" style="border: 1px solid yellow; margin: 50px 50px;">
	   			<div class="row">
		    <div class="col-lg-6">
		      One of three columns 첫번째
		      <h2 style="text-align:center;">출근|퇴근|외출 상황</h2>
			  <div id="emp_table" style="width:100%; height:300px;">
			  	<div class="table-responsive">
				  	 <table id="testTable"
				  	 		class="table table-hover"
				  	 		data-toggle="table"
				  	 		data-url="./SearchJson.json">
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
			<script src="/js/react/cfTableContainer.bundle.js"></script>
		    <hr>
		    </div>
		  </div>
		  
		  <div class="row">
		  
		    <div class="col-lg-6">
		      One of three columns 세번째
		      <div id="todo_table"></div>
			  <script src="/js/react/todoContainer.bundle.js"></script>
		    </div>
		    
		    <div class="col-lg-6">
		 	<div id="text"></div>
		      One of three columns 네번째<br>
		      <div class="container">
		      	<div class="row">
		      		<div class="col-lg-12" style="height:100px;">
						<img id="mar" src="../img/mar.png" style="width: 100px; left: 0px; bottom: 30px; position: absolute;">
						<div id="clock" style="left: 20px; width: 100px; bottom: 60px; font-size: 1em; font-weight: bold; position: absolute;">현재시간</div>
					</div>
		      	</div>
			      <div class="row">
				      <div class="col-lg-12">
				      <img id="men" alt="달리는 사람" src="../img/run2.gif" style="width:80px; height:100px; left: 0px; position: absolute;"/><!-- float:left; -->
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
	   				</div>
				</div>
                </main>
            </div>
        </div>
        <!-- 슬라이드바 사용할때 필요 -->
       <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
       	<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
       <!-- 버거 메뉴 활성화 -->     
        <script src="../dist/js/scripts.js"></script>
</body>
</html>