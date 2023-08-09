<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>

<html lang="en">

<head>
<!-- Title -->
<title>HaruBooks</title>

<!-- Required Meta Tags Always Come First -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Favicon -->
<link rel="shortcut icon" href="/resources/assets/img/로고1.png">

<!-- Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap"
	rel="stylesheet">

<!-- CSS Implementing Plugins -->
<link rel="stylesheet"
	href="/resources/assets/vendor/font-awesome/css/fontawesome-all.min.css">
<link rel="stylesheet"
	href="/resources/assets/vendor/flaticon/font/flaticon.css">
<link rel="stylesheet"
	href="/resources/assets/vendor/animate.css/animate.css">
<link rel="stylesheet"
	href="/resources/assets/vendor/bootstrap-select/dist/css/bootstrap-select.min.css">
<link rel="stylesheet"
	href="/resources/assets/vendor/slick-carousel/slick/slick.css" />
<link rel="stylesheet"
	href="/resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
<link rel="stylesheet"
	href="/resources/assets/css/harubooksmain.css">
<!-- CSS Bookworm Template -->
<link rel="stylesheet" href="/resources/assets/css/theme.css">
</head>

<body>
	<div id="main-div" style="width: 1440px; margin: 0 auto;">
		<tiles:insertAttribute name="header"/>
		<tiles:insertAttribute name="content"/>
		<tiles:insertAttribute name="footer"/>
	</div>
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="/resources/assets/vendor/jquery/dist/jquery.min.js"></script>
	<script
		src="/resources/assets/vendor/jquery-migrate/dist/jquery-migrate.min.js"></script>
	<script src="/resources/assets/vendor/popper.js/dist/umd/popper.min.js"></script>
	<script src="/resources/assets/vendor/bootstrap/bootstrap.min.js"></script>
	<script
		src="/resources/assets/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
	<script
		src="/resources/assets/vendor/slick-carousel/slick/slick.min.js"></script>
	<script
		src="/resources/assets/vendor/multilevel-sliding-mobile-menu/dist/jquery.zeynep.js"></script>
	<script
		src="/resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
	

	<!-- JS HS Components -->
	<script src="/resources/assets/js/hs.core.js"></script>
	<script src="/resources/assets/js/components/hs.unfold.js"></script>
	<script src="/resources/assets/js/components/hs.malihu-scrollbar.js"></script>
	<script src="/resources/assets/js/components/hs.header.js"></script>
	<script src="/resources/assets/js/components/hs.slick-carousel.js"></script>
	<script src="/resources/assets/js/components/hs.selectpicker.js"></script>
	<script src="/resources/assets/js/components/hs.show-animation.js"></script>
	<script src="https://cdn.rawgit.com/davidsonfellipe/lena.js/master/dist/lena.js"></script>
	
	<!-- sweet alert -->
<!-- 	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- JS Bookworm -->
	<!-- <script src="/resources/assets/js/bookworm.js"></script> -->
	<script>
		$(document).on('ready', function() {
			// initialization of unfold component
			$.HSCore.components.HSUnfold.init($('[data-unfold-target]'));

			// initialization of slick carousel
			$.HSCore.components.HSSlickCarousel.init('.js-slick-carousel');

			// initialization of header
			$.HSCore.components.HSHeader.init($('#header'));

			// initialization of malihu scrollbar
			$.HSCore.components.HSMalihuScrollBar.init($('.js-scrollbar'));

			// initialization of show animations
			$.HSCore.components.HSShowAnimation.init('.js-animation-link');

			// init zeynepjs
			var zeynep = $('.zeynep').zeynep({
				onClosed : function() {
					// enable main wrapper element clicks on any its children element
					$("body main").attr("style", "");

					console.log('the side menu is closed.');
				},
				onOpened : function() {
					// disable main wrapper element clicks on any its children element
					$("body main").attr("style", "pointer-events: none;");

					console.log('the side menu is opened.');
				}
			});

			// handle zeynep overlay click
			$(".zeynep-overlay").click(function() {
				zeynep.close();
			});

			// open side menu if the button is clicked
			$(".cat-menu").click(function() {
				if ($("html").hasClass("zeynep-opened")) {
					zeynep.close();
				} else {
					zeynep.open();
				}
			});
		});
	</script>
	
</body>

</html>
