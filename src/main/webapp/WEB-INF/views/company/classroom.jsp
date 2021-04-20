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
<title>교육장안내</title>
<link href="<c:url value='/resources/css/company.css?ver=1'/>"
	rel="stylesheet">

<!-- 모달창 스크립트 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

</head>
<body>
	<!-- 스크롤업 -->
	<div class="scrollTop" onclick="scrollToTop()"></div>

	<!-- 상단배너 -->
	<img id="classroom__banner"
		src="${contextPath}/resources/image/classroom_banner2.png">

	<div class="classroom__container">

		<!-- 강의장 조감도 -->
		<div class="classroom__content">
			<img id="classroom__content"
				src="${contextPath}/resources/image/classroom_content4.png">

			<!-- 휴게실 사진 영역 -->
			<span
				style="font-size: 30px; color: #4E4D4D; font-weight: 500; margin: 30px 0px 0px 0px;"><p>휴게실</p></span>
			<div class="restroom">
				<img id="restroom1"
					src="${contextPath}/resources/image/restroom1.png"> <img
					id="restroom2" src="${contextPath}/resources/image/restroom2.png">
				<img id="restroom3"
					src="${contextPath}/resources/image/restroom3.png">
			</div>

			<!-- 모달 휴게실 사진 영역 -->
			<div id="restroom1_1">
				<img src="${contextPath}/resources/image/restroom1.png"> <a
					class="modal_close_btn"><img
					src="${contextPath}/resources/image/close_button.png"></a>
			</div>
			<div id="restroom2_1">
				<img src="${contextPath}/resources/image/restroom2.png"> <a
					class="modal_close_btn"><img
					src="${contextPath}/resources/image/close_button.png"></a>
			</div>
			<div id="restroom3_1">
				<img src="${contextPath}/resources/image/restroom3.png"> <a
					class="modal_close_btn"><img
					src="${contextPath}/resources/image/close_button.png"></a>
			</div>

			<!-- 강의장 사진 영역 -->
			<span
				style="font-size: 30px; color: #4E4D4D; font-weight: 500; margin: 30px 0px 0px 0px;"><p>강의장</p></span>
			<div class="classroom">
				<img id="classroom1"
					src="${contextPath}/resources/image/classroom1.png"> <img
					id="classroom2" src="${contextPath}/resources/image/classroom2.png">
				<img id="classroom3"
					src="${contextPath}/resources/image/classroom3.png">
			</div>

			<!-- 모달 강의장 사진 영역 -->
			<div id="classroom1_1">
				<img src="${contextPath}/resources/image/classroom1.png"> <a
					class="modal_close_btn"><img
					src="${contextPath}/resources/image/close_button.png"></a>
			</div>
			<div id="classroom2_1">
				<img src="${contextPath}/resources/image/classroom2.png"> <a
					class="modal_close_btn"><img
					src="${contextPath}/resources/image/close_button.png"></a>
			</div>
			<div id="classroom3_1">
				<img src="${contextPath}/resources/image/classroom3.png"> <a
					class="modal_close_btn"><img
					src="${contextPath}/resources/image/close_button.png"></a>
			</div>


			<div class="classroom_bottom">
				<!-- 카카오맵 API -->
				<div id="map"></div>
				
				<!-- 오시는길 설명 -->
				<div class="classroom__contact">
					<img id="classroom__contact"
						src="${contextPath}/resources/image/classroom_contact4.png">
				</div>
			</div>
		</div>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b93d2a7de17cf2095fb7a7ce6f30699"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.4821859130098,
						127.00364910080704), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// 마커가 표시될 위치입니다 
			var markerPosition = new kakao.maps.LatLng(37.4821859130098,
					127.00364910080704);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				position : markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);
		</script>

		<!-- 모달 -->
		<script type="text/javascript">
			function modal(id) {
				var zIndex = 9999;
				var modal = $('#' + id);

				// 모달 div 뒤에 희끄무레한 레이어
				var bg = $('<div>').css({
					position : 'fixed',
					zIndex : zIndex,
					left : '0px',
					top : '0px',
					width : '100%',
					height : '100%',
					overflow : 'auto',
					// 레이어 색갈은 여기서 바꾸면 됨
					backgroundColor : 'rgba(0,0,0,0.4)'
				}).appendTo('body');

				modal
						.css(
								{
									position : 'fixed',
									boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

									// 시꺼먼 레이어 보다 한칸 위에 보이기
									zIndex : zIndex + 1,

									// div center 정렬
									top : '50%',
									left : '50%',
									transform : 'translate(-50%, -50%)',
									msTransform : 'translate(-50%, -50%)',
									webkitTransform : 'translate(-50%, -50%)',

									width : '55%',
									height : '77%',
								/* border-radius : '5px' */
								}).show()
						// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
						.find('.modal_close_btn').on('click', function() {
							bg.remove();
							modal.hide();
						});
			}

			$('#restroom1').on('click', function() {
				// 모달창 띄우기
				modal('restroom1_1');
			});
			$('#restroom2').on('click', function() {
				// 모달창 띄우기
				modal('restroom2_1');
			});
			$('#restroom3').on('click', function() {
				// 모달창 띄우기
				modal('restroom3_1');
			});

			$('#classroom1').on('click', function() {
				// 모달창 띄우기
				modal('classroom1_1');
			});
			$('#classroom2').on('click', function() {
				// 모달창 띄우기
				modal('classroom2_1');
			});
			$('#classroom3').on('click', function() {
				// 모달창 띄우기
				modal('classroom3_1');
			});
		</script>

		<!-- 스크롤업 -->
		<script type="text/javascript">
			window.addEventListener('scroll', function() {
				const scroll = document.querySelector('.scrollTop');
				scroll.classList.toggle("active", window.scrollY > 500)
			})

			function scrollToTop() {
				window.scrollTo({
					top : 0,
					behavior : 'smooth'
				})
			}
		</script>

	</div>
</body>
</html>