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
	private String bannerImg;
	private SyllabusVO syllabusVO;
	
	public CourseVO() {
		
	}
	
	public CourseVO(int id, String startDate, String endDate, String startTime, String endTime, String classroom,
			String bannerImg, SyllabusVO syllabusVO) {
		this.id = id;
		this.startDate = startDate;
		this.endDate = endDate;
		this.startTime = startTime;
		this.endTime = endTime;
		this.classroom = classroom;
		this.bannerImg = bannerImg;
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



	public SyllabusVO getSyllabusVO() {
		return syllabusVO;
	}



	public void setSyllabusVO(SyllabusVO syllabusVO) {
		this.syllabusVO = syllabusVO;
	}



	public String getBannerImg() {
		return bannerImg;
	}



	public void setBannerImg(String bannerImg) {
		this.bannerImg = bannerImg;
	}





	
	
}
