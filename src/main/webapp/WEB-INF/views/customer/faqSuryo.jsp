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
    
    <body>
    
    	<div class="banner" id="course__banner">
			<h1>FAQ</h1>
		</div>
    
        <div class = "container">
            <div class="menu">

              <!-- float:left로 주기 -->
              <!-- Jquery용으로 button에 id주기 -->
              <button class="menu_button_1"><a href="${contextPath}/customer/faq.do">전체</a></button>
              <button class="menu_button"><a href="${contextPath}/customer/faqMember.do">회원관련</a></button>
              <button class="menu_button"><a href="${contextPath}/customer/faqCourse.do">수강관련</a></button>
              <button class="menu_button"><a href="${contextPath}/customer/faqEdu.do">교육관련</a></button>
              <button class="menu_button"><a href="${contextPath}/customer/faqSuryo.do">수료관련</a></button>
              <button class="menu_button"><a href="${contextPath}/customer/faqElse.do">기타</a></button>
        
            </div>

        </div>

        <!-- ----------------Q&A---------------- -->

        <ul class="list">
            
           
            <!-- <수료 관련> -->
            <div class = "suryo">

              <details>
                <summary class="desc">
                  <p><a class="qna">Q </a>수료증을 받으려면 어떻게 해야하나요?</p>
                </summary>
                <div class = "answer">
                  <a>A </a>일정시간이상 출석(80%)하시어 교육을 수료하셨다면, 홈페이지에서 수료증 다운로드 및 출력이 가능합니다.<br>

                  - 홈페이지 개인회원 로그인 -> 마이페이지 -> 수강완료 과정 -> 수료증  -> 다운로드
                </div>
              </details>

              <details>
                <summary class="desc">
                  <p><a class="qna">Q </a>수료 기준이 어떻게 되나요?</p>
                </summary>
                <div class = "answer">
                  <a>A </a> 교육과정의 총 출석률이 80 이상일 때 수료가 가능합니다.<br>
                  (총 5일 과정 중 4일 출석 시 수료가능. 단 1일 결석후 지각, 조퇴가 있으면 미수료 됨)
                </div>
              </details>
            </div>

           

        </ul>
    
    </body>
</html>