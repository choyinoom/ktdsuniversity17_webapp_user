package com.ktdsuniversity.edu.course.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.ktdsuniversity.edu.course.vo.CourseVO;
import com.ktdsuniversity.edu.course.vo.SyllabusVO;

public interface CourseService {
	public List listCourses() throws DataAccessException;

	public int enrollCourse(Map<String, Object> enrollMap);

	public Map<String, Object> viewCourse(int courseId);
}
