<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:set var="contextPath" value="${pageContext.request.contextPath}" />

		<% request.setCharacterEncoding("UTF-8"); %>


			<link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>">
			<!-- Add the slick-theme.css if you want default styling -->
			<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
			<link rel="stylesheet" type="text/css"
				href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />

		<!-- The Modal -->
		<div id="mainModal" class="modal" style="background-image : url('${contextPath}/resources/image/modal_bg.jpg');">
	     	<div class="modal_content">
	                <p><b><span style="font-size: 22pt;">2022년 국가인적자원개발</span></b></p>
	                <p><b><span style="font-size: 22pt;">컨소시엄 수요조사 안내</span></b></p>
	                <p><br/></p>
	                <p><span class="modal_text">2022년 국가인적자원 개발</span></p>
	                <p><span class="modal_text">컨소시엄 교육과정 개설을 위하여</span></p>
	                <p><span class="modal_text">수요조사를 진행하고자 합니다.</span></p>
	                <p><span class="modal_text"><br /></span></p>
	                <p><span class="modal_text">더 좋은 과정을 만들 수 있도록</span></p>
	                <p><span class="modal_text">수요조사에 응답하여 주시면 감사하겠습니다.</span></p>
	                <p style="padding-top: 22px; font-size: 10pt;"><span>조사기간 : 2021-05-25 ~ 2021-06-25</span></p>
	                <button type="button" class="modal_button"><a href="https://forms.gle/r33T5Fksozpw9ZbR7" target="_blank">조사 참여하기</a></button>
 	          </div>
 	                     
			<div class="modal_footer">
				<p style="padding-top: 20px;">
					<span id="modal_today_close" style="cursor: pointer; float : left;"><img src="${contextPath}/resources/image/modal_x.png"  style="margin-right: 5px; width: 20px;
   					 object-fit: contain; margin-right: 5px;  position: relative; top: 3px;">오늘 하루 열지 않기</span> 						
				     <span id="modal_close" style="cursor:pointer; float : right;" onClick="close_pop();" data-dismiss="modal">닫기</span>
				</p>
			</div>
    	</div>
        <!--End Modal-->
				
			<section class="main__carousel">
				<div class="carousel-item">
					<img src="${contextPath}/resources/image/main_banner/1.png" alt="전경">
				</div>
				<div class="carousel-item">
					<img src="${contextPath}/resources/image/main_banner/2.png" alt="로비">
				</div>
				<div class="carousel-item">
					<img src="${contextPath}/resources/image/main_banner/3.png" alt="휴식공간">
				</div>
				<div class="carousel-item">
					<img src="${contextPath}/resources/image/main_banner/4.png" alt="복도">
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
					<button style="cursor: pointer;" onclick="location.href='${contextpath}/edu/company/companyInfo.do'" type="button">자세히 보기</button>
				</div>

			</div>
			<section class="grid mx-auto row-wrap" id="quickview__wrapper">
				<div class="grid col-wrap" id="course__quickview">
					<div class="grid row-wrap" id="nav__wrapper">
						<div class="grid" id="course__quickview__navigator">
						</div>
						<a class="grid" href="${contextPath}/course/listCourses.do">
							<span>전체보기</span>
						</a>
					</div>
					<div class="grid course__cards">
					</div>
					<button id="more">더보기</button>
				</div>
				<nav class="grid col-wrap" id="article__quickview">
					<ul>
						<li>
							<a class="grid" href="${contextPath}/customer/faq.do">
								<img src="${contextPath}/resources/image/059-slack.png" />
								<span>자주 묻는 질문</span>
							</a>
						</li>
						<li>
							<a class="grid" href="${contextPath}/customer/listNotices.do?pageNo=1">
								<img src="${contextPath}/resources/image/028-voice.png" />
								<span>공지사항</span>
							</a>
						</li>
						<li>
							<a class="grid" href="${contextPath}/company/classroom.do">
								<img src="${contextPath}/resources/image/008-maps.png" />
								<span>오시는 길</span>
							</a>
						</li>
					</ul>
				</nav>
			</section>
			
				<script type="text/javascript"
				src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
			<script type="text/javascript">
				function fn_createCard(month) {
					const coursesEachMonth = ${ coursesJSON };
					const coursesList = coursesEachMonth[month];
					const backgroundMapper = {
						//crs_category_id : file
						100: 'ff7539',
						101: 'c30000',
						102: 'ffc246',
						120: 'c56200',
						121: '00b248',
						122: '00b0ff',
						123: '7200ca',
						141: 'ff5983',
						143: '9b0000',
						144: 'ff5131',
						140: 'aa00ff',
						142: 'bb002f',
						'undefined': 'ff9100'
					};

					var cards = $(".course__cards");
					for (var idx = 0; idx < coursesList.length; idx++) {
						var cur = coursesList[idx];

						// 슬라이드 생성
						var column = $('<div class="column"></div>');
						var card = $('<div class="card"></div>');

						if (idx >= 6) {
							card.toggleClass('hidden');
						}

						
						// card-front
						var cardFront = $(`<a class="card__front" href="${contextPath}/course/viewCourse.do?courseId=\${cur['id']}"></a>`);
						var cardImage = $('<div class="card__image"></div>');
						const backgroundImg = '/server/resources/image/course_card/' + backgroundMapper[cur['syllabusVO']['crsCategoryId'] || 'undefined'] + '.jpg';
						cardImage.css('background-image', `url(\${backgroundImg})`);
						var img = $(`<img src="/server/resources/image/\${cur['syllabusVO']['id']}/\${cur['syllabusVO']['bannerImg']}"></img>`)

						cardImage.append(img);

						var cardContents = $('<div class="card__contents"></div>');

						var courseTitle = $(`<div class="course__title">\${cur["syllabusVO"]["name"]}</div>`);
						var courseDate = $(`<div class="course__date">\${cur['startDate']} ~ \${cur['endDate']}</div>`);

						cardContents.append(courseTitle);
						cardContents.append(courseDate);
						
						cardFront.addClass("card__front");
						cardFront.append(cardImage);
						cardFront.append(cardContents);
						
						
						// card-back
						const cardBack = $(`<div class="card__back"></div>`);
						const a = $(`<a href="${contextPath}/course/viewCourse.do?courseId=\${cur['id']}"></a>`);
						const p = $(`<p class="course__title">\${cur["syllabusVO"]["name"]}</p>`)
						a.append(p);
						cardBack.append(a);
						
						card.append(cardFront);
						card.append(cardBack);
						
						column.append(card);
						cards.append(column);
					}
				}

				function fn_toggleHidden() {
					var allHiddenCards = $('.course__cards .hidden'); 	// 숨겨져 있는 카드들
					if (allHiddenCards.length === 0) { 	// 숨겨져 있는 카드가 없음.
						$('#more').addClass('hidden');
					} else {
						var countMin = Math.min(allHiddenCards.length, 6);
						allHiddenCards.each(function (index) {
							if (index < countMin)
								$(this).removeClass('hidden');	// 카드 숨김 해제
						});
						allHiddenCards = $('.course__cards .hidden');
						if (allHiddenCards.length === 0) { // 더보기 할 카드가 없음.
							$('#more').addClass('hidden');
						} else {
							$('#more').removeClass('hidden');
						}
					}
				}
			</script>
			<script type="text/javascript">
				$(document).ready(function () {
					$("header").toggleClass("header__transparent");
					$("main").css("padding-top", 0); //main에는 패딩 없음.

					$('.main__carousel').slick({
						slidesToScroll: 1,
						autoplay: true,
						autoplaySpeed: 4000,
					});


					$('#course__quickview__navigator .button').click(function (e) {
						// 월 버튼 클릭 시 기존 슬라이드 삭제
						e.preventDefault();
						var cards = $('.course__cards');
						cards.empty();

						var curMonth = $(this).text().substr(0, $(this).text().length - 1);
						fn_createCard(curMonth);
						var allHiddenCards = cards.find('.hidden'); 	// 숨겨져 있는 카드들
						if (allHiddenCards.length === 0) { 	// 숨겨져 있는 카드가 없음.
							$('#more').addClass('hidden');
						} else {
							$('#more').removeClass('hidden');
						}

						// 버튼 클릭 시 border-bottom으로 표시
						var buttons = $('.button__wrapper .button');
						for (var i = 0; i < buttons.length; i++) {
							$(buttons[i]).css('border-bottom', 'none');
						}
						$(this).css('border-bottom', '3px solid red');

					});

					$('#more').click(function (e) {
						// 더보기 버튼을 클릭
						fn_toggleHidden();
					})

				});
				
			</script>
			<script type="text/javascript">
				// 월별 모집 과정을 보여주기 위해 월별 버튼 생성
				var courseNav = $("#course__quickview__navigator");
				var ul = $('<ul class="grid row-wrap button__wrapper"></ul>');
				var coursesEachMonth = ${ coursesJSON };
				Object.keys(coursesEachMonth).forEach(function (month) {
					ul.append(`<li><a class="button" href="javascript:fn_createCard(\${month})">\${month}월</a></li>`);
				})
				courseNav.append(ul);
				courseNav.find('ul .button:first').css('border-bottom', '3px solid red');

				// 다가오는 월에 해당하는 강의로 카드 생성
				var curMonth = Object.keys(coursesEachMonth)[0];

				fn_createCard(curMonth);
				var allHiddenCards = $('.hidden');
				if (allHiddenCards.length === 0) // 더보기 할 카드가 있음.
					$("#more").addClass("hidden");
			</script>
			
			<!-- 모달창 -->
			<script type="text/javascript">
			 jQuery(document).ready(function() {			 
				 if( document.cookie != "" ){
					 $('#mainModal').hide();	      
				 } else {
					 $('#mainModal').show();	     
				 }
	        });
			 
	        //팝업 Close 기능
	        function close_pop(flag) {
	             $('#mainModal').hide();
	        };
	        
       		// 쿠키 생성
			function setCookie(name, value, expiredays){
				var today = new Date();
				console.log(today.getDate())
				today.setDate(today.getDate() + expiredays) // 현재시간에 하루를 더함
				document.cookie = name + '=' + escape(value) + '; expires=' + today.toGMTString();
			} 
	       
			// 쿠키 가져오기
			function getCookie(name) {
				var cookie = document.cookie;
				if (document.cookie != "") {
					var cookie_array = cookie.split("; ");
					console.log(cookie_array)
					for ( var index in cookie_array) {
						var cookie_name = cookie_array[index].split("=");
						if (cookie_name[0] == "mycookie") {
							return cookie_name[1];
						}
					}
				}
				return;
			}
	        
			// 오늘 하루 안보기 버튼 클릭하고 난 후
			$("#modal_today_close").click(function() {
				setCookie("mycookie", 'popupEnd', 1);
			 	var checkCookie = getCookie("mycookie");
				
				if(checkCookie == 'popupEnd') {
					$("#mainModal").hide();
				} else {
					$("#mainModal").show();
				}  
				
				})
				
			</script>
			
			
			        






			
