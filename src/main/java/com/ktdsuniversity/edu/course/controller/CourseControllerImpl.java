package com.ktdsuniversity.edu.course.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.course.service.CourseService;
import com.ktdsuniversity.edu.course.vo.CourseVO;
import com.ktdsuniversity.edu.course.vo.SyllabusVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Controller("courseController")
public class CourseControllerImpl implements CourseController{
	@Autowired
	private CourseService courseService;
	
	@Autowired
	MemberVO memberVO;
	
	@Override
	@RequestMapping(value = "/course/listCourses.do", method = RequestMethod.GET)
	public ModelAndView listCourses(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String) request.getAttribute("viewName");
		List coursesList = courseService.listCourses();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("coursesList", coursesList);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/course/enrollCourse.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity enrollCourse(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("member");
		
		Map<String, Object> enrollMap = new HashMap<String, Object>();
		enrollMap.put("id", memberVO.getId());
		enrollMap.put("courseID", session.getAttribute("courseID"));
		
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			int result = courseService.enrollCourse(enrollMap);
			message = "<script>";
			message += " alert('수강신청이 완료되었습니다.');";
			message += " location.href='" + request.getContextPath() + "/course/listCourses.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch(Exception e) {
			message = "<script>";
			message += " alert('수강신청에 실패하였습니다<br>관리자에게 문의하십시오.');";
			message += " location.href='" + request.getContextPath() + "/course/listCourses.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		
		}
		
		return resEnt;
	}
	
	@Override
	@RequestMapping(value="/course/viewCourse.do", method= RequestMethod.GET) 
	public ModelAndView viewCourse(@RequestParam("courseId") int courseId, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		Map <String, Object> courseMap = courseService.viewCourse(courseId);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("courseMap", courseMap);
		
		return mav;
	}
	
}
