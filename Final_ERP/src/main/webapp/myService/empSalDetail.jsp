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
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous"/>

<link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.css" />
<link href="../common/main.css" rel="stylesheet" />
<link href="../common/css/custom.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
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
					<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
						<h2>상세급여</h2>
					</div>
					<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
						<!-- 컨텐츠 들어갈내용 시작-->

				
   <div class="container">
	<div class="col" >
		<div style="text-align: right; padding: 5px;">
			<button class="btn btn-danger">인쇄</button>
		
		</div>
	</div>
   <div class="col" style="padding: 10px; background-color:; border: 1px solid black; ">
   
  <h2>2020년 06월 20일 급여</h2>

  <table class="table">
    <tbody>
      <tr style="font-size: small;">
        <td style="width:12.5%">성명 : </td>
        <td style="width:12.5%">개구리</td>
        <td style="width:12.5%">부서 : </td>
        <td style="width:12.5%">인사과</td>
        <td style="width:12.5%">직책 : </td>
        <td style="width:12.5%">사원</td>
        <td style="width:12.5%">지급일 : </td>
        <td style="width:12.5%">2020-06-07</td>
      </tr>
      <tr style="font-size: small;">
        <td >은행 : </td>
        <td ></td>
        <td >국민</td>
        <td ></td>
        <td >계좌번호 : </td>
        <td ></td>
        <td >964016-0454787</td>
        <td ></td>
        
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
        <td></td>
       
      </tr>
    </tbody>
  </table>
    <table class="table table-bordered table-sm">
    <thead>
      <tr >
        <th style="width:25%">지급항목</th>
        <th style="width:25%">지급액</th>
        <th style="width:25%">공제항목</th>
        <th style="width:25%">공제액</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>기본급여</td>
        <td>2,080,000</td>
        <td>소득세</td>
        <td>8,000</td>
      
      </tr>
      <tr>
		<td>인센티브</td>
        <td></td>
        <td>주민세</td>
        <td></td>
      </tr>
      <tr>
		<td></td>
        <td></td>
        <td>고용보험</td>
        <td></td>
      </tr>
      <tr>
		<td></td>
        <td></td>
        <td>국민연금</td>
        <td></td>
      </tr>
      <tr>
		<td></td>
        <td></td>
        <td>건강보험</td>
        <td></td>
      </tr>
      <tr>
		<td>급여합계</td>
        <td></td>
        <td>공제합계</td>
        <td></td>
      </tr>
    </tbody>
  </table>
  
   <table class="table table-bordered table-sm">
    <thead>
      <tr>
        <th style="width:50%">실수령액</th>
        <th style="width:50%">1,920,000</th>
      </tr>
   </thead>
   </table>
   </div>
   </div>

						
						<!-- 컨텐츠 들어갈내용 끝   -->
					</div>
				</div>
			</main>
		</div>
	</div>
<!-- 슬라이드바 사용할때 필요 -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="https://unpkg.com/bootstrap-table@1.16.0/dist/bootstrap-table.min.js"></script>



<!-- 탑메뉴 사용 -->
<script src="../common/js/topNav.js"></script>
<!-- 사이드 메뉴 사용 -->
<script src="../common//js/sideNav.js"></script>

<script src="../common/scripts.js"></script>
<!-- 버거 메뉴 활성화 -->
</body>
</html>