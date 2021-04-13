package com.ktdsuniversity.edu.mypage.dao;

import java.util.Map;

import com.ktdsuniversity.edu.mypage.vo.EnrollmentDetailVO;

public interface MypageDAO {

	public EnrollmentDetailVO selectEnrollmentDetailByEnrollMap(Map<String, Object> enrollMap);

}
