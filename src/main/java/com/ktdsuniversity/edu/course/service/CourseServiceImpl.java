package com.ktdsuniversity.edu.course.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.course.dao.CourseDAO;
import com.ktdsuniversity.edu.course.vo.CourseVO;
import com.ktdsuniversity.edu.course.vo.SyllabusVO;

@Service("courseService")
public class CourseServiceImpl implements CourseService {
	@Autowired
	private CourseDAO courseDAO;
	
	@Override
	public List listCourses() throws DataAccessException {
		List coursesList = null;
		coursesList = courseDAO.selectAllCourseList();
		return coursesList;
	}

	@Override
	public int enrollCourse(Map<String, Object> enrollMap) {
		return courseDAO.enrollCourse(enrollMap);
	}

	@Override
	public Map viewCourse(int courseId) {
		Map<String, Object> courseMap = new HashMap<String, Object>();
		CourseVO courseVO = courseDAO.selectCourse(courseId);
		SyllabusVO syllabusVO = courseDAO.selectSyllabus(courseId);
		
		courseMap.put("course", courseVO);
		courseMap.put("syllabus", syllabusVO);
		return courseMap;
		
	}
}
