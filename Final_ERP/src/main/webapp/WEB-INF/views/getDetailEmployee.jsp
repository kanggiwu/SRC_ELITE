<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%
    StringBuilder path = new StringBuilder(request.getContextPath());
    path.append("/");
    out.print(path);
    List<Map<String,Object>> boardDetail = null;
    List<Map<String,Object>> licenceList = null;
      boardDetail = (List<Map<String,Object>>)request.getAttribute("boardDetail");
      licenceList = (List<Map<String,Object>>)request.getAttribute("licenceList");
      int size = 0;
      String emp_no = null;
      String emp_name 	=	null;  
      String emp_year 	= null;
      String dept_name 	= null;
      String team_name 	= null;
      String rank_name 		= null;
      String emp_hiredate 		= null;
      String emp_retiredate 	= null;
      String emp_tel 		= null;
      String emp_email 		= null;	
      String emp_status 		= null;	
      String emp_account		= null;	
      String emp_picture_path		= null;	
      String licence_no 		= null;	
      String licence_name 		= null;	
      String licence_type 		= null;	
      String licence_level 		= null;	
      String licence_date 		= null;	
      String licence_expire 		= null;	
      if(boardDetail!=null){
          Map<String,Object> rmap = boardDetail.get(0);
          emp_no = rmap.get("EMP_NO").toString();
          emp_name = rmap.get("EMP_NAME").toString();
//          emp_year = rmap.get("EMP_YEAR").toString();
          emp_year = "";
          dept_name = rmap.get("DEPT_NAME").toString();
          team_name = rmap.get("TEAM_NAME").toString();
	      rank_name = rmap.get("RANK_NAME").toString();
          emp_hiredate = rmap.get("EMP_HIREDATE").toString();
          if(rmap.get("EMP_RETIREDATE")!=null){
            emp_retiredate = rmap.get("EMP_RETIREDATE").toString();		
          }else{
            emp_retiredate = "";
          }
          emp_tel = rmap.get("EMP_TEL").toString();
          emp_email = rmap.get("EMP_EMAIL").toString();
          emp_status = rmap.get("EMP_STATUS").toString();
          emp_account = rmap.get("EMP_ACCOUNT").toString();
          emp_picture_path = rmap.get("EMP_PICTURE_PATH").toString();
          
        	
          
        }

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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->
<script>
  //자격증 로우 추가
  function add_row() {
	  console.log("1"+document.getElementById('AddLicenseRow1').value+"1");
	  console.log(document.getElementById('AddLicenseRow2').value);
	  console.log(document.getElementById('AddLicenseRow3').value);
	  console.log(document.getElementById('AddLicenseRow4').value);
	  console.log(document.getElementById('AddLicenseRow5').value);
	  console.log(document.getElementById('AddLicenseRow6').value);
	  if(document.getElementById('AddLicenseRow1').value !== null ||
			  document.getElementById('AddLicenseRow2').value !== null ||	  
			  document.getElementById('AddLicenseRow3').value !== null ||	  
			  document.getElementById('AddLicenseRow4').value !== null ||	  
			  document.getElementById('AddLicenseRow5').value !== null ||	  
			  document.getElementById('AddLicenseRow6').value !== null 	  
	  ){
	    var my_tbody = document.getElementById('licence-tbody');
	    // var row = my_tbody.insertRow(0); // 상단에 추가
	    var row = my_tbody.insertRow( my_tbody.rows.length ); // 하단에 추가
	    var cell1 = row.insertCell(0);
	    var cell2 = row.insertCell(1);
	    var cell3 = row.insertCell(2);
	    var cell4 = row.insertCell(3);
	    var cell5 = row.insertCell(4);
	    var cell6 = row.insertCell(5);
	    cell1.innerHTML = document.getElementById('AddLicenseRow1').value;
	    cell2.innerHTML = document.getElementById('AddLicenseRow2').value;
	    cell3.innerHTML = document.getElementById('AddLicenseRow3').value;
	    cell4.innerHTML = document.getElementById('AddLicenseRow4').value;
	    cell5.innerHTML = document.getElementById('AddLicenseRow5').value;
	    cell6.innerHTML = document.getElementById('AddLicenseRow6').value;
		  }
	  else{
		  alert("X");
	  }
	  }
  function delete_row() {
    var my_tbody = document.getElementById('licence-tbody');
    if (my_tbody.rows.length < 1) return;
    // my_tbody.deleteRow(0); // 상단부터 삭제
    my_tbody.deleteRow( my_tbody.rows.length-1 ); // 하단부터 삭제
  }

  //사원 수정을 위한 활성화
  function fieldsetDisable()  {
  const fieldset = document.getElementById('btn_fieldset');
  fieldset.disabled = false;
  var empUpdReady = document.getElementById('EmpUpdReady');
  empUpdReady.style.visibility = 'hidden';
/*   if(document.getElementById('dept_options') != "개발부"){
	  document.getElementById('team_options').disabled = true;	  
  } */
  document.getElementById('EmpUpdSubmit').style.display = ''
  
}

/// 콤보박스 중분류 비활성화하기
function handleOnChange(e) {
	  // 선택된 데이터 가져오기
	  const value = e.value;
	  console.log(value);
	  if(value != "개발부"){
		  document.getElementById('team_options').disabled = true;
		  $("#team_options").val("").prop("selected", true);
	  }else{
		  document.getElementById('team_options').disabled = false;
		  $("#team_options").val("개발1팀").prop("selected", true);
	  }
}
// 콘텐츠 수정 :: 사진 수정 시 이미지 미리보기
function readURL(input) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$('#imgArea').attr('src', e.target.result); 
		}
		reader.readAsDataURL(input.files[0]);
	}
}

/* $(":input[name='u_file']").change(function() {
	if( $(":input[name='u_file']").val() == '' ) {
		$('#imgArea').attr('src' , '');  
	}
	$('#imgViewArea').css({ 'display' : '' });
	readURL(this);
}); */

// 이미지 에러 시 미리보기영역 미노출
/* function imgAreaError(){
	$('#imgViewArea').css({ 'display' : 'none' });
} */
function empUpdateAction() {
			console.log("입력 액션 호출");
			$('#employee_update').submit();
     // location.href = 'getEmployeeList.src1'
		}
</script>
<title>HR - ERP PROGRAM</title>
</head>
<body class="sb-nav-fixed">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
				<h2>사원 상세 조회</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
     			<!-- 컨텐츠 들어갈내용 시작-->
         		<div class="container">
               <div class="col" >
                 <div style="text-align: right; padding: 5px;">
                  <button class="btn btn-info" id="EmpUpdReady" onclick="fieldsetDisable()">수정</button>
                  <button class="btn btn-info" id="EmpUpdSubmit" onclick="empUpdateAction();" style="display:none;">수정 완료</button>
                  <button class="btn btn-danger" onclick="location.href='getEmployeeList.src1'">취소</button>
                </div>
                <fieldset id='btn_fieldset' disabled>
                <form id="employee_update" method="post" enctype="multipart/form-data" action="updateEmployee.src1">
			   			<div class="row">
						    <div class="col-lg-6">
								<div id="imgViewArea" style="width:100%; height:250px;">
									<img id="imgArea" src="../<%=emp_picture_path%>"style="width: 200px; left: 20%; position: relative;" alt="profile" onerror="imgAreaError()">
								 <div class="form-group" style="left: 20%; position: relative;">
								    <input type="file" id="u_file" onchange="readURL(this);" name="emp_picture_path" accept="image/*">
								</div>
								  </div>
								<hr>
		    				</div>		    
						    <div class="col-lg-6">
							  <div id="emp_table" style="width:100%; height:250px;">
								<br>
								<div class="input-group">
								  <span class="input-group-addon" id="basic-addon1" style="display: inline-block; width: 25%">이름</span>
								  <input type="text" name="emp_name" class="form-control" value="<%=emp_name%>" aria-describedby="basic-addon1" >
								</div>
								<br>				
								<div class="input-group">
								  <span class="input-group-addon" id="basic-addon1" style="display: inline-block; width: 25%">부서</span>
						          <select class="form-control" name="dept_name" id="dept_options" onchange="handleOnChange(this)">
                      			   <option value="<%=dept_name%>" selected ><%=dept_name%></option>
						              <option value="인사부">인사부</option>
						              <option value="회계부">회계부</option>
						              <option value="개발부">개발부</option>
						              <option value="임원">임원</option>
						          </select>
						          <select class="form-control" name="team_name" id="team_options">
                    			    <option  value="<%=team_name%>" selected hidden  ><%=team_name%></option>
						              <option value="개발1팀">개발1팀</option>
						              <option value="개발2팀">개발2팀</option>
						              <option value="개발3팀">개발3팀</option>
						              <option value="SM팀">SM팀</option>
						              <option value="" hidden >없음</option>
						          </select>
								</div>
								<br>						
								<div class="input-group">
								  <span class="input-group-addon" id="basic-addon1" style="display: inline-block; width: 25%">직위</span>
								  <select class="form-control" name="rank_name" >
                       				 <option value="<%=rank_name%>" selected   ><%=rank_name%></option>
							            <option value="사원">사원</option>
							            <option value="대리">대리</option>
							            <option value="차장">차장</option>
							            <option value="과장">과장</option>
							            <option value="부장">부장</option>
							            <option value="부사장">부사장</option>
							            <option value="이사">이사</option>
							            <option value="대표">대표</option>
					       	   		</select>
								</div>						
							</div>	
							<hr>
						</div>
					</div>
					  <div class="row">
					    <div class="col-lg-6">
					      <div id="emp_table" style="width:100%; height:300px;">
						  <br>
							<div class="input-group">
							  <span class="input-group-addon" id="basic-addon1" style="display: inline-block; width: 25%">사원번호</span>
							  <input type="text" name="emp_no" class="form-control" value="<%=emp_no%>" aria-describedby="basic-addon1">
							</div>
							<br>				
							<div class="input-group">
							  <span class="input-group-addon" id="basic-addon1" style="display: inline-block; width: 25%">연차</span>
							  <input type="text" class="form-control" value="<%=emp_year%>" aria-describedby="basic-addon1">
							</div>
							<br>						
							<div class="input-group">
							  <span class="input-group-addon" id="basic-addon1" style="display: inline-block; width: 25%">입사일자</span>
                
							  <input type="date" name="emp_hiredate" class="form-control" value="<%=emp_hiredate%>" aria-describedby="basic-addon1">
							</div>						
							<br>						
							<div class="input-group">
							  <span class="input-group-addon" id="basic-addon1" style="display: inline-block; width: 25%">퇴사일자</span>
							  <input type="date" name="emp_retiredate" class="form-control" value="<%=emp_retiredate%>" aria-describedby="basic-addon1">
							</div>						
						  </div>
					    </div>
						<div class="col-lg-6">
						      <div id="emp_table" style="width:100%; height:300px;  vertical-align: middle;">
							  <br>
								<div class="input-group">
								  <span class="input-group-addon" id="basic-addon1" style="display: inline-block; width: 25%">전화번호</span>
								  <input type="text" name="emp_tel" class="form-control" value="<%=emp_tel%>" aria-describedby="basic-addon1">
								</div>
								<br>				
								<div class="input-group">
								  <span class="input-group-addon" id="basic-addon1" style="display: inline-block; width: 25%">이메일</span>
								  <input type="text" name="emp_email" class="form-control" value="<%=emp_email%>" aria-describedby="basic-addon1">
								</div>
								<br>						
								<div class="input-group">
								  <span class="input-group-addon" id="basic-addon1" style="display: inline-block; width: 25%">고용상태</span>
								  <select name="emp_status" class="form-control" >
                       				 <option value="<%=emp_status%>"  selected  ><%=emp_status%></option>
						            <option value="재직">재직</option>
						            <option value="휴직">휴직</option>
						            <option value="퇴직">퇴직</option>
					       	   </select>
								</div>
								<br>						
								<div class="input-group">
								  <span class="input-group-addon" id="basic-addon1" style="display: inline-block; width: 25%">급여계좌</span>
               					   <input type="text" class="form-control" placeholder="국민은행" aria-describedby="basic-addon1" disabled>
								  <input type="text" name="emp_account" class="form-control" value="<%=emp_account%>" aria-describedby="basic-addon1">
								</div>						
							  </div>
						    </div>
            				</form>
			                <form id="licence_add" method="post" enctype="multipart/form-data" action="updateEmployee.src1">
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
			    					<th colspan="6">보유 자격증</th>
			    				</tr>
							     <tr>
							        <th>번호</th>
							        <th>이름</th>
							        <th>분류</th>
							        <th>레벨</th>
							        <th>취득일</th>
							        <th>만기일</th>
							     </tr>
							 </thead>
							    <tbody id="licence-tbody">
					    	   	   <tr>
			                        <td><input type="text" name="licence_no" id="AddLicenseRow1" class="form-control" /></td>
			                        <td><input type="text" name="licence_name" id="AddLicenseRow2" class="form-control" /></td>
			                        <td><input type="text" name="licence_type" id="AddLicenseRow3" class="form-control" /></td>
			                        <td><input type="text" name="licence_level" id="AddLicenseRow4" class="form-control" /></td>
			                        <td><input type="text" name="licence_date" id="AddLicenseRow5" class="form-control" /></td>
			                        <td><input type="text" name="licence_expire" id="AddLicenseRow6" class="form-control" /></td>
					       		 </tr>
<%

				     		size = licenceList.size();
				     	    if(size>0){
				     		for(int i=0;i<size;i++){
				     			if(i==size) break;
				     	          Map<String,Object> lmap = licenceList.get(i);
				     	            licence_no = lmap.get("LICENCE_NO").toString();		
				     	             licence_name = lmap.get("LICENCE_NAME").toString();		
				     	/*            licence_type = lmap.get("LICENCE_TYPE").toString();		
				     	            licence_level = lmap.get("LICENCE_LEVEL").toString();		
				     	            licence_date = lmap.get("LICENCE_DATE").toString();		
				     	            licence_expire = lmap.get("LICENCE_EXPIRE").toString();	 */	
%>							    
					    	   	   <tr>
                        <td><input type="text" value="<%=licence_no%>" class="form-control" disabled/></td>
                        <td><input type="text" value="<%=licence_name%>"class="form-control" disabled/></td>
                        <td><input type="text" class="form-control" disabled/></td>
                        <td><input type="text" class="form-control" disabled/></td>
                        <td><input type="text" class="form-control" disabled/></td>
                        <td><input type="text" class="form-control" disabled/></td>
					       		 </tr>
<%
							}///end of for
						}///end of if
%> 							       		 
							    </tbody>
			    			</table>
            				</form>
					  	</div>
              <div style="text-align: right; padding: 5px;">
                <button class="btn btn-light" onclick="add_row()">자격증 추가</button>
                <button class="btn btn-light" onclick="delete_row()">자격증 삭제</button>
              </div>
            </fieldset>
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
</body>
</html>