package com.ktdsuniversity.edu.course.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.ModelAndView;

public interface CourseController {
	public ModelAndView listCourses(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity enrollCourse(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView viewCourse(int syllabusId, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
