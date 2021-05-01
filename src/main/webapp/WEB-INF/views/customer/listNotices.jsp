<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>


<%String searchType=request.getParameter("searchType"); String
	searchText=request.getParameter("searchText"); %>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="<c:url value='/resources/css/listNotices.css'/>" rel="stylesheet">

<div class="grid mx-auto ai-center col-wrap" id="notice1__container">
	<section class="banner notice__banner">
		<h1>공지사항</h1>
	</section>
	<section class="grid mx-auto col-wrap contents">
		<div class="grid filter">
			<div id="select">
				<select id="pagingSize" onchange="fn_applyPagingSize()">
					<option value=10 selected>10개씩 보기</option>
					<option value=20>20개씩 보기</option>
					<option value=50>50개씩 보기</option>
					<option value=100>100개씩 보기</option>
				</select>
			</div>
			<form method="get" onsubmit="fn_getNoticesList(); return false;" id="searchFrm">
				<!-- 검색 값이 있냐 없냐에 따라 값 띄우는거 설정 -->
				<div class="grid search">
					<img src="${contextPath}/resources/image/loupe.png" alt="검색하기">

					<div class="search__in">
						<c:choose>
							<c:when test="${searchText != null }">
								<input type="text" name="searchText" id="searchText" value="${searchText }">
							</c:when>
							<c:otherwise>
								<input type="text" name="searchText" id="searchText">
							</c:otherwise>
						</c:choose>
					</div>
					<input type="submit" class='search__btn' value="검색">
				</div>
			</form>
		</div>
		<p class='search__result'><b><span id="keyword">${searchText}</span></b>에 대한 검색결과: <span id=count>${noticesCnt}</span> 건</p>
		<table id="notice__list">
			<thead>
				<tr align="center">
					<th width="20%">번호</th>
					<th width="60%">제목</th>
					<th width="20%">등록일</th>
				</tr>
			</thead>
			<tbody>
				<!-- 공지사항 번호 인덱스 -->
				<c:choose>
					<c:when test="${articlesList.size() > noticesCnt - 10 * (pageNo - 1)}">
						<c:set var="index" value="${articlesList.size()}" />
					</c:when>
					<c:otherwise>
						<c:set var="index" value="${noticesCnt - 10 * (pageNo - 1)}" />
					</c:otherwise>
				</c:choose>
				<c:forEach var="notice" items="${articlesList}" varStatus="stat">
					<tr align="center">
						<td width="20%">
							<c:choose>
								<c:when test="${notice.important != null}">
									<span class="notice__important">공지</span>
								</c:when>
								<c:otherwise>
									${index}
								</c:otherwise>
							</c:choose>
						</td>
						<td class="row__title" width="60%">
							<a
								href="${contextPath}/customer/viewNotice.do?articleId=${notice.id}">${notice.title}</a>
							<c:if test="${fn:contains(notice.file, 'T')}">
								<img src="${contextPath}/resources/image/disk.png">
							</c:if>
						</td>
						<td width="20%">${notice.joinDate}</td>
					</tr>
					<c:set var="index" value="${index - 1}" />
				</c:forEach>
			</tbody>
		</table>
		<div class="Pagination">
			<ul class="grid mx-auto pagination" id="pagination">
			</ul>
		</div>
	</section>
</div>
<script type="text/javascript">
	function fn_sendRequest(pageNo) {
		const pagingSize = Number(document.getElementById('pagingSize').value);
		const searchText = document.getElementById('searchText').value;

		return new Promise(function (resolve, reject) {
			$.ajax({
				url: "${contextPath}/ajax/customer/listNotices",
				method: "GET",
				data: {
					"pageNo": pageNo,
					"pagingSize": pagingSize,
					"searchText": searchText
				},
				success: function (data) { resolve(data); },
				error: function (error) { reject(error); }
			});
		})
	}


	function fn_getPage(pageNo) {	// 페이지 목록 갱신
		const pagingSize = Number(document.getElementById('pagingSize').value);
		fn_sendRequest(pageNo)
			.then((response) => fn_drawingTable(response, pageNo, pagingSize))
			.catch((error) => { console.log(error); });
		const searchText = document.getElementById('searchText').value;
		if (searchText === '') {
			history.pushState('', '공지사항', "listNotices.do?pageNo=" + pageNo + "&pagingSize=" + pagingSize);
		} else {
			history.pushState('', '공지사항', "listNotices.do?pageNo=" + pageNo + "&pagingSize=" + pagingSize + "&searchText=" + searchText);
		}
	}

	function fn_paginationCtrl(response, pagingSize) { // 페이지네이션 설정 초기화
		const noticesCnt = response.noticesCnt;
		const totalPages = Math.ceil(noticesCnt / pagingSize);
		$("#pagination").twbsPagination('destroy');
		$("#pagination").twbsPagination({
			totalPages: totalPages, // 전체 페이지 수
			visiblePages: Math.min(5, totalPages),
			prev: '<',
			next: '>',
			onPageClick: function (event, pageNo) {
				fn_getPage(pageNo);
			}
		});
	}


	function fn_getNoticesList() { // 검색
		const pageNo = 1;	// 검색 시 무조건 1페이지 반환
		const pagingSize = Number(document.getElementById('pagingSize').value);
		const searchText = document.getElementById('searchText').value;
		
		$(".search__result").css('display', 'block');
		$("span[id='keyword']").text(searchText);
		
		fn_sendRequest(pageNo)
			.then((response) => {
				fn_drawingTable(response, pageNo, pagingSize);
				fn_paginationCtrl(response, pagingSize);
			})
			.catch((error) => { console.log(error) });
	}

	function fn_drawingTable(response, pageNo, pagingSize) { // 새로운 데이터로 테이블 새로 그리기
		const articlesList = response.articlesList;
		const noticesCnt = response.noticesCnt;
		var index = Math.max(articlesList.length, noticesCnt -  pagingSize * (pageNo - 1));
		/* ###에 대한 검색결과: 몇 건*/
		$("span[id='count']").text(noticesCnt);
		
		var tableBody = $("#notice__list tbody");
		tableBody.empty(); // 테이블 비우기

		articlesList.forEach(function (article) {
			let tr = $('<tr align="center"></tr>');
			let td = null;
			// 번호 컬럼
			if (article['important'] === '공지') {
				tr.append('<td width="20%"><span class="notice__important">공지</span></td>');
			} else {
				tr.append(`<td>\${index}</td>`);
			}
			index = index - 1;
			// 제목 컬럼
			td = $(`<td width="60%" class="row__title" align="center">
				<a href="${contextPath}/customer/viewNotice.do?articleId=\${article.id}">
				\${article.title}
				</a></td>`);
			if (article['file'] === 'T') { // 첨부파일 있을 경우 아이콘 표시
				td.append('<img src="${contextPath}/resources/image/disk.png">');
			}
			if (isNewNotice(article['joinDate'])) { // 등록한 지 일주일 안 지난 공지사항은 new 표시
				td.append('<button id="new">new</button>');
			}
			tr.append(td);
			// 등록일 컬럼
			td = $(`<td width="20%">\${article['joinDate']}</td>`);
			tr.append(td);
			tableBody.append(tr);
		})
	}


	function fn_applyPagingSize() { // 페이징사이즈 적용하기
		// 1. 페이징사이즈에 맞춰 리스트 새로 가져온다.
		// 2. 페이지네이션 재설정한다.
		const pageNo = 1;	//페이징사이즈 적용시 무조건 1페이지 반환
		const pagingSize = Number(document.getElementById('pagingSize').value);
		fn_sendRequest(pageNo)
			.then((response) => {
				fn_drawingTable(response, pageNo,  pagingSize);
				fn_paginationCtrl(response, pagingSize);
			})
			.catch((error) => { console.log(error) });
	}

	function isNewNotice(arg) {
		// 게시된 지 일주일이 지나지 않은 공지 제목 옆에는 'new'를 띄운다.
		const today = new Date();
		const artJoinDate = arg.split("-");
		const joinDate = new Date(artJoinDate[0], Number(artJoinDate[1])-1, artJoinDate[2]);
		
		// Do the math.
		var millisecondsPerDay = 1000 * 60 * 60 * 24;
		var millisBetween = today.getTime() - joinDate.getTime();
		var days = millisBetween / millisecondsPerDay;

		if (days < 7) {
			return true;
		} else {
			return false;
		}
	}
</script>
<script type="text/javascript">
	$(document).ready(function () {
		// 페이지 버튼 최초 생성
		const ROWS = 10;
		const totalPages = Math.ceil(${ noticesCnt } / ROWS);
		$("#pagination").twbsPagination({
			totalPages: totalPages, // 전체 페이지 수
			visiblePages: Math.min(5, totalPages),
			prev: '<',
			next: '>',
			onPageClick: function (event, pageNo) {
				fn_getPage(pageNo);
			}
		});

		const searchText = '${searchText}';
		const noticesCnt = ${noticesCnt};
		if (searchText.length > 0) {
			$(".search__result").css('display', 'block');
			$("span[id='keyword']").text(searchText);
			
			if(noticesCnt > 0) {
				$("span[id='count']").text(noticesCnt);
			} else {
				$("span[id='count']").text('0');
			}
		}
	})
</script>
<script src="${contextPath}/resources/js/jquery.twbsPagination.js" type="text/javascript"></script>