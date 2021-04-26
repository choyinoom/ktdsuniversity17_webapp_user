<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />    

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FAQ🧡</title>
        <link rel="stylesheet" href="<c:url value='/resources/css/faq.css'/>">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">
       
    </head>
    
    <body class = "faq_body">
    
    	<div class="banner" id="faq__banner">
			<h1>FAQ</h1>
		</div>
    
        <div class = "faq_container">
            <div class="faq_menu">

              <!-- float:left로 주기 -->
              <!-- Jquery용으로 button에 id주기 -->
              <button class="faq_menu_button_1"><a href="${contextPath}/customer/faq.do">전체</a></button>
              <button class="faq_menu_button"><a href="${contextPath}/customer/faqMember.do">회원관련</a></button>
              <button class="faq_menu_button"><a href="${contextPath}/customer/faqCourse.do">수강관련</a></button>
              <button class="faq_menu_button"><a href="${contextPath}/customer/faqEdu.do">교육관련</a></button>
              <button class="faq_menu_button"><a href="${contextPath}/customer/faqSuryo.do">수료관련</a></button>
              <button class="faq_menu_button"><a href="${contextPath}/customer/faqElse.do">기타</a></button>
        
            </div>

        </div>

        <!-- ----------------Q&A---------------- -->

        <ul class="list">

            <!-- <교육 관련> -->
            <div class = "edu">

              <details>
                <summary class="desc">
                  <p><a class="qna">Q </a>연간 교육일정이 궁금합니다.</p>
                </summary>
                <div class = "answer">
                  <a>A </a> '게시판'의 '공지사항'에서 교육일정 확인이 가능합니다.
                </div>
              </details>

            </div>

        </ul>
    
    </body>
</html>