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
            
     

            <!-- <수강 관련> -->
            <div class = "course">

              <details>
                <summary class="desc">
                  <p><a class="qna">Q </a>교육비는 어떻게 되나요?</p>
                </summary>
                <div class = "answer">
                  <a>A </a>교육비는 전액(100%) 정부지원으로 교육생 소속사(사업주)의 자부담금이 없는 무료교육입니다.
                </div>
              </details>
          
              <details>
                <summary class="desc">
                  <p><a class="qna">Q </a>교육신청 및 입과절차는 어떻게 되나요?</p>
                </summary>
                <div class = "answer">
                  <a>A </a>아래 사항을 꼼꼼히 확인하시기 바랍니다. (협약을 체결한 기업은 ②번부터 적용 됩니다.)<br>
                  ※ kt ds 컨소시엄 교육 : kt ds와 컨소시엄 협약을 체결한 중소기업 임직원들을 위한 무료교육(비협약, 대기업:유료)<br>

                  1. 교육 절차 : 必<br>
                  ①협약체결<br>
                  ②kt ds 교육홈페이지에 신청(https://edu.ktdsuniversity.com/) <br>           
                  ③승인대기<br>
                  ④kt ds에서 요청하는 내용송부(주민번호 등)<br>
                  ⑤승인<br>
                  ⑥수강<br>
                  ⑦교육진행<br>
                  ⑧수료<br><br>
            
                  
                  2. 세부 내용<br>
                  ① 협약체결 방법 첨부파일 작성(직인필)<br>
                  - 원본 : 우편발송<br>
                  - 스캔본 : 교육시작 전까지 메일로 송부(82036600@kt.com)<br><br>
           
                  
                  ② kt ds 교육홈페이지에 신청(https://edu.ktdsuniversity.com/)<br>
                  ③교육시작 전주 화요일까지 신청(승인대기)<br><br>

                  
                  ④교육시작 전주 수요일까지 메일로 제출<br> 
                   1) 성명 :<br>
                  2) 주민등록번호(13자리) :<br>
                  3) 회사명 :<br>
                  4) 연락처(핸드폰) :<br>
                  5) 과정명 :<br>
                  6) 교육일자 :<br><br>

                  - 위 항목 제출시 목요일에 ⑤승인 상태로 변경<br><br>
                  
                  ⑥ kt ds에서 금요일에 문자 발송 (과정명, 교육일자, 시간)<br>
                  - 홈페이지에서 사전 이해도 조사 실시<br><br>
                  
                  ⑦ 교육수강 종료전 사후이해도 조사 실시<br><br>
                  
                  ⑧ 수료 홈페이지에서 수료증 출력<br>
                  
                  [단일클래스를 통한 맞춤형 교육 시행]<br>
                  1. 협력사에서 요청하는 교육강좌 개설 (담당자와 별도 협의)<br>
                  2. 본 정규 과정 이외의 단일클래스 과정 개설 가능 (장소 : kt ds 방배사옥 강의장 또는 협력사 회의장)<br>
                  주소 : 서울특별시 서초구 효령로 176 KT방배빌딩 B동 2층 담당자 : 권철우 과장 010-8753-2147<br>
                </div>
              </details>

              <details>
                <summary class="desc">
                  <p><a class="qna">Q </a>신청기간이 따로 정해져 있나요 수강인원이 충원되면 마감되는 건가요?</p>
                </summary>
                <div class = "answer">
                  <a>A </a>[수강신청기간]
                  - 각 과목별 교육시작 한 주 전까지<br>
                  (수강신청을 하신분들에게는 개강일 전주 월~수요일 사이 메일/문자로 입과안내드립니다.)<br> 
                  각 과정의 정원은 최대 20명으로, 신청자가 정원을 초과하는 경우에는 조기 마감될 수 있습니다.
                </div>
              </details>

            </div>

        </ul>
    
    </body>
</html>