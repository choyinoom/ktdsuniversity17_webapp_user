package com.ktdsuniversity.edu.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.member.dao.MemberDAO;
import com.ktdsuniversity.edu.member.vo.EnrollmentDetailVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;


@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}

	@Override
	public int removeMember(String id) throws DataAccessException {
		return memberDAO.deleteMember(id);
	}
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception{
		return memberDAO.loginById(memberVO);
	}

	public int idCheck(MemberVO vo) throws DataAccessException {
		int result = memberDAO.idCheck(vo);
		return result;
	}

	@Override
	public MemberVO getMemberInfo(String id) throws Exception {
		return memberDAO.selectMemberInfo(id);
	}

	@Override
	public int changeMemberInfo(MemberVO member) throws Exception {
		return memberDAO.updateMemberInfo(member);
	}

	@Override
	public int updateLoginFail(String id) throws Exception {
		return memberDAO.updateLoginFail(id);		
	}


	@Override
	public EnrollmentDetailVO findEnrollmentDetailBy(Map<String, Object> enrollMap)
			throws Exception {
		return memberDAO.selectEnrollmentDetailBy(enrollMap);
	}
	
	@Override
	public List<EnrollmentDetailVO> findEnrollmentDetailBy(String id) throws Exception {
		List<EnrollmentDetailVO> enrollmentDetailList = null;
		enrollmentDetailList = memberDAO.selectEnrollmentDetailBy(id);
		return enrollmentDetailList;
	}
	
	@Override
	public MemberVO selectMemberPwInfoById(String id) throws Exception {
		return memberDAO.selectMemberPwInfoById(id);
	}

// 비밀번호변경

	@Override
	public int updatePwOfMember(MemberVO vo) {
		return memberDAO.updatePwOfMember(vo);
	}
	
}
