<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%> 
<style>
	.side_menu_contents {
		margin: 5px;
		text-decoration: none;
		color: black;
	}
</style>


	<h1 class="side_menu_title">${categoryName}</h1>

	<c:forEach var="menu" items="${sideMenu}">
		<h2>
			<a class="side_menu_contents" href="${contextPath}${menu.value}"  class="no-underline">${menu.key}</a><br>
		</h2>
	</c:forEach>
