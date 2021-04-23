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
    
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
		<script type="text/javaScript">
			 //첨부파일 다운을 위한 js
			 $(document).ready( function() {
		           $('#downloadLink').click( function () {
		              var str = '감사합니다';

		              //Data URI
		              var uriEncodedData = 'data:application/text;charset=utf-8,' + encodeURIComponent(str);
		              $('#downloadLink').attr('href', uriEncodedData);  
		           	  });
        			});
		</script> 
		
    <body>
    
    	<div class="banner" id="course__banner">
			<h1>FAQ</h1>
		</div>
    
        <div class = "container">
            <div class="menu">

              <!-- float:left로 주기 -->

              <button class="menu_button_1"><a href="${contextPath}/customer/faq.do">전체</a></button>
              <button class="menu_button"><a href="${contextPath}/customer/faqMember.do">회원관련</a></button>
              <button class="menu_button"><a href="${contextPath}/customer/faqCourse.do">수강관련</a></button>
              <button class="menu_button"><a href="${contextPath}/customer/faqEdu.do">교육관련</a></button>
              <button class="menu_button"><a href="${contextPath}/customer/faqSuryo.do">수료관련</a></button>
              <button class="menu_button"><a href="${contextPath}/customer/faqElse.do">기타</a></button>
        
            </div>

            <!-- 검색기능 일단 주석 -->
           <%--  <div class="faq_search">
                  <img src="${contextPath}/resources/image/loupe.png" alt="돋보기 이미지">

                  <div class="faq_search_in">
                    <input type="text" placeholder="검색어를 입력해주세요." >
                  </div>

                  <input type = "submit" name = "faq_btn" value = "검색">

            </div> --%>

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
				<div class="answer_sub">
				<img src="${contextPath}/resources/image/download.png" alt="첨부파일다운">
 				 <a href='C:\downloadFile\컨소시엄협약서_2018.02.zip' id="downloadLink" download="컨소시엄협약서_2018.02.zip">첨부파일:컨소시엄협약서_2018.02.zip</a>
 				 </div>
                <div class = "answerConsortium">
                  <!-- 첨부파일있음!!!! -->
                  <a>A </a>국가인적자원개발 컨소시엄 협약체결은 첨부된 컨소시엄협약서(총 3P)를 작성하셔서 제출하여 주시면 됩니다.<br>
                  (1년에 1회 협약체결을 원칙으로 하며 2년간 유효합니다.)<br>
                  
                  (단, 2017년도 이후부터는 타 교육기관과의 중복협약이 가능합니다.)<br>
                  - 문의처 : 권철우 과장(070-4268-6187 / 82036600@kt.com)<br>
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