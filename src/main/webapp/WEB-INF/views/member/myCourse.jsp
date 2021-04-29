<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<link href="<c:url value='/resources/css/myCourse.css'/>" rel="stylesheet">
<link href="<c:url value='/resources/css/completionDcmt.css'/>" rel="stylesheet">


<div class="grid mx-auto col-wrap ai-center" id="mycourse__container">
	<section class="banner" id="mycourse__banner">
		<h1>마이페이지</h1>
	</section>
	<div class="contents">
		<div class="menu">
			<button class="menu_button"
				onclick="location.href='${contextPath}/member/myPage.do'">회원정보</button>
			<button class="menu_button"
				onclick="location.href='${contextPath}/member/myPage.do?pageFlag=C'">수강현황</button>
		</div>
		<table id="my__courses" style="text-align:center;">
			<tr>
				<th width="30%">강좌명</th>
				<th width="30%">교육기간</th>
				<th width="5%">강의장</th>
				<th width="15%">상태</th>
				<th width="10%">수료증</th>
				<th width="10%" ><span style="font-size: 22px;">🧙‍</span></th>
			</tr>
			<c:forEach var="detail" items="${enrollmentDetailList}">
				<tr>
					<td style="text-align:left;" data-id=${detail.courseVO.id} data-type=${detail.syllabusVO.type}>${detail.syllabusVO.name}</td>
					<td><span id="crsStartDate">${detail.courseVO.startDate}</span> ~ ${detail.courseVO.endDate}<br>${detail.syllabusVO.time}시간</td>
					<td>${detail.courseVO.classroom}</td>
					<td><span id="enrdStat">${detail.stat}</span></td>
					<c:if test="${detail.stat eq '수료'}">
						<td data-id=${detail.id} data-complete=${detail.completeDate}>
							<img src="${contextPath}/resources/image/disk.png"></img>
						</td>
					</c:if>
					<c:if test="${detail.stat ne '수료'}">
						<td></td>
					</c:if>
					<td>
						<button class='td_button'>신청취소</button>
						<button class='goForm' data-id=${detail.satisfactionVO.id} data-state=${detail.satisfactionVO.state} onclick="window.open('${detail.satisfactionVO.url}')">설문조사</button>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div class="custom__modal" id="print">
		<div class="dimmed"></div>
		<div class="completionButton">
		</div>
		<section id="certification">
			<div class = "grid row-wrap" id="buttons">
				<button id="submit" onclick="window.print()">출력</button>
				<button id="cancle">취소</button>
			</div>
			<div class="completionPrint">
				<img id="completionImg" alt="" src="${contextPath}/resources/image/completion8.jpg">
				<div class="completionText">
					<div class="completion_serial">ktds <span id="type"></span>과정 제 <span id="id"></span>호</div>
					<div class="completion_main">수료증</div>
					<div class="completion_info">
						<ul>
							<li><span id="compl_name">성</span>명 : <span id="name1"></span></li>
							<li><span id="compl_companyName">회사</span>명 : <span id="name2"></span></li>
							<li><span id="compl_slb_name">훈련과정</span>명 : <span id="name3"></span></li>
							<li><span id="compl_crs_date">훈련기</span>간 : <span id="date"></span>
						</ul>
					</div>
					<div class="completion_content">위 사람은 상기 국가인적자원개발 컨소시엄 과정을
						수료하였으므로 이 증서를 수여합니다.</div>
					<div class="completion_date"><span id="complete"></span></div>
					<div id="completion_logo">
						<img src="${contextPath}/resources/image/completionLogo3.png">
					</div>
					<div class="completion_ceo">
						대표이사 <span style="font-size: 28px;">우 정 민</span>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div class="custom__modal" id="drop">
		<div class="dimmed"></div>
		<section id="course__drop">
			<div id="content">
				<h4>과정 수강을 취소하시겠습니까?</h4>
				<hr>
				<p id="name"></p>
				<p id="date"></p>
				<div class = "grid row-wrap" id="buttons">
					<button id="submit">예</button>
					<button id="cancle">아니오</button>
				</div>
			</div>
		</section>
	</div>
</div>
<script type="text/javascript">

	$(document).ready(function () {
		$(".menu .menu_button:nth-child(2)").addClass("visited");

		$(".menu .menu_button").on("click", function () {
			$(this).sibling().removeClass("visited");
			$(this).addClass("visited");
		});

		var tdButtons = $('#my__courses .td_button');
		if (tdButtons !== undefined) { // 수강신청 내역이 없을 경우에 실행하지 않음
			const today = new Date();
			for (var i = 0; i < tdButtons.length; i++) {
				var thisBtn = $(tdButtons[i]);
				const crsStartDate = Date.parse(thisBtn.parent().siblings().find("#crsStartDate").text());
				const enrdStat = thisBtn.parent().siblings().find("#enrdStat").text();
				if (today < crsStartDate && (enrdStat === '승인' || enrdStat === '신청'))
					thisBtn.css('display', 'block');

			}
		}

		var goForms = $('#my__courses .goForm');
		if(goForms !== undefined) {
			for(var i = 0; i < goForms.length; i++) {
				var goForm = $(goForms[i]);
				const formId = goForm.data('id');
				const stat = goForm.data('state');
				const enrdStat = goForm.parent().siblings().find("#enrdStat").text();
				if(formId !== undefined && stat === '활성' && enrdStat === '수료') {
					goForm.css('display', 'block');
				}
			}
		}

		/* 수료증 출력 모달 */
		$('#my__courses').on('click', 'img', function () {
			$('div[id="print"]').css('display', 'flex');
			
			const row = $(this).closest("tr").find("td");
			let completionInfo = {
				enrollmentId: $(row[4]).data('id'),
				type: $(row[0]).data('type'),
				userName: '${member.name}',
				companyName: '${member.companyName}',
				courseName: row[0].textContent,
				date: row[1].textContent.substr(0, 23),
				complete: $(row[4]).data('complete')
			};

			
			$('.completionPrint span[id="type"]').text(completionInfo.type);
			$('.completionPrint span[id="id"]').text(completionInfo.enrollmentId);
			$('.completionPrint span[id="name1"]').text(completionInfo.userName);
			$('.completionPrint span[id="name2"]').text(completionInfo.companyName);
			$('.completionPrint span[id="name3"]').text(completionInfo.courseName);
			$('.completionPrint span[id="date"]').text(completionInfo.date);
			$('.completionPrint span[id="complete"]').text(completionInfo.complete);
		});

		var course = undefined;
		/* 수강 취소 모달 */
		$('#my__courses').on('click', '.td_button', function() {
			var row = $(this).closest("tr").find("td");
			course = {
				id: $(row[0]).data('id'),
				name: row[0].textContent, 
				date: row[1].textContent.substr(0, 23)
			}

			$('#name').text('과정명: ' + course.name); 
			$('#date').text('일시: ' + course.date.substr(0,23));
				
			$('div[id="drop"]').css('display','flex');
		});

		$('div[id="drop"] #submit').on('click', function() {
			let form = document.createElement("form");
			form.action = '${contextPath}/course/dropCourse.do';
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
		
	})
</script>