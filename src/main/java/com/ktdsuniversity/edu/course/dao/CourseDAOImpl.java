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
	public List<CourseVO> selectAllCourseList() throws DataAccessException {
		List<CourseVO> coursesList = sqlSession.selectList("mapper.course.selectAllCourseList");
		return coursesList;
	}

	@Override
	public int enrollCourse(Map<String, Object> enrollMap) throws DataAccessException {
		return sqlSession.insert("mapper.course.insertNewEnrollment", enrollMap);
	}

	@Override
	public SyllabusVO selectSyllabus(int courseId) {
		SyllabusVO syllabusVO = sqlSession.selectOne("mapper.course.selectSyllabus", courseId);
		return syllabusVO;
	}
	
	@Override
	public CourseVO selectCourse(int courseId) {
		CourseVO courseVO = sqlSession.selectOne("mapper.course.selectCourse", courseId);
		return courseVO;
	}
	
	@Override
	public List<CourseVO> selectAllCourseListForWelcomePage() throws DataAccessException {
		List<CourseVO> coursesList = sqlSession.selectList("mapper.course.selectAllCourseListForWelcomePage");
		return coursesList;
	}

	@Override
	public List<CourseVO> selectAllCourseListBy(String keyword) throws DataAccessException {
		List<CourseVO> coursesList = sqlSession.selectList("mapper.course.selectAllCourseListBy", keyword);
		return coursesList;
	}
}
