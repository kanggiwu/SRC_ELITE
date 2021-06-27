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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
  	  rel="stylesheet" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous" ></script>
<link href="../common/main.css" rel="stylesheet" />
<link href="../common/css/custom.css" rel="stylesheet" />
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
<title>2RP PROGRAM</title>

</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;"><h2>급여관리</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
     			<!-- 컨텐츠 들어갈내용 시작-->

   <div>
     <table class="table table-bordered table-hover"  id="testTable"
                       id="table"
              data-toggle="table"
              data-height="650"
              data-search="true"
              data-show-columns="true"
             data-method="post"
              data-pagination="true"
                  data-url="./member.json">
    <thead>
      <tr>
        <th>날짜</th>
        <th>사원명</th>
        <th>부서</th>
        <th>직급</th>
        <th>기본급</th>
        <th>고용보험</th>
        <th>건강보험</th>
        <th>소득세</th>
        <th>주민세</th>
        <th>공제계</th>
        <th>인센티브</th>
        <th>실수령액</th>
        <th>선택</th>
      </tr>
    </thead>
    <tbody>
      <tr onclick="location.href='empSalDetail.jsp'">
        <td>2020-02-16</td>
        <td>개구리</td>
        <td>인사과</td>
        <td>사원</td>
        <td>2,300,000</td>
        <td>120,000</td>
        <td>80,000</td>
        <td>6,000</td>
        <td>8,000</td>
        <td>312,000</td>
        <td>0</td>
        <td>1,988,000</td>
        <td>
        <input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
                        <label></label>
        </td>
        </tr>
      <tr onclick="window.open('empSalDetail.jsp','window_name','width=1200,height=564,location=no,status=no,scrollbars=yes');">
        <td>2020-02-16</td>
        <td>개구리</td>
        <td>인사과</td>
        <td>사원</td>
        <td>2,300,000</td>
        <td>120,000</td>
        <td>80,000</td>
        <td>6,000</td>
        <td>8,000</td>
        <td>312,000</td>
        <td>0</td>
        <td>1,988,000</td>
        <td>
        <input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
                        <label></label>
        </td>
        </tr>
      <tr>
        <td>2020-02-16</td>
        <td>개구리</td>
        <td>인사과</td>
        <td>사원</td>
        <td>2,300,000</td>
        <td>120,000</td>
        <td>80,000</td>
        <td>6,000</td>
        <td>8,000</td>
        <td>312,000</td>
        <td>0</td>
        <td>1,988,000</td>
        <td>
        <input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
                        <label></label>
        </td>
        </tr>
      <tr>
        <td>2020-02-16</td>
        <td>개구리</td>
        <td>인사과</td>
        <td>사원</td>
        <td>2,300,000</td>
        <td>120,000</td>
        <td>80,000</td>
        <td>6,000</td>
        <td>8,000</td>
        <td>312,000</td>
        <td>0</td>
        <td>1,988,000</td>
        <td>
        <input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
                        <label></label>
        </td>
        </tr>
      <tr>
        <td>2020-02-16</td>
        <td>개구리</td>
        <td>인사과</td>
        <td>사원</td>
        <td>2,300,000</td>
        <td>120,000</td>
        <td>80,000</td>
        <td>6,000</td>
        <td>8,000</td>
        <td>312,000</td>
        <td>0</td>
        <td>1,988,000</td>
        <td>
        <input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
                        <label></label>
        </td>
        </tr>
      <tr>
        <td>2020-02-16</td>
        <td>개구리</td>
        <td>인사과</td>
        <td>사원</td>
        <td>2,300,000</td>
        <td>120,000</td>
        <td>80,000</td>
        <td>6,000</td>
        <td>8,000</td>
        <td>312,000</td>
        <td>0</td>
        <td>1,988,000</td>
        <td>
        <input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
                        <label></label>
        </td>
        </tr>
      <tr>
        <td>2020-02-16</td>
        <td>개구리</td>
        <td>인사과</td>
        <td>사원</td>
        <td>2,300,000</td>
        <td>120,000</td>
        <td>80,000</td>
        <td>6,000</td>
        <td>8,000</td>
        <td>312,000</td>
        <td>0</td>
        <td>1,988,000</td>
        <td>
        <input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
                        <label></label>
        </td>
        </tr>
      <tr>
        <td>2020-02-16</td>
        <td>개구리</td>
        <td>인사과</td>
        <td>사원</td>
        <td>2,300,000</td>
        <td>120,000</td>
        <td>80,000</td>
        <td>6,000</td>
        <td>8,000</td>
        <td>312,000</td>
        <td>0</td>
        <td>1,988,000</td>
        <td>
        <input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
                        <label></label>
        </td>
        </tr>
      <tr>
        <td>2020-02-16</td>
        <td>개구리</td>
        <td>인사과</td>
        <td>사원</td>
        <td>2,300,000</td>
        <td>120,000</td>
        <td>80,000</td>
        <td>6,000</td>
        <td>8,000</td>
        <td>312,000</td>
        <td>0</td>
        <td>1,988,000</td>
        <td>
        <input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
                        <label></label>
        </td>
        </tr>
      <tr>
        <td>2020-02-16</td>
        <td>개구리</td>
        <td>인사과</td>
        <td>사원</td>
        <td>2,300,000</td>
        <td>120,000</td>
        <td>80,000</td>
        <td>6,000</td>
        <td>8,000</td>
        <td>312,000</td>
        <td>0</td>
        <td>1,988,000</td>
        <td>
        <input type="checkbox" class="styled" id="singleCheckbox1" value="option1" aria-label="Single checkbox One">
                        <label></label>
        </td>
        </tr>
    </tbody>
  </table>
  </div>

 		  	<div class="text-center">
 			<div class="text-center" align="center">
  		 	<ul class="pagination justify-content-center">
   		 	 	<li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
 		   	 	<li class="page-item"><a class="page-link" href="#">1</a></li>
  				 <li class="page-item"><a class="page-link" href="#">2</a></li>
  				 <li class="page-item"><a class="page-link" href="#">3</a></li>
  				 <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
	 		 </ul>
	 		</div>
	 		<div style="float:right;">
	 			<label>전체 영수증 다운로드</label>
	 			<img alt="" src="download.png" style="width:30px; height:30px;">
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
<script src="../common/js/topNav.js"></script>
<!-- 사이드 메뉴 사용 -->
<script src="../common/js/sideNav.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous" ></script>
<script src="../common/scripts.js"></script>
<!-- 버거 메뉴 활성화 -->
</body>
</html>
