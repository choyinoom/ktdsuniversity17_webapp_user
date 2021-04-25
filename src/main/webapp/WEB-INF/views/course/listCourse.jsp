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
	</head>
	<body>
		<div class="grid mx-auto ai-center" id="course__container">
			<section class="banner" id="course__banner">
				<h1>과정 안내</h1>
			</section>
			<h2>현재 모집중인 과정</h2>
			<section id="course__contents">
				<form class="grid" id="course__search">
					<img src="${contextPath}/resources/image/loupe.png" alt="검색하기">
					<div id="course__search__in">
						<input type='text' name='keyword' placeholder="강의명을 입력하세요">
					</div>
					<input type='submit' id='search_btn' value="검색">
				</form>
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
			</section>
			<div class="custom__modal">
				<div class="dimmed"></div>
				<section id="course__enroll">
					<div id="content">
						<h4>수강신청🎈</h4>
						<hr>
						<p id="name"></p>
						<p id="date"></p>
						<div class = "grid row-wrap" id="buttons">
							<button id="submit">신청</button>
							<button id="cancle">취소</button>
						</div>
					</div>
				</section>
			</div>
		</div>
		<script type="text/javascript">		
			// 과정목록 출력하기
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
	            	curRow.append('<td style="display:none">'+course['id']+'</td>')
	            	// 과정 대상
	            	curRow.append('<td>'+course['syllabusVO']['type']+'</td>');
	            	// 과정명 (과정상세 바로가기)
	            	var courseName = $(`<a href="${contextPath}/course/viewCourse.do?courseId=\${course['id']}">\${course['syllabusVO']['name']}</a>`);
	            	curRow.append('<td id="course__name"></td>');
	            	td = curRow.find("td").last();
	            	td.append(courseName);
	            	// 교육기간
	            	curRow.append(`<td>\${course['startDate']} ~ \${course['endDate']}<br>\${course['syllabusVO']['time']}시간</td>`);
	            	// 수강신청 버튼
	            	var enrollBtn = $('<button id="course__btn">신청하기</button>');
	            	curRow.append("<td></td>");
	            	td = curRow.find("td").last();
	            	td.append(enrollBtn);
	            })
			}
		</script>
		<script type="text/javascript">
			// 페이지네이션
			const coursesArray = ${coursesJSON};
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
		<script type="text/javascript">
		/* 모달 */
		var course;
		$('#course__list').on('click', 'button', function() {
			var isLogOn = '${isLogOn}';
			if (isLogOn != '' && isLogOn != 'false') {
				// 모달 창 띄우기
				var row = $(this).closest("tr").find("td");
				course = {
					id: row[0].textContent,
				 	name: row[2].textContent, 
				 	date: row[3].textContent
				}
	
				$('#name').text('과정명: ' + course.name); 
				$('#date').text('일시: ' + course.date.substr(0,23));
				 
				$('.custom__modal').css('display','flex');
			} else {
				alert("로그인 후 수강신청이 가능합니다.");
				const loginForm = '${contextPath}/member/loginForm.do';
				location.href=loginForm+'?action=/course/listCourses.do';
			}	
		});
		
		/* 수강신청 버튼*/
		$('.custom__modal #submit').on('click', function() {
			let form = document.createElement("form");
			form.action = '${contextPath}/course/enrollCourse.do';
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
			$('.custom__modal').css('display','none');
		})
		</script>
	</body>
</html>
