<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>


<link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
<!-- Bootstrap CSS-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<div id="main__carousel" class="carousel slide" data-ride="carousel">
	<ol class="carousel-indicators">
		<li data-target="#main__carousel" data-slide-to="0" class="active"></li>
		<li data-target="#main__carousel" data-slide-to="1"></li>
		<li data-target="#main__carousel" data-slide-to="2"></li>
		<li data-target="#main__carousel" data-slide-to="3"></li>
	</ol>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="${contextPath}/resources/image/main_banner/1.jpg" class="d-block w-100" alt="전경">
		</div>
		<div class="carousel-item">
			<img src="${contextPath}/resources/image/main_banner/2.jpg" class="d-block w-100" alt="로비">
		</div>
		<div class="carousel-item">
			<img src="${contextPath}/resources/image/main_banner/3.jpg" class="d-block w-100" alt="휴식공간">
		</div>
		<div class="carousel-item">
			<img src="${contextPath}/resources/image/main_banner/4.jpg" class="d-block w-100" alt="복도">
		</div>
	</div>
</div>
<div id="text__wrapper">
	<div class="mx-auto" id="main__banner__text">
		<p id="text__1">
			<span class="big__text">IT분야 HRD 업무노하우</span>를 바탕으로<br>
			<span class="big__text">IT전문 교육기관</span>으로 신뢰받는 기업<br>
		</p>
		<p id="text__2">
			kt ds는 KT 정보시스템 구축 기술과 노하우를 기반으로 <br> 새로운 IT서비스를 창출하고 우수한 인재를
			양성하여 <br> 고객의 가치를 최고로 실현하는 IT서비스 전문기업입니다.
		</p>

	</div>
</div>
<div id="course__carousel__navigator">
</div>
<div id="course__carousel" class="carousel slide" data-ride="carousel">
	<div class="carousel-inner row w-100 mx-auto" role="listbox">
	</div>
</div>
<script>
	$(document).ready(function() {
		$("header").toggleClass("header__transparent");
		$("main").css("padding-top", 0); //main에는 패딩 없음.
			
	});
</script>
<script>
	function fn_createCarousel(month, coursesList) {
		// 캐러셀 생성
		var courseCarousel = $("#course__carousel > div");
		for(var idx = 0; idx < coursesList.length; idx++) {
			var cur = coursesList[idx];
			var div = $(`<div class="row-wrap carousel-item col-md-3 col-sm-4 col-xs-12" alt="slide\${idx}"></div>`);
		
			// 슬라이드 생성
			var img = $(`<img class="img-fluid mx-auto d-block" src="${contextPath}/resources/image/course_banner/\${cur['syllabusVO']['bannerImg']}"></img>`); 
			div.append(img);
			courseCarousel.append(div);
		}
		courseCarousel.find("div:first").toggleClass('active');
	}

	
	(function(){
		// 월별 모집 과정을 보여주기 위해 월별 버튼 생성
		var courseCarouselNav = $("#course__carousel__navigator");
		var ul = $('<ul class="grid row-wrap" id="month__button"></ul>');
		var coursesEachMonth = ${coursesJSON};
		Object.keys(coursesEachMonth).forEach(function(month) {
			ul.append(`<li>\${month}월</li>`);
		})
		courseCarouselNav.append(ul); 
		
		// 제일 가까운 월에 해당하는 강의들로 캐러셀 생성
		var curMonth = Object.keys(coursesEachMonth)[0];
		var curMonthCourses = coursesEachMonth[curMonth];
		fn_createCarousel(curMonth, curMonthCourses);
		
		$('#course__carousel .carousel-item').each(function(){
			var itemToClone = $(this);
			
			for (var i=1; i<=curMonthCourses.length ;i++) {
			  itemToClone = itemToClone.next();
			
			  // wrap around if at end of item collection
			  if (!itemToClone.length) {
			    itemToClone = $(this).siblings(':first');
			  }
			
			  // grab item, clone, add marker class, add to collection
			  itemToClone.children(':first-child').clone()
			    .addClass("cloneditem-"+(i))
			    .appendTo($(this));
			}
		});
	}());
	
	
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>

