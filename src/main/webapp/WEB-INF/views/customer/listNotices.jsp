<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%> 
 

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="<c:url value='/resources/css/listNotices.css'/>" rel="stylesheet">

<div class="grid mx-auto ai-center col-wrap" id="notice1__container">
	<section class="banner notice__banner">
		<h1>공지사항</h1>
	</section>
	<section class="grid mx-auto col-wrap contents">
		<div class="grid search">
			<img src="${contextPath}/resources/image/loupe.png" alt="검색하기">
			<div class="search__in">
				<input type='text' name='search'>
			</div>
			<input type='submit' class ='search__btn' value="검색">
		</div>
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
					<c:when test="${articlesList.size() > all - 10 * (pageNo - 1)}">
						<c:set var="index" value = "${articlesList.size()}"/>
					</c:when> 
					<c:otherwise>
						<c:set var="index" value = "${all - 10 * (pageNo - 1)}"/>
					</c:otherwise>
				</c:choose>
				<c:forEach var="notice" items="${articlesList}" varStatus="stat">
					<tr align="center">
						<td width="20%">
							<c:choose >
								<c:when test="${notice.important != null}">
									<span class="notice__important">공지</span>
								</c:when>
								<c:otherwise>
									${index}
								</c:otherwise>
							</c:choose>
						</td>
						<td class ="row__title" width="60%">
							<a href="${contextPath}/customer/viewNotice.do?articleId=${notice.id}">${notice.title}</a>
							<c:if test="${fn:contains(notice.file, 'T')}">
								<span class="material-icons file__icon">
									save
								</span>
							</c:if>
						</td>
						<td width="20%">${notice.joinDate}</td>
					</tr>
					<c:set var="index" value="${index - 1}"/>
				</c:forEach>
			</tbody>
		</table>
		<div class="Pagination contents">
			<ul class = "grid mx-auto pagination">
				<li class="prev"><a><</a></li>
				<li class="next"><a>></a></li>
			</ul>
		</div>
</section>
</div>
<script type="text/javascript">
 	function fn_paginationCtrl(page) { // 페이지 이동
		$.ajax({
			url: "${contextPath}/ajax/customer/listNotices",
			method: "GET",
			data: {"pageNo" : page},
			success: function(result) {
				const articlesList = result.articlesList;
				var index = Math.max(articlesList.length, ${all} - 10 * (page - 1));
				var tableBody = $("#notice__list tbody");
				tableBody.empty(); // 테이블 비우기
				
				result.articlesList.forEach(function(article) {
					var tr = $('<tr align="center"></tr>');
					var td = null;
					// 번호 컬럼
					if (article['important'] === '공지') {
						tr.append('<td width="20%"><span class="notice__important">공지</span></td>');
					} else {
						tr.append(`<td>\${index}</td>`);
					} 
					index = index - 1;
					// 제목 컬럼
					td = $(`<td width="60%" class="row__title">
							<a href="${contextPath}/customer/viewNotice.do?articleId=${article.id}">
							\${article.title}
							</a></td>`);
					if (article['file'] === 'T') { // 첨부파일 있을 경우 아이콘 표시
						td.append('<span class="material-icons file__icon">save</span>');
					}
					tr.append(td);
					// 등록일 컬럼
					td = $(`<td width="20%">\${article['joinDate']}</td>`);
					tr.append(td);
					tableBody.append(tr);
				})
				history.pushState('', '공지사항', 'listNotices.do?pageNo=' + page);
			},
			error: function(xhr, status, error) {
				console.log(error);
			}
		});
 	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		// 페이지 버튼 최초 생성
		var next = $(".pagination .next");
		var totalPages = Math.min(10, ${totalPages});
		for(var i = 1; i <= totalPages; i++) {
			var li = $('<li></li>');
			var a = $(`<a onclick="javascript:fn_paginationCtrl(\${i})">\${i}<a/>`);
			li.append(a);
			next.before(li);
		}
	})
</script>
