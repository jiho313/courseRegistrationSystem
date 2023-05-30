<%@page import="util.RedirectHelper"%>
<%@page import="vo.Professor"%>
<%@page import="dao.ProfessorDao"%>
<%@page import="vo.Student"%>
<%@page import="dao.StudentDao"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
   // 로그인처리
   // 1. 요청파라미터 읽기
   String type = request.getParameter("type");
   String id =  request.getParameter("id");
   String password = request.getParameter("password");
   
   // 2. 아이디에 맞는 학생정보 혹은 교수정보 조회하기
   StudentDao studentDao = StudentDao.getInstance();
   ProfessorDao professorDao = ProfessorDao.getInstance();
   
   boolean isExist = false;
   String dbPassword = null;
   if ("STUDENT".equals(type)) {
      Student student = studentDao.getStudentById(id);
      if (student != null) {
         isExist = true;
         dbPassword = student.getPassword();
      }
      
   } else if ("PROFESSOR".equals(type)) {
      Professor professor = professorDao.getProfessorById(id);
      if (professor != null) {
         isExist = true;
         dbPassword = professor.getPassword();
      }
   }
   
   if (!isExist) {
      //response.sendRedirect("loginform.jsp?err=fail");
      response.sendRedirect(RedirectHelper.redirectWithError("loginform.jsp", "fail", ""));
      return;
   }
   if (!dbPassword.equals(password)) {
      //response.sendRedirect("loginform.jsp?err=fail");
      response.sendRedirect(RedirectHelper.redirectWithError("loginform.jsp", "fail", ""));
      return;
   }
   
   session.setAttribute("loginType", type);
   session.setAttribute("loginId", id);
   
   response.sendRedirect("home.jsp");
%>