<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
List<Map<String, Object>> boardList = null;
boardList = (List<Map<String, Object>>) request.getAttribute("boardList");
int size = 0;
if (boardList != null) {
	size = boardList.size();

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
<script>
	$(document).ready(
			function() {
				var $setRows = $('#setRows');

				$setRows.submit(function(e) {
					e.preventDefault();
					var rowPerPage = $('#rowPerPage').val() * 1;
					// 1 을  곱하여 문자열을 숫자형로 변환

					$('#nav').remove();
					var $products = $('#products');
					console.log("dd1");

					$products.after('<div id="nav">');

					var $tr = $($products).find('tbody tr');
					var rowTotals = $tr.length;

					var pageTotal = Math.ceil(rowTotals / rowPerPage);
					var i = 0;
					console.log("dd2");

					for (; i < pageTotal; i++) {
						$('<a href="#"></a>').attr('rel', i).html(i + 1)
								.appendTo('#nav');
					}
					$tr.addClass('off-screen').slice(0, rowPerPage)
							.removeClass('off-screen');

					console.log("dd3");
					var $pagingLink = $('#nav a');
					$pagingLink.on('click', function(evt) {
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
						$tr.css('opacity', '0.0').addClass('off-screen').slice(
								startItem, endItem).removeClass('off-screen')
								.animate({
									opacity : 1
								}, 300);
						console.log("5");
					});

					console.log("dd6");
					$pagingLink.filter(':first').addClass('active');

				});

				$setRows.submit();
			});

	function empSearchAction() {
		console.log("입력 액션 호출");
		$('#emp_search').submit();
	}
</script>
<title>Account - ERP PROGRAM</title>
</head>
<body class="sb-nav-fixed">
	<main id="input_div">
		<div id="frame_div" style="border: 1px solid black;">
			<div id="page_title"
				style="border-bottom: 2px solid gray; margin: 50px 30px;">
				<h2>사원 검색</h2>
			</div>
			<div id="page_contents"
				style="max-width: 1730px; margin: 10px 100px;">
				<!-- 컨텐츠 들어갈내용 시작-->
				<div class="container">
					<div class="col">
						<div
							style="text-align: left; padding: 5px; display: inline-block; width: 49%;">
							<form id="emp_search" method="post" enctype="multipart/form-data"
								action="getEmpSearchList.src1">
								<span class="input-group"> <select name="dept_name"
									class="form-control" id="dept_options">
										<option value="전체">부서</option>
										<option value="개발부">개발</option>
										<option value="인사부">인사</option>
										<option value="회계부">회계</option>
										<option value="임원">임원</option>
								</select> <select name="rank_name" class="form-control" id="rank_options">
										<option value="전체">직위</option>
										<option value="사원">사원</option>
										<option value="대리">대리</option>
										<option value="차장">차장</option>
										<option value="과장">과장</option>
										<option value="부장">부장</option>
										<option value="부사장">부사장</option>
										<option value="이사">이사</option>
										<option value="대표">대표</option>
								</select> <input name="emp_name" type="text"
									class="form-control float-left " placeholder="이름"> <a
									href="javascript:empSearchAction()"
									class="btn btn-default float-left" role="button"><i
										class="fas fa-search"></i></a>
								</span>
							</form>
						</div>
						<div
							style="text-align: right; padding: 5px; display: inline-block; width: 50%">
							<button class="btn btn-info"
								onclick="Select()">선택</button>

						</div>
					</div>
					<div>
						<table class="table table-bordered table-hover table-striped"
							id="products">

							<form action="" id="setRows">
								<input type="hidden" name="rowPerPage" value="10"
									id="rowPerPage">
							</form>
							<thead>
								<tr class="thead-dark">
									<th>선택</th>
									<th>사원번호</th>
									<th>이름</th>
									<th>부서</th>
									<th>직위</th>
								</tr>
							</thead>
							<tbody>
								<%
								//조회 결과가 없는거야?
								String emp_status = null;
								if (size == 0) {
								%>
								<tr>
									<th colspan="5">조회 결과가 없습니다.</th>
								</tr>
								<%
								} else {//조회 결과가 있는데..
								for (int i = 0; i < size; i++) {
									Map<String, Object> rmap = boardList.get(i);
									if (i == size)
										break;
								%>

								<tr>
									<td><input type="checkbox"></td>
									<td><%=rmap.get("EMP_NO")%></td>
									<td><%=rmap.get("EMP_NAME")%></td>
									<td><%=rmap.get("DEPT_NAME")%></td>
									<td><%=rmap.get("RANK_NAME")%></td>
								</tr>
								<%
								} ///end of for
								} ///end of else
								%>

							</tbody>
						</table>
					</div>
				</div>
				<!-- 컨텐츠 들어갈내용 끝   -->
			</div>
		</div>
	</main>