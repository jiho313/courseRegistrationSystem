<%@page import="vo.Dept"%>
<%@page import="vo.Professor"%>
<%@page import="dao.ProfessorDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 교수로 회원가입 시킨다.
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String position = request.getParameter("position");
	int deptNo = Integer.parseInt(request.getParameter("deptNo"));

	ProfessorDao professorDao = new ProfessorDao();
	Professor professor = new Professor();
	
	professor.setId(id);
	professor.setPassword(password);
	professor.setName(name);
	professor.setPosition(position);
	professor.setDept(new Dept(deptNo));
	
	
	if (professorDao.getProfessorById(id) != null){
		response.sendRedirect("form.jsp?err=dup");
		return;
	}
	
	professorDao.insetProfessor(professor);
	
	response.sendRedirect("../home.jsp");
%>