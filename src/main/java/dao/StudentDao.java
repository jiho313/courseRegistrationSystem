package dao;

import java.util.List;

import util.DaoHelper;
import vo.Course;
import vo.Dept;
import vo.Professor;
import vo.Student;

public class StudentDao {
	
	
	public List<Course> getCourses (int begin, int end) {
		return DaoHelper.selectList("studentDao.getCourses", rs -> {
			Course course = new Course();
			course.setNo(rs.getInt("course_no"));
			course.setName(rs.getString("course_name"));
			course.setDept(new Dept(rs.getString("dept_name")));
			course.setProfessor(new Professor(null, rs.getString("professor_name")));
			course.setQuota(rs.getInt("course_quota"));
			course.setReqCnt(rs.getInt("course_req_cnt"));


			return course;
		},begin, end);
	}
	
	public Student getStudentById(String id) {
		return DaoHelper.selectOne("studentDao.getStudentById", rs -> {
			Student student = new Student();
			student.setId(rs.getString("student_id"));
			student.setPassword(rs.getString("student_password"));
			student.setName(rs.getString("student_name"));
			student.setGrade(rs.getInt("student_grade"));
			student.setUpdateDate(rs.getDate("student_update_date"));
			student.setCreateDate(rs.getDate("student_create_date"));
			student.setDept(new Dept(rs.getInt("dept_no")));
			
			return student;
		}, id);
	}
	
	public void insertStudent(Student student) {
		DaoHelper.update("studentDao.insertStudent", student.getId(),
													 student.getPassword(),
													 student.getName(),
													 student.getGrade(),
													 student.getDept().getNo());
	}

	public int getTotalRows() {
		return DaoHelper.selectOne("studentDao.getTotalRows", rs -> {
			return rs.getInt("cnt");
		});
	}

}
