<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<link rel="stylesheet"
	href="<c:url 
value='/resources/css/footer.css'/>">


<div class="grid mx-auto ai-center" id="footer__container">
	<div class='footer__contents grid' id="left">
		<h3>(주)케이티디에스</h3>
		<p>
			대표이사: 우정민<br> 사업자등록번호: 117-81-655799<br> 통신판매 신고번호 2013-서울서초-0039<br> 주소 : 서울특별시
			서초구 효령로176 <br> copyright(c) 2018 kt ds All Rights Reserved.
		</p>
	</div>

	<div class='footer__contents grid' id="right">
		<h3>kt ds University</h3>
		<p>
			<a id="noEmail" style="cursor:pointer;">이메일 무단수집 거부</a>
			<a href="${contextPath}/member/privacy.do">개인정보처리방침</a>
			<a href="${contextPath}/company/classroom.do">오시는길</a>
	</div>

</div>


<div id="noEmail_modal" style="display : none; background: #fefefe; width: 100px;">
<div style="display:flex; justify-content: center; padding-top : 30px;">
<img style="width : 50px; height:50px;"src="${contextPath}/resources/image/email.png">
<h2>&nbsp;&nbsp;&nbsp;이메일 무단수집 거부</h2></div>
<div style="display:flex; justify-content: center; padding : 10px 50px 0px 50px;">본 사이트에 게재된 모든 전자메일 (E-MAIL) 주소를 무단으로 수집하는 것을 거부하며, 이를 위반시 정보통신망법에 의해 형사처벌됨을 유념하시기 바랍니다.</div>
 <a	class="modal_close_btn" style="position: absolute; top: 10px; right: 10px; cursor: pointer;"><img src="${contextPath}/resources/image/close_button.png"></a>
</div>



<!-- 모달창 스크립트 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<!-- 모달 -->
		<script type="text/javascript">
			function modaldal(id) {
				var zIndex = 9999;
				var modaldal = $('#' + id);

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

				modaldal
						.css(
								{
									position : 'fixed',
									boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0,0,0,0.19)',

									// 시꺼먼 레이어 보다 한칸 위에 보이기
									zIndex : zIndex + 1,

									// div center 정렬
									top : '50%',
									left : '50%',
									transform : 'translate(-50%, -50%)',
									msTransform : 'translate(-50%, -50%)',
									webkitTransform : 'translate(-50%, -50%)',

									width : '60%',
									height : '77%',
								/* border-radius : '5px' */
								}).show()
						// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
						.find('.modal_close_btn').on('click', function() {
							bg.remove();
							modaldal.hide(); 
						});
			}

			$('#noEmail').on('click', function() {
				// 모달창 띄우기
				modaldal('noEmail_modal');
			});
		</script>