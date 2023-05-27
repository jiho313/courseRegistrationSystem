<%@page import="vo.Dept"%>
<%@page import="java.util.List"%>
<%@page import="dao.DeptDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	DeptDao deptDao = new DeptDao();
	List<Dept> deptList = deptDao.getDepts();
	String err = (String) request.getParameter("err");
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
	<jsp:param name="menu" value="회원가입"/>
</jsp:include>
<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">교수로 등록하기</h1>
      	</div>
   	</div>
   	<div class="row mb-3">
   		<div class="col-12">
   			<p>사용자 정보를 입력하고 등록하세요.</p>
<%
	if ("dup".equals(err)) {
%>
		<div class="alert alert-danger">
			<strong>회원가입 실패</strong> 아이디가 이미 사용중입니다.
		</div>
<%
	}
%>
   			<form class="border bg-light p-3" method="post" action="insert.jsp">
   				<div class="form-group mb-2 w-75">
   					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="position"  value="정교수" checked="checked">
  						<label class="form-check-label" for="inlineRadio1">정교수</label>
					</div>
					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="position" value="부교수">
  						<label class="form-check-label" for="inlineRadio2">부교수</label>
					</div>
   					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="position"  value="조교수">
  						<label class="form-check-label" for="inlineRadio1">조교수</label>
					</div>
					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="position" value="강사">
  						<label class="form-check-label" for="inlineRadio2">강사</label>
					</div>
   				</div>
   				<div class="form-group mb-2 w-75">
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
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">아이디</label>
   					<input type="text" class="form-control" name="id" />
   				</div>
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">비밀번호</label>
   					<input type="text" class="form-control" name="password" />
   				</div>
   				<div class="form-group mb-2 w-75">
   					<label class="form-label">이름</label>
   					<input type="text" class="form-control" name="name" />
   				</div>
   				<div class="text-end w-75">
   					<button type="submit" class="btn btn-primary">로그인</button>
   				</div>
   			</form>
   		</div>
   	</div>
</div>
</body>
</html>