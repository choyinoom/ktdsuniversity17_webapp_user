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
.popup_container {
	width: 600px;
	margin: 0px;
	padding: 0px;
}

.pageNumber ul {
	display: flex;
	justify-content: center;
	list-style: none;
}

.pageNumber ul li {
	margin: 8px;
}
</style>
</head>
<script>
	window.onfocus = function() {
	}

	window.onload = function() {
		window.focus();
		/* window.moveTo(3,0); */
		window.resizeTo(600, 700);
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
		$(function() {
				$('#listFilter')
						.on(
								'change',
								function() {
									var perPage = $(this).val();
									var searchType = document
											.getElementById('searchType').value;
									var searchText = document
											.getElementById('searchText').value;
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
		<div class="popup_title">회사 리스트</div>
		<!-- controller에서 보낸 값 받아서 저장 -->
		<%
		String searchType = request.getParameter("searchType");
		String searchText = request.getParameter("searchText");
		%>
		<form method="get" action="${contextPath}/company/popUp.do"
			id="searchFrm">
			<div class="searchType">
				<!-- 리시트 필터 값 적용 -->
				<select name="perPage" id="listFilter">
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

				<select name="searchType" id="searchType">
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
						<input type="text" name="searchText" id="searchText"
							value="${searchText }">
					</c:when>
					<c:otherwise>
						<input type="text" name="searchText" id="searchText">
					</c:otherwise>
				</c:choose>
				<input type="submit" id="searchSubmit" value="검색">
			</div>
		</form>
		<div>
			<table>

				<c:choose>
					<c:when test="${empty companiesList }">
						<tr height="10">
							<td>
								<div>
									<p class="companyNotFound">등록된 회사가 없습니다.</p>
									<input id="inputCompanyName" type="text" placeholder="직접 입력">
									<button onclick="inputCompanyName();">등록</button>
								</div>
							</td>
						</tr>
					</c:when>
					<c:when test="${companiesList !=null }">
						<tr height="15" align="center">
							<td><b>회사명</b></td>
							<td><b>사업자번호</b></td>
							<td><b>주소</b></td>
						</tr>
						<c:forEach var="company" items="${companiesList }"
							varStatus="companyNum">
							<tr align="center">
								<td align='left'><a href='javascript:void(0);'
									onclick="setCompanyName(this);">${company.name }</a></td>
								<td>${company.id }</td>
								<td>${company.address }</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</table>
		</div>

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

		<div>
			<input type="button" value="창 닫기" onclick="window.close()">
		</div>
	</div>
</body>
</html>