package vo;

import java.util.Date;

public class Course {

	private int no;
	private String name;
	private String type;
	private int score;
	private int quota;
	private int reqCnt;
	private String description;
	private Date updateDate;
	private Date createDate;
	private Dept dept;
	private Professor professor;
	
	public Course () {}

	public Course (int no) {
		this.no = no;
	}
	
	public Course (String name) {
		this.name = name;
	}
	
	public Course (int no, String name ) {
		this.no = no;
		this.name = name;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getQuota() {
		return quota;
	}
	public void setQuota(int quota) {
		this.quota = quota;
	}
	public int getReqCnt() {
		return reqCnt;
	}
	public void setReqCnt(int reqCnt) {
		this.reqCnt = reqCnt;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	public Professor getProfessor() {
		return professor;
	}
	public void setProfessor(Professor prfessor) {
		this.professor = prfessor;
	}
	
}
