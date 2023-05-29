<%@page import="java.net.URLEncoder"%>
<%@page import="dto.Pagination"%>
<%@page import="util.StringUtils"%>
<%@page import="vo.Course"%>
<%@page import="java.util.List"%>
<%@page import="vo.Professor"%>
<%@page import="dao.ProfessorDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String)session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");
	String err = request.getParameter("err");

	if (loginId == null) {
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("개설과정조회", "utf-8"));
		return;
	}
	
	if (!"PROFESSOR".equals(loginType)) {
		response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("개설과정조회", "utf-8"));
		return;
	}
	
	ProfessorDao professorDao =new ProfessorDao();

	int pageNo = StringUtils.stringToInt(request.getParameter("page"), 1);
	int totalRows = professorDao.getTotalRows(loginId);

	Pagination pagination = new Pagination(pageNo, totalRows);

	List<Course> courseList = professorDao.getCourses(pagination.getBegin(), pagination.getEnd(), loginId);
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
<style type="text/css">
	.btn.btn-xs {--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;}
</style>
</head>
<body>
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="교수"/>
</jsp:include>
<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">개설한 과정 목록</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
<%
	if (!courseList.isEmpty()){
%>
			<p>개설한 과정을 확인하세요.</p>
<%
	}
%>
<%
	if ("deny".equals(err)) {
%>
		<div class="alert alert-danger">
			<strong>과정 현황 조회 실패</strong> 타인이 개설한 과정은 조회할 수 없습니다.
		</div>
<%
	}
%>
			<table class="table">
				<thead>
					<tr class="table-dark">
						<th style="width: 10%;">번호</th>
						<th style="width: 15%;">구분</th>
						<th style="width: 20%;">과정명</th>
						<th style="width: 15%;">학과</th>
						<th style="width: 15%;">모집정원</th>
						<th style="width: 15%;">신청자수</th>
						<th style="width: 10%;"></th>
					</tr>
				</thead>
				<tbody>
<%
    if (courseList.isEmpty()) {
%>
				   <tr>
        	      		<td colspan="7">
         					<div class="alert alert-secondary">
                				개설한 과정이 존재하지 않습니다.
          					</div>
      					</td>
					</tr>
<%
    }
%>
					<tr class="align-middle">
<%
	for (Course course : courseList) {
%>
					<tr class="align-middle">
						<td><%=course.getNo() %></td>
						<td><%=course.getType() %></td>
						<td><%=course.getName() %></td>
						<td><%=course.getDept().getName() %></td>
						<td><%=course.getQuota() %></td>
						<td><%=course.getReqCnt() %></td>
						<td><a href="course-detail.jsp?no=<%=course.getNo() %>" class="btn btn-outline-dark btn-xs">상세정보</a></td>
					</tr>
<%
	}
%>

				</tbody>
			</table>
		</div>
	</div>

	<div class="row mb-3">
		<div class="col-12">
			<nav>
				<ul class="pagination justify-content-center">
					<li class="page-item <%=pageNo <= 1 ? "disabled" : "" %>"><a class="page-link" href="course-list.jsp?page=1">이전</a></li>
<%
	for (int num = pagination.getBeginPage(); num <= pagination.getEndPage(); num++) {
%>
					<li class="page-item"><a class="page-link <%=pageNo == num ? "active" : "" %>" href="course-list.jsp?page=<%=num %>"><%=num %></a></li>
<%
	}
%>
					<li class="page-item "><a class="page-link <%=pageNo >= pagination.getTotalPages() ? "disabled" : "" %>" href="course-list.jsp?page=<%=pageNo + 1 %>">다음</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
</body>
</html>