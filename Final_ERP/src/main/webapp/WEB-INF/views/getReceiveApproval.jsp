<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
	List<Map<String,Object>> getReceiveApproval = null;
	getReceiveApproval = (List<Map<String,Object>>)request.getAttribute("getReceiveApproval");
	int size = 0;
	String aprvRead = null;
	if(getReceiveApproval!=null){
		size = getReceiveApproval.size();
	}
	out.print("size:"+size);
	String aprvStatus = "";
	String aprvStatus2 = "";
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous" >
</script>
<link href="../common/main.css" rel="stylesheet" />
<link href="../common/css/custom.css" rel="stylesheet" />
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
<script>
let title = "";
</script>
<title>전자결재 수신함</title>
</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
				<h2>전자결재 수신함</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
<!--================================= 컨텐츠 들어갈내용 시작===============================================-->
<table id="appSend" class="table table-hover">
			<thead>
				<tr style="background-color:lightgray">
					<th style="width: 2%"></th>
					<th style="width: 18%">결재번호</th>
					<th style="width: 20%">작성일</th>
					<th style="width: 25%">문서제목</th>
					<th style="width: 15%">결재상태</th>
					<th style="width: 10%"></th>
					<th style="width: 10%"></th>
				</tr>
			</thead>
			<tbody class="sendBody" id="approvalPlan">
			<%
			//조회 결과가 없는 거야?
			if(size==0){		
			%>    
			        <tr>
			            <td colspan="7">조회결과가 없습니다.</td>
			        </tr>
			<%
			}
			else{//조회 결과가 있을 때
				for(int i=0;i<size;i++){
					Map<String,Object> pmap = getReceiveApproval.get(i);
					if(i==size) break;
					aprvRead = pmap.get("APRV_READ").toString();
					//out.print("aprvRead:"+aprvRead);
					aprvStatus = pmap.get("APRV_STATUS").toString().trim();					
					//out.print("aprvStatus:"+aprvStatus);
					if(aprvStatus.equals("1")){
						aprvStatus2 = "대기중";
					}else if(aprvStatus.equals("2")){
						aprvStatus2 = "반려";					
					}else if(aprvStatus.equals("3")){
						aprvStatus2 = "결재완료";					
					}
			%>   
				<tr>
			<%
					if (aprvRead == "F") {
			%>
					<td>💌</td>
			<%
					}else { 
			%>
					<td></td>
			<%
					}
			%>
					<td><%=pmap.get("APRV_NO").toString()%></td>
					<td><%=pmap.get("APRV_DATE").toString()%></td>
					<td><%=pmap.get("APRV_TITLE").toString()%></td>
					<td><%=aprvStatus2%></td>
					<%-- <td><%=pmap.get("APRV_STATUS").toString()%></td> --%>
					<td><button type="button" class="btn btn-info btn-sm" id="btn_sel"
						onclick="openModal()">결재자조회</button></td>
					<td><button type="button" class="btn btn-info btn-sm" name="btn_app"
						onclick="openPop()">결재문서조회</button></td>
					<!-- <td><a href='javascript:void(0)' onclick='openModal()' class='btn btn-info btn-sm'>결재자조회</a></td>
					<td><a href='javascript:void(0)' onclick='openPop()' class='btn btn-info btn-sm'>결재문서조회</a></td> -->
				</tr>
			<% 
				}///end of for
			} ///end of if
			%>
			</tbody>
		</table>
					
<!--============================== 결재라인 상세조회 Modal 시작 =======================================-->
<div class="modal fade" id="mod_appLine" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">        
        <h4 class="modal-title" id="myModalLabel">결재라인검색</h4>
      </div>
      <div class="modal-body">
			<table class="table table-hover" >
				<thead>
					<tr style="background-color:lightgray">						
						<th style="width: 20%">결재순서</th>
						<th style="width: 20%">부서</th>
						<th style="width: 20%">직위</th>
						<th style="width: 20%">사원명</th>
						<th style="width: 20%">결재상태</th>
					</tr>
				</thead>
				<tbody class="modAppLine">
				<!-- 
				===============DB에서 데이터 가져와서 뿌려주기======================
				 -->
					
				</tbody>	
			</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-warning" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
 </div>

<!--============================== 결재라인 상세조회 Modal 끝 =======================================-->
			
<!--================================= 컨텐츠 들어갈내용 끝  ============================================== -->
     			</div>
			</div>
		</main>
	</div>
</div>

<!-- 결재창 -->
<script type="text/javascript">
	//$("#approvalPlan").on("click", "btn_app", function(){
	let appPlan = "";
	//모달창 오픈
 	function openModal(){
		//alert("모달창 오픈");
		$("#approvalPlan").off("click").on('click',"tr", function(){
		//현재 로우값 가져오기
	    let tr = $(this);
		let td = tr.children();
		let aprv_no = td.eq(1).text();
		//alert(aprv_no);
		$.ajax({
			type:"post",
			  data:{"aprv_no":aprv_no},
			  url: "/approval/getApproverEmp.src1",
			  dataType:"json",
		          success:function(data){
		        	  appResult2(data);
		  	      },
		          error:function(e){
		        	  let x = e.responseXML;
		        	  alert("fail ===> "+e)
		          } 
		});
		
        $("#mod_appLine").modal();
	});
		//$("#approvalPlan").off("click")
	}
	
 	function appResult2(data){
 		let a="";
 		for(let i=0;i<data.length;i++){
 			a+="<tr>";						
 			a+="<td>"+data[i]['SIGN_LEVEL']+"</td>";
 			a+="<td>"+data[i]['DEPT_NAME']+"</td>";
 			a+="<td>"+data[i]['RANK_NAME']+"</td>";
 			a+="<td>"+data[i]['EMP_NAME']+"</td>";
 			a+="<td>"+data[i]['SIGN_PERMISSION']+"</td>";
 			a+="</tr>";
 		}
 			document.querySelector(".modAppLine").innerHTML = a;
 	}
	
 	//결재문서조회
	function openPop(){
		//alert("오픈팝업");
		$("#approvalPlan").off("click").on('click',"tr", function(){
			//alert( $(this).find("td:eq(1)").text() );
			appPlan = $(this).find("td:eq(3)").text();	
			let aprv_no = $(this).find("td:eq(1)").text();	
			//alert(appPlan);
			openPopup(aprv_no,appPlan);
		});
	}
    function openPopup(aprv_no,appPlan){
    	//alert("팝업");
    	//alert(aprv_no);
    	//alert(appPlan);
	    if (appPlan == "휴가계획서") {
	    	//alert("휴가계획서");
	    	window.open("/approval/vacationPlan.src1?aprv_no="+aprv_no+"&appPlan="+appPlan, "new", "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=1000, height=700, left=0, top=0" );
	    }else{
	    	//alert("프로젝트 계약확정서");
	    	window.open("/approval/projectPlan.src1?aprv_no="+aprv_no+"&appPlan="+appPlan, "new", "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=1000, height=700, left=0, top=0" );   	
	    	
	    }////end of if
    	//});
    	$("#approvalPlan").off("click") //이벤트 다중으로 걸리는 것 방지
    }////end of function
    function appResult3(data){
    	window.open(url2, "new", "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=1000, height=700, left=0, top=0" );
 	}
</script>
<!-- 슬라이드바 사용할때 필요 -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!-- 탑메뉴 사용 -->
<script src="../common/js/topNav.js"></script>
<!-- 사이드 메뉴 사용 -->
<script src="../common/js/sideNav.js"></script>
<script src="../common/scripts.js"></script>
</body>
</html>