<%@page import="dao.ProfessorDao"%>
<%@page import="dao.StudentDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 로그인처리
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String type = request.getParameter("type");
	
	StudentDao studentDao = new StudentDao();
	ProfessorDao professorDao = new ProfessorDao();
	
	if ("STUDENT".equals(type)){
		if (studentDao.getStudentById(id) == null){
			response.sendRedirect("loginform.jsp?err=fail");
			return;
		}
		if (!studentDao.getStudentById(id).getPassword().equals(password)){
			response.sendRedirect("loginform.jsp?err=fail");
			return;
		}
		session.setAttribute("loginId", id);
		session.setAttribute("loginType", type);
	}
	
	if ("PROFESSOR".equals(type)){
		if (professorDao.getProfessorById(id) == null){
			response.sendRedirect("loginform.jsp?err=fail");
			return;
		}
		if (!professorDao.getProfessorById(id).getPassword().equals(password)){
			response.sendRedirect("loginform.jsp?err=fail");
			return;
		}
		session.setAttribute("loginId", id);
		session.setAttribute("loginType", type);
	}
	
	response.sendRedirect("home.jsp");
%>