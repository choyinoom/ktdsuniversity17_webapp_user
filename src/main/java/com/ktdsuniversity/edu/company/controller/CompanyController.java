package com.ktdsuniversity.edu.company.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.company.vo.CompanyVO;

public interface CompanyController {

	public ModelAndView listCompanies(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView listConsortium(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView listClassroom(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public List listBySearchCompanies(CompanyVO companyVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ModelAndView companyInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
