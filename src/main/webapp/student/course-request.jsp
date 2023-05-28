<%@page import="dao.CourseDao"%>
<%@page import="vo.Student"%>
<%@page import="vo.Course"%>
<%@page import="vo.Registration"%>
<%@page import="dao.RegistrationDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
	// 과정 신청을 처리한다.
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");
	int no = Integer.parseInt(request.getParameter("no"));
	

	
	
	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("수강신청", "utf-8"));
		return;
	}
	
	if (!"STUDENT".equals(loginType)){
		response.sendRedirect("../loginform.jsp?err=deny&job=" + URLEncoder.encode("수강신청", "utf-8"));
		return;
	}
	
	RegistrationDao registrationDao = new RegistrationDao();
	CourseDao courseDao = new CourseDao();
	
	if (registrationDao.getRegistrationByCourseNoAndStudentId(no, loginId) != null && "신청완료".equals(registrationDao.getRegistrationByCourseNoAndStudentId(no, loginId).getRegStatus())){
		response.sendRedirect("course-list.jsp?err=fail&job=" + URLEncoder.encode("수강신청", "utf-8"));
		return;
	}
	
	Registration registration = new Registration();
	registration.setCourse(new Course(no));
	registration.setStudent(new Student(loginId));
	registrationDao.insertRegistration(registration);
	
	Course course = courseDao.getCourseDetailByNo(no);
	course.setReqCnt(course.getReqCnt() + 1);
	courseDao.updateCourse(course);
	
	response.sendRedirect("course-registration-list.jsp");
%>