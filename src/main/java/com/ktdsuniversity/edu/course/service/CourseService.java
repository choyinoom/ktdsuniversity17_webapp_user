package com.ktdsuniversity.edu.course.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.ktdsuniversity.edu.course.vo.CourseVO;
import com.ktdsuniversity.edu.course.vo.SyllabusVO;

public interface CourseService {
	public List<CourseVO> listCourses() throws Exception;
	public int enrollCourse(Map<String, Object> enrollMap) throws Exception;
	public Map<String, Object> viewCourse(int courseId) throws Exception;
	public Map<String, Object> listCoursesForWelcomePage() throws Exception;
	public List<CourseVO> listCoursesBy(String keyword) throws Exception;
}
