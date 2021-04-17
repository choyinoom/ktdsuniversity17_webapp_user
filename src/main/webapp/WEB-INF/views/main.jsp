<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>


<link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
<!-- Add the slick-theme.css if you want default styling -->
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<section class="main__carousel">
	<div class="carousel-item">
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
</section>
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
<section class="grid mx-auto ai-center col-wrap" id="course__carousel__wrapper">
	<div class="grid mx-auto ai-center" id="course__carousel__navigator">
	</div>
	<div class="courses__carousel">
	</div>
</section>
<script type="text/javascript">
	$(document).ready(function() {
		$("header").toggleClass("header__transparent");
		$("main").css("padding-top", 0); //main에는 패딩 없음.
		
		$('.main__carousel').slick({
			 slidesToScroll: 1,
			 autoplay: true,
			 autoplaySpeed: 4000,
	      });
		
		$('.courses__carousel').slick({
			slidesToScroll: 1,
			slidesToShow:6,
			autoplay: true,
			autoplaySpeed: 2000,
			arrows: true
		});
		
		$('.button__wrapper').on('click', '.button', function() {
			// 월 버튼 클릭 시 기존 슬라이드 삭제
			var slideIndex = $('.card').length;
			while(slideIndex > 0) {
				$('.courses__carousel').slick('slickRemove',slideIndex - 1);
				slideIndex--;
			}
			
			// 버튼 클릭 시 border-bottom으로 표시
			var buttons = $('.button__wrapper .button');
			for(var i=0; i<buttons.length; i++) {
				$(buttons[i]).css('border-bottom', 'none');
			}
			$(this).css('border-bottom', '3px solid red');
						  
		});
		
		$('.courses__carousel').on('mouseover', '.card', function() {
			var slideTop = $(this).find('.slide__top');
			slideTop.css('background-color', 'red');
			slideTop.find('img').css('display', 'none');
			slideTop.find('span').css('color', 'white');
			$(this).css('transition', '2s linear');
		});
		
		$('.courses__carousel').on('mouseout', '.card', function() {
			var slideTop = $(this).find('.slide__top');
			slideTop.css('background-color', 'rgb(242, 242, 242)');
			slideTop.find('img').css('display', 'block');
			slideTop.find('span').css('color', 'black');
		});
		
	});
</script>
<script type="text/javascript">
	// 월별 모집 과정을 보여주기 위해 월별 버튼 생성
	var courseCarouselNav = $("#course__carousel__navigator");
	var ul = $('<ul class="grid row-wrap button__wrapper"></ul>');
	var coursesEachMonth = ${coursesJSON};
	Object.keys(coursesEachMonth).forEach(function(month) {
		ul.append(`<li><a class="button" href="javascript:fn_createCarousel(\${month})">\${month}월</a></li>`);
	})
	courseCarouselNav.append(ul);
	courseCarouselNav.find('ul .button:first').css('border-bottom', '3px solid red');
	
	// 제일 가까운 월에 해당하는 강의들로 캐러셀 생성
	var curMonth = Object.keys(coursesEachMonth)[0];
	fn_createCarousel(curMonth);

	function fn_createCarousel(month) {	
		var coursesEachMonth = ${coursesJSON};
		var coursesList = coursesEachMonth[month];
		// 캐러셀 생성
		var courseCarousel = $(".courses__carousel");
		for(var idx = 0; idx < coursesList.length; idx++) {
			var cur = coursesList[idx];
			var div = $(`<div class="card"></div>`);
		
			// 슬라이드 생성
			var slide__top = $('<div class="grid ai-center slide__top"></div>')
			var a = $(`<a href="${contextPath}/course/viewCourse.do?courseId=\${cur['id']}"></a>`)
			var img = $(`<img src="${contextPath}/resources/image/course_banner/\${cur['syllabusVO']['bannerImg']}"></img>`)
			var span = $(`<span>\${cur["syllabusVO"]["name"]}</span>`)
			slide__top.append(img);
			slide__top.append(span);
			
			var slide__bottom = $('<div class="slide__bottom"></div>')
			span = $(`<span>교육기간 : \${cur['startDate']} ~ \${cur['endDate']}</span>`);
			slide__bottom.append(span);
			
			div.append(a);
			a.append(slide__top);
			a.append(slide__bottom);
			
			fn_addSlide(div);
		}
	}
	
	function fn_addSlide(div) {
		$(document).ready(function() {
			$('.courses__carousel').slick('slickAdd',div);
		})
	}
</script>

<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
