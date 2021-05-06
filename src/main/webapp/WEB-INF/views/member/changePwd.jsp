<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>

<link rel="stylesheet"
	href="<c:url value='/resources/css/changePwd.css'/>">

<section class="banner" id="mypage__banner">
	<h1>비밀번호 변경</h1>
</section>

<form method="post" name="changePwd"
	action="${contextPath}/member/changePwd.do" id="changePwdForm">
	<div class="changePwd_container">

		<div class="changePwd_menu">
			<!-- 버튼 클릭시 페이지 이동하는거 아님 -->
			<button class="menu_button">비밀번호 변경</button>
		</div>

		<div class="mypage_changePwd">

			<input type=password name="nowPw" placeholder="현재 비밀번호" /><br>
			<div class="changePwd_pattern">
				<input type=password name="newPw1" placeholder="새 비밀번호"
					pattern="^(?=.*[0-9])(?=.*[a-zA-Z]).{8,16}$">
				<p id="changePwd_condition">8~16자리의 영문, 숫자를 조합하여 입력해주세요.</p>
			</div>
			<input type=password name="newPw2" placeholder="새 비밀번호 확인"></input><br>
			<!-- 준오오빠가 준 input 양식 -->


		</div>
	</div>

	<div class="changePwd_under">
		<input id="ok_Button" type="submit" value="확인" />
		<button type="cancle" id="cancle_Button"
			onclick="location.href='${contextPath}/member/myPage.do'; return false;">취소</button>
		<!-- 취소버튼 클릭시 이전페이지(마이페이지)로 돌아가도록 링크설정 -->
	</div>
</form>

<script>
	$(function() {
		$('#changePwdForm').submit(function() {

			var frm = document.changePwd;
			var Pw = '${vo.pw}';
			var nowPw = frm.nowPw.value;
			var newPw1 = frm.newPw1.value;
			var newPw2 = frm.newPw2.value;
			if (nowPw == "") {
				alert('현재 비밀번호를 입력해주세요.');
				return false;
			} else if (Pw != nowPw) {
				alert('현재 비밀번호가 다릅니다.');
				return false;
			} else if (newPw1 == "") {
				alert('새 비밀번호 입력해주세요.');
				return false;
			} else if (newPw2 == "") {
				alert('새 비밀번호 확인을 입력해주세요.');
				return false;
			} else if (newPw1 != newPw2) {
				alert('새 비밀번호가 일치하지 않습니다.');
				return false;
			}

			return true;
		})
	})
</script>