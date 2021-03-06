package com.ktdsuniversity.edu.member.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.mail.HtmlEmail;
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
	public MemberVO login(MemberVO memberVO) throws Exception {
		memberDAO.updateLoginFailToZero(memberVO.getId());
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
		int result = memberDAO.updateLoginFail(id);
		if (result == 1) {
			result = memberDAO.selectLoginFail(id);
		}	
		return result;
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

// ??????????????????
	@Override
	public int updatePwOfMember(MemberVO vo) {
		return memberDAO.updatePwOfMember(vo);
	}
	
	// ?????? ???????????? ?????? ?????? ?????????
	@SuppressWarnings("deprecation")
	@Override
	public void sendPwdResetMail(MemberVO member) throws Exception {
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "junh011@naver.com";
		String hostSMTPpwd = "ju0382";

		String fromEmail = "junh011@naver.com";
		String fromName = "kt ds University";
		String subject = "kt ds University ?????? ???????????? ?????????.";
		String msg = "?????? ???????????? ??????";

		
		subject = "kt ds University ?????? ???????????? ?????????.";
		msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg += "<h3 style='color: blue;'>";
		msg += member.getId() + "?????? ?????? ???????????? ?????????. ??????????????? ???????????? ???????????????.</h3>";
		msg += "<p>?????? ??????: ";
		msg += member.getPw() + "</p></div>";
		
		String mail = member.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("?????? ?????? ??????: " + e);
		}
	}
}
