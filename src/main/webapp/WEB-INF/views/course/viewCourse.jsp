<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="course" value="${courseMap.course}" />
<c:set var="syllabus" value="${courseMap.syllabus }"/>
<fmt:parseDate pattern="yyyy-mm-dd" value="${course.startDate}" var="parsedStartDate"/>
<fmt:parseDate pattern="yyyy-mm-dd" value="${course.endDate}" var="parsedEndDate"/>

<%
request.setCharacterEncoding("UTF-8");
%>


<link rel="stylesheet"
	href="<c:url value='/resources/css/viewCourse.css'/>">

<script type="text/javascript">
$(document).ready(function() {
	$("header").css("position" ,"relative");
	$("main").css("padding-top" ,"10px" );
})
</script>
<script type="text/javascript">
	// 로그인을 하지 않으면 과정 신청이 불가합니다.
	function fn_enrollCourse(isLogOn, enrollCourse, loginForm, courseID) {
		if(isLogOn != '' && isLogOn != 'false') {
			console.log(courseID);
			let form = document.createElement("form");
			form.action = enrollCourse;
			form.method = "post";
			let input = document.createElement("input");
			input.setAttribute("name", "courseID");
			input.setAttribute("value", courseID);
			form.appendChild(input);
			document.body.appendChild(form);
			form.submit();
		} else {
			alert("로그인 후 수강신청이 가능합니다.");
			location.href=loginForm+'?action=/course/viewCourse.do?courseId='+courseID;
		}
	}
</script>

<div class="grid" id="course__banner">
	<div class="grid mx-auto row-wrap" id="course__wrapper">
		<div class="grid ai-center" id="course__logo">
			<img alt="과정 로고" src="${contextPath}/resources/image/course_banner/${course.bannerImg}">
		</div>
		<div class="grid col-wrap" id="intro__wrapper">
			<div class="grid" id="course__intro">
				<p>[${syllabus.type}] ${syllabus.category}</p>
				<p id="course__name">${syllabus.name}</p>
				<p>교육기간 : <fmt:formatDate value="${parsedStartDate}" pattern="yy/MM/dd"/> ~ <fmt:formatDate value="${parsedEndDate}" pattern="yy/MM/dd"/>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  강의장:${course.classroom}
				</p>
			</div>
			<div id="enroll__button">
				<a id="course__btn" 
	            	href="javascript:fn_enrollCourse('${isLogOn}', '${contextPath}/course/enrollCourse.do', '${contextPath}/member/loginForm.do', ${course.id} )">신청하기</a>
			</div>
		</div>
	</div>
</div>

<div id="back__button__wrapper" class="grid mx-auto">
	<div id="back__button">
		<a href="${contextPath}/course/listCourses.do">목록</a>
	</div>
</div>

<div class="grid mx-auto" id="course__detail">
	<!--  강의계획서 -->	
	<section class="mx-auto" id=syllabus__contents>
		<article id="overview">
			<h2 class="detail__title">학습개요</h2>
			<pre class="detail">${syllabus.overview}</pre>
		</article>
		<article id="objectives">
			<h2 class="detail__title">학습목표</h2>
			<pre class="detail">${syllabus.objectives}</pre>
		</article>
		<article id="target">
			<h2 class="detail__title">학습대상</h2>
			<pre class="detail">${syllabus.target}</pre>
		</article>
		<article id="contents">
			<h2 class="detail__title">교육내용</h2>
			<pre class="detail">${syllabus.contents}</pre>
		</article>
	</section>
</div>

<div id="back__button__wrapper" class="grid mx-auto">
	<div id="back__button">
		<a href="${contextPath}/course/listCourses.do">목록</a>
	</div>
</div>

