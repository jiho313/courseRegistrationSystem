<%@page import="dao.RegistrationDao"%>
<%@page import="vo.Registration"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");
	String err = request.getParameter("err");
	
	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("수강 신청 현황", "utf-8"));
		return;
	}
	
	if (!"STUDENT".equals(loginType)){
		response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("수강 신청 현황", "utf-8"));
		return;
	}
	
	RegistrationDao registrationDao = new RegistrationDao();
	List<Registration> registrationList = registrationDao.getRegistrations(loginId);
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
<%
	if (!registrationList.isEmpty()){
%>
			<p>현재 수강신청 현황을 확인하세요</p>
<%
	}
%>
<%
	if ("deny".equals(err)) {
%>
		<div class="alert alert-danger">
			<strong>수강 취소 실패</strong> 타인의 수강신청 정보는 변경할 수 없습니다.
		</div>
<%
	}
%>
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
<%
    if (registrationList.isEmpty()) {
%>
				   <tr>
        	      		<td colspan="7">
         					<div class="alert alert-secondary">
                				수강신청 현황이 존재하지 않습니다.
          					</div>
      					</td>
					</tr>
<%
    }
%>
					<tr class="align-middle">
<%
	for (Registration registration : registrationList) {
%>
						<td><%=registration.getNo() %></td>
						<td><%=registration.getCourse().getNo() %></td>
						<td><%=registration.getCourse().getName() %></td>
						<td><%=registration.getDept().getName() %></td>
						<td><%=registration.getProfessor().getName() %></td>
<%
	if ("신청완료".equals(registration.getRegStatus())) {
%>
						<td><span class="badge text-bg-primary"><%=registration.getRegStatus() %></span></td>
<%
	} else {
%>
						<td><span class="badge text-bg-secondary"><%=registration.getRegStatus() %></span></td>
<%
	}
%>
						<td>
							<a href="course-detail.jsp?no=<%=registration.getCourse().getNo() %>" class="btn btn-outline-dark btn-xs">상세정보</a>
<%
	if ("신청완료".equals(registration.getRegStatus())) {
%>							
							<a href="course-cancel.jsp?rno=<%=registration.getNo() %>" class="btn btn-outline-danger btn-xs">수강취소</a>
<%
	} else {
%>
							<a href="course-reapply.jsp?rno=<%=registration.getNo() %>" class="btn btn-outline-success btn-xs">재수강</a>
<%
	}
%>
						</td>
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