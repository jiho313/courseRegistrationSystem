<%@page import="java.net.URLEncoder"%>
<%@page import="util.StringUtils"%>
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
	int deptNo = StringUtils.stringToInt((request.getParameter("deptNo")));
	
	ProfessorDao professorDao = ProfessorDao.getInstance();

	if (professorDao.getProfessorById(id) != null){
		response.sendRedirect("form.jsp?err=dup");
		return;
	}

	Professor professor = new Professor();
	professor.setId(id);
	professor.setPassword(password);
	professor.setName(name);
	professor.setPosition(position);
	professor.setDept(new Dept(deptNo));
	
	if (id == null || name.isBlank()){
	    response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("교육자 가입", "utf-8") );
	    return;
	}
	
	professorDao.insetProfessor(professor);
	
	response.sendRedirect("../home.jsp");
%>