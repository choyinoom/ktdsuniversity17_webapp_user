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
            
             <!-- <기타문의> -->
             <div class = "suryo">

              <details>
                <summary class="desc">
                  <p><a class="qna">Q </a>고용보험이 적용되어야 교육수강을 할 수 있나요?</p>
                </summary>
                <div class = "answer">
                  <a>A </a>
                  컨소시엄 무료교육은 중소기업에 재직중이시며 고용보험이 적용되고있는 상태이셔야 수강이 가능합니다.<br>
                  위 사항에 해당되지 않으시는 분은 문의(문의처 : 권철우 과장 070-4268-6187 / 82036600@kt.com) 주시기 바랍니다.<br>
                  [고용보험 적용여부 확인]<br>
                  - 고용보험관리공단 사이트 : http:www.ei.go.kr

                </div>
              </details>

              <details>
                <summary class="desc">
                  <p><a class="qna">Q </a>컨소시엄 협약은 어떻게 체결하나요?</p>
                </summary>

                <div class = "answer">
                  <!-- 첨부파일있음!!!! -->
                  <a>A </a>국가인적자원개발 컨소시엄 협약체결은 첨부된 컨소시엄협약서(총 3P)를 작성하셔서 제출하여 주시면 됩니다.<br>
                  (1년에 1회 협약체결을 원칙으로 하며 2년간 유효합니다.)<br>
                  
                  (단, 2017년도 이후부터는 타 교육기관과의 중복협약이 가능합니다.)<br>
                  - 문의처 : 권철우 과장(070-4268-6187 / 82036600@kt.com)<br>
                  
                  <!-- 문제점 : a태그 쓰면 css에서 가로정렬한 속성 때문에 div가 깨짐!! -->
                  <a href="${contextPath}/customer/filedownload.jsp">⭐️[첨부파일1] 컨소시엄협약서_2018.02.zip</a>
                </div>
              </details>

              <details>
                <summary class="desc">
                  <p><a class="qna">Q </a>훈련비용 지원한도액은 어떻게 확인 하나요?</p>
                </summary>
                <div class = "answer">
                  <a>A </a>국가인적자원개발컨소시엄 협약서 작성시, 위탁훈련비 지원 동의서 페이지에 '훈련비용 지원 한도액'란이 있습니다.<br>
                  노동부나 산업인력공단측에 문의하셔서 확인이 가능하십니다.<br>
                  최저한도액은 5,000,000으로 기업의 규모에따라 금액이 증가합니다.<br> 
                  kt ds 교육센터에서 노동부사이트를 통해 직접 확인이 가능하므로 공란으로 비워두고 제출하셔도 무방하십니다.
                </div>
              </details>

              <details>
                <summary class="desc">
                  <p><a class="qna">Q </a>컨소시엄 협약서 작성할 때 고용안정 직업능력개발사업 보험료 납부금액은 어떻게 쓰나요?</p>
                </summary>
                <div class = "answer">
                  <a>A </a>국가인적자원개발컨소시엄 협약서 작성시, 일반현황페이지에 '고용안정 직업능력개발사업 보험료 납부금액'란이 있습니다.<br>
                  작년(현재 2013년도이면 2012년도)한 해 동안 납부하셨던 고용안정 보험료를 적어주시면 됩니다.<br>
                  kt ds 교육센터에서 노동부사이트를 통해 직접 확인이 가능하므로 공란으로 비워두고 제출하셔도 무방하십니다.
                </div>
              </details>

            </div>

        </ul>
    
    </body>
</html>