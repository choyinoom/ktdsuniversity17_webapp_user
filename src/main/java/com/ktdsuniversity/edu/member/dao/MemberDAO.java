package com.ktdsuniversity.edu.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.ktdsuniversity.edu.member.vo.EnrollmentDetailVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface MemberDAO {
	public List selectAllMemberList() throws DataAccessException;

	public int insertMember(MemberVO memberVO) throws DataAccessException;

	public int deleteMember(String id) throws DataAccessException;

	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;

	public EnrollmentDetailVO selectEnrollmentDetailBy(Map<String, Object> enrollMap) throws DataAccessException;
	
	public int idCheck(MemberVO vo) throws DataAccessException;

	
	// 비밀번호 찾기할 때 쓰는 메소드들 3개
	public int check_id(String id) throws DataAccessException;

	public MemberVO login(String id) throws DataAccessException;

	public int update_pw(MemberVO member) throws Exception;

}
