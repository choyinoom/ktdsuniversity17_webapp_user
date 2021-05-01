package com.ktdsuniversity.edu.member.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = memberDAO.selectAllMemberList();
		return membersList;
	}

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
		return memberDAO.loginById(memberVO);
	}

	public EnrollmentDetailVO findEnrollmentDetailBy(Map<String, Object> enrollMap) throws DataAccessException {
		return memberDAO.selectEnrollmentDetailBy(enrollMap);
	}

	public int idCheck(MemberVO vo) throws DataAccessException {
		int result = memberDAO.idCheck(vo);
		return result;
	}

	// 임시 비밀번호 발송 메일 메소드
	@SuppressWarnings("deprecation")
	@Override
	public void send_mail(MemberVO member, String div) throws Exception {
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "junh011@naver.com";
		String hostSMTPpwd = "ju0382";

		String fromEmail = "junh011@naver.com";
		String fromName = "KTds University";
		String subject = "KTds University 임시 비밀번호 입니다.";
		String msg = "임시 비밀번호 발급";

		if (div.equals("find_pw")) {
			subject = "KTds University 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 번호: ";
			msg += member.getPw() + "</p></div>";
		}
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
			System.out.println("메일 전송 실패: " + e);
		}
	}

	// 비밀번호 찾는 메소드
	@Override
	public void find_pw(HttpServletResponse response, MemberVO member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 아이디가 없으면
		if (memberDAO.check_id(member.getId()) == 0) {
			out.print("등록된 아이디가 없습니다.");
			out.close();
		}
		// 이메일이 같지 않다면
		else if (!member.getEmail().equals(memberDAO.login(member.getId()).getEmail())) {
			out.print("등록된 이메일이 없습니다.");
			out.close();
		} else {
			// 랜덤으로 번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			member.setPw(pw);
			// 비밀번호 변경
			memberDAO.update_pw(member);
			// 비밀번호 변경 메일 발송
			send_mail(member, "find_pw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
	
	// 아이디 체크 메소드
	@Override
	public void check_id(String id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(memberDAO.check_id(id));
		out.close();
	}
}
