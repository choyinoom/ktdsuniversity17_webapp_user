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

import com.ktdsuniversity.edu.member.service.MemberService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ktdsuniversity.edu.course.service.CourseService;
import com.ktdsuniversity.edu.course.vo.CourseVO;
import com.ktdsuniversity.edu.course.vo.SyllabusVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.member.vo.EnrollmentDetailVO;

@Controller("courseController")
@RequestMapping(value="/course")
public class CourseControllerImpl implements CourseController{
	@Autowired
	private CourseService courseService;
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;
	
	// 과정안내 페이지
	@Override
	@RequestMapping(value = "/listCourses.do", method = RequestMethod.GET)
	public ModelAndView listCourses(@RequestParam(required=false) String keyword, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		List<CourseVO> coursesList = null;
		if (keyword != null) { // 검색 필터 적용시
			coursesList = courseService.listCoursesBy(keyword);
		} else { // 검색 필터 미적용시
			coursesList = courseService.listCourses();
		}
		ModelAndView mav = new ModelAndView(viewName);
		String coursesJSON = new ObjectMapper().writeValueAsString(coursesList);
		mav.addObject("coursesJSON", coursesJSON);
		return mav;
	}
	
	// 수강신청 버튼을 클릭한 경우
	@Override
	@RequestMapping(value = "/enrollCourse.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> enrollCourse(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/* 과정 수강 신청을 위한 메소드*/
		HttpSession session = request.getSession();
		memberVO = (MemberVO) session.getAttribute("member");
		
		Map<String, Object> enrollMap = new HashMap<String, Object>();
		enrollMap.put("id", memberVO.getId());
		enrollMap.put("courseId", request.getParameter("courseId"));
		System.out.println(memberVO.getId());
		System.out.println(request.getParameter("courseId"));
		// 이미 수강 접수한 이력이 있는지 확인한다.
		EnrollmentDetailVO enrollmentVO  = memberService.findEnrollmentDetailBy(enrollMap);
		String stat = null;
		if (enrollmentVO != null)
			stat = enrollmentVO.getStat();
		
		String message = null;
		ResponseEntity<String> resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		if(stat == null || stat.equals("취소")) {// 수강이력이 없거나, 취소 상태인 경우 
			try {
				courseService.enrollCourse(enrollMap);
				message = "<script>";
				message += " alert('수강신청이 완료되었습니다.');";
				message += " history.go(-1); "; // 이전 페이지로 돌아가기
				message += " </script>";
			} catch(Exception e) {
				message = "<script>";
				message += " alert(`수강신청에 실패하였습니다\n관리자에게 문의하십시오.`);";
				message += " history.go(-1); ";
				message += " </script>";
				e.printStackTrace();
			}
		} else if (stat.equals("신청")){ // 이미 접수된 상태일 경우
			message = "<script>";
			message += " alert('이미 신청된 과목입니다.');";
			message += " history.go(-1);"; 
			message += "</script>";
		} //else: 이미 수료 완료한 경우는 과정 신청 자체가 되지 않으므로 고려하지 않음.
		resEnt = new ResponseEntity<String> (message, responseHeaders, HttpStatus.CREATED);
		
		return resEnt;
	}
	
	
	// 과정 안내 (상세)
	@Override
	@RequestMapping(value="/viewCourse.do", method= RequestMethod.GET) 
	public ModelAndView viewCourse(@RequestParam("courseId") int courseId, HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		Map <String, Object> courseMap = courseService.viewCourse(courseId);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("courseMap", courseMap);
		
		return mav;
	}
	
}
