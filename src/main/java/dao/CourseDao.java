package dao;

import util.DaoHelper;
import vo.Course;
import vo.Dept;
import vo.Professor;

public class CourseDao {
	
	private static CourseDao instance = new CourseDao();
	private CourseDao() {}
	public static CourseDao getInstance() {
		return instance;
	}

	public void updateCourse(Course course) {
		DaoHelper.update("courseDao.updateCourse", course.getName(),
													course.getType(),
													course.getScore(),
													course.getQuota(),
													course.getReqCnt(),
													course.getDescription(),
													course.getNo());
	}
	
	public Course getCourseDetailByNo (int no) {
		return DaoHelper.selectOne("courseDao.getCourseDetailByNo", rs -> { 
		
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
}
