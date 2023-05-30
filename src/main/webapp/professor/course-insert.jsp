<%@page import="util.StringUtils"%>
<%@page import="dao.ProfessorDao"%>
<%@page import="vo.Professor"%>
<%@page import="vo.Dept"%>
<%@page import="vo.Course"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 신규 개설과정을 등록시킨다.
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");

	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("과정등록", "utf-8"));
		return;
	}
	
	if (!"PROFESSOR".equals(loginType)){
		response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("과정등록", "utf-8"));
		return;
	}
	
	String name = request.getParameter("name");
	String type = request.getParameter("type");
	int deptNo = StringUtils.stringToInt(request.getParameter("deptNo"));
	int score = StringUtils.stringToInt(request.getParameter("score"));
	int quota = StringUtils.stringToInt(request.getParameter("quota"));
	String description = request.getParameter("description");
	
	Course course = new Course();
	course.setName(name);
	course.setType(type);
	course.setScore(score);
	course.setQuota(quota);
	course.setDescription(description);
	course.setDept(new Dept(deptNo));
	course.setProfessor(new Professor(loginId));
	

	if (name == null || name.isBlank()){
    response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("과정등록", "utf-8") );
    return;
	}
	
	ProfessorDao professorDao = ProfessorDao.getInstance();
	professorDao.insertCourse(course);
	
	response.sendRedirect("course-list.jsp");
%>