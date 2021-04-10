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
		<link href="<c:url value='/resources/css/listCourse.css'/>" rel="stylesheet">
		
		<script src="${contextPath}/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
		<script type="text/javascript">
			// 로그인을 하지 않으면 과정 신청이 불가합니다.
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
			
			// 과정목록 페이지네이션
			function fn_pagination(page) {
				var table = $('#course__list');
	            table.find('tr').not('tr:first').remove(); //헤더 외에 모든 행 삭제
	            
	            const firstRowIdx = 0 + ROWS * (page - 1);
	            const lastRowIdx = firstRowIdx + ROWS;
	            const courses10 = coursesArray.slice(firstRowIdx, lastRowIdx);
	            
	            var curRow = null; 	// 현재 데이터를 넣으려고 하는 행
	            var td = null; 		// 컬럼을 특정하기 위한 변수
	            courses10.forEach(function(course) {
	            	table.append('<tr align="center"></tr>');
	            	curRow = table.find("tr").last();
	            	// 과정 대상
	            	curRow.append('<td>'+course['type']+'</td>');
	            	// 과정명 (과정상세 바로가기)
	            	var courseName = $(`<a href="${contextPath}/course/viewCourse.do?courseId=\${course['id']}">\${course['name']}</a>`);
	            	curRow.append('<td id="course__name"></td>');
	            	td = curRow.find("td").last();
	            	td.append(courseName);
	            	// 교육기간
	            	curRow.append(`<td>\${course['startDate']}~\${course['endDate']}<br>\${course['time']}시간</td>`);
	            	// 수강신청 버튼
	            	var enrollBtn = $(`<a id="course__btn" 
	            			href="javascript:fn_enrollCourse(
		            			'${isLogOn}', 
		            			'${contextPath}/course/enrollCourse.do',
		            			'${contextPath}/member/loginForm.do', \${course['id']} )">신청하기</a></td>`);
	            	curRow.append("<td></td>");
	            	td = curRow.find("td").last();
	            	td.append(enrollBtn);
	            })
			}
		</script>
		<script type="text/javascript">
			// 페이지네이션
			const coursesArray = new Array(); // jstl to js
			<c:forEach var = "course" items="${coursesList}"> 
				coursesArray.push({
					type 		: "${course.syllabusVO.type}",
					id 			: "${course.id}",
					name		: "${course.syllabusVO.name}",
					startDate	: "${course.startDate}",
					endDate		: "${course.endDate}",
					time		: "${course.syllabusVO.time}"
				});
			</c:forEach>
			const ROWS = 10;
			const totalPages = Math.ceil(coursesArray.length / ROWS);
			
			$(document).ready(function() {	
				$("#pagination").twbsPagination({
					totalPages: totalPages, // 전체 페이지 수
					visiblePages: Math.min(5, totalPages),
					prev: '<',
					next: '>',
					onPageClick: function (event, page) {
						fn_pagination(page);
					}
				})
			})
		</script>
		
	</head>
	<body>
		<div class="grid mx-auto ai-center" id="course__container">
			<div class="banner" id="course__banner">
				<h1>과정 안내</h1>
			</div>
			<h2>현재 모집중인 과정</h2>
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
	
				</table>
				<div  id="Pagination">
					<ul class = "grid mx-auto" id="pagination"></ul>
				</div>
			</div>
		</div>
	</body>
</html>
