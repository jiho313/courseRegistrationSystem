<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Dept"%>
<%@page import="java.util.List"%>
<%@page import="dao.DeptDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");
	
	
	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("과정등록", "utf-8"));
		return;
	}
	
	if (!"PROFESSOR".equals(loginType)){
		response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("과정등록", "utf-8"));
		return;
	}
	
	DeptDao deptDao = new DeptDao();
	List<Dept> deptList = deptDao.getDepts();
%>
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
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="교수"/>
</jsp:include>
<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">과정 등록하기</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>신규 과정 정보를 입력하고, 등록하세요.</p>
			<div class="border bg-light p-3">
				<form class="row g-3" method="post" action="course-insert.jsp">
	 				<div class="col-md-12">
						<label class="form-label">과정명</label>
						<input type="text" class="form-control" name="name">
					</div>
	 				<div class="col-md-6">
						<label class="form-label">구분</label>
						<div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="type"  value="전공" checked="checked">
		  						<label class="form-check-label" >전공</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="type" value="교양">
		  						<label class="form-check-label" >교양</label>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<label class="form-label">학과</label>
						<select class="form-select" name="deptNo">
<%
	for (Dept dept : deptList) {
%>
	   						<option value="<%=dept.getNo() %>"><%=dept.getName() %></option>
<%
	}
%>
	   					</select>
					</div>
	 				<div class="col-md-6">
						<label class="form-label">학점</label>
						<div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="score"  value="3" checked="checked">
		  						<label class="form-check-label" >3학점</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="score" value="2">
		  						<label class="form-check-label" >2학점</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="score" value="1">
		  						<label class="form-check-label" >1학점</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="score" value="0">
		  						<label class="form-check-label" >수료</label>
							</div>
						</div>
					</div>
	 				
					<div class="col-md-6">
						<label class="form-label">모집정원</label>
						<div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="quota"  value="10" checked="checked">
		  						<label class="form-check-label" >10명</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="quota" value="20">
		  						<label class="form-check-label" >20명</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="quota" value="30">
		  						<label class="form-check-label" >30명</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="quota"  value="40">
		  						<label class="form-check-label" >40명</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="quota" value="50">
		  						<label class="form-check-label" >50명</label>
							</div>
						</div>
					</div>
	  				<div class="col-md-12">
						<label class="form-label">설명</label>
						<textarea rows="3" class="form-control" name="description"></textarea>
					</div>
					<div class="text-end">
						<button type="submit" class="btn btn-primary btn-sm">등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>