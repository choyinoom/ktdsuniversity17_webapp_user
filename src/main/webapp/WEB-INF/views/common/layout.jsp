<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="<c:url value='/resources/css/common.css'/>">
		<!-- Google Font -->
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap" rel="stylesheet">
		<script src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
		
		<title><tiles:insertAttribute name="title" /></title>
	</head>
	<body>
		<div id="wrapper">
			<header>
				<tiles:insertAttribute name="header" />
			</header>
			<main>
				<tiles:insertAttribute name="body" />
			</main>
	
			<footer>
				<tiles:insertAttribute name="footer" />
			</footer>
		</div>
		<script>
		$(function () {
			  $(document).scroll(function () {
			    var $header = $("header");
			    $header.toggleClass('scrolled', $(this).scrollTop() > $header.height());
			    
			  });
			});
		</script>
	</body>
</html>