package com.ktdsuniversity.edu.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;

import com.ktdsuniversity.edu.member.vo.EnrollmentDetailVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface MemberService {
	public List listMembers() throws DataAccessException;

	public int addMember(MemberVO memberVO) throws DataAccessException;

	public int removeMember(String id) throws DataAccessException;

	public MemberVO login(MemberVO memberVO) throws Exception;

	public EnrollmentDetailVO findEnrollmentDetailBy(Map<String, Object> enrollMap) throws DataAccessException;

	public int idCheck(MemberVO vo) throws DataAccessException;

	
	// 비밀번호 찾기할 때 쓰는 메소드들
	void send_mail(MemberVO member, String div) throws Exception;

	void find_pw(HttpServletResponse response, MemberVO member) throws Exception;
	
	public void check_id(String id, HttpServletResponse response) throws Exception;


}
