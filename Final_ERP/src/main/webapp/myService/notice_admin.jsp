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
<title>공지사항(관리자)</title>
</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
				<h2>공지사항(관리자)</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
     	<link rel="stylesheet" href="{{ url_for('static', filename='bootstrap.min.css') }}">
     			<!-- 컨텐츠 들어갈내용 시작-->       
     			    			<!-- 검색버튼 -->  
     			<div class= col-xs-4 style="text-align: left; padding: 5px; display: inline-block; width: 40%;">
	<span class="input-group">
	        <select class="form-control">
          <option value="" selected disabled hidden >분류</option>
          <option>공통</option>
          <option>인사</option>
          <option>회계</option>
          <option>개발</option>
         </select>

  <div class="col-xs-2">
    <input type="text" class="form-control " placeholder="검색">
  </div>  
    <a class="btn btn-default" href="" role="button"><i class="fas fa-search"></i></a>
    </span>
    </div>
    	     			<!-- 추가버튼 클릭시 내용 추가 창으로 이동 -->
     			<div style="text-align: right; padding: 5px; display: inline-block; width: 59%">
     			<button class="btn btn-primary btn-sm pull-right" onClick="location.href='notice_insert.jsp'">추가</button>
     			<button class="btn btn-primary btn-sm pull-right" onClick="location.href='notice_update.jsp'">수정</button>
     			<button class="btn btn-primary btn-sm pull-right" onClick="#">삭제</button>
     		    </div>
    <table class="table table-bordered table-striped" id="products">
    	<!-- 페이징 처리 부분 //반드시 테이블 안에 넣어야됨// -->
                     <form action="" id="setRows">
                    <input type="hidden" name="rowPerPage" value="2" id="rowPerPage">
                  </form>
                  <!-- 공지부분 -->
            <thead>
        <tr class="thead-dark">
            <th>분류</th>
            <th>공지제목</th>
            <th>등록일</th> 
        </tr>
        </thead>
        <tbody>
            <!-- 상세보기 페이지 이동 -->
        <tr onClick="location.href='notice_detail_admin.jsp'">
              <td>공통</td>
            <td>
                홈페이지 점검 안내
            </td>
             <td>2021-07-15</td>
        </tr>
        <tr>
              <td>인사</td>
            <td>
                공지사항1
            </td>
          
            <td>2021-07-14</td>
        </tr>
        <tr>
              <td>회계</td>
            <td>
               공지사항2
            </td>
                       <td>2021-07-02</td>
        </tr>
  </tbody>
    </table>
<!-- 
<div class="text-center">
 			<div class="text-center" align="center">
  		 	<ul class="pagination justify-content-center">
   		 	 	<li class="page-item"><a class="page-link" href="#">처음</a></li>
   		 	 	<li class="page-item"><a class="page-link" href="#">이전</a></li>
 		   	 	<li class="page-item"><a class="page-link" href="#">1</a></li>
  				 <li class="page-item"><a class="page-link" href="#">2</a></li>
  				 <li class="page-item"><a class="page-link" href="#">3</a></li>
  				 <li class="page-item"><a class="page-link" href="#">4</a></li>
  				 <li class="page-item"><a class="page-link" href="#">5</a></li>
  				 <li class="page-item"><a class="page-link" href="#">6</a></li>
  				 <li class="page-item"><a class="page-link" href="#">7</a></li>
  				 <li class="page-item"><a class="page-link" href="#">8</a></li>
  				 <li class="page-item"><a class="page-link" href="#">9</a></li>
  				 <li class="page-item"><a class="page-link" href="#">10</a></li>
  				 <li class="page-item"><a class="page-link" href="#">다음</a></li>
  				 <li class="page-item"><a class="page-link" href="#">끝</a></li>
	 		 </ul>
	 		</div> -->
		<!-- 컨텐츠 들어갈내용 끝   -->
<!-- 페이징 처리 부분  -->
<script src="../common/js/paging.js"></script>
<!-- 슬라이드바 사용할때 필요 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!-- 탑메뉴 사용 -->
<script src="../common/js/topNav_admin.js"></script>
<!-- 사이드 메뉴 사용 -->
<script src="../common/js/sideNav_admin.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous" ></script>
<script src="../common/scripts.js"></script>
</body>
</html>