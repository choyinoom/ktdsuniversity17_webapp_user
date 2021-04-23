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
            
            <!-- <회원 관련> -->
            <div class = 'member'>

              <details>
                <summary class="desc">
                  <p><a class="qna">Q </a>비밀번호를 잊어버렸는데 어떻게 하나요?</p>
                </summary>
                <div class = "answer">
                  <a>A </a>
                  <div class = "answer_text">
                  컨소시엄 관리자에게 메일 또는 전화(문자)로 연락주시기 바랍니다.<br>
                  초기 비밀번호는 123456789!로 설정 되며 로그인후 비밀번호를 변경하셔야 합니다.
                  </div>
                 
                </div>
              </details>

            </div>

        </ul>
   
    </body>
</html>