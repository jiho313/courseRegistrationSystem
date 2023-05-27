<%@page import="vo.Dept"%>
<%@page import="vo.Student"%>
<%@page import="dao.StudentDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 학생으로 회원가입 시킨다.
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	int grade = Integer.parseInt(request.getParameter("grade"));
	int deptNo = Integer.parseInt(request.getParameter("deptNo"));

	Student student = new Student();
	StudentDao studentDao = new StudentDao();
	
	student.setId(id);
	student.setPassword(password);
	student.setName(name);
	student.setGrade(grade);
	student.setDept(new Dept(deptNo));
	
	if (studentDao.getStudentById(id) != null){
		response.sendRedirect("form.jsp?err=dup");
		return;
	}
	
	studentDao.insertStudent(student);
	
	response.sendRedirect("../home.jsp");
%>