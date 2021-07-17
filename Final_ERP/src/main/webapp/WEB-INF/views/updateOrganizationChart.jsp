<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
out.print(path);
List<Map<String, Object>> organizationChartPath = null;
organizationChartPath = (List<Map<String, Object>>) request.getAttribute("organizationChartPath");
Map<String, Object> rmap = organizationChartPath.get(0);
String oc_path = rmap.get("OC_PATH").toString();
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
<script type="text/javascript">
	// 콘텐츠 수정 :: 사진 수정 시 이미지 미리보기
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#OrganizationChartImg').attr('src', e.target.result); 
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$(":input[name='u_file']").change(function() {
		if( $(":input[name='u_file']").val() == '' ) {
			$('#OrganizationChartImg').attr('src' , '');  
		}
		$('#imgViewArea').css({ 'display' : '' });
		readURL(this);
	});

	// 이미지 에러 시 미리보기영역 미노출
/* 	function imgAreaError(){
		$('#imgViewArea').css({ 'display' : 'none' });
	} */
	
/* 	$(document).ready(function(){
		  $("#fileInput").on('change',function(){
		    if(window.FileReader){
		      var filename = $(this)[0].files[0].name;
		      console.log(filename+"1");
		    } else{
		      var filename = $(this)[0].val().split('/').pop().split('\\').pop();
		      console.log(filename+"2");
		    }
		    //추출한 파일명 삽입
		    $("#userfile").val(filename);
		  });
		});	 */
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
				<h2>조직도 수정</h2></div>
				<div id="page_contents" style="max-width: 1730px; margin: 10px 100px;">
     			<!-- 컨텐츠 들어갈내용 시작-->
            <div id="imgViewArea" style=" width:100%; height:500px;">
              <img id="OrganizationChartImg" src="../<%=oc_path%>" style="width: 90%; height: 90%;" alt="Organization chart" onerror="imgAreaError()">
          </div>
          <div class="form-group">
            <label for="InputSubject1">파일첨부</label>
            <input id="fileInput" name="u_file" filestyle="" type="file" data-class-button="btn btn-default" data-class-input="form-control"
            data-button-text="" data-icon-name="fa fa-upload" class="form-control" tabindex="-1" 
            style="position: absolute; clip: rect(0px 0px 0px 0px);" accept="image/*">
            <div class="bootstrap-filestyle input-group">
              <input type="text" id="userfile" class="form-control" name="userfile" disabled="">
              <span class="group-span-filestyle input-group-btn" tabindex="0">
                <label for="fileInput" class="btn btn-default">
                  <span class="glyphicon fa fa-upload"></span>
                </label>
                <button class="btn btn-info" onclick="location.href='updateOrganizationChart.src1'">
                  수정</button>
              </span>
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
</body>
</html>