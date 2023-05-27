package dao;

import java.util.List;

import util.DaoHelper;
import vo.Course;
import vo.Dept;
import vo.Student;

public class StudentDao {
	
	public List<Course> getCourses () {
		return DaoHelper.selectList("studentDao.getCourses", rs -> {
			Course course = new Course();
			return course;
		});
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


}
