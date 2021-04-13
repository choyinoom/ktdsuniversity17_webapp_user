package com.ktdsuniversity.edu.mypage.service;

import java.util.Map;

import com.ktdsuniversity.edu.mypage.vo.EnrollmentDetailVO;

public interface MypageService {
	public EnrollmentDetailVO findEnrollmentDetailByEnrollMap(Map<String, Object> enrollMap); 
}
