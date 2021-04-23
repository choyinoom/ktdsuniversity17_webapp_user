package com.ktdsuniversity.edu.member.vo;

import org.springframework.stereotype.Component;

import com.ktdsuniversity.edu.course.vo.CourseVO;
import com.ktdsuniversity.edu.course.vo.SyllabusVO;

@Component("enrollmentDetailVO")
public class EnrollmentDetailVO {
	private int id;
	private int crsId;
	private String memId;
	private String stat;
	private String joinDate;
	private String modDate;
	private String completeDate;
	
	private CourseVO courseVO;
	private SyllabusVO syllabusVO;
	
	public EnrollmentDetailVO() {
		
	}
	
	public EnrollmentDetailVO(int id, int crsId, String memId, String stat, String joinDate, String modDate,
			String completeDate, CourseVO courseVO, SyllabusVO syllabusVO) {
		this.id = id;
		this.crsId = crsId;
		this.memId = memId;
		this.stat = stat;
		this.joinDate = joinDate;
		this.modDate = modDate;
		this.completeDate = completeDate;
		this.courseVO = courseVO;
		this.syllabusVO = syllabusVO;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCrsId() {
		return crsId;
	}

	public void setCrsId(int crsId) {
		this.crsId = crsId;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getStat() {
		return stat;
	}

	public void setStat(String stat) {
		this.stat = stat;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getModDate() {
		return modDate;
	}

	public void setModDate(String modDate) {
		this.modDate = modDate;
	}

	public String getCompleteDate() {
		return completeDate;
	}

	public void setCompleteDate(String completeDate) {
		this.completeDate = completeDate;
	}

	public CourseVO getCourseVO() {
		return courseVO;
	}

	public void setCourseVO(CourseVO courseVO) {
		this.courseVO = courseVO;
	}

	public SyllabusVO getSyllabusVO() {
		return syllabusVO;
	}

	public void setSyllabusVO(SyllabusVO syllabusVO) {
		this.syllabusVO = syllabusVO;
	}
	
}
