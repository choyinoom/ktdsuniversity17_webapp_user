package com.ktdsuniversity.edu.course.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.course.dao.CourseDAO;
import com.ktdsuniversity.edu.course.vo.CourseVO;
import com.ktdsuniversity.edu.course.vo.SyllabusVO;

@Service("courseService")
public class CourseServiceImpl implements CourseService {
	@Autowired
	private CourseDAO courseDAO;
	
	@Override
	public List<CourseVO> listCourses() throws Exception {
		List<CourseVO> coursesList = null;
		coursesList = courseDAO.selectAllCourseList();
		return coursesList;
	}

	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public int enrollCourse(Map<String, Object> enrollMap){
			int result1 = courseDAO.enrollCourse(enrollMap);
			int courseId = Integer.parseInt((String)enrollMap.get("courseId"));
			int result2 = courseDAO.updateCourseApplyNum(courseId);
			return result1 * result2;
	}

	@Override
	public Map<String, Object> viewCourse(int courseId) throws Exception {
		Map<String, Object> courseMap = new HashMap<String, Object>();
		CourseVO courseVO = courseDAO.selectCourse(courseId);
		
		courseMap.put("course", courseVO);
		courseMap.put("syllabus", courseVO.getSyllabusVO());
		return courseMap;
	}

	@Override
	public Map<String, Object> listCoursesForWelcomePage() throws Exception {
		List<CourseVO> coursesList = courseDAO.selectAllCourseListForWelcomePage(); // 현재 모집중인 강의목록
		Map<String, Object> courseMap = new HashMap<String, Object>();
		// 강의들을 모집월별로 분류한다.
		for(int i=0; i<coursesList.size(); i++) {
			CourseVO course = coursesList.get(i);
			String month = course.getStartDate().substring(0,2).replaceFirst("^0+(?!$)", ""); // 04월 --> 4월
			
			// courseMap에 month를 키로 하는 value가 있는지 확인한다.
			if(courseMap.isEmpty() || !courseMap.containsKey(month)) {
				List<CourseVO> coursesForThisMonth = new ArrayList<CourseVO>();
				courseMap.put(month, coursesForThisMonth);
			}
			
			// courseMap의 month를 키로 가지는 value에 강의를 추가한다.
			List<CourseVO> coursesForThisMonth = (List<CourseVO>) courseMap.get(month);
			coursesForThisMonth.add(course);
			courseMap.put(month, coursesForThisMonth); 
		}
		return courseMap;
	}

	@Override
	public List<CourseVO> listCoursesBy(String keyword) throws Exception {
		List<CourseVO> coursesList = null;
		coursesList = courseDAO.selectAllCourseListBy(keyword);
		return coursesList;
	}

	@Override
	public int dropCourse(Map<String, Object> dropMap) throws Exception {
		return courseDAO.dropCourse(dropMap);
	}
}
