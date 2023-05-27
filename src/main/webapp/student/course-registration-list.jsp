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
        	<h1 class="border bg-light fs-4 p-2">수강신청 현황</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>현재 수강신청 현황을 확인하세요</p>
			<table class="table">
				<thead>
					<tr class="table-dark">
						<th style="width: 10%;">신청번호</th>
						<th style="width: 10%;">과정번호</th>
						<th style="width: 20%;">과정명</th>
						<th style="width: 15%;">학과</th>
						<th style="width: 15%;">담당교수</th>
						<th style="width: 15%;">신청상태</th>
						<th style="width: 15%;"></th>
					</tr>
				</thead>
				<tbody>
					<tr class="align-middle">
						<td>2000</td>
						<td>1000</td>
						<td>웹 애플리케이션 기초</td>
						<td>컴퓨터공학과</td>
						<td>홍길동</td>
						<td><span class="badge text-bg-success">신청완료</span></td>
						<td>
							<a href="course-detail.jsp?no=1000" class="btn btn-outline-dark btn-xs">상세정보</a>
							<a href="course-cancel.jsp?regNo=2000" class="btn btn-outline-danger btn-xs">수강취소</a>
						</td>
					</tr>
					<tr class="align-middle">
						<td>1000</td>
						<td>2000</td>
						<td>웹 애플리케이션 기초</td>
						<td>컴퓨터공학과</td>
						<td>홍길동</td>
						<td><span class="badge text-bg-secondary">수강취소</span></td>
						<td>
							<a href="course-detail.jsp?cno=1000" class="btn btn-outline-dark btn-xs">상세정보</a>
							<a href="course-reapply.jsp?regNo=2000" class="btn btn-primary btn-xs">재신청</a>
						</td>
					</tr>
					<tr class="align-middle">
						<td>1000</td>
						<td>2000</td>
						<td>웹 애플리케이션 기초</td>
						<td>컴퓨터공학과</td>
						<td>홍길동</td>
						<td><span class="badge text-bg-success">신청완료</span></td>
						<td>
							<a href="course-detail.jsp?cno=1000" class="btn btn-outline-dark btn-xs">상세정보</a>
							<a href="course-cancel.jsp?regNo=2000" class="btn btn-outline-danger btn-xs">수강취소</a>
						</td>
					</tr>
					<tr class="align-middle">
						<td>1000</td>
						<td>2000</td>
						<td>웹 애플리케이션 기초</td>
						<td>컴퓨터공학과</td>
						<td>홍길동</td>
						<td><span class="badge text-bg-success">신청완료</span></td>
						<td>
							<a href="course-detail.jsp?no=1000" class="btn btn-outline-dark btn-xs">상세정보</a>
							<a href="course-cancel.jsp?regNo=2000" class="btn btn-outline-danger btn-xs">수강취소</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>