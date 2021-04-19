<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
  <link rel="stylesheet"	href="<c:url value='/resources/css/common.css'/>">
  <script src="<c:url value='/resources/js/jquery-3.6.0.min.js'/>"></script>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <script>
  $(function () {
      $(document).scroll(function () {
        var $header = $("header");
        $header.toggleClass('scrolled', $(this).scrollTop() > $header.height());
      });

      $(document).on('mouseover', '.topMenu', function() {
            $('.navbar__menu__each__sub').slideDown(300);
            $(".header__transparent").css("background", "white")
            $(".header__transparent .navbar__menu__each").css("color", "black")
            $(".header__transparent .navbar__menu__each__main").css("color", "black")
            var $header = $(".topMenu");
          $header.toggleClass('mouseover');
          var $logo = $(".navbar__logo");
          $logo.toggleClass('mouse');
        });

        $(document).on('mouseleave', '.topMenu', function() {
            $('.navbar__menu__each__sub').slideUp(300);
            $(".header__transparent").css("background", "transparent")
            $(".header__transparent .navbar__menu__each").css("color", "white")
            $(".header__transparent .navbar__menu__each__main").css("color", "white")
            var $header = $(".topMenu");
          $header.toggleClass('');
          var $logo = $(".navbar__logo");
          $logo.toggleClass('');
        });
    });
  </script>

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
  </body>
</html>