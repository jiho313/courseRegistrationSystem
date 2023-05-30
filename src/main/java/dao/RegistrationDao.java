package dao;

import java.util.List;

import util.DaoHelper;
import vo.Course;
import vo.Dept;
import vo.Professor;
import vo.Registration;
import vo.Student;

public class RegistrationDao {
	
	private static RegistrationDao instance = new RegistrationDao();
	private RegistrationDao() {}
	public static RegistrationDao getInstance() {
		return instance;
	}
	
	
	public void updateRegistration(Registration registration, int regNo) {
		DaoHelper.update("registraionDao.updateRegistration", registration.getRegStatus(), regNo);
		
		
	}
	
	public Registration getRegistrationByCourseNoAndStudentId(int courseNo, String studentId) {
		return DaoHelper.selectOne("registrationDao.getRegistrationByCourseNoAndStudentId", rs -> {
			Registration registration = new Registration();
			registration.setNo(rs.getInt("reg_no"));
			registration.setCourse(new Course(rs.getInt("course_no")));
			registration.setStudent(new Student(rs.getString("student_id")));
			registration.setRegStatus(rs.getString("reg_status"));
			registration.setUpdateDate(rs.getDate("reg_update_date"));
			registration.setCreateDate(rs.getDate("reg_create_date"));
			
			return registration;
		}, courseNo, studentId);
	}
	
	public Registration getRegistrationByRegNo(int regNo) {
		return DaoHelper.selectOne("registrationDao.getRegistrationByRegNo", rs -> {
			Registration registration = new Registration();
			registration.setNo(rs.getInt("reg_no"));
			registration.setCourse(new Course(rs.getInt("course_no")));
			registration.setStudent(new Student(rs.getString("student_id")));
			registration.setRegStatus(rs.getString("reg_status"));
			registration.setUpdateDate(rs.getDate("reg_update_date"));
			registration.setCreateDate(rs.getDate("reg_create_date"));
			
			return registration;
		}, regNo);
	}
	
	public List<Registration> getRegistrations(String id){
		return DaoHelper.selectList("registrationDao.getRegistrations", rs -> {
			Registration registration = new Registration();
			registration.setNo(rs.getInt("reg_no"));
			registration.setCourse(new Course(rs.getInt("course_no"), rs.getString("course_name")));
			registration.setDept(new Dept(rs.getString("dept_name")));
			registration.setProfessor(new Professor(null, rs.getString("professor_name")));
			registration.setRegStatus(rs.getString("reg_status"));
			
			return registration;
		}, id);
	}
	
	public void insertRegistration(Registration registration) {
		DaoHelper.update("registrationDao.insertRegistration", registration.getCourse().getNo(),
															   registration.getStudent().getId());
	}
	
}
