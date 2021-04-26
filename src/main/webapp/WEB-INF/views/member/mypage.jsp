<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>

<link href="<c:url value='/resources/css/mypage.css'/>" rel="stylesheet">


<div class="grid mx-auto col-wrap ai-center" id="mypage__container">
	<section class="banner" id="mypage__banner">
		<h1>마이페이지</h1>
	</section>
	<div class="contents">
		<div class="menu">
			<!-- 버튼 클릭시 페이지 이동하는거 아님 -->
			<button class="menu_button">회원정보</button>
			<button class="menu_button">수강현황</button>
		</div>
		<table id="member__info" frame=void>
			<tbody>
				<!-- 아이디 -->
				<tr>
					<td width="15%">아이디</td>
					<td>${memberVO.id}</td>
				</tr>
				<!-- 이름 -->
				<tr>
					<td width="15%">이름</td>
					<td>${memberVO.name}</td>
				</tr>
				<!-- 전화번호 -->
				<tr>
					<td width="15%">전화번호</td>
					<td>${memberVO.tel}</td>
				</tr>

				<!-- 휴대폰 -->
				<tr>
					<td width="15%">휴대폰</td>
					<td>${memberVO.phone}</td>
				</tr>

				<!-- 이메일 -->
				<tr>
					<td width="15%">이메일</td>
					<td>${memberVO.email}</td>
				</tr>

				<!-- 소속회사 -->
				<tr>
					<td width="15%">소속회사</td>
					<td>${memberVO.companyName}</td>
				</tr>
			</tbody>
		</table>


		<div class="under">
			<button class="td_button" id="change__info" type="button">회원정보변경</button>
			<button class="td_button"
				onclick="location.href = '${contextPath}/mypage/changePwdForm.do'">비밀번호변경</button>
		</div>

		<div class="custom__modal">
			<div class="dimmed"></div>
			<section>
				<form id="personal__info" method="post"
					action="${contextPath}/member/changeMemberInfo.do">
					<table id="member__info">
						<tbody>
							<tr>
								<td width="30%">아이디</td>
								<td>${memberVO.id}</td>
							</tr>
							<tr>
								<td>이름</td>
								<td>${memberVO.name}</td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><input type="text" id="tel" value="${memberVO.tel}"></td>
							</tr>
							<tr>
								<td>휴대폰</td>
								<td><input type="text" id="phone" value="${memberVO.phone}"></td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" id="email" value="${memberVO.phone}"></td>
							</tr>
							<tr>
								<td width="15%">소속회사</td>
								<td>${memberVO.companyName}</td>
							</tr>
						</tbody>
					</table>
				</form>

				<div class="grid row-wrap" id="buttons">
					<button id="submit" form="personal__info" type="submit">수정</button>
					<button id="cancle">취소</button>
				</div>
			</section>
		</div>
	</div>
</div>
<script type="text/javascript">
	/*최초 페이지 진입 시 회원정보에 밑줄*/
	$(document).ready(function() {
		$(".menu .menu_button:nth-child(1)").addClass("visited");

		$(".menu .menu_button").on("click", function() {
			$(this).sibling().removeClass("visited");
			$(this).addClass("visited");
		});

		$("#change__info").on("click", function() {
			$('.custom__modal').css('display', 'flex');
		});

		/* 수강신청 버튼*/
		$('.custom__modal #submit').on('click', function() {
			let form = document.createElement("form");
			form.action = '${contextPath}/member/changeMemberInfo.do';
			form.method = "post";
			let input = document.createElement("input");
			input.setAttribute("name", "courseId");
			input.setAttribute("value", Number(course['id']));
			form.appendChild(input);
			document.body.appendChild(form);
			form.submit();
		})

		/* 취소 버튼*/
		$('.custom__modal #cancle').on('click', function() {
			$('.custom__modal').css('display', 'none');
		})
	})
</script>