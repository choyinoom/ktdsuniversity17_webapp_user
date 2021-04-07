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
	$("main").css("padding-top" ,"0px" );
})
</script>


<div class="grid" id="course__banner">
	<div class="grid mx-auto" id="course__wrapper">
		<div class="grid ai-center" id="course__logo">
			<img alt="과정 로고" src="${contextPath}/resources/image/course_banner/${course.bannerImg}">
		</div>
		<div class="grid" id="course__intro">
			<p>[${syllabus.type}] ${syllabus.category}</p>
			<p id="intro__name">${syllabus.name}</p>
			<p>교육기간 : <fmt:formatDate value="${parsedStartDate}" pattern="yy/MM/dd"/> ~ <fmt:formatDate value="${parsedEndDate}" pattern="yy/MM/dd"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  강의장:${course.classroom}
			</p>
		</div>
	</div>
</div>

<div class="grid mx-auto" id="course__detail">
	<!--  과정상세 각 내용으로 바로 가는 내비게이션 -->
	<section class="grid mx-auto" id="detail__index">
		<ul class="grid" id="detail__navigation">
			<li id="__overview">학습개요</li>
			<li id="__objectives">학습목표</li>
			<li id="__target">학습대상</li>
			<li id="__contents">교육내용</li>
		</ul>
		<div id="underbar"></div>
		<div id="enroll__button__wrapper">
			<div id="enroll__button">
				<a>신청하기</a>
			</div>
		</div>
	</section>
	
	<section class="mx-auto" id=syllabus__contents>
		<article id="overview">
			<h2 class="detail__title">학습개요</h2>
			<p class="detail">${syllabus.overview}</p>
		</article>
		<article id="objectives">
			<h2 class="detail__title">학습목표</h2>
			<p class="detail">${syllabus.objectives}</p>
		</article>
		<article id="target">
			<h2 class="detail__title">학습대상</h2>
			<p class="detail">${syllabus.target}</p>
		</article>
		<article id="contents">
			<h2 class="detail__title">교육내용</h2>
			<p class="detail">${syllabus.contents}</p>
		</article>
	</section>
</div>

<div id="back__button__wrapper" class="grid mx-auto">
	<div id="back__button">
		<a href="${contextPath}/course/listCourses.do">목록</a>
	</div>
</div>


<script>
$(document).ready(function() {
	const posOverview = $('#overview > h2').offset();
	const posObjectives = $('#objectives > h2').offset();
	const posTarget = $('#target > h2').offset();
	const posContents = $('#contents > h2').offset();
	
	$('#__overview').on('click', function() {
		$('html, body').animate({scrollTop:posOverview.top-90}, "slow");
	})
	$('#__objectives').on('click', function() {
		$('html, body').animate({scrollTop:posObjectives.top-90}, "slow");
		$('#__objectives > span').toggleClass("f");
	})
	$('#__target').on('click', function() {
		$('html, body').animate({scrollTop:posTarget.top-90}, "slow");
	})
	$('#__contents').on('click', function() {
		$('html, body').animate({scrollTop:posContents.top-90}, "slow");
	})
})
	
</script>
