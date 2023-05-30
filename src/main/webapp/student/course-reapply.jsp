<%@page import="util.StringUtils"%>
<%@page import="dao.CourseDao"%>
<%@page import="vo.Course"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Registration"%>
<%@page import="dao.RegistrationDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 과정 재신청을 처리하세요.
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");

	
	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("재수강", "utf-8"));
		return;
	}
	
	if (!"STUDENT".equals(loginType)){
		response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("재수강", "utf-8"));
		return;
	}
	
	//int rno = Integer.parseInt(request.getParameter("rno"));
	int rno = StringUtils.stringToInt(request.getParameter("rno"));
	
	RegistrationDao registrationDao = RegistrationDao.getInstance();
	CourseDao courseDao = CourseDao.getInstance();
	
	Registration registration = registrationDao.getRegistrationByRegNo(rno);
	if (registration == null) {
		response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("재수강", "utf-8"));
		return;
	}

	Course course = courseDao.getCourseDetailByNo(registration.getCourse().getNo());
	
	if (!loginId.equals(registration.getStudent().getId())){
		response.sendRedirect("course-registration-list.jsp?err=deny");
		return;
	}
	if (course == null) {
		response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("수강신청", "utf-8"));
		return;
	}
	
	if (course.getQuota() <= course.getReqCnt()){
		response.sendRedirect("course-list.jsp?err=quota");
		return;
	}
	
	registration.setRegStatus("신청완료");
	course.setReqCnt(course.getReqCnt() + 1);
	
	registrationDao.updateRegistration(registration, rno);
	courseDao.updateCourse(course);

	response.sendRedirect("course-registration-list.jsp");
%>