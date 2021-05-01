package com.ktdsuniversity.edu.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ktdsuniversity.edu.member.vo.EnrollmentDetailVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.company.vo.CompanyVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllMemberList() throws DataAccessException {
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}

	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}

	@Override
	public int deleteMember(String id) throws DataAccessException {
		int result = sqlSession.delete("mapper.member.deleteMember", id);
		return result;
	}

	@Override
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mapper.member.loginById", memberVO);
		return vo;
	}

	public EnrollmentDetailVO selectEnrollmentDetailBy(Map<String, Object> enrollMap) throws DataAccessException {
		EnrollmentDetailVO vo = sqlSession.selectOne("mapper.member.selectEnrollmentDetailByEnrollMap", enrollMap);
		return vo;
	}

	public int idCheck(MemberVO vo) throws DataAccessException{
		int result = sqlSession.selectOne("mapper.member.selectMember", vo);
		return result;
	}
	
	
	// 비밀번호 찾기 할 때 쓰는 메소드들
	// 비밀번호 수정
		@Transactional
		public int update_pw(MemberVO member) throws Exception{
			int result = sqlSession.update("mapper.member.update_pw", member);
			return result;
		}
		
		// 아이디 체크
		@Override
		public int check_id(String id) throws DataAccessException {
			int result = sqlSession.selectOne("mapper.member.check_id", id);
			return result;
		}
		
		// 로그인 되는
		@Override
		public MemberVO login(String id) throws DataAccessException {
			MemberVO vo = sqlSession.selectOne("mapper.member.login", id);
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@" +vo.getEmail());
			return vo;
		}
	
}
