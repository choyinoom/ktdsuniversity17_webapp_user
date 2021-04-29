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
	// 로그인을 하지 않으면 과정 신청이 불가합니다.
	function fn_enrollCourse(isLogOn, enrollCourse, loginForm, courseID) {
		if(isLogOn != '' && isLogOn != 'false') {
			console.log(courseID);
			let form = document.createElement("form");
			form.action = enrollCourse;
			form.method = "post";
			let input = document.createElement("input");
			input.setAttribute("name", "courseId");
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
	<div class="grid mx-auto row-wrap ai-center" id="course__wrapper">
		<div class="grid ai-center" id="course__logo">
			<img alt="과정 로고" src="${contextPath}/resources/image/course_banner/${syllabus.bannerImg}">
		</div>
		<div class="grid col-wrap" id="intro__wrapper">
			<div class="grid" id="course__intro">
				<p>[${syllabus.type}] ${syllabus.courseCategoryVO.name}</p>
				<p id="course__name">${syllabus.name}</p>
				<p>교육기간 : ${course.startDate} ~ ${course.endDate}
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  강의장:${course.classroom}
				</p>
				<p>교육시간: ${course.startTime} ~ ${course.endTime}</p>
			</div>
			<button id="enroll__button">신청하기</button>
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
<div class="custom__modal" id="enroll">
	<div class="dimmed"></div>
	<section id="course__enroll">
		<div id="content">
			<h4>수강신청🎈</h4>
			<hr>
			<p id="name"></p>
			<p id="date"></p>
			<p id="time"></p>
			<div class = "grid row-wrap" id="buttons">
				<button id="submit">신청</button>
				<button id="cancle">취소</button>
			</div>
		</div>
	</section>
</div>
<script type="text/javascript">
	/* 모달 */
	
	$('#enroll__button').on('click', function() {
		var isLogOn = '${isLogOn}';
		if (isLogOn != '' && isLogOn != 'false') {
			// 모달 창 띄우기
			
			const _course = {
				id: Number('${course.id}'),
				name: '${syllabus.name}',
				date: '${course.startDate} ~ ${course.endDate}',
				time: '${course.startTime} ~ ${course.endTime}'
			};

			$('#name').text('과정명: ' + _course.name); 
			$('#date').text('날짜: ' + _course.date);
			$('#time').text('시간: ' + _course.time); 
			$('#enroll').css('display','flex');
		} else {
			alert("로그인 후 수강신청이 가능합니다.");
			const loginForm = '${contextPath}/member/loginForm.do';
			location.href=loginForm+'?action=/course/viewCourse.do?courseId='+ '${course.id}';
		}	
	});

	/* 수강신청 버튼*/
	$('#enroll #submit').on('click', function() {
		let form = document.createElement("form");
		form.action = '${contextPath}/course/enrollCourse.do';
		form.method = "post";
		let input = document.createElement("input");
		input.setAttribute("name", "courseId");
		input.setAttribute("value", Number('${course.id}'));
		form.appendChild(input);
		document.body.appendChild(form);
		form.submit();
	})

	/* 취소 버튼*/
	$('.custom__modal #cancle').on('click', function() {
		$('.custom__modal').css('display','none');
})
</script>
