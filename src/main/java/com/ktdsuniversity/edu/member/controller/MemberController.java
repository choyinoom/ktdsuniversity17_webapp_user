package com.ktdsuniversity.edu.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ktdsuniversity.edu.member.vo.MemberVO;


public interface MemberController {
	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addMember(@ModelAttribute("info") MemberVO memberVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
                              RedirectAttributes rAttr,
                              HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listPrivacy(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView joinAgree(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView celebrate(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity<String> changeMemberInfo(@ModelAttribute("member")MemberVO member, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	public ModelAndView changePwdForm(MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;

	/* 비밀번호변경 */
	public ModelAndView changePwd(MemberVO member, @RequestParam String newPw1, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}