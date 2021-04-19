<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="<c:url value='/resources/css/header.css'/>">


<nav class="navbar mx-auto grid ai-center">

	<div class="navbar__logo">
		<a href="${contextPath}/"> <img alt="ktdsUniversity__logo"/>
		</a>
	</div>


	<div class="navbar__menu grid">
			<ol class="navbar__menu__tnb grid">
				<li><c:choose>
						<c:when test="${isLogOn == true  && member!= null}">
							<a class="navbar__menu__each" href="${contextPath}/member/logout.do"> 로그아웃 </a>
						</c:when>
						<c:otherwise>
							<a class="navbar__menu__each" href="${contextPath}/member/loginForm.do"> 로그인 </a>
						</c:otherwise>
					</c:choose></li>
				<li class="navbar__menu__each">|</li>
				<li><a class="navbar__menu__each" href="${contextPath}/member/memberForm.do">회원가입</a></li>
				<li class="navbar__menu__each">|</li>
				<li ><a class="navbar__menu__each" href="#">마이페이지</a></li>
			</ol>

		<div class="topMenu">
			<ul class="navbar__menu__gnb grid">
				<li><a class="navbar__menu__each__main" href="${contextPath}/company/companyInfo.do">회사소개</a>
          <ul class="navbar__menu__each__sub">
            <li><a id="navbar__menu__each__sub__text" href="${contextPath}/company/companyInfo.do">회사소개</a></li>
            <li><a id="navbar__menu__each__sub__text" href="${contextPath}/company/consortium.do">컨소시엄소개</a></li>
          </ul>
				</li>
				<li><a class="navbar__menu__each__main" href="${contextPath}/course/listCourses.do">과정안내</a></li>
				<li><a class="navbar__menu__each__main" href="${contextPath}/company/classroom.do">교육장안내</a></li>
				<li><a class="navbar__menu__each__main" href="${contextPath}/customer/listNotices.do?pageNo=1">고객지원</a>
          <ul class="navbar__menu__each__sub">
            <li><a id="navbar__menu__each__sub__text" href="${contextPath}/customer/listNotices.do?pageNo=1">공지사항</a></li>
            <li><a id="navbar__menu__each__sub__text" href="${contextPath}/customer/faq.do">FAQ</a></li>
				  </ul>
				</li>
			</ul>
		</div>
	</div>

</nav>