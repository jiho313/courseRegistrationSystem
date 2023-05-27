package dao;

import util.DaoHelper;
import vo.Dept;
import vo.Professor;

public class ProfessorDao {
	
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
}
