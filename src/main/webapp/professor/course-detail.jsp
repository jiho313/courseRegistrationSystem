<%@page import="vo.Registration"%>
<%@page import="util.StringUtils"%>
<%@page import="java.util.List"%>
<%@page import="vo.Course"%>
<%@page import="dao.ProfessorDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String)session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");
	
	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("과정 현황 조회", "utf-8"));
		return;
	}
	
	if (!"PROFESSOR".equals(loginType)){
		response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("과정 현황 조회", "utf-8"));
		return;
	}
	
	int no = StringUtils.stringToInt(request.getParameter("no"));
	
	ProfessorDao professorDao = ProfessorDao.getInstance();
	Course course = professorDao.getCourseDetailByNo(no);
	List<Registration> registrationList = professorDao.getStudentsRegisteredInCourseByCourseNo(no);
	
	if (course == null) {
		response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("과정 현황 조회", "utf-8"));
		return;
	}
	if (!course.getProfessor().getId().equals(loginId)){
		response.sendRedirect("course-list.jsp?err=deny");
		return;
	}
	
	
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
        	<h1 class="border bg-light fs-4 p-2">과정 상세 정보</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>과정 상세정보를 확인하세요</p>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th class="table-dark" style="width: 15%;">과정이름</th>
						<td style="width: 35%;"><%=course.getName() %></td>
						<th class="table-dark" style="width: 15%;">번호</th>
						<td style="width: 35%;"><%=course.getNo() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">구분</th>
						<td style="width: 35%;"><%=course.getType() %></td>
						<th class="table-dark" style="width: 15%;">학점</th>
						<td style="width: 35%;"><%=course.getScore() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">학과</th>
						<td style="width: 35%;"><%=course.getDept().getName() %></td>
						<th class="table-dark" style="width: 15%;">담당교수</th>
						<td style="width: 35%;"><%=course.getProfessor().getName() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">모집정원</th>
						<td style="width: 35%;"><%=course.getQuota() %></td>
						<th class="table-dark" style="width: 15%;">신청자수</th>
						<td style="width: 35%;"><%=course.getReqCnt() %></td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">설명</th>
						<td style="width: 85%; height: 100px;" colspan="3"><%=course.getDescription() %></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>해당 과정을 신청한 학생들을 확인하세요</p>
			<table class="table table-sm">
				<thead>
					<tr class="table-dark">
						<th style="width: 20%;">순번</th>
						<th style="width: 20%;">아이디</th>
						<th style="width: 20%;">학생이름</th>
						<th style="width: 20%;">소속학과</th>
						<th style="width: 20%;">학년</th>
					</tr>
				</thead>
				<tbody>
<%
	if (registrationList.isEmpty()) {
%>
		   <tr>
     		<td colspan="7">
				<div class="alert alert-secondary">
   				수강 신청 정보가 존재하지 않습니다.
					</div>
				</td>
		</tr>
<%		
	}
%>

<%
	for (Registration registeredCourse : registrationList) {
%>
					<tr>
						<td><%=registeredCourse.getRowNum() %></td>
						<td><%=registeredCourse.getStudent().getId() %></td>
						<td><%=registeredCourse.getStudent().getName() %></td>
						<td><%=registeredCourse.getDept().getName() %></td>
						<td><%=registeredCourse.getStudent().getGrade() %></td>
					</tr>
<%
	}
%>					
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>