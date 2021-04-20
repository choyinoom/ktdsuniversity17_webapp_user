<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<%
request.setCharacterEncoding("UTF-8");
%>

<head>
<link href="<c:url value='/resources/css/viewNotice.css'/>" rel="stylesheet">
</head>


<body>
	<div class="grid mx-auto ai-center col-wrap" id="notice1__container">
		<section class="banner notice__banner">
			<h1>공지사항</h1>
		</section>
		<section class="grid mx-auto col-wrap contents">
			<div class="notice_container">
				<div class="notice_title">
					<ul>
						<li id="notice_important">${vo.important}</li>
						<li id="notice_title">${vo.title}</li>
					</ul>
					<ul>
						<li>조회수&nbsp;&nbsp;${vo.hits}</li>
						<li id="notice_joindate">등록일&nbsp;&nbsp;${vo.joinDate}</li>
					</ul>
				</div>
				<div class="addfile">첨부파일 : <a href="${contextPath}/fileDown.do?filename=${filevo.name}&articleId=${articleId }">&nbsp;${filevo.name }</a></div>
				<div class="notice_content">${vo.contents}</div>
				<div class="notice_listbutton"><input type="button" onclick="history.back()"
					style="width: 60px; height: 30px; font-weight: bold; cursor:pointer;" value="목록"></div>
			</div>
			
		</section>
	</div>

</body>
