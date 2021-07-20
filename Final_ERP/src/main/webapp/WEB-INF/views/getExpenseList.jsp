<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
List<Map<String, Object>> expenseList = null;
expenseList = (List<Map<String, Object>>) request.getAttribute("expenseList");
int size = 0;
String pProjectNo = null;
if (expenseList != null) {
	size = expenseList.size();
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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
  // 지출 수정창 값 불러오기
   function updExpense(e){
	  console.log($(e).closest('td').attr('id'));
	  console.log($(e).parents('td').attr('id'));
	  console.log($(e).closest('tr').attr('id'));
	  console.log($(e).parents('tr').attr('id'));
	  console.log($('#'+ expense_no).attr('id'));
	  var expense_no = ($(e).parents('tr').attr('id'));
	  var expense_type = $(e).closest('td').prevAll("#expense_type").attr('value')
	  var expense_price = $(e).closest('td').prevAll("#expense_price").attr('value')
	  var dept_no = $(e).closest('td').prevAll("#dept_no").attr('value')
	  var expense_detail = $(e).closest('td').prevAll("#expense_detail").attr('value')
	  var expense_date = $(e).closest('td').prevAll("#expense_date").attr('value')
	$('#upd_expense_type').val(expense_type);
	$('#upd_expense_price').val(expense_price);
	$('#upd_dept_no').val(dept_no);
	$('#upd_expense_detail').val(expense_detail);
	$('#upd_expense_date').val(expense_date);
	$('#upd_expense_no').val(expense_no);
  } 
  // 지출 추가 
   function insertExpense() {
		Swal.fire({
			  title: '추가 되었습니다!',
			  confirmButtonColor: '#17a2b8'})
			setTimeout(() => $('#expense_insert').submit() , 1500);
   }
  // 지출 수정
   function updateExpense() {
		Swal.fire({
			  title: '수정 되었습니다!',
			  confirmButtonColor: '#17a2b8'})
			setTimeout(() => $('#expense_update').submit() , 1500);
   }
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

						<!-- -----------------------------------검색부분---------------------------------- -->
						<div
							style="text-align: left; padding: 5px; display: inline-block; width: 60%;">
							<form id="expense_search" method="post"
								action="getExpenseList.src1">
								<span class="input-group"> <select
									name="expense_date_year" class="form-control" id="dept_options">
										<option value="전체">년</option>
										<option value=2021>2021</option>
								</select> <select name="expense_date_month" class="form-control"
									id="rank_options">
										<option value="전체">월</option>
										<%
										int month = 12;
										int day = 31;
										for (int i = 1; i <= month; i++) {
										%>
										<option value="<%=i%>"><%=i%></option>
										<%
										} //end of for
										%>
								</select> <select name="expense_date_day" class="form-control"
									id="rank_options">
										<option value="전체">일</option>
										<%
										for (int i = 1; i <= day; i++) {
										%>
										<option value="<%=i%>"><%=i%></option>
										<%
										} //end of for
										%>
								</select> <a href="javascript:expenseSearchAction()"
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
										<th style="width: 18%">분류</th>
										<th style="width: 15%">부서</th>
										<th style="width: 20%">금액</th>
										<th style="width: 20%">내용</th>
										<th style="width: 17%">지출일자</th>
										<th style="width: 10%">수정</th>
									</tr>
								</thead>
								<tbody>
									<%
									//조회 결과가 없는 거야?
									if (size == 0) {
									%>
									<tr>
										<td colspan="7">조회결과가 없습니다.</td>
									</tr>
									<%
									} else {//조회 결과가 있을 때
									for (int i = 0; i < size; i++) {
										Map<String, Object> rmap = expenseList.get(i);
										if (i == size)
											break;

										String dept_name = null;
										String expense_type_name = null;
										switch (rmap.get("DEPT_NO").toString()) {
										case "20":
											dept_name = "개발부";
											break;
										case "30":
											dept_name = "인사부";
											break;
										case "40":
											dept_name = "회계부";
											break;
										case "10":
											dept_name = "임원";
											break;
										}
										switch (rmap.get("EXPENSE_TYPE").toString()) {
										case "1":
											expense_type_name = "인건비";
											break;
										case "2":
											expense_type_name = "교육훈련비";
											break;
										case "3":
											expense_type_name = "임차료";
											break;
										case "4":
											expense_type_name = "통신비";
											break;
										case "5":
											expense_type_name = "수도광열비";
											break;
										case "6":
											expense_type_name = "소모품비";
											break;
										case "7":
											expense_type_name = "기타";
											break;
										}
									%>
									<!-- 
			===============DB에서 데이터 가져와서 뿌려주기======================
			 -->
									<tr id="<%=rmap.get("EXPENSE_NO")%>">
										<td id="expense_type" value="<%=rmap.get("EXPENSE_TYPE")%>"><%=expense_type_name%></td>
										<td id="dept_no" value="<%=rmap.get("DEPT_NO")%>"><%=dept_name%></td>
										<td id="expense_price" value="<%=rmap.get("EXPENSE_PRICE")%>"><%=rmap.get("EXPENSE_PRICE")%></td>
										<td id="expense_detail"
											value="<%=rmap.get("EXPENSE_DETAIL")%>"><%=rmap.get("EXPENSE_DETAIL")%></td>
										<td id="expense_date" value="<%=rmap.get("EXPENSE_DATE")%>"><%=rmap.get("EXPENSE_DATE")%></td>
										<td id="asdaq"><button type="button"
												class="btn btn-warning" id="adsad" data-toggle="modal"
												data-target="#mod_updEmp" onclick="updExpense(this)">
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
									<form id="expense_insert" method="post"
										action="insertExpense.src1">
										<div class="modal-header">
											<h4 class="modal-title" id="myModalLabel">지출추가</h4>
										</div>
										<div class="modal-body">
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">분류</span> <select
													name="expense_type" class="form-control" id="dept_options">
													<option value="1">인건비</option>
													<option value="2">교육훈련비</option>
													<option value="3">임차료</option>
													<option value="4">통신비</option>
													<option value="5">수도광열비</option>
													<option value="6">소모품비</option>
													<option value="7">기타</option>
												</select>
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">부서</span> <select
													name="dept_no" class="form-control">
													<option value="20">개발부</option>
													<option value="10">임원</option>
													<option value="30">인사부</option>
													<option value="40">회계부</option>
												</select>
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">금액</span> <input
													type="text" name="expense_price" class="form-control"
													value="" aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">내용</span> <input
													type="text" name="expense_detail" class="form-control"
													value="" aria-describedby="basic-addon1">
											</div>
											<br>
											<div class="input-group">
												<span class="input-group-addon" id="basic-addon1"
													style="display: inline-block; width: 25%">지출일자</span> <input
													type="date" name="expense_date" class="form-control"
													value="" aria-describedby="basic-addon1">
											</div>
											<br>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-info"
												onclick="insertExpense()">추가</button>
											<button type="button" class="btn btn-danger"
												data-dismiss="modal">닫기</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!---------------- 지출 추가 Modal 끝 ----------------------------------------------->

					<!---------------- 지출 수정 Modal 시작 --------------------------------------->
					<div class="modal fade" id="mod_updEmp" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<form id="expense_update" method="post"
								action="updateExpense.src1">
								<div class="modal-content">
									<div class="modal-header">
										<h4 class="modal-title" id="myModalLabel">지출수정</h4>
									</div>
									<div class="modal-body">
										<div class="input-group">
											<span class="input-group-addon"
												style="display: inline-block; width: 25%">분류</span> <select
												name="expense_type" class="form-control"
												id="upd_expense_type">
												<option value="1">인건비</option>
												<option value="2">교육훈련비</option>
												<option value="3">임차료</option>
												<option value="4">통신비</option>
												<option value="5">수도광열비</option>
												<option value="6">소모품비</option>
												<option value="7">기타</option>
											</select>
										</div>
										<br>
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1"
												style="display: inline-block; width: 25%">부서</span> <select
												name="dept_no" class="form-control" id="upd_dept_no">
												<option value="20">개발부</option>
												<option value="10">임원</option>
												<option value="30">인사부</option>
												<option value="40">회계부</option>
											</select>
										</div>
										<br>
										<div class="input-group">
											<span class="input-group-addon"
												style="display: inline-block; width: 25%">금액</span> <input
												type="text" name="expense_price" class="form-control"
												value="" aria-describedby="basic-addon1"
												id="upd_expense_price">
										</div>
										<br>
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1"
												style="display: inline-block; width: 25%">내용</span> <input
												type="text" name="expense_detail" class="form-control"
												value="" aria-describedby="basic-addon1"
												id="upd_expense_detail">
										</div>
										<br>
										<div class="input-group">
											<span class="input-group-addon" id="basic-addon1"
												style="display: inline-block; width: 25%">지출일자</span> <input
												type="date" name="expense_date" class="form-control"
												value="" aria-describedby="basic-addon1"
												id="upd_expense_date">
										</div>
										<input type="text" name="expense_no" class="form-control"
											value="" aria-describedby="basic-addon1"
											id="upd_expense_no" hidden> <br>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-warning"
											onclick="updateExpense()">수정</button>
										<button type="button" class="btn btn-danger"
											data-dismiss="modal">닫기</button>
									</div>
								</div>
							</form>
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