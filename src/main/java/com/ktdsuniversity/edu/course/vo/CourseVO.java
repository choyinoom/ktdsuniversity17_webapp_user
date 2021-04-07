package com.ktdsuniversity.edu.course.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("courseVO")
public class CourseVO {
	private int id;
	private Date startDate;
	private Date endDate;
	private String startTime;
	private String endTime;
	private String classroom;
	private String bannerImg;
	private SyllabusVO syllabusVO;
	public CourseVO() {
		
	}
	


	public CourseVO(int crs_id, Date crs_start_date, Date crs_end_date, String crs_start_time, String crs_end_time,
			String crs_classroom, String crs_banner_img, SyllabusVO syllabusVO) {
		this.id = crs_id;
		this.startDate = crs_start_date;
		this.endDate = crs_end_date;
		this.startTime = crs_start_time;
		this.endTime = crs_end_time;
		this.classroom = crs_classroom;
		this.bannerImg = crs_banner_img;
		this.syllabusVO = syllabusVO;
	}
	
	
	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public Date getStartDate() {
		return startDate;
	}



	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}



	public Date getEndDate() {
		return endDate;
	}



	public void setEndDate(Date endDate) {
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
