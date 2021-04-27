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
<title>컨소시엄소개</title>
<link href="<c:url value='/resources/css/company.css'/>"
	rel="stylesheet">
</head>
<body>

<!-- 스크롤업 -->
	 <div class="scrollTop" onclick="scrollToTop()"></div>
	 
	<div class="consortium__container">
		<section class="banner" id="consortium__banner">
				<span style="position:relative; top:-2em;"><h1>정부 지원 무료 교육<br>국가인적자원개발 컨소시엄</h1></span>
				<span style="position:relative; top:-8em; color: #fff;">채용과 교육의 기회를 동시에 제공합니다.</span>
		</section>
		<div class="consortium__content">
			<img id="consortium__content"
				src="${contextPath}/resources/image/consortium_content.png">
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