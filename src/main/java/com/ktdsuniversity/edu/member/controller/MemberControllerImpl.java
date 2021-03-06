	package com.ktdsuniversity.edu.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ktdsuniversity.edu.course.service.CourseService;
import com.ktdsuniversity.edu.course.vo.CourseVO;
import com.ktdsuniversity.edu.member.service.MemberService;
import com.ktdsuniversity.edu.member.vo.EnrollmentDetailVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

@Controller("memberController")
// @EnableAspectJAutoProxy
public class MemberControllerImpl implements MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private CourseService courseService;
	@Autowired
	MemberVO memberVO;
	@Autowired
	CourseVO courseVO;

	@RequestMapping(value = { "/", "/main.do" }, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);		
		Map<String, Object> courseMap = courseService.listCoursesForWelcomePage();
		String coursesJSON = new ObjectMapper().writeValueAsString(courseMap); // courseMap?????? JSON???????????? ????????????
		mav.addObject("coursesJSON", coursesJSON);
		return mav;
	}
	

	//????????????
	@RequestMapping(value = "/member/joinAgree.do", method =  RequestMethod.GET)
	@Override
	public ModelAndView joinAgree(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// ???????????? ??????
	@RequestMapping(value = "/member/celebration.do", method = RequestMethod.GET)
	@Override
	public ModelAndView celebrate(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	// ????????????????????????
	@RequestMapping(value = "/member/privacy.do", method = RequestMethod.GET)
	@Override
	public ModelAndView listPrivacy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}

	/* ??????????????? */
	@RequestMapping(value = "/member/myPage.do", method = RequestMethod.GET)
	@Override
	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pageFlag = request.getParameter("pageFlag");
		ModelAndView mav = new ModelAndView();
		if(pageFlag == null) {
			mav.setViewName("/member/myPage");
			MemberVO vo = memberService.getMemberInfo(memberVO.getId());
			mav.addObject("memberVO", vo);
		} else {
			mav.setViewName("/member/myCourse");
			List<EnrollmentDetailVO> enrollmentDetailList = memberService.findEnrollmentDetailBy(memberVO.getId());
			mav.addObject("enrollmentDetailList", enrollmentDetailList);
		}		
		return mav;
	}
	
	
	/* ?????? ??????*/
	@Override
	@RequestMapping(value = "/member/changeMemberInfo.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> changeMemberInfo(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		member.setId(memberVO.getId());
		int result = 0;
		try {
			result = memberService.changeMemberInfo(member);
		} catch(Exception e) {
			e.printStackTrace();
		}
		String contextPath = request.getContextPath();
		String message = null;
		ResponseEntity<String> resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		if (result == 1) {
			message = "<script>";
			message += "alert('????????? ?????????????????????.');";
			message += "window.location.replace('" + contextPath + "/member/myPage.do')";
			message += "</script>";
		} else {
			message = "<script>";
			message += " alert(`?????? ????????? ?????????????????????.\n??????????????? ??????????????????.`);";
			message += " history.go(-1); ";
			message += "</script>";
		}
		resEnt = new ResponseEntity<String> (message, responseHeaders, HttpStatus.CREATED);
		return resEnt; 
	}
	
	
	/* ???????????????->???????????? ?????????*/
	@Override
	@RequestMapping(value = "/member/changePwdForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView changePwdForm(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String)request.getAttribute("viewName");
		MemberVO vo = memberService.selectMemberPwInfoById(memberVO.getId());
		ModelAndView mav = new ModelAndView(); 
		mav.setViewName(viewName);
		mav.addObject("vo", vo);
		return mav;
	}
	
	/* ???????????????->???????????? ?????? */
	@Override
	@RequestMapping(value = "/member/changePwd.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView changePwd(@ModelAttribute("member") MemberVO member, @RequestParam String newPw1, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String viewName = (String)request.getAttribute("viewName"); 
		MemberVO vo = memberService.getMemberInfo(memberVO.getId());
	    vo.setPw(newPw1); //????????????????????? ??????
		int result = 0; //?
		result = memberService.updatePwOfMember(vo);
		ModelAndView mav = new ModelAndView("redirect:/member/myPage.do"); 
		return mav;
	}
	


	//????????? ????????????
	@ResponseBody
	@RequestMapping(value = "/member/idCheck.do", method = RequestMethod.POST)
	public int idCheck(String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		MemberVO vo = new MemberVO();
		vo.setId(id);
		int result = memberService.idCheck(vo);
		return result;
	}
	
	//????????????
	@Override
	@RequestMapping(value = "/member/addMember.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
				memberService.addMember(member);
		ModelAndView mav = new ModelAndView("redirect:/member/celebration.do");
		return mav;
	}

	@Override
	@RequestMapping(value = "/member/removeMember.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> removeMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		MemberVO vo = memberService.login(member);
		
		ResponseEntity<String> resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String message = null;
		if (vo != null) {
			try {
				int result = memberService.removeMember(member.getId());
				String contextPath = request.getContextPath();
				
				if (result == 1) {
					message = "<script>";
					message += "alert(`????????? ?????????????????????.\n????????? ?????????????????? ???????????????.`);";
					message += "window.location.replace('" + contextPath + "/')";
					message += "</script>";
				} else {
					message = "<script>";
					message += " alert(`????????? ?????????????????????.\n??????????????? ??????????????????.`);";
					message += " history.go(-1); ";
					message += "</script>";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			message = "<script>";
			message += "alert(`??????????????? ???????????????..`);";
			message += " history.go(-1); ";
			message += "</script>";
		}
		
		resEnt = new ResponseEntity<String> (message, responseHeaders, HttpStatus.CREATED);
		return resEnt;
	}

	
	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes rAttr,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = memberService.login(member);
		if (memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			mav.setViewName("redirect:/");
			String action = (String) session.getAttribute("action");
			session.removeAttribute("action");
			if (action != null) {
				mav.setViewName("redirect:" + action);
			} else {
				mav.setViewName("redirect:/");
			}

		} else {
			rAttr.addAttribute("result", "loginFailed");
			int count = memberService.updateLoginFail(member.getId());
			if(count >= 5) {
				rAttr.addFlashAttribute("failedCount", count); //url??? ???????????? ??????.
			}
			mav.setViewName("redirect:/member/loginForm.do");
		}
		return mav;
	}

	/* ???????????? */
	@Override
	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}

	// ???????????? ?????? ???
	@Override
	@RequestMapping(value = "/member/findPwdForm.do")
	public String findPwdForm() throws Exception {
		return "/member/findPwdForm";
	}

	// ???????????? ??????
	@Override
	@RequestMapping(value = "/member/findPwd.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> findPwd(@ModelAttribute MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ResponseEntity<String> resEnt = null;
		String message = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		// ???????????? ?????????
		int result = memberService.idCheck(member);
		if (result == 0) {
			message = "????????? ???????????? ????????????.";
		}
		else {
			MemberVO vo = memberService.getMemberInfo(member.getId());
			// ????????? ???????????? ?????????
			if(!member.getEmail().equals(vo.getEmail())) {
				message = "????????? ???????????? ????????????.";
			} else {
				//???????????? ?????? ??????
				String pw = "";
				for (int i = 0; i < 12; i++) {
					pw += (char) ((Math.random() * 26) + 97);
				}
				member.setPw(pw);
				memberService.updatePwOfMember(member);
				// ???????????? ?????? ?????? ??????
				memberService.sendPwdResetMail(member);
				message = "???????????? ?????? ??????????????? ?????????????????????.";
			}
		}
		
		resEnt = new ResponseEntity<String> (message, responseHeaders, HttpStatus.CREATED);
		return resEnt;
	}   
	

	@RequestMapping(value = "/member/*Form.do", method = RequestMethod.GET)
	private ModelAndView form(@RequestParam(value = "result", required = false) String result,
			@RequestParam(value = "action", required = false) String action, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String viewName = (String) request.getAttribute("viewName");
		System.out.println(viewName);
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName(viewName);
		return mav;
	}

	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}
	
	
	
	

}
