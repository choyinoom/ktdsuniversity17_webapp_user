<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value='/resources/css/common.css'/>">
	<script src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link
		href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap"
		rel="stylesheet">
	<title><tiles:insertAttribute name="title" /></title>
	<script>
		function scrollUp() {//mousleave
			return new Promise(function(resolve, reject) {
				$('.navbar__menu__each__sub').slideUp(300);
				setTimeout(function() {
					resolve();							
				}, 300);
			});
		}
		
		function makeTransparent() {
			return scrollUp().then(function() {
				$(".header__transparent .navbar__menu__each").css("color", "white");
				$(".header__transparent .navbar__menu__each__main").css("color", "white");
				$(".header__transparent").css("background", "transparent");
				var $logo = $(".navbar__logo");
				$logo.toggleClass('mouse');
			});	
		}
		
		$(function() {
			$(document).scroll(
				function() {
					var $header = $("header");
					$header.toggleClass('scrolled', $(this).scrollTop() > $header.height());
			});
	
		$('header').hover(
			function() {//mouseenter
				$('.navbar__menu__each__sub').slideDown(300);
				$(".header__transparent").css("background", "white");
				$(".header__transparent .navbar__menu__each").css("color", "black");
				$(".header__transparent .navbar__menu__each__main").css("color", "black");
				var $logo = $(".navbar__logo");
				$logo.toggleClass('mouse');
			},
			makeTransparent);
		});
	</script>
</head>
<body>
	<header>
		<tiles:insertAttribute name="header" />
	</header>
	<main>
		<tiles:insertAttribute name="body" />
	</main>
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>
