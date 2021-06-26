<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	String emp_name = (String)session.getAttribute("emp_name");
	String dept_name = (String)session.getAttribute("dept_name");
	List<Map<String, Object>> rList = (List<Map<String, Object>>)request.getAttribute("todayInOutList");
 	if(rList == null){
		rList = new ArrayList<>();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->  
<!--관리자 로그에 필요한 코드 시작=================================================================================-->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.css" />
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous" ></script>
<link href="../common/main.css" rel="stylesheet" />
<!-- 구글 차트 API에 필요 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<link href="../common/css/custom.css" rel="stylesheet" />
<script src="../js/bootstrap.min.js"></script>
	<title>2RP PROGRAM</title>

<script type="text/javascript">
      /***************** PIE CHART ********************/
	var chartData = null;
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(pieDrawChart);
		 
	function pieDrawChart() {
		/* 개인일정 받아오는 프로시저가 뭐지.. 분단위로 주는 프로시저가 안보인다...  */
		var today = new Date();
		var yyyy = today.getFullYear().toString(); 
		var month = (today.getMonth()+1).toString();  
		var date = today.getDate().toString(); 
		var msg = yyyy+"-"+month+"-"+date;
		var jsonData = $.ajax({
			url: "myScheduleChart.erp?cud=myScheduleChart"
			,dataType: "json"
			,async: false
		}).responseText;
		//alert(jsonData);
		var pieData = new google.visualization.DataTable(jsonData);

		/*  pieData.addColumn('string', 'SCHEDULE');
			pieData.addColumn('number', 'TIME'); */
			
 		/*	pieData.addRows([
				['점심시간 12:00~1:00',60]
			]);  */
		var pieOptions = {
			title: '근무일정[분 단위]'
				,'width':'100%'
				,'height':400
				,pieSliceText: 'label'
				,pieStartAngle: 180
				,legend: 'none'
				, slices: {0: {offset: 0.2}}/* jsonData.length  */
				,tooltip: {
			        trigger: 'selection'
			    },
	    		pieResidueSliceColor: "yellow"
		};
		var chart = new google.visualization.PieChart(document.getElementById('piechart'));
			chart.draw(pieData, pieOptions);
			window.addEventListener('resize', pieDrawChart, false);
		}
		
	/***************** CURVE CHART ********************/
    /* google.charts.load('current', {'packages':['corechart']}); */
	google.charts.setOnLoadCallback(curvDrawChart);

    function curvDrawChart() {
	var jsonData1 = $.ajax({
				url: "weekChart.erp?cud=weekChart"
				,dataType: "json"
				,async: false
	}).responseText;
	var curvData = new google.visualization.DataTable(jsonData1);
/*  	['day', '근무시간'],
        ['월',  2],
        ['화',  4],
        ['수',  8],
        ['목',  10],
        ['금',  8] */
          
	var options = {
		title: '근무시간[주 단위]'
		,curveType: 'function'
		,'width':'100%'
		,'height':400
		,colors:['pink']
		,legend: { position: 'bottom' }
	};
	var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
	chart.draw(curvData, options);
	window.addEventListener('resize', curvDrawChart, false);
	}
	function go(){
		var goText = $("#go").text();
		alert("출근");
		alert(goText+" goTex");
		var today = new Date();   
		var  hours = today.getHours(); // 시
		var minutes = today.getMinutes();  // 분
		//var second  = today.getSeconds();
		hours = hours < 10 ? '0'+hours : hours;
		minutes = minutes < 10 ? '0'+minutes : minutes;
		//second = second < 10 ? '0'+second : second;
		alert(hours+ ':' + minutes);
		var msg = hours+ ':' + minutes;
		if(goText == "-"){
			$("#go").text(msg);
			$.ajax({
				url:"myGoWork.erp",
				success:function(data){
					alert("업데이트 결과"+data);
					alert("출 근 성 공");
				}
			});
     	}else{
			alert("이미 출근하셨습니다.");
     	}
	}
	function out() {
		var outText = $("#out").text();
		alert("외출")
		alert(outText + " outText");
		var today = new Date();
		var hours = today.getHours(); // 시
		var minutes = today.getMinutes(); // 분
		//var second = today.getSeconds();
		hours = hours < 10 ? '0'+hours : hours;
		minutes = minutes < 10 ? '0'+minutes : minutes;
		//second = second < 10 ? '0'+second : second;
		alert(hours+ ':' + minutes);
		var msg = hours+ ':' + minutes;
		if (outText == "-") {
			$("#out").text(msg);
			$.ajax({
				url : "myGoOut.erp",
				success : function(data) {
					alert("업데이트 성공" + data);
					if(data != null){
						alert("출근 성공")
					}
				}
			});
		} else {
			alert("이미 외출하셨습니다.");
		}
	}
	function comeback() {
		var comeBackText = $("#comeBack").text();
		alert("외츨복귀")
		alert(comeBackText + " comeBackText");
		var today = new Date();
		var hours = today.getHours(); // 시
		var minutes = today.getMinutes(); // 분
		//var second = today.getSeconds();
		hours = hours < 10 ? '0'+hours : hours;
		minutes = minutes < 10 ? '0'+minutes : minutes;
		//second = second < 10 ? '0'+second : second;
		alert(hours+ ':' + minutes);
		var msg = hours+ ':' + minutes;
		var outText = $("#out").text();
		alert(outText + " outText");
		if (outText != "-") {
			$("#comeBack").text(msg);
			$.ajax({
				url : "myComBack.erp",
				success : function(data) {
					alert("업데이트 성공" + data);
				}
			});
		} else {
			alert("외출을 하지 않으셨습니다.");
		}
	}
	function leave() {
		var leaveText = $("#leave").text();
		alert("퇴근");
		alert(leaveText + " leaveText");
		var today = new Date();
		var hours = today.getHours(); // 시
		var minutes = today.getMinutes(); // 분
		//var second = today.getSeconds();
		hours = hours < 10 ? '0'+hours : hours;
		minutes = minutes < 10 ? '0'+minutes : minutes;
		//second = second < 10 ? '0'+second : second;
		alert(hours+ ':' + minutes);
		var msg = hours+ ':' + minutes;

		if (leaveText == "-") {
			$("#leave").text(msg);
			$.ajax({
				url : "myGoHome.erp",
				success : function(data) {
					alert("업데이트 성공" + data);
				}
			});
		} else {
			alert("이미 퇴근하셨습니다.");
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
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;"><h2>출|퇴근 관리</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
     			<!-- 컨텐츠 들어갈내용 시작-->

				<div style="margin-top: 10px;" class="row">
				<div class="col-lg-1"></div>
				<div class="col-lg-10">
					<div class="small-unit" align="right">
						<button type="button" onclick="go()" class="btn btn-info" style="width:100px;">출근</button>
						<button type="button" onclick="out()" class="btn btn-info" style="width:100px;">외출</button>
						<button type="button" onclick="comeback()" class="btn btn-info" style="width:100px;">복귀</button>
						<button type="button" onclick="leave()" class="btn btn-info" style="width:100px;">퇴근</button>
					</div>
				</div>
				<div class="col-lg-1"></div>
				</div>

				<!--테이블 태그 -->
				<div class="row" style="margin-top: 10px; width: 100%; height: 100%;">
					<!-- <div class="col-1"></div> -->
					<div class="col-12">
						<table class="table table-bordered" style="width: 100%; height:80%; ">
							<thead class="thead-dark">
								<tr>
									<th scope="col" style="text-align: center;">부서명</th>
									<th scope="col" style="text-align: center;">사원명</th>
									<th scope="col" style="text-align: center;">출근</th>
									<th scope="col" style="text-align: center;">퇴근</th>
									<th scope="col" style="text-align: center;">외출</th>
									<th scope="col" style="text-align: center;">복귀</th>
									<th scope="col" style="text-align: center;">휴가</th>
								</tr>
							</thead>
							<tbody>
								<tr >
									<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;"><%=dept_name %></td>
									<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;"><%=emp_name %></td>
								<%
								if(rList.size() == 0){
								%>
									<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;" id="go">-</td>
									<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;" id="leave">-</td>
									<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;" id="out">-</td>
									<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;" id="comeBack">-</td>
									<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;">-</td>
									<%
								}
								else if(rList.size() > 0){
									Map<String, Object> rMap = rList.get(0);
%>
									<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;" id="go"><%=rMap.get("CM_GOTOWORK") %></td>
									<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;" id="leave"><%=rMap.get("CM_GOTOHOME") %></td>
									<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;" id="out"><%=rMap.get("CM_OUTTIME")%></td>
									<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;" id="comeBack"><%=rMap.get("CM_COMEBACK")%></td>
									<td scope="col" style="text-align: center; font-weight:bold; font-size: 20px; padding-top: 20px;">-</td>
								<%
	}
								%>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- <div class="col-lg-1"></div> -->
				</div>
				<!--테이블 끝태그  style="justify-content: center"-->

				<div class="row" style="background-color: #DCEBFF; width: 100%; height: 100%; float: center;" align="center">
					<div class="col-lg-6" style="padding: 12px; width: 100%; height: 100%;">
						<div style="width: 100%; height: 100%; float: center" align="center" id="piechart"></div>
					</div>
					<div class="col-lg-6" style="padding: 12px; width: 100%; height: 100%;">
						<div style="width: 100%; height: 100%;" align="center" id="curve_chart"></div>
					</div>
					<!-- <div class="col-6" style="width: 100%; height: 100%; background-color: black;" align="center" id="piechart"></div> -->
					<!-- <div class="col-6" style="width: 100%; height: 100%; background-color: black;" align="center" id="curve_chart"></div> -->
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
<script src="../common/js/topNav.js"></script>
<!-- 사이드 메뉴 사용 -->
<script src="../common/js/sideNav.js"></script>
<!-- 버거 메뉴 활성화 -->

 <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>

<script src="../common/scripts.js"></script>
</body>
</html>
