package com.ktdsuniversity.edu.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.ktdsuniversity.edu.member.vo.EnrollmentDetailVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;

public interface MemberDAO {
	public List selectAllMemberList() throws DataAccessException;
	public int insertMember(MemberVO memberVO) throws DataAccessException ;
	public int deleteMember(String id) throws DataAccessException;
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	public EnrollmentDetailVO selectEnrollmentDetailBy(Map<String, Object> enrollMap) throws DataAccessException;
	public int idCheck(MemberVO vo) throws DataAccessException;
	public MemberVO selectMemberInfoBy(String id) throws DataAccessException;
	public MemberVO selectMemberPwInfoById(String id) throws DataAccessException;
	public int updatePwOfMember(MemberVO vo);

}
