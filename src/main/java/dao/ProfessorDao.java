package dao;

import java.util.List;

import util.DaoHelper;
import vo.Course;
import vo.Dept;
import vo.Professor;
import vo.Registration;
import vo.Student;

public class ProfessorDao {
	
	public void insertCourse(Course course) {
		DaoHelper.update("professorDao.insertCourse", course.getName(),
													  course.getType(),
													  course.getScore(),
													  course.getQuota(),
													  course.getDescription(),
													  course.getDept().getNo(),
													  course.getProfessor().getId());
	}
	
//	public List<Course> getStudentsRegisteredInCourseByCourseNo1(int no) {
//		return DaoHelper.selectList("professorDao.getStudentsRegisteredInCourseByCourseNo", rs -> {
//			Course course = new Course();
//			course.setRegistration(new Registration(rs.getInt("reg_no")));
//			course.setDept(new Dept(rs.getString("dept_name")));
//			
//			Student student = new Student();
//			student.setId(rs.getString("student_id"));
//			student.setName(rs.getString("student_name"));
//			student.setGrade(rs.getInt("student_grade"));
//			
//			course.setStudent(student);
//			
//			return course;
//		}, no);
//	}
	
	public List<Registration> getStudentsRegisteredInCourseByCourseNo(int no) {
		return DaoHelper.selectList("professorDao.getStudentsRegisteredInCourseByCourseNo", rs -> {
			Registration registration = new Registration();
			registration.setRowNum(rs.getInt("row_number"));
			registration.setDept(new Dept(rs.getString("dept_name")));
			registration.setCourse(new Course(rs.getInt("course_no")));
			
			Student student = new Student();
			student.setId(rs.getString("student_id"));
			student.setName(rs.getString("student_name"));
			student.setGrade(rs.getInt("student_grade"));
			
			registration.setStudent(student);
			
			return registration;
		}, no);
	}
	 
	public Course getCourseDetailByNo(int no) {
		return DaoHelper.selectOne("professorDao.getCourseDetailByNo", rs -> {
			Course course = new Course();
			course.setName(rs.getString("course_name"));
			course.setNo(rs.getInt("course_no"));
			course.setType(rs.getString("course_type"));
			course.setScore(rs.getInt("course_score"));
			course.setDept(new Dept(rs.getString("dept_name")));
			course.setProfessor(new Professor(rs.getString("professor_id"), rs.getString("professor_name")));
			course.setQuota(rs.getInt("course_quota"));
			course.setReqCnt(rs.getInt("course_req_cnt"));
			course.setDescription(rs.getString("course_description"));
			
			return course;
		}, no);
	}
	
	public List<Course> getCourses(int begin, int end, String id) {
		return DaoHelper.selectList("professorDao.getCourses", rs -> {
			Course course = new Course();
			course.setNo(rs.getInt("course_no"));
			course.setName(rs.getString("course_name"));
			course.setType(rs.getString("course_type"));
			course.setDept(new Dept(rs.getString("dept_name")));
			course.setQuota(rs.getInt("course_quota"));
			course.setReqCnt(rs.getInt("course_req_cnt"));
			course.setProfessor(new Professor(null, rs.getString("professor_id")));
			
			return course;
		}, begin, end, id);
				
	}
	
	public Professor getProfessorById(String id) {
		return DaoHelper.selectOne("professorDao.getProfessorById", rs -> {
			Professor professor = new Professor();
			professor.setId(rs.getString("professor_id"));
			professor.setPassword(rs.getString("professor_password"));
			professor.setName(rs.getString("professor_name"));
			professor.setPosition(rs.getString("professor_position"));
			professor.setUpdateDate(rs.getDate("professor_update_date"));
			professor.setCreateDate(rs.getDate("professor_create_date"));
			professor.setDept(new Dept(rs.getInt("dept_no")));
			
			return professor;
		}, id);
	}

	public void insetProfessor (Professor professor) {
		DaoHelper.update("professorDao.insertProfessor", professor.getId(),
														professor.getPassword(),
														professor.getName(),
														professor.getPosition(),
														professor.getDept().getNo());
	}
	
	public int getTotalRows(String id) {
		return DaoHelper.selectOne("professorDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		}, id);
	}
}
