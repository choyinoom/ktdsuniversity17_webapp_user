package com.ktdsuniversity.edu.course.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.ktdsuniversity.edu.course.vo.CourseVO;
import com.ktdsuniversity.edu.course.vo.SyllabusVO;

public interface CourseDAO {
	public List selectAllCourseList() throws DataAccessException;

	public int enrollCourse(Map<String, Object> enrollMap) throws DataAccessException;

	public SyllabusVO selectSyllabus(int syllabusId);
	
	public CourseVO selectCourse(int courseId);
}