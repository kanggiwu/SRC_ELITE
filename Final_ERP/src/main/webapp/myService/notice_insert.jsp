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

<title>공지사항 내용</title>
</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
     	<link rel="stylesheet" href="{{ url_for('static', filename='bootstrap.min.css') }}">
     			<!-- 컨텐츠 들어갈내용 시작-->
     	
     	    <div class="label">
     	    <!--분류 선택-->
		<select class="label-control">
	  <option>분류</option>
	  <option>공통</option>
	  <option>인사</option>
	  <option>회계</option>
	  <option>개발</option>
	 </select>
	 <!-- 제목입력 -->
	          <input type="text" class="label-control" id="title"
       placeholder="공지 제목 입력(2-100)" name="title"
       maxlength="100" required="required"
       pattern=".{2,100}">
    
    <!-- 내용입력 -->
    <div class="form-group">
   <label for="content">내용</label>
<!-- placeholder 속성 입력한 데이터가 없는 경우 배경으로 나타난다.실제적으로 입력을 100자까지로 지정 -->
   <textarea class="form-control" rows="5" id="content"
    name="content" placeholder="내용 작성"></textarea>
 <!-- 등록 버튼 -->
  </div>
     	<!-- 내용업데이트(?) -->
								<a class="btn btn-primary" onClick="location.href='notice_add.jsp'">등록</a>
									<!-- @RequestMapping("/boardUpdate.do") public String
									getBoardForUpdate { 
                    
									board=boardService.getBoard(vo.getId());
									model.addAttribute("board" ,board); return "notice.detail.jsp";  
									@RequestMapping("/updateProcess.do")
									public String updateProcess(BoardVOvo) { 
                     boardService.modifyBoard(vo); 
                     return "redirect:notice.jsp; }} -->
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