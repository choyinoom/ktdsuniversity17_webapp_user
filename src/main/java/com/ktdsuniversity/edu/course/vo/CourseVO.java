package com.ktdsuniversity.edu.course.vo;

import org.springframework.stereotype.Component;

@Component("courseVO")
public class CourseVO {
	private int id;
	private String startDate;
	private String endDate;
	private String startTime;
	private String endTime;
	private String classroom;
	private String joinDate;
	private String rsDate; // 접수시작일
	private String reDate; // 접수마감일
	private String stat;   // 상태 (신청가능, 조기마감, 마감)
	private SyllabusVO syllabusVO;
	
	public CourseVO() {
		
	}
	
	public CourseVO(int id, String startDate, String endDate, String startTime, String endTime, String classroom,
			String joinDate, String rsDate, String reDate, String stat, SyllabusVO syllabusVO) {
		this.id = id;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.classroom = classroom;
		this.joinDate = joinDate;
		this.rsDate = rsDate;
		this.reDate = reDate;
		this.stat = stat;
		this.syllabusVO = syllabusVO;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getClassroom() {
		return classroom;
	}

	public void setClassroom(String classroom) {
		this.classroom = classroom;
	}

	public String getRsDate() {
		return rsDate;
	}

	public void setRsDate(String rsDate) {
		this.rsDate = rsDate;
	}

	public String getReDate() {
		return reDate;
	}

	public void setReDate(String reDate) {
		this.reDate = reDate;
	}

	public String getStat() {
		return stat;
	}


	public void setStat(String stat) {
		this.stat = stat;
	}

	public SyllabusVO getSyllabusVO() {
		return syllabusVO;
	}

	public void setSyllabusVO(SyllabusVO syllabusVO) {
		this.syllabusVO = syllabusVO;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}


	
}
