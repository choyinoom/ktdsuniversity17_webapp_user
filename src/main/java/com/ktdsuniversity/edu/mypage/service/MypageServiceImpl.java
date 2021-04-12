package com.ktdsuniversity.edu.mypage.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ktdsuniversity.edu.mypage.dao.MypageDAO;
import com.ktdsuniversity.edu.mypage.vo.EnrollmentDetailVO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService{

	@Autowired
	MypageDAO mypageDAO;
	
	@Override
	public EnrollmentDetailVO findEnrollmentDetailByEnrollMap(Map<String, Object> enrollMap) {
		EnrollmentDetailVO vo = mypageDAO.selectEnrollmentDetailByEnrollMap(enrollMap);
		return vo;
	}

}
