package com.ktdsuniversity.edu.course.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.course.vo.CourseVO;
import com.ktdsuniversity.edu.course.vo.SyllabusVO;

@Repository("courseDAO")
public class CourseDAOImpl implements CourseDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllCourseList() throws DataAccessException {
		List<CourseDAO> courseList = null;
		courseList = sqlSession.selectList("mapper.course.selectAllCourseList");
		return courseList;
	}

	@Override
	public int enrollCourse(Map<String, Object> enrollMap) throws DataAccessException {
		
		return sqlSession.insert("mapper.course.insertNewEnrollment", enrollMap);
	}

	@Override
	public SyllabusVO selectSyllabus(int courseId) {
		SyllabusVO syllabusVO = null;
		syllabusVO =  sqlSession.selectOne("mapper.course.selectSyllabus", courseId);
		return syllabusVO;
	}
	
	@Override
	public CourseVO selectCourse(int courseId) {
		CourseVO courseVO = null;
		courseVO = sqlSession.selectOne("mapper.course.selectCourse", courseId);
		return courseVO;
	}
}