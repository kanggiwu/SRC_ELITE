<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String emp_name = (String)session.getAttribute("emp_name");
	String login_no = (String)session.getAttribute("login_no");
	String emp_deptno = (String)session.getAttribute("emp_dept");
	if(emp_name==null){
		emp_name = "dzuza";//hjdlp
	}
	if(login_no==null){
		login_no = "77";//34
	}
	if(emp_deptno==null){
		emp_deptno = "30";//20
	}
	
	
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>일정 관리</title>
    <%@ include file ="../common/fontAwesomeUI.jsp" %>
    <!-- <link rel=" shortcut icon" href="../mihyun_cal/image/favicon.ico"> -->

<link href="<%=path.toString() %>common/main.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=path.toString() %>common/vendor/css/fullcalendar.min2.css" />
    <link rel="stylesheet" href="<%=path.toString() %>common/vendor/css/bootstrap.min2.css?after">
    <link rel="stylesheet" href='<%=path.toString() %>common/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='<%=path.toString() %>common/vendor/css/bootstrap-datetimepicker.min.css' />
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="<%=path.toString() %>common/css/main1.css">
	<link href="../common/css/custom.css" rel="stylesheet" />
</head>
<body id="body">
<nav id="topNav"></nav>
<div id="layoutSidenav">
   <div id="layoutSidenav_nav"></div>
   <div id="layoutSidenav_content">
		<main id="input_div">
			<div id="frame_div" style="border: 1px solid black;">
				<div id="page_title" style="border-bottom: 2px solid gray; margin: 50px 30px;">
								<h2>일정 캘린더</h2></div>
				<div id="page_contents" style="max-width: 1730px;  margin: 50px 50px;">
     			
     			<!-- 컨텐츠 들어갈내용 시작-->
			      <div class="container"> 
				      <div class="panel panel-default">
				
				            <div class="panel-heading">
				                <h3 class="panel-title">분류</h3>
				            </div>
				
				            <div class="panel-body">
				                        <div class="col-lg-6">
				                    <!-- <label for="calendar_view"></label> -->
				                    <div class="input-group">
				                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="1"
				                                checked>공통</label>
				                        <label class="checkbox-inline"><input class='filter' id = "emp_dept" type="checkbox" value="<%=emp_deptno%>"
				                                checked>부서</label>
				                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="2"
				                                checked>프로젝트</label>
				                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="3"
				                                checked>개인</label>
				                    </div>
				                </div>
				        	</div>
				        </div>
			        <!-- /.filter panel -->
			<!-- 일정추가전 생기는 카탈로그 창 -->
			        <!-- 일자 클릭시 메뉴오픈 -->
				         <div id="contextMenu" class="dropdown clearfix">
				            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
				                style="display:block;  position:static; margin-bottom:5px;">
				                <li><a tabindex="-1" href="#">공통</a></li>
				                <li><a tabindex="-1" href="#">부서</a></li>
				                <li><a tabindex="-1" href="#">프로젝트</a></li>
				                <li><a tabindex="-1" href="#">개인</a></li>
				                <li class="divider"></li>
				                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
				            </ul>
				        </div> 
			
				        <div id="wrapper">
				            <div id="loading"></div>
				            <div id="calendar"></div>
				        </div>
				
			
				
				        <!-- 일정 추가 MODAL -->
				        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
				            <div class="modal-dialog" role="document">
				                <div class="modal-content">
				                
				                <!--  
				                ================================================================================================================
				                일정 다이알로그 추가창 header 시작
				                ================================================================================================================
				                -->
				                    <div class="modal-header">
				                        <h4 class="modal-title"></h4>
				                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
				                                aria-hidden="true">&times;</span></button>
				                    </div>
				                <!--  
				                ================================================================================================================
				                일정 다이알로그 추가창 body 시작
				                ================================================================================================================
				                -->
				                    <div class="modal-body">
				
				                        <div class="row">
				                            <div class="col-xs-12">
				                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
				                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
				                            </div>
				                        </div>
				
				                        <div class="row">
				                            <div class="col-xs-12">
				                                <label class="col-xs-4" for="edit-title">일정명</label>
				                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
				                                    required="required" />
				                            </div>
				                        </div>
				
				                       <div class="row">
				                            <div class="col-xs-12">
				                                <label class="col-xs-4" for="edit-username">사원명</label>
				                                <input class="inputModal" type="text" name="edit-username" id="edit-username"  value="<%=emp_name %>" disabled/>
				                            </div>
				                        </div>  
				                        <div class="row">
				                            <div class="col-xs-12">
				                                <label class="col-xs-4" for="edit-start">시작</label>
				                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
				                            </div>
				                        </div>
				                        <div class="row">
				                            <div class="col-xs-12">
				                                <label class="col-xs-4" for="edit-end">끝</label>
				                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
				                            </div>
				                        </div>
				                        <div class="row">
				                            <div class="col-xs-12">
				                                <label class="col-xs-4" for="edit-type">분류</label>
				                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
				                                    <option value="1">공통</option>
				                                    <option value="<%=emp_deptno%>">부서</option>
				                                    <option value="2">프로젝트</option>
				                                    <option value="3">개인</option>
				                                </select>
				                            </div>
				                        </div>
				                        <div class="row">
				                            <div class="col-xs-12">
				                                <label class="col-xs-4" for="edit-color">색상</label>
				                                <select class="inputModal" name="color" id="edit-color">
				                                    <option value="#D25565" style="color:#D25565;">빨간색</option>
				                                    <option value="#9775fa" style="color:#9775fa;">보라색</option>
				                                    <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
				                                    <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
				                                    <option value="#f06595" style="color:#f06595;">핑크색</option>
				                                    <option value="#63e6be" style="color:#63e6be;">연두색</option>
				                                    <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
				                                    <option value="#4d638c" style="color:#4d638c;">남색</option>
				                                    <option value="#495057" style="color:#495057;">검정색</option>
				                                </select>
				                            </div>
				                        </div>
				                        <div class="row">
				                            <div class="col-xs-12">
				                                <label class="col-xs-4" for="edit-desc">내용</label>
				                                <textarea rows="4" cols="50 " class="inputModal" name="edit-desc"
				                                    id="edit-desc"></textarea>
				                            </div>
				                        </div>
				                    </div>
			                <!--  
			                ================================================================================================================
			                일정 다이알로그 추가창 body 끝
			                ================================================================================================================
			                -->
				                    <div class="modal-footer modalBtnContainer-addEvent">
				                        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
				                    </div>
				                    <div class="modal-footer modalBtnContainer-modifyEvent">
				                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
				                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
				                    </div>
				                </div><!-- /.modal-content -->
				            </div><!-- /.modal-dialog -->
				        </div><!-- /.modal -->
				    </div>
			    </div>
			    <!-- /.container -->
			    
			</div>
		</div>
	</main>
</div>
    <!-- 슬라이드바 사용할때 필요 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <!-- 탑메뉴 사용 -->
	<script src="<%=path.toString() %>common/js/topNav.js"></script>
	<!-- 사이드 메뉴 사용 -->
<script src="<%=path.toString() %>common/js/sideNav.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous" ></script>
<script src="<%=path.toString() %>common/scripts.js"></script>
	
    <script src="<%=path.toString() %>common/vendor/js/jquery.min.js"></script>
    <script src="<%=path.toString() %>common/vendor/js/bootstrap.min.js"></script>
    <script src="<%=path.toString() %>common/vendor/js/moment.min.js"></script>
    <script src="<%=path.toString() %>common/vendor/js/fullcalendar.min.js"></script>
    <script src="<%=path.toString() %>common/vendor/js/ko.js"></script>
    <script src="<%=path.toString() %>common/vendor/js/select2.min.js"></script>
    <script src="<%=path.toString() %>common/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="<%=path.toString() %>common/js/main.js?ver=7"></script>
    <script src="<%=path.toString() %>common/js/addEvent.js?ver=6"></script>
    <script src="<%=path.toString() %>common/js/editEvent.js?ver=13"></script>
    <script src="<%=path.toString() %>common/js/etcSetting.js?ver=3"></script>
</body>
</html>