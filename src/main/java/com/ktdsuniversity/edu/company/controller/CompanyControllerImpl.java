package com.ktdsuniversity.edu.company.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ktdsuniversity.edu.company.vo.CompanyVO;
import com.ktdsuniversity.edu.common.paging.Criteria;
import com.ktdsuniversity.edu.common.paging.PageMaker;
import com.ktdsuniversity.edu.company.service.CompanyService;

@Controller("companyController")
public class CompanyControllerImpl implements CompanyController{

	@Autowired
	CompanyService companyService;
	
	@Autowired
	CompanyVO companyvo;
	
	@RequestMapping(value = "/company/companyInfo.do", method =  RequestMethod.GET)
	@Override
	public ModelAndView companyInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/company/listCompanies.do" ,method = RequestMethod.GET)
	public ModelAndView listCompanies(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List companiesList = companyService.listCompanies();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("companiesList", companiesList);
		return mav;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value="/company/listBySearch.do" ,method = RequestMethod.POST)
	public List listBySearchCompanies(@ModelAttribute("company") CompanyVO companyVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List companiesBySearchList = companyService.listBySearchCompanies(companyVO);
		return companiesBySearchList;
	}
	
	
	@RequestMapping(value = "/company/consortium.do", method =  RequestMethod.GET)
	@Override
	public ModelAndView listConsortium(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = "/company/classroom.do", method =  RequestMethod.GET)
	@Override
	public ModelAndView listClassroom(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		System.out.println(viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	//소속회사 검색 팝업
		@RequestMapping(value = "/company/popUp.do", method = {RequestMethod.GET, RequestMethod.POST})
		public ModelAndView popUp(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			String viewName = (String)request.getAttribute("viewName");
			String searchType = (String)request.getParameter("searchType");
			String searchText = (String)request.getParameter("searchText");
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"+searchText);
			
			// page 기본 변수 생성
					int page = 0;
					
					// 받은 페이지 값이 있다면
					if(request.getParameter("page") != null) {
						page = Integer.parseInt((String)request.getParameter("page")); //page 변수에 값을 저장
					} else {
						page = 1; //아니면 page 1로 기본 지정
					}
					
					int perPage = 0; //리스트 개수 값 저장할 변수 생성
					
					// perPage 값이 있다면
					if(request.getParameter("perPage") != null) {
						perPage = Integer.parseInt((String)request.getParameter("perPage")); // perPage 변수에 리스트 띄울 개수 저장
					} else {
						perPage = 10; // 기본 10개로 지정
					}
					System.out.println("전달 받은 페이지 번호 page:"+page); // 전달 받은 페이지 번호 page 
					System.out.println("리스트 띄울 개수 Perpage:"+perPage); // 전달 받은 페이지 번호 page 
					
					List companiesList = null; 
					ModelAndView mav = new ModelAndView(viewName);
					Criteria criteria = new Criteria();
					PageMaker pageMaker = new PageMaker();
					
					
					criteria.setPerPageNum(perPage); // 리스트 개수 설정
					pageMaker.setCriteria(criteria); // 기준 값 설정
					
					if (searchType != null && searchText != null) { // 검색 유형이랑 값을 받았다면
						System.out.println(searchType);
						System.out.println(searchText);
						System.out.println("@@@@@@@@@검색필터 적용됨요");
						companiesList = companyService.listBySearchCompanies(searchType, searchText);
						System.out.println("@@@@@@@@@@서치된 리스트"+companiesList.size()); // 검색해서 받은 전체 리스트 사이즈
						criteria.setPage(page); // page 설정
						criteria.setSearchText(searchText); // 검색 값 설정
						criteria.setSearchType(searchType); // 검색 유형 설정
						pageMaker.setTotalCount(companiesList.size()); // 페이지 개수를 전체 리스트 크기로 설정
						companiesList = companyService.listCriteriaBySearch(criteria); // 기준 설정에 의해 새로 받는 리스트
						System.out.println("page@@@"+page+"번호에 해당하는 리스트 크기"+companiesList.size());
						
						mav.addObject("searchText", searchText); // 검색 값 다시 페이지로 보내기
						mav.addObject("searchType", searchType); // 검색 유형 다시 페이지로 보내기
					} else { // 검색 유형이랑 값을 받지 않았다면
						System.out.println("@@@@@@@@검색필터적용안됨요");
						companiesList = companyService.listCompanies(); //전체 리스트 저장
//						membersList = memberService.listCriteria(criteria);
						
						 System.out.println(companiesList.size()); //전체 사이즈 
						 criteria.setPage(page); //페이지 설정 
						 pageMaker.setTotalCount(companiesList.size()); //페이지 개수 설정
						 companiesList = companyService.listCriteria(criteria); //기준에 의해 나눠진 리스트 설정
						 			}
					System.out.println("perPage@@@@@@@@@@@@"+perPage);
					mav.addObject("perPage", perPage); // 리스트 기준 값 보내기
					mav.addObject("pageMaker", pageMaker); // 페이지 만들어진 값 보내기
					mav.addObject("companiesList", companiesList); //설정된 리스트 보내기
					return mav; //리스트 페이지로
		}
		
}
