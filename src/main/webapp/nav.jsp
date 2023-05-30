<%@page import="vo.Professor"%>
<%@page import="dao.ProfessorDao"%>
<%@page import="vo.Student"%>
<%@page import="dao.StudentDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	String menu = request.getParameter("menu");
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");
	System.out.println("메뉴 - " + menu);
	System.out.println("아이디 - " + loginId);
	System.out.println("타입 - " + loginType);
	
	StudentDao studentDao = StudentDao.getInstance();
	ProfessorDao professorDao = ProfessorDao.getInstance();
	Student student = studentDao.getStudentById(loginId);
	Professor professor = professorDao.getProfessorById(loginId);
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
	<div class="container">
    	<ul class="navbar-nav me-auto">
        	<li class="nav-item"><a class="nav-link <%="홈".equals(menu) ? "active" : "" %>"  href="/app4/home.jsp">홈</a></li>
<%
	if ("STUDENT".equals(loginType)) {
%>
			<li class="nav-item dropdown">
          		<a class="nav-link dropdown-toggle <%="학생".equals(menu) ? "active" : "" %>" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	학생
          		</a>
          		<ul class="dropdown-menu">
            		<li><a class="dropdown-item" href="/app4/student/course-list.jsp">모든 과정 조회</a></li>
            		<li><a class="dropdown-item" href="/app4/student/course-registration-list.jsp">신청현황 조회</a></li>
          		</ul>
        	</li>
<%
	} else if ("PROFESSOR".equals(loginType)) {
%>
			<li class="nav-item dropdown">
          		<a class="nav-link dropdown-toggle <%="교수".equals(menu) ? "active" : "" %>" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	교수
          		</a>
          		<ul class="dropdown-menu">
            		<li><a class="dropdown-item" href="/app4/professor/course-list.jsp">개설한 과정 조회</a></li>
            		<li><a class="dropdown-item" href="/app4/professor/course-form.jsp">과정 등록</a></li>
          		</ul>
        	</li>
 <%
	}
 %>
      	</ul>
      	<ul class="navbar-nav">
 <%
 	if (loginId == null) {
 %>
			<li class="nav-item dropdown">
          		<a class="nav-link dropdown-toggle <%="회원가입".equals(menu) ? "active" : "" %>"  href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            	사용자 등록
          		</a>
          		<ul class="dropdown-menu">
            		<li><a class="dropdown-item " href="/app4/student/form.jsp">학생</a></li>
            		<li><a class="dropdown-item" href="/app4/professor/form.jsp">교수</a></li>
          		</ul>
        	</li>
         	<li class="nav-item"><a class="nav-link <%="로그인".equals(menu) ? "active" : "" %>" href="/app4/loginform.jsp">로그인</a></li>
<%
 	}
%>
 <%
 	if (loginId != null) {
 		if(student != null) {
 %>
         	<li class="nav-item"><a class="nav-link "><%=student.getName()%>님 환영합니다.</a></li>
         	<li class="nav-item"><a class="nav-link " href="/app4/logout.jsp">로그아웃</a></li>
<%
 		} else if (professor != null) {
%>
 			<li class="nav-item"><a class="nav-link "><%=professor.getName()%>님 환영합니다.</a></li>
         	<li class="nav-item"><a class="nav-link " href="/app4/logout.jsp">로그아웃</a></li>
<%
 		}
 	}
 %>        	
      	</ul>
   	</div>
</nav>