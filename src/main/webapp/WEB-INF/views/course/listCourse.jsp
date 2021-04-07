<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
<meta charset="UTF-8">
<title>과정안내</title>
<link rel="stylesheet"
	href="<c:url 
value='/resources/css/listCourse.css'/>">
</head>
<script type="text/javascript">
	function fn_enrollCourse(isLogOn, enrollCourse, loginForm, courseID) {
		if(isLogOn != '' && isLogOn != 'false') {
			let form = document.createElement("form");
			form.action = enrollCourse;
			form.method = "post";
			let input = document.createElement("input");
			input.setAttribute("type", "hidden");
			input.setAttribute("name", "courseID");
			input.setAttribute("value", courseID);
			form.appendChild(input);
			document.body.appendChild(form);
			form.submit();
		} else {
			alert("로그인 후 수강신청이 가능합니다.");
			location.href=loginForm+'?action=/course/listCourses.do';
		}
	}
</script>
<body>
	<div class="grid mx-auto ai-center" id="course__container">
		<div class="banner" id="course__banner">
			<h1>과정 안내</h1>
		</div>
		<h2>2021년도 04월 교육일정</h2>
		<div id="course__contents">
			<div class="grid" id="course__search">
				<img src="${contextPath}/resources/image/loupe.png" alt="검색하기">
				<div id="course__search__in">
					<input type='text' name='search' placeholder="강의명을 입력하세요">
				</div>
				<input type='submit' id='search_btn' value="검색">
			</div>
			<table id="course__list">
				<tr align="center">
					<th width="15%">과정대상</th>
					<th width="35%">과정명</th>
					<th width="25%">교육기간</th>
					<th width="15%">수강신청</th>
				</tr>

				<c:forEach var="course" items="${coursesList}">
					<tr align="center">
						<td>${course.syllabusVO.type}</td>
						<td id="course__name"><a href='${contextPath}/course/viewCourse.do?courseId=${course.id}'>${course.syllabusVO.name}</a></td>
						<td>${course.startDate}~${course.endDate}<br>${course.syllabusVO.time}시간</td>
						<td><a href="javascript:fn_enrollCourse('${isLogOn}','${contextPath}/course/enrollCourse.do',
								'${contextPath}/member/loginForm.do', ${course.id})" id="course__btn">신청하기</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>
