<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소속회사</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap')
	;

.popup_container {
	display: flex;
    flex-direction: column;
    align-items: center;
	width: 100%;
	margin: 0px;
	padding: 0px;
	font-family: 'Noto Sans KR', sans-serif;
}

#popup_searchFrm {
width : 92%;
}

.pageNumber ul {
	display: flex;
	justify-content: center;
	list-style: none;
	padding : 0px;
}

.pageNumber ul li {
	margin: 8px;
}

.pageNumber ul li a:link {
color : black;
text-decoration: none;
}

.searchType {
	display: flex;
	justify-content: flex-end;
	margin: 30px 0px 30px 0px;
}

#popup_listFilter {
	background: #ECECEC;
	margin: 0px 0px 10px 10px;
	height: 35px;
	border: none;
	border-radius: 6px;
}

#popup_searchType {
	background: #ECECEC;
	margin: 0px 0px 10px 10px;
	height: 35px;
	border: none;
	border-radius: 6px;
}

#popup_searchText {
	background: #ECECEC;
	width: 200px;
	height: 35px;
	border-radius: 6px;
	margin: 0px 0px 10px 10px;
	border: none;
}

#popup_Search {
	background: #969696;
	width: 50px;
	height: 35px;
	border-radius: 6px;
	margin: 0px 0px 10px 5px;
	color: #EFEFEF;
	cursor: pointer;
	font-size: 16px;
	border: none;
}

.popup_table {
	border-collapse: collapse;
	width: 90%;
	margin : 0px;
}

#popup_title {
	border-bottom: 2px solid;
}

.popup_tr > td {
	padding: 8px 0px 8px 0px;
	border-bottom: 0.3px solid;
	border-color: rgba(156, 157, 157, 0.2);
	font-size: 14px;
}

.companyNotFound {
font-size : 23px;
font-weight: 700;
}

.popup_companyNotFound {
	display: flex;
    flex-direction: column;
    align-items: center;
}

#inputCompanyName {
background: #ECECEC;
	width: 200px;
	height: 35px;
	border-radius: 6px;
	border: none;
}

#inputCompanyName_button {
background: #ED1C24;
	width: 50px;
	height: 35px;
	border-radius: 6px;
	margin: 0px 0px 0px 8px;
	color: #EFEFEF;
	cursor: pointer;
	font-size: 16px;
	border: none;
}
#popup_td1 {
width : 25%;
align : center;
}

#popup_td1 a:link {
color : black;
text-decoration: none;
}

#popup_td1 a:hover {
color : #e91b23;
}
#popup_td2 {
width : 25%;
align : center;
}
#popup_td3 {
width : 50%;
}

.popup_close {
display : flex;
justify-content: center;
}

.popup_close > input{
	background: #969696;
	width: 70px;
	height: 35px;
	border-radius: 6px;
	color: #EFEFEF;
	cursor: pointer;
	font-size: 16px;
	border: none;
}
</style>
</head>
<script>
	window.onfocus = function() {
	}

	window.onload = function() {
		window.focus();
		/* window.moveTo(3,0); */
		/* window.resizeTo(600, 700); */
		window.scrollTo(0, 0)
	}

	//회사명 클릭 시 회원가입창에 자동 입력
	function setCompanyName(name) {
		var name = $(name).text();

		//document.getElementById('search').value = name;
		opener.document.getElementById('companyName').value = name;
		window.close();
	}

	//회사명 검색 안될 시 직접입력하여 등록
	function inputCompanyName() {
		var companyName = document.getElementById('inputCompanyName').value;
		opener.document.getElementById('companyName').value = companyName;
		window.close();
	}

	//리스트 갯수 표시
	$(
			function() {
				$('#popup_listFilter')
						.on(
								'change',
								function() {
									var perPage = $(this).val();
									var searchType = document.getElementById('popup_searchType').value;
									var searchText = document.getElementById('popup_searchText').value;
									/* alert(perPage+"씩 리스트 출력");
									alert(searchType);
									alert(searchText); */
									location.href = "${contextPath}/company/popUp.do?perPage="
											+ perPage
											+ "&searchType="
											+ searchType
											+ "&searchText="
											+ searchText;
								})
			})
</script>
<body>
	<div class="popup_container">
		<!-- controller에서 보낸 값 받아서 저장 -->
		<%
		String searchType = request.getParameter("searchType");
		String searchText = request.getParameter("searchText");
		%>
		<form method="get" action="${contextPath}/company/popUp.do"
			id="popup_searchFrm">
			<div class="searchType">
				<!-- 리시트 필터 값 적용 -->
				<select name="perPage" id="popup_listFilter">
					<c:if test="${perPage == '10' }">
						<option value='10' selected>10개</option>
						<option value='20'>20개</option>
						<option value='50'>50개</option>
						<option value='100'>100개</option>
					</c:if>
					<c:if test="${perPage == '20' }">
						<option value='10'>10개</option>
						<option value='20' selected>20개</option>
						<option value='50'>50개</option>
						<option value='100'>100개</option>
					</c:if>
					<c:if test="${perPage == '50' }">
						<option value='10'>10개</option>
						<option value='20'>20개</option>
						<option value='50' selected>50개</option>
						<option value='100'>100개</option>
					</c:if>
					<c:if test="${perPage == '100' }">
						<option value='10'>10개</option>
						<option value='20'>20개</option>
						<option value='50'>50개</option>
						<option value='100' selected>100개</option>
					</c:if>
				</select>

				<!-- 검색 유형 값에 따라 셀렉트 띄우는 값 설정 -->

				<select name="searchType" id="popup_searchType">
					<c:if test="${empty searchType }">
						<option value="companyName" selected>회사명</option>
						<option value="companyNum">사업자번호</option>
					</c:if>
					<c:if test="${searchType == 'companyName' }">
						<option value="companyName" selected>회사명</option>
						<option value="companyNum">사업자번호</option>
					</c:if>
					<c:if test="${searchType == 'companyNum'}">
						<option value="companyName">회사명</option>
						<option value="companyNum" selected>사업자번호</option>
					</c:if>
				</select>
				<!-- 검색 값이 있냐 없냐에 따라 값 뛰우는거 설정 -->
				<c:choose>
					<c:when test="${not empty searchText }">
						<input type="text" name="searchText" id="popup_searchText"
							value="${searchText }">
					</c:when>
					<c:otherwise>
						<input type="text" name="searchText" id="popup_searchText">
					</c:otherwise>
				</c:choose>
				<input type="submit" id="popup_Search" value="검색">
			</div>
		</form>
			<table class="popup_table">

				<c:choose>
					<c:when test="${empty companiesList }">
						<tr height="10">
							<td>
								<div class="popup_companyNotFound">
									<p class="companyNotFound">등록된 회사가 없습니다.</p>
									<div class="inputCompanyName">
									<input id="inputCompanyName" type="text" placeholder="직접 입력">
									<button id="inputCompanyName_button" onclick="inputCompanyName();">등록</button>
									</div>
								</div>
							</td>
						</tr>
					</c:when>
					<c:when test="${companiesList !=null }">
						<tr>
							<td id="popup_title"><b>회사명</b></td>
							<td id="popup_title"><b>사업자번호</b></td>
							<td id="popup_title"><b>주소</b></td>
						</tr>
						<c:forEach var="company" items="${companiesList }"
							varStatus="companyNum">
							<tr class="popup_tr">
								<td id="popup_td1" align='left'><a
									href='javascript:void(0);' onclick="setCompanyName(this);">${company.name }</a></td>
								<td id="popup_td2">${company.id }</td>
								<td id="popup_td3">${company.address }</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</table>

		<!-- 전체 페이지개수에 의한 페이지 리스트 띄우기 -->
		<div class="pageNumber" align="center">
			<ul>
				<c:if test="${pageMaker.prev }">
					<c:choose>
						<c:when test="${not empty searchType and not empty searchText }">
							<li><a
								href="${contextPath}/company/popUp.do?page=${pageMaker.startPage - 1 }&searchText=${searchText}&searchType=${searchType}">이전</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="${contextPath}/company/popUp.do?page=${pageMaker.startPage - 1 }&searchText=${searchText}&searchType=${searchType}">이전</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:choose>
					<c:when test="${not empty searchType and not empty searchText }">
						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
							<li
								<c:out value="${pageMaker.criteria.page == idx ? 'class=active' : '' }"/>>
								<a
								href="${contextPath }/company/popUp.do?page=${idx}&searchText=${searchText}&searchType=${searchType}&perPage=${perPage}">${idx }</a>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }" var="idx">
							<li
								<c:out value="${pageMaker.criteria.page == idx ? 'class=active' : '' }"/>>
								<a
								href="${contextPath }/company/popUp.do?page=${idx}&searchText=${searchText}&searchType=${searchType}&perPage=${perPage}">${idx }</a>
							</li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<c:choose>
						<c:when test="${not empty searchType and not empty searchText }">
							<li><a
								href="${contextPath}/company/popUp.do?page=${pageMaker.endPage + 1 }&searchText=${searchText}&searchType=${searchType}">다음</a></li>
						</c:when>
						<c:otherwise>
							<li><a
								href="${contextPath}/company/popUp.do?page=${pageMaker.endPage + 1 }&searchText=${searchText}&searchType=${searchType}">다음</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
			</ul>
		</div>

		<div class="popup_close">
			<input type="button" value="창 닫기" onclick="window.close()">
		</div>
	</div>
</body>
</html>