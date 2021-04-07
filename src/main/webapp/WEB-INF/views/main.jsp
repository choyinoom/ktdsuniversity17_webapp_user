<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>

<script>
	$(document).ready(function() {
		$("header").toggleClass("header__transparent");
		$("main").css("padding-top", 0); //main에는 패딩 없음.
	});
</script>


<link rel="stylesheet" href="<c:url 
value='/resources/css/main.css'/>">

<div id="slider">
	<div id="slides">
		<!-- radio buttons to choose img -->
		<input type="radio" name="radio" id="radio1" checked/> 
		<input type="radio" name="radio" id="radio2"/> 
		<input type="radio" name="radio" id="radio3"/>

		<!--  images to slide -->
		<div class="slide s1">
			<img alt="ktds 야외"
				src="${contextPath}/resources/image/main_banner1.jpg">
		</div>
		<div class="slide">
			<img alt="교육장 내부1"
				src="${contextPath}/resources/image/main_banner2.jpg">
		</div>
		<div class="slide">
			<img alt="교육장 내부2"
				src="${contextPath}/resources/image/main_banner3.jpg">
		</div>

		<div id="slide__navigation">
			<span class="arrow prev">◀</span>
			<label for="radio1" class="slide__btn"></label>
			<label for="radio2" class="slide__btn"></label>
			<label for="radio3" class="slide__btn"></label>
			<span class="arrow next">▶</span>
		</div>


		<div id="text__wrapper">
			<div class="mx-auto" id="main__banner__text">
				<p id="text__1">
					<span class="big__text"><b>IT분야 HRD 업무노하우</b></span>를 바탕으로<br>
					<span class="big__text"><b>IT전문 교육기관</b></span>으로 신뢰받는 기업<br>
				</p>
				<p id="text__2">
					kt ds는 KT 정보시스템 구축 기술과 노하우를 기반으로 <br> 새로운 IT서비스를 창출하고 우수한 인재를
					양성하여 <br> 고객의 가치를 최고로 실현하는 IT서비스 전문기업입니다.
				</p>

			</div>
		</div>
	</div>
</div>



<script>
	var counter = 1;
	setInterval(function() {
		document.getElementById('radio' + counter).checked = true;
		counter++;
		if (counter > 3) {
			counter = 1;
		}
	}, 5000);
</script>

