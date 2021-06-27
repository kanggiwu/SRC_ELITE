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
<title>Insert title here</title>
</head>
<body>
<br><br>
<div class="container">
<div class="row">
   <div class='col-sm-6'  >
		<form class="form-horizontal" role="form">
			<div class="form-group" >
				<label for="txt_proName">프로젝트명</label>				
				<input type="text" class="form-control" id="txt_proName">				
			</div>
			<div class="form-group">
				<label for="dat_period">기간</label>
				<div class="form-inline">
					<input type="date" class="form-control" id="dat_period">&nbsp; ~ &nbsp;
					<input type="date" class="form-control" id="dat_period">
				</div>
			</div>
			<div class="form-group">
				<label for="txt_company">발주사</label>
				<input type="text" class="form-control" id="txt_company">
			</div>
			<div class="form-group">
				<label for="txt_emp">담당자</label>
				<input type="text" class="form-control" id="txt_emp">
			</div>
			<div class="form-group">
				<label for="txt_prodeeds">수익금</label>
				<input type="text" class="form-control" id="txt_prodeeds">
			</div>
			<div class="form-group">
				<label for="txt_kind">종류</label>
				<input type="text" class="form-control" id="txt_kind">
			</div>
		</form>
		</div>		
		<div class='col-sm-6'>
		<form class="form-horizontal" role="form">
			<div class="form-group">
				<div class='col-sm-3'><label for="txt_emps">인력</label></div>
				<textarea class="form-control" id="txt_emps" rows="3" cols="50"></textarea>					
			</div>
			<div class="form-group">
				<label for="txt_skills">기술</label>
				<textarea class="form-control" id="txt_skills" rows="3" cols="50"></textarea>					
			</div>
			<div class="form-group">
				<label for="txt_content">개발내용</label>
				<textarea class="form-control" id="txt_content" rows="10" cols="50"></textarea>					
			</div>
		</form>
		</div>
	</div>
	</div> 	
		<div class="text-right container">
		<button type="button" class="btn btn-info" onClick="self.close()">확인</button>	
	</div>		

</body>
</html>