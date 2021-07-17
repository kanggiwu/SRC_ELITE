<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
List<Map<String, Object>> profitList = null;
profitList = (List<Map<String, Object>>) request.getAttribute("profitList");
int size = 1;
String pProjectNo = null;
if (profitList != null) {
	size = profitList.size();
}
out.print("size:" + size);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<!--관리자 로그에 필요한 코드 시작=================================================================================-->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"
	crossorigin="anonymous"></script>
<link href="../common/main.css" rel="stylesheet" />
<link href="../common/css/custom.css" rel="stylesheet" />
<!--관리자 로그에 필요한 코드 끝   =================================================================================-->

<!--페이징 처리   =================================================================================-->
<script>
  $(document).ready(function () {
    var $setRows = $('#setRows');
  console.log("dd0");

$setRows.submit(function (e) {
  console.log("dd1");
  e.preventDefault();
  var rowPerPage = $('#rowPerPage').val() * 1;
  // 1 을  곱하여 문자열을 숫자형로 변환
  
  
  $('#nav').remove();
  var $products = $('#products');
  
  
  $products.after('<div id="nav">');
    
    
    var $tr = $($products).find('tbody tr');
    var rowTotals = $tr.length;
    
    var pageTotal = Math.ceil(rowTotals / rowPerPage);
    var i = 0;
    console.log("dd2");
    
    for (; i < pageTotal; i++) {
      $('<a href="#"></a>')
      .attr('rel', i)
      .html(i + 1)
      .appendTo('#nav');
  }
  $tr.addClass('off-screen')
    .slice(0, rowPerPage)
    .removeClass('off-screen');
    
    console.log("dd3");
    var $pagingLink = $('#nav a');
    $pagingLink.on('click', function (evt) {
      evt.preventDefault();
    var $this = $(this);
    if ($this.hasClass('active')) {
      return;
    }
    console.log("dd4");
    $pagingLink.removeClass('active');
    $this.addClass('active');
    // 0 => 0(0*4), 4(0*4+4)
    // 1 => 4(1*4), 8(1*4+4)
    // 2 => 8(2*4), 12(2*4+4)
    // 시작 행 = 페이지 번호 * 페이지당 행수
    // 끝 행 = 시작 행 + 페이지당 행수
    console.log("dd5");
    
    var currPage = $this.attr('rel');
    var startItem = currPage * rowPerPage;
    var endItem = startItem + rowPerPage;
    $tr.css('opacity', '0.0')
    .addClass('off-screen')
    .slice(startItem, endItem)
    .removeClass('off-screen')
    .animate({ opacity: 1 }, 300);
    console.log("5");
  });
  
  console.log("dd6");
  $pagingLink.filter(':first').addClass('active');
  
});

$setRows.submit();
  });
</script>

<title>Account - ERP PROGRAM</title>
</head>
<body class="sb-nav-fixed">
	<nav id="topNav"></nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav"></div>
		<div id="layoutSidenav_content">
			<main id="input_div">
				<div id="frame_div" style="border: 1px solid black;">
					<div id="page_title"
						style="border-bottom: 2px solid gray; margin: 50px 30px;">
						<h2>지출 관리</h2>
					</div>
					<div id="page_contents"
						style="max-width: 1730px; margin: 10px 100px;">
						<!--
******************************************* 컨텐츠 들어갈내용 시작************************************************
-->
						<script type="text/javascript">
document.getElementById('my_form').onsubmit = function(){
	  var dat_period = this.dat_period.value
	  alert(dat_period);
	}
</script>

						<!-- -----------------------------------검색부분---------------------------------- -->
						<div
							style="text-align: left; padding: 5px; display: inline-block; width: 60%;">
							<form id="emp_search" method="post" enctype="multipart/form-data"
								action="getEmpSearchList.src1">
								<span class="input-group"> <select name="dept_name"
									class="form-control" id="dept_options">
										<option value="전체">년</option>
										<option value=2021>2021</option>
								</select> <select name="rank_name" class="form-control" id="rank_options">
										<option value="전체">월</option>
										<option value="1">1</option>
								</select> <select name="rank_name" class="form-control" id="rank_options">
										<option value="전체">일</option>
										<option value="1">1</option>
								</select> <a href="javascript:empSearchAction()"
									class="btn btn-default float-left" role="button"><i
										class="fas fa-search"></i></a>
								</span>
							</form>
						</div>
						<div
							style="text-align: right; padding: 5px; display: inline-block; width: 39%">
							<button type="button" class="btn btn-info" data-toggle="modal"
								data-target="#mod_addEmp">지출 추가</button>
						</div>
						<!-- -----------------------------------검색부분 끝----------------------------------- -->
						<div class='row'>
							<table id="products"
								class="table table-bordered table-hover table-striped">
								<form action="" id="setRows">
									<input type="hidden" name="rowPerPage" value="5"
										id="rowPerPage">
								</form>
								<thead>
									<tr class="thead-dark">
										<th style="width: 14%">분류</th>
										<th style="width: 16%">금액</th>
										<th style="width: 20%">내용</th>
										<th style="width: 20%">지출일자</th>
										<th style="width: 18%">지출처</th>
										<th style="width: 10%">수정</th>
									</tr>
								</thead>
								<tbody>
									<%
									//조회 결과가 없는 거야?
									if (size == 0) {
									%>
									<tr>
										<td colspan="6">조회결과가 없습니다.</td>
									</tr>
									<%
									} else {//조회 결과가 있을 때
									for (int i = 0; i < size; i++) {
										//Map<String, Object> pmap = profitList.get(i);
										if (i == size)
											break;
										//pProjectNo = pmap.get("PROJECT_NO").toString();
									%>
									<!-- 
			===============DB에서 데이터 가져와서 뿌려주기======================
			 -->
									<tr>
										<%-- <td><%=pmap.get("PROJECT_PERIOD").toString()%></td> --%>
										<td>소모품</td>
										<td>백만</td>
										<td>사무용품</td>
										<td>2021-07-21</td>
										<td>모닝글로리</td>
										<td><button type="button" class="btn btn-warning"
												data-toggle="modal" data-target="#mod_updEmp">
												<i class="fas fa-edit"></i>
											</button></td>
									</tr>
									<%
									} ///end of for
									} ///end of if
									%>
								</tbody>
							</table>
							<hr />
						</div>
						<!---------------- 지출 추가 Modal 시작 --------------------------------------->
						<div class="modal fade" id="mod_addEmp" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel">지출추가</h4>
									</div>
									<div class="modal-body">
										<form class="form-horizontal" role="form">
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">분류</span> <select
													name="dept_name" class="form-control" id="dept_options">
													<option value="소모품">소모품</option>
													<option value="인건비">인건비</option>
													<option value="통신비">통신비</option>
													<option value="임차료">임차료</option>
												</select>
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">금액</span> <input
													type="text" name="emp_retiretext" class="form-control"
													value="" aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">내용</span> <input
													type="text" name="emp_retiretext" class="form-control"
													value="" aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">지출일자</span> <input
													type="date" name="emp_retiretext" class="form-control"
													value="" aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">수주처</span> <select
													name="project_name" class="form-control" id="dept_options">
													<option value="SI">SI</option>
													<option value="SM">SM</option>
												</select>
											</div>

											<br>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-info">추가</button>
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!---------------- 지출 추가 Modal 끝 ----------------------------------------------->

					<!---------------- 지출 수정 Modal 시작 --------------------------------------->
					<div class="modal fade" id="mod_updEmp" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">지출수정</h4>
								</div>
								<div class="modal-body">
									<form class="form-horizontal" role="form">
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">분류</span> <select
													name="dept_name" class="form-control" id="dept_options">
													<option value="소모품">소모품</option>
													<option value="인건비">인건비</option>
													<option value="통신비">통신비</option>
													<option value="임차료">임차료</option>
												</select>
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">금액</span> <input
													type="text" name="emp_retiretext" class="form-control"
													value="" aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">내용</span> <input
													type="text" name="emp_retiretext" class="form-control"
													value="" aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">지출일자</span> <input
													type="date" name="emp_retiretext" class="form-control"
													value="" aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">수주처</span> <select
													name="project_name" class="form-control" id="dept_options">
													<option value="SI">SI</option>
													<option value="SM">SM</option>
												</select>
											</div>

											<br>
										</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-warning">수정</button>
									<button type="button" class="btn btn-danger"
										data-dismiss="modal">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!---------------- 지출 수정 Modal 끝 ----------------------------------------------->

				<!--
****************************************** 컨텐츠 들어갈내용 끝 *************************************************   
-->
			</main>
		</div>
	</div>

	<!-- 슬라이드바 사용할때 필요 -->
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<!-- 탑메뉴 사용 -->
	<script src="../common/js/topNav.js"></script>
	<!-- 사이드 메뉴 사용 -->
	<script src="../common/js/sideNav.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		crossorigin="anonymous"></script>
	<script src="../common/scripts.js"></script>
</body>
</html>