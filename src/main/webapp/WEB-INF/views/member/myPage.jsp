<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>

<link href="<c:url value='/resources/css/myPage.css'/>" rel="stylesheet">


<div class="grid mx-auto col-wrap ai-center" id="mypage__container">
	<section class="banner" id="mypage__banner">
		<h1>마이페이지</h1>
	</section>
	<div class="contents">
		<div class="menu">
			<button class="menu_button" onclick="location.href='${contextPath}/member/myPage.do'">회원정보</button>
			<button class="menu_button" onclick="location.href='${contextPath}/member/myPage.do?pageFlag=C'">수강현황</button>
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
				<!-- 수신동의 여부 -->
				<tr>
					<td>수신동의</td>
					<td>
						<input type="radio" name="subscription" id="subscription_T" value="T" disabled>
						<label for="subscription_T">동의</label>
						<input type="radio" name="subscription" id="subscription_F" value="F" disabled>
						<label for="subscription_F">비동의</label>
					</td>
				<tr>
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
				onclick="location.href = '${contextPath}/member/changePwdForm.do'">비밀번호변경</button>
		</div>

		<div class="custom__modal">
			<div class="dimmed"></div>
			<section>
			<h4 style="text-align: center">회원정보 변경 🙋‍♂️</h4>
				<form id="personal__info" method="post" action="${contextPath}/member/changeMemberInfo.do">
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
								<td>
									<input type="text" name="tel1" id="tel1" pattern="[0-9]{2,3}"> -
									<input type="text" name="tel2" id="tel2" pattern="[0-9]{3,4}"> -
									<input type="text" name="tel3" id="tel3" pattern="[0-9]{4}"> 
									<input type="hidden" name="tel">
								</td>
							</tr>
							<tr>
								<td>휴대폰</td>
								<td>
									<input type="text" name="phone1" id="phone1" pattern="[0-9]{3}" required> - 
									<input type="text" name="phone2" id="phone2" pattern="[0-9]{3,4}"  required> - 
									<input type="text" name="phone3" id="phone3" pattern="[0-9]{4}" id="phone3" required>
									<input type="hidden" name="phone">									
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="email" name="email" placeholder="example@exam.com" value="${memberVO.email}" required></td>
							</tr>
							<tr>
								<td>수신동의</td>
								<td>
									<input type="radio" name="subscription" id="m__subscription_T" value="T">
									<label for="subscription_T">동의</label>
									<input type="radio" name="subscription" id="m__subscription_F" value="F">
									<label for="subscription_F">비동의</label>
								</td>
							</tr>
							<tr>
								<td width="15%">소속회사</td>
								<td>${memberVO.companyName}</td>
							</tr>
						</tbody>
					</table>
				</form>

				<p>이름과 소속회사 변경을 원하실 경우 관리자에게 문의주십시오.</p>
				<p>케이티디에스 역량강화팀 이홍은 010-2709-8965 / hongeun.lee@kt.com</p>
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
		
		
		if('${memberVO.subscription}' === 'T') { // default 수신동의 여부
			document.querySelector("#subscription_T").checked = true;
		} else {
			document.querySelector("#subscription_F").checked = true;
		}
		
		$("#change__info").on("click", function() {
			$('.custom__modal').css('display', 'flex');
			/* 기존 전화번호 */
			var tNumber = '${memberVO.tel}';	
			if (tNumber.length > 0) {
				var tNumbers = tNumber.split('-');
				$("#tel1").val(tNumbers[0]);
				$("#tel2").val(tNumbers[1]);
				$("#tel3").val(tNumbers[2]);
			}
			/* 기존 휴대폰 번호*/
			var pNumbers = '${memberVO.phone}'.split('-');
			$("#phone1").val(pNumbers[0]);
			$("#phone2").val(pNumbers[1]);
			$("#phone3").val(pNumbers[2]);
			if('${memberVO.subscription}' === 'T') { // default 수신동의 여부
				document.querySelector("#m__subscription_T").checked = true;
			} else {
				document.querySelector("#m__subscription_F").checked = true;
			}
		});

		$('.custom__modal #submit').on('click', function() {
			$('#personal__info input[type="hidden"][name="phone"]').val($('#personal__info input[name="phone1"]').val()+'-'+$('#personal__info input[name="phone2"]').val()+'-'+$('#personal__info input[name="phone3"]').val());
			const tel1 = $("#personal__info input[name='tel1']").val();
			const tel2 = $("#personal__info input[name='tel2']").val();
			const tel3 = $("#personal__info input[name='tel3']").val();
			if(tel1 !== undefined && tel2 !== undefined && tel3 !== undefined)
				$('#personal__info [type="hidden"][name="tel"]').val(tel1+'-'+tel2+'-'+tel3);
			
		})
		
		/* 취소 버튼*/
		$('.custom__modal #cancle').on('click', function() {
			$('.custom__modal').css('display', 'none');
		})
	})
</script>