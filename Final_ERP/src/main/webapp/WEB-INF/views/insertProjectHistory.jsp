<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
	List<Map<String,Object>> projectNameList = null;
	List<Map<String,Object>> empSearchList2 = null;
	projectNameList = (List<Map<String,Object>>)request.getAttribute("projectNameList");
	
	Map<String,Object> rmap = projectNameList.get(0);
	String project_no = "";
	project_no = rmap.get("PROJECT_NO").toString();
	int size = 0;
	String pProjectName = null;
	if(projectNameList!=null){
		size = projectNameList.size();
	}
	out.print("size:"+size);
	empSearchList2 = (List<Map<String,Object>>)request.getAttribute("empSearchList2");
	int size2 = 0;
	String empSearch2 = null;
	if(empSearchList2!=null){
		size2 = empSearchList2.size();
	}
	out.print("size2:"+size2);
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
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
<title>프로젝트 이력 추가</title>


<script>
	function empSearchAction(){
		//let a ={"d":a,"d1":b};
		//alert("여기")
		//var deptTarget = document.getElementById("dept_options")
		let deptTarget = $("#dept_options option:selected").val();
		let rankTarget = $("#rank_options option:selected").val();
		let companyTarget = $("#txt_company").val();
		//alert(companyTarget)
		console.log("ddddd");
     	$.ajax({
  		  type:"post",
  		  //type:"get"
  		  data:{"dept_name":deptTarget,"rank_name":rankTarget,"emp_name":companyTarget},
  		  url: "/projecthistory/getEmpSearchList2.src1",
  		  //data:{"dept":개발부} getparameter("dept")
  		  dataType:"json",
	          success:function(data){
	        	  resultt(data);
	  	       },
	          error:function(e){
	        	  let x = e.responseXML;
	        	  alert("fail ===> "+e)
	          }
  	}); 
 
	}
	
function resultt(data){
	let a="";
      //조회 결과가 없는 거야?
      if(data.size==0){	
    	  console.log("df");
    	a+="        <td colspan='5'>조회결과가 없습니다.</td>";
      }
      else{//조회 결과가 있을 때
      	for(let i=0;i<data.length;i++){
      		console.log(data[i]['RANK_NAME']);
      				a+="<tr>";
      				a+="		<td>";
      				a+="			<input type='checkbox' name='chkList' class='styled' id='singleCheckbox1'  aria-label='Single checkbox One'>";
      				a+="		</td>";
       				a+="		<td>"+data[i]['EMP_NO']+"</td>";
      				a+="		<td>"+data[i]['DEPT_NAME']+"</td>";
      				a+="		<td>"+data[i]['RANK_NAME']+"</td>";
      				a+="		<td>"+data[i]['EMP_NAME']+"</td>"; 
      				a+="</tr>";
      	}///end of for
      } ///end of if
      document.querySelector(".aaaa").innerHTML = a;
}



</script>
</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
<form id="project_ins" method="post" action="updateProjectInfo.src1"> 
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
				<h2>프로젝트 이력 추가</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
     			<!-- 컨텐츠 들어갈내용 시작-->
 <!-- ====================================================================================================== --> 
   <div class="row">
   <div class='col-sm-6'>
			<div class="form-group">
<!-- =========프로젝트명 DB에서 가져와서 뿌려주기 ========================== -->
				<label for="txt_proName">프로젝트명</label>
				<select class="form-control">
<%
//조회 결과가 없는 거야?
if(size==0){		
%>    
            <option>조회결과가 없습니다.</option>
<%
}
else{//조회 결과가 있을 때
	Map<String,Object> pmap = null;
	for(int i=0;i<size;i++){
		pmap = projectNameList.get(i);
		if(i==size) break;
		pProjectName = pmap.get("PROJECT_NAME").toString();
%>    	
				  <%-- <option><%=pmap.get("PROJECT_NAME").toString()%></option> --%>
				  <option name="projectName_options" value="<%=pProjectName%>"><%=pProjectName%></option>
<!-- =========프로젝트명 DB에서 가져와서 뿌려주기끝 ========================== -->				  
<% 
	}///end of for
} ///end of if
%>
				</select>
			</div>
			<input type="hidden" name="project_no" value="<%=project_no%>"></input>
			<div class="form-group">
				<label for="dat_period">기간</label>
				<div class="form-inline">
					<input type="date" class="form-control" id="dat_period2" name="dat_period2">&nbsp; ~ &nbsp;
					<input type="date" class="form-control" id="dat_period3" name="dat_period3">
				</div>
			</div>
			<div class="form-group">
				<label for="txt_company">발주사</label>
				<input type="text" class="form-control" id="txt_company1" name="tproject_client">
			</div>
			<div class="form-group">
				<label for="txt_emp">담당자</label>
				<input type="text" class="form-control" id="txt_emp" name="txt_emp">
			</div>
			<div class="form-group">
				<label for="txt_prodeeds">수익금</label>
				<input type="text" class="form-control" id="txt_prodeeds" name="project_profit">
			</div>
			<div class="form-group">
				<label for="txt_kind">종류</label>
				<input type="text" class="form-control" id="txt_kind" name="project_type">
			</div>
			<div class="form-group">
				<label for="txt_skills">기술</label>
				<textarea class="form-control" id="txt_skills" rows="3" cols="50" name="project_tech">
				</textarea>					
			</div>
			<div class="form-group">
				<label for="txt_content">개발내용</label>
				<textarea class="form-control" id="txt_content" rows="3" cols="50" name="project_content">
				</textarea>					
			</div>
		</div>
<!-- ********************************우측 인력검색부분************************************* -->	
		<div class='col-sm-6'>
		
			<div class="form-inline form-group">
				<select name = "dept_name" class="form-control" id="dept_options">
				  <option value="전체">===부서===</option>
				  <option value="임원">임원</option>
				  <option value="개발부">개발부</option>
				  <option value="인사부">인사부</option>
				  <option value="회계부">회계부</option>
				</select>
				&nbsp;
				<select name = "rank_name" class="form-control" id="rank_options">
				  <option value="전체">===직위===</option>
				  <option value="대표">대표</option>
				  <option value="부사장">부사장</option>
				  <option value="이사">이사</option>
				  <option value="부장">부장</option>
				  <option value="차장">차장</option>
				  <option value="과장">과장</option>
				  <option value="대리">대리</option>
				  <option value="사원">사원</option>
				</select>
				&nbsp;
				<input type="text" name = "emp_name" class="form-control" id="txt_company">
				&nbsp;

				<a href="javascript:void(0)" onclick="empSearchAction()" class="btn btn-info btn-sm">사원검색</a>
			</div>
			<!-- 
				===============사원정보테이블 만들기======================
			-->
			<div style="overflow:scroll; width:100%; height:300px;">
			<table class="table table-hover" id = "empTable">
				<thead>
					<tr style="background-color:lightgray">						
						<th style="width: 10%">선택</th>
						<th style="width: 30%">사원번호</th>
						<th style="width: 20%">부서명</th>
						<th style="width: 20%">직위명</th>
						<th style="width: 20%">사원명</th>
					</tr>
				</thead>
				<tbody class="aaaa">
				<!-- 
				===============DB에서 데이터 가져와서 뿌려주기======================
				 -->

				</tbody>	
			</table>
			</div>
			</form>
			<div class="col text-center">
				<!-- <a href="javascript:void(0)" id="selectBtn" onclick="empAddAction()"  class="btn btn-info btn-sm">추가</a> -->
				<a href="javascript:void(0)" id="selectBtn" class="btn btn-info btn-sm">추가</a>
<!-- 				<a href="javascript:void(0)" id="selectBtn" onclick="deleteBtn()"  class="btn btn-info btn-sm">제거</a> -->
				<!-- <a href="javascript:void(1)" id="deleteBtn" class="btn btn-info btn-sm">제거</a> -->
				<button  type="button" id="deletB" class="btn btn-info btn-sm" onclick="deleteBtn()">제거</button>
<!-- 				<input type="button" value="제거" onclick="deleteBtn();" name="deletB"  /><br/> -->
			</div>
			
			<form>
			<div>
			<div style="overflow:scroll; width:100%; height:300px;">
			<table class="table table-hover" id="sTable">
				<thead>
					<tr style="background-color:lightgray">						
						<th style="width: 10%">선택</th>
						<th style="width: 30%">사원번호</th>
						<th style="width: 20%">부서명</th>
						<th style="width: 20%">직위명</th>
						<th style="width: 20%">사원명</th>
					</tr>
				</thead>
				<tbody class="bbbb">
				<!-- ==============위에서 선택된 데이터 가져와서 뿌려주기======================-->

				<!-- ==============위에서 선택된 데이터 가져와서 뿌려주기 끝======================-->
				</tbody>
			</table>
			</div>
</form>
			<br>
			<div class="text-right">
				<!-- <button type="button" id="addProject" class="btn btn-warning btn-lg" onclick="addProjectAction()">프로젝트 추가</button> -->
				<button type="submit" id="addProject" class="btn btn-warning btn-lg" onclick="addProjectAction()">프로젝트 추가</button>
	
			</div>
			</div>
		</div>
<!-- </form> -->
		</main>
	</div>
</div>
<script>
let myMap = new Map();
		let EMP_NO = 0;
$("#selectBtn").click(function(){ 
	//alert("click");
	let rowData = new Array();
	let tdArr = new Array();
	let checkbox = $("input[name=chkList]:checked");
	
	// 체크된 체크박스 값을 가져온다
	checkbox.each(function(i) {

		// checkbox.parent() : checkbox의 부모는 <td>이다.
		// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
		let tr = checkbox.parent().parent().eq(i);
		let td = tr.children();
		
		// 체크된 row의 모든 값을 배열에 담는다.
		rowData.push(tr.text());
		
		// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
		EMP_NO = td.eq(1).text();
		let DEPT_NAME = td.eq(2).text();
		let RANK_NAME = td.eq(3).text();
		let EMP_NAME = td.eq(4).text(); 
		if(myMap.get(EMP_NO) == undefined){   
  			//alert("아니야");
			myMap.set(EMP_NO,EMP_NO);
  		}else {
  			//alert("맞아");
        	return;   			
  		}
		//alert (myMap.set(EMP_NO,EMP_NO));
		
		// 가져온 값을 배열에 담는다.
		tdArr.push(EMP_NO);
		tdArr.push(DEPT_NAME);
		tdArr.push(RANK_NAME);
		tdArr.push(EMP_NAME);
		result2(tdArr);	
		tdArr = new Array();
	});
	
});
function result2(data){
	//alert("result2 호출성공")
	let b="";
	let size=0;
      		b+="<tr id='empno' value='"+EMP_NO+"'>";
      		b+="		<td>";
      		b+="			<input type='checkbox' name='chkList2' class='styled' id='"+EMP_NO+"'  aria-label='Single checkbox One'>";
       		b+="			<input name = 'emp_no' value='"+EMP_NO+"' hidden>";
      		b+="		</td>";

	      	for(let i=0;i<data.length;i++){
	       		b+="		<td value='empno_"+EMP_NO+"'>"+data[i]+"</td>";
			}
      		b+="</tr>"; 

      document.querySelector(".bbbb").innerHTML += b;
}
</script>
<script>

//$("#deleteBtn").click(function(){
function deleteBtn(){
	//window.deleteBtn = function()
	//alert("삭제버튼 클릭");
	 $("input[name=chkList2]:checked").each(function(){
		 if(this.checked== true){
			 	console.log($(this).attr('id'));
				this.parentNode.parentNode.remove();
				myMap.delete($(this).attr('id'));
	     	};
     });

}
//프로젝트 추가 버튼 클릭
/* function addProjectAction(){
	alert("addProjectAction 호출 성공");
	let pNameTarget = $("#projectName_options option:selected").val();
	let date2Target = $("#dat_period2").val();
	let date3Target = $("#dat_period3").val();
	let companyTarget = $("#txt_company1").val();
	let empTarget = $("#txt_emp").val();
	let prodeedsTarget = $("#txt_prodeeds").val();
	let typeTarget = $("#txt_kind").val();
	let skillsTarget = $("#txt_skills").val();
	let contentTarget = $("#txt_content").val();
	let empArr = new Array();
	empArr = $("#empno").val();
	console.log(empArr[0]);
 	$.ajax({
		  type:"post",
		  //type:"get"
		  data:{"dept_name":pNameTarget,"rank_name":date2Target,"emp_name":date3Target
			  ,"emp_name":companyTarget,"emp_name":empTarget,"emp_name":prodeedsTarget
			  ,"emp_name":typeTarget,"emp_name":skillsTarget,"emp_name":contentTarget},
		  
		  url: "/projecthistory/getProjectHistoryList.src1",
		  //data:{"dept":개발부} getparameter("dept")
		  dataType:"json",
          /* success:function(data){
        	  resultt(data);
  	       },
          error:function(e){
        	  let x = e.responseXML;
        	  alert("fail ===> "+e)
          } 
	}); */

          
</script>
<!-- 슬라이드바 사용할때 필요 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!-- 탑메뉴 사용 -->
<script src="../common/js/topNav.js"></script>
<!-- 사이드 메뉴 사용 -->
<script src="../common/js/sideNav.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous" ></script>
<script src="../common/scripts.js"></script>
</body>
</html>