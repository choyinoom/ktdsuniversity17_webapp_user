<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사소개</title>
<link href="<c:url value='/resources/css/company.css'/>"
	rel="stylesheet">
</head>
<body>

<!-- 스크롤업 -->
	 <div class="scrollTop" onclick="scrollToTop()"></div>
	 
	<div class="company__container">
		<div class="company__content">
			<img id="company_intro"	src="${contextPath}/resources/image/company_intro.png">
			<img id="company__content" src="${contextPath}/resources/image/company_content.png">
			<img id="company__history" src="${contextPath}/resources/image/company_history.png">
		</div>
	</div>
	<!-- 스크롤업 -->
		<script type="text/javascript">
		    window.addEventListener('scroll', function(){
		        const scroll = document.querySelector('.scrollTop');
		        scroll.classList.toggle("active" , window.scrollY > 500)
		    })
		
		    function scrollToTop(){
		        window.scrollTo({
		            top: 0,
		            behavior: 'smooth'
		        })
		    }
   		 </script>
	
</body>
</html>