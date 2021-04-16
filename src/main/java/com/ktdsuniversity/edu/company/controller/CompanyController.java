package com.ktdsuniversity.edu.company.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface CompanyController {

	public ModelAndView listCompanies(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView listConsortium(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView listClassroom(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
