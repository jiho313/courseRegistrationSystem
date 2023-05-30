<%@page import="util.StringUtils"%>
<%@page import="vo.Course"%>
<%@page import="dao.CourseDao"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="vo.Registration"%>
<%@page import="dao.RegistrationDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
// 수강취소 처리를 한다.
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");

	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("수강 취소", "utf-8"));
		return;
	}
	
	if (!"STUDENT".equals(loginType)){
		response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("수강 취소", "utf-8"));
		return;
	}

	int rno = StringUtils.stringToInt(request.getParameter("rno"));
	
	RegistrationDao registrationDao = RegistrationDao.getInstance();
	CourseDao courseDao = CourseDao.getInstance();
	Registration registration = registrationDao.getRegistrationByRegNo(rno);

	if (registration == null) {
		response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("수강 취소", "utf-8"));
		return;
	}
	if (!registration.getStudent().getId().equals(loginId)) {
		response.sendRedirect("course-registration-list.jsp?err=deny");
		return;
	}

	registration.setRegStatus("수강취소");

	Course course = courseDao.getCourseDetailByNo(registration.getCourse().getNo());
	course.setReqCnt(course.getReqCnt() - 1);

	registrationDao.updateRegistration(registration, rno);
	courseDao.updateCourse(course);

	response.sendRedirect("course-registration-list.jsp");
%>