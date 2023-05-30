<%@page import="util.StringUtils"%>
<%@page import="dao.CourseDao"%>
<%@page import="vo.Student"%>
<%@page import="vo.Course"%>
<%@page import="vo.Registration"%>
<%@page import="dao.RegistrationDao"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	// 과정 신청을 처리한다.
	String loginId = (String) session.getAttribute("loginId");
	String loginType = (String) session.getAttribute("loginType");
	int no = StringUtils.stringToInt(request.getParameter("no"));
		
	
	if (loginId == null){
		response.sendRedirect("../loginform.jsp?err=req&job=" + URLEncoder.encode("수강신청", "utf-8"));
		return;
	}
	
	if (!"STUDENT".equals(loginType)){
		response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("수강신청", "utf-8"));
		return;
	}
	
	RegistrationDao registrationDao = RegistrationDao.getInstance();
	CourseDao courseDao = CourseDao.getInstance();
	
	Registration existingReg = registrationDao.getRegistrationByCourseNoAndStudentId(no, loginId);
	Course course = courseDao.getCourseDetailByNo(no);
	
	if (course == null) {
		response.sendRedirect("../home.jsp?err=deny&job=" + URLEncoder.encode("수강신청", "utf-8"));
		return;
	}
	
	if (course.getQuota() <= course.getReqCnt()){
		response.sendRedirect("course-list.jsp?err=quota");
		return;
	}
	if (existingReg != null) {
		if("신청완료".equals(existingReg.getRegStatus())){
			response.sendRedirect("course-registration-list.jsp?err=fail&job=" + URLEncoder.encode("수강신청", "utf-8"));
			return;
		} else if ("수강취소".equals(existingReg.getRegStatus())) {
      	 	response.sendRedirect("course-reapply.jsp?rno=" + existingReg.getNo());
      	 	return;
		}
    }

	Registration registration = new Registration();
	registration.setCourse(new Course(no));
	registration.setStudent(new Student(loginId));
	registrationDao.insertRegistration(registration);
	
	course.setReqCnt(course.getReqCnt() + 1);
	courseDao.updateCourse(course);
	
	response.sendRedirect("course-registration-list.jsp");
%>