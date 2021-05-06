package com.ktdsuniversity.edu.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;

import com.ktdsuniversity.edu.member.vo.EnrollmentDetailVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface MemberService {
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public int removeMember(String id) throws DataAccessException;
	public MemberVO login(MemberVO memberVO) throws Exception;
	public int idCheck(MemberVO vo) throws DataAccessException;
	public MemberVO getMemberInfo(String id) throws Exception;
	public int changeMemberInfo(MemberVO member) throws Exception;
	public int updateLoginFail(String id) throws Exception;
	public EnrollmentDetailVO findEnrollmentDetailBy(Map<String, Object> enrollMap) throws Exception;
	public List<EnrollmentDetailVO> findEnrollmentDetailBy(String id) throws Exception;
	public MemberVO selectMemberPwInfoById(String id) throws Exception;
	public int updatePwOfMember(MemberVO vo);
	public void sendPwdResetMail(MemberVO member) throws Exception;
}
