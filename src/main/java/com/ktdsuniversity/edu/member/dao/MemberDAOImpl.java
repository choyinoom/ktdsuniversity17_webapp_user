package com.ktdsuniversity.edu.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.member.vo.EnrollmentDetailVO;
import com.ktdsuniversity.edu.member.vo.MemberVO;
import com.ktdsuniversity.edu.company.vo.CompanyVO;


@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	
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
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException{
		  MemberVO vo = sqlSession.selectOne("mapper.member.loginById",memberVO);
		return vo;
	}

	public int idCheck(MemberVO vo) throws DataAccessException{
		int result = sqlSession.selectOne("mapper.member.selectMember", vo);
		return result;
	}

	@Override
	public MemberVO selectMemberInfo(String id) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mapper.member.selectMemberInfoById", id);
		return vo;
	}

	@Override
	public int updateMemberInfo(MemberVO member) throws DataAccessException {
		int result = sqlSession.update("mapper.member.updateMemberInfo", member);
		return result;
	}

	@Override
	public int updateLoginFail(String id) throws DataAccessException {
		return sqlSession.update("mapper.member.updateLoginFail", id);
	}
	
	/* 중복 수강신청 방지 */
	@Override
	public EnrollmentDetailVO selectEnrollmentDetailBy(Map<String, Object> enrollMap)
			throws DataAccessException {
		EnrollmentDetailVO vo = sqlSession.selectOne("mapper.enrollment.selectEnrollmentDetailByEnrollMap", enrollMap);
		return vo;
	}

	@Override
	public MemberVO selectMemberPwInfoById(String id) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mapper.member.selectMemberPwInfoById", id);
		return vo;
	}

	/* 비밀번호변경 */
	@Override
	public int updatePwOfMember(MemberVO vo) {
		
		return sqlSession.update("mapper.member.updatePwOfMember", vo);
	}
	
	/* 마이페이지 수강현황 */
	@Override
	public List<EnrollmentDetailVO> selectEnrollmentDetailBy(String id)
			throws DataAccessException {
		List<EnrollmentDetailVO> enrollmentDetailList = null;
		enrollmentDetailList = sqlSession.selectList("mapper.enrollment.selectEnrollmentDetailById", id);
		return enrollmentDetailList;
	}
	
}
