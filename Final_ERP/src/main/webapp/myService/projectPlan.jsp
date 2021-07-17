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
<title>프로젝트계약확정서</title>
<div id="page_vacationPlan" style="border-bottom: 2px solid gray; margin: 50px 30px;">
<h2>프로젝트계약확정서</h2></div>
</head>
<body>
<div class="container">
	<form class="form-horizontal" role="form">
		<div class="form-group" >
			<label for="lab_projectName">프로젝트명</label>				
			<input type="text" class="form-control" id="txt_projectName" value="" readonly>				
		</div>
		<div class="form-group">
			<label for="lab_company">발주사</label>
			<input type="text" class="form-control" id="txt_company" value="" readonly>
		</div>
		<div class="form-group">
			<label for="lab_period2">기간</label>
			<input type="text" class="form-control" id="txt_period2" value="" readonly>
		</div>
		<div class="form-group">
			<label for="lab_benefit">수익금</label>
			<input type="text" class="form-control" id="txt_benefit" value="" readonly>
		</div>
		<div class="form-group">
			<label for="lab_kind">종류</label>
			<input type="text" class="form-control" id="txt_kind" value="" readonly>
		</div>
		<div class="form-group">
			<label for="lab_context">개발내용</label>
			<textarea class="form-control" id="txt_context" rows="5" cols="50" readonly></textarea>
		</div>
		<div class="col text-center">
			<button type="submit" id="rejectAct" class="btn btn-info btn-lg" onclick="rejectAction()">
			반려</button>	
			<button type="submit" id="approvalAct" class="btn btn-warning btn-lg" onclick="approvalAction()">
			결재</button>	
		</div>
		&nbsp;
	</form>
	
</div>
</body>
</html>