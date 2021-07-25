<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
	//List<Map<String,Object>> getDetailApproval2 = null;
	String[] token = null; 
	token = (String[])request.getAttribute("token");
	String deptName = token[0];
	String empName = token[1];
	String period = token[2];
	String reason = token[3];
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
<link href="../common/main.css" rel="stylesheet" />
<link href="../common/css/custom.css" rel="stylesheet" />
<title>휴가계획서</title>
<div id="page_vacationPlan" style="border-bottom: 2px solid gray; margin: 50px 30px;">
<h2>휴가계획서</h2></div>
</head>
<body>
<div class="container">
		<div class="form-group" >
			<label for="lab_deptName">부서명</label>				
			<input type="text" class="form-control" id="txt_deptName" value="<%=deptName%>" readonly>				
		</div>
		<div class="form-group">
			<label for="lab_empName">사원명</label>
			<input type="text" class="form-control" id="txt_empName" value="<%=empName%>" readonly>
		</div>
		<div class="form-group">
			<label for="lab_period">기간</label>
			<input type="text" class="form-control" id="txt_period" value="<%=period%>" readonly>
		</div>
		<div class="form-group">
			<label for="lab_reason">내용(사유)</label>
			<textarea class="form-control" id="txt_reason" rows="5" cols="50" readonly><%=reason%></textarea>
		</div>
		<div class="col text-center">
			<!-- <button type="button" id="rejectAct" class="btn btn-info btn-lg" onclick="rejectAction()">
			반려</button>	 -->
			<a href="javascript:void(0)" onclick="rejectAction()" class="btn btn-info btn-lg">반려</a>
			<a href="javascript:void(0)" id="appBtn" onclick="approvalAction()" class="btn btn-warning btn-lg">승인</a>
			<!-- <button type="submit" id="approvalAct" class="btn btn-warning btn-lg" onclick="approvalAction()">
			결재</button>	 -->
		</div>
	
</div>
</body>
</html>
<script>
//get방식으로 넘어온 값 읽어들이기
function getParams() {
    // 파라미터가 담길 배열
    var param = new Array();
 
    // 현재 페이지의 url
    var url = decodeURIComponent(location.href);
    // url이 encodeURIComponent 로 인코딩 되었을때는 다시 디코딩 해준다.
    url = decodeURIComponent(url);
 
    var params;
    // url에서 '?' 문자 이후의 파라미터 문자열까지 자르기
    params = url.substring( url.indexOf('?')+1, url.length );
    // 파라미터 구분자("&") 로 분리
    params = params.split("&");

    // params 배열을 다시 "=" 구분자로 분리하여 param 배열에 key = value 로 담는다.
    var size = params.length;
    var key, value;
    for(var i=0 ; i < size ; i++) {
        key = params[i].split("=")[0];
        value = params[i].split("=")[1];

        param[key] = value;
    }

    return param;
}

//반려
function rejectAction(){
	alert("반려");
    let p = getParams();
    alert("p['aprv_no'] = "+p["aprv_no"]);
    
    let p_aprv_no = p["aprv_no"]; 
    alert (p_aprv_no);
	
	let p_sign_permission = "F";
	$.ajax({
		//alert("ajax 들어왔어요");
		type:"post",
		  data:{"p_aprv_no":p_aprv_no,"p_sign_permission":p_sign_permission},
		  url: "/approval/permissionApproval.src1",
		  //dataType:"json",
	          success:function(data){
	        	  alert("반려되었습니다");
	  	      },
	          error:function(e){
	        	  let x = e.responseXML;
	        	  alert("fail ===> "+e)
	          } 
	});
}
//승인
function approvalAction(){
	alert("승인");
    let p = getParams();
    alert("p['aprv_no'] = "+p["aprv_no"]);
    
    let p_aprv_no = p["aprv_no"]; 
    alert (p_aprv_no);
	
	let p_sign_permission = "T";
	$.ajax({
		type:"post",
		  data:{"p_aprv_no":p_aprv_no,"p_sign_permission":p_sign_permission},
		  url: "/approval/permissionApproval.src1",
		  //dataType:"json",
	          success:function(data){
	        	  alert("승인되었습니다");
	        	  //$("#appBtn").prop("disabled", true);
	        	  $('#appBtn').addClass('disabled');  //appBtn버튼 비활성화
	  	      },
	          error:function(e){
	        	  let x = e.responseXML;
	        	  alert("fail ===> "+e)
	          } 
	});
}
</script>