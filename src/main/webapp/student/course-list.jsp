<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style type="text/css">
	.btn.btn-xs {--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;}
</style>
</head>
<body>
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="학생"/>
</jsp:include>
<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">과정 목록</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>개설된 과정을 확인하고, 수강신청하세요.</p>
			<table class="table">
				<thead>
					<tr class="table-dark">
						<th style="width: 10%;">번호</th>
						<th style="width: 20%;">과정명</th>
						<th style="width: 15%;">학과</th>
						<th style="width: 15%;">담당교수</th>
						<th style="width: 15%;">모집정원</th>
						<th style="width: 15%;">신청자수</th>
						<th style="width: 10%;"></th>
					</tr>
				</thead>
				<tbody>
					<tr class="align-middle">
						<td>100</td>
						<td>웹 애플리케이션 기초</td>
						<td>컴퓨터공학과</td>
						<td>홍길동</td>
						<td>30</td>
						<td>6</td>
						<td><a href="course-detail.jsp?no=1" class="btn btn-outline-dark btn-xs">상세정보</a></td>
					</tr>
					<tr class="align-middle">
						<td>100</td>
						<td>웹 애플리케이션 기초</td>
						<td>컴퓨터공학과</td>
						<td>홍길동</td>
						<td>30</td>
						<td>6</td>
						<td><a href="course-detail.jsp?no=1" class="btn btn-outline-dark btn-xs">상세정보</a></td>
					</tr>
					<tr class="align-middle">
						<td>100</td>
						<td>웹 애플리케이션 기초</td>
						<td>컴퓨터공학과</td>
						<td>홍길동</td>
						<td>30</td>
						<td>6</td>
						<td><a href="course-detail.jsp?no=1" class="btn btn-outline-dark btn-xs">상세정보</a></td>
					</tr>
					<tr class="align-middle">
						<td>100</td>
						<td>웹 애플리케이션 기초</td>
						<td>컴퓨터공학과</td>
						<td>홍길동</td>
						<td>30</td>
						<td>6</td>
						<td><a href="course-detail.jsp?no=1" class="btn btn-outline-dark btn-xs">상세정보</a></td>
					</tr>
					<tr class="align-middle">
						<td>100</td>
						<td>웹 애플리케이션 기초</td>
						<td>컴퓨터공학과</td>
						<td>홍길동</td>
						<td>30</td>
						<td>6</td>
						<td><a href="course-detail.jsp?no=1" class="btn btn-outline-dark btn-xs">상세정보</a></td>
					</tr>
					<tr class="align-middle">
						<td>100</td>
						<td>웹 애플리케이션 기초</td>
						<td>컴퓨터공학과</td>
						<td>홍길동</td>
						<td>30</td>
						<td>6</td>
						<td><a href="course-detail.jsp?no=1" class="btn btn-outline-dark btn-xs">상세정보</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link disabled" href="course-list.jsp?page=1">이전</a></li>
					<li class="page-item"><a class="page-link active" href="course-list.jsp?page=1">1</a></li>
					<li class="page-item"><a class="page-link" href="course-list.jsp?page=2">2</a></li>
					<li class="page-item"><a class="page-link" href="course-list.jsp?page=3">3</a></li>
					<li class="page-item"><a class="page-link" href="course-list.jsp?page=4">4</a></li>
					<li class="page-item"><a class="page-link" href="course-list.jsp?page=5">5</a></li>
					<li class="page-item"><a class="page-link" href="course-list.jsp?page=2">다음</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
</body>
</html>