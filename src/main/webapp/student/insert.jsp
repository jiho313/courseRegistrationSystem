<%@page import="java.net.URLEncoder"%>
<%@page import="util.StringUtils"%>
<%@page import="vo.Dept"%>
<%@page import="vo.Student"%>
<%@page import="dao.StudentDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 학생으로 회원가입 시킨다.
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	int grade = StringUtils.stringToInt((request.getParameter("grade")));
	int deptNo = StringUtils.stringToInt((request.getParameter("deptNo")));

	Student student = new Student();
	StudentDao studentDao = new StudentDao();
	
	
	if (studentDao.getStudentById(id) != null){
		response.sendRedirect("form.jsp?err=dup");
		return;
	}

	student.setId(id);
	student.setPassword(password);
	student.setName(name);
	student.setGrade(grade);
	student.setDept(new Dept(deptNo));
	
	if (id == null || name.isBlank()){
	    response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("학생 가입", "utf-8") );
	    return;
	}
	
	studentDao.insertStudent(student);
	
	response.sendRedirect("../home.jsp");
%>