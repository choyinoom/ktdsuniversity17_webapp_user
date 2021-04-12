package com.ktdsuniversity.edu.mypage.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ktdsuniversity.edu.mypage.vo.EnrollmentDetailVO;

@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public EnrollmentDetailVO selectEnrollmentDetailByEnrollMap(Map<String, Object> enrollMap) {
		EnrollmentDetailVO vo = sqlSession.selectOne("mapper.mypage.selectEnrollmentDetailByEnrollMap", enrollMap);
		return vo;
	}

}
