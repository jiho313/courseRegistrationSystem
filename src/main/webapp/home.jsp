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
</head>
<body>
<jsp:include page="nav.jsp">
	<jsp:param name="menu" value="홈"/>
</jsp:include>

<div class="container">
	<div class="bg-light p-3">
		<h1 class="mb-5">수강신청 시스템</h1>
		<p class="mb-1">학생, 교수로 사용자를 등록할 수 있습니다.</p>
		<p class="mb-1">학생은 과정조회/수강신청/수강신청현황조회/수강취소 서비스를 제공받습니다.</p>
		<p class="mb-1">교수는 과정조회/과정등록/과정현황조회 서비스를 제공받습니다.</p>
	</div>
</div>
</body>
</html>