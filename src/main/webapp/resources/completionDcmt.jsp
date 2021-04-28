<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link href="<c:url value='/resources/css/completionDcmt.css'/>" rel="stylesheet">

<div class="completionPrint">
    <img id="completionImg" alt="" src="${contextPath}/resources/image/completion8.jpg">
    <div class="completionText">
        <div class="completion_serial">ktds <span id="type"></span>과정 제 <span id="id"></span>호</div>
        <div class="completion_main">수료증</div>
        <div class="completion_info">
            <ul>
                <li><span id="compl_name">성</span>명 : <span id="name1"></span></li>
                <li><span id="compl_companyName">회사</span>명 : <span id="name2"></span></li>
                <li><span id="compl_slb_name">훈련과정</span>명 : <span id="name3"></span></li>
                <li><span id="compl_crs_date">훈련기</span>간 : <span id="date"></span>
            </ul>
        </div>
        <div class="completion_content">위 사람은 상기 국가인적자원개발 컨소시엄 과정을
            수료하였으므로 이 증서를 수여합니다.</div>
        <div class="completion_date">${enrollmentVO.completeDate }</div>
        <div id="completion_logo">
            <img src="${contextPath}/resources/image/completionLogo3.png">
        </div>
        <div class="completion_ceo">
            대표이사 <span style="font-size: 28px;">우 정 민</span>
        </div>
    </div>
</div>