<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/resources/assets/css/scroll.css">
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row" style="width : 1440px; margin: 0px auto;">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
      	<!-- 사이드바 넣기 전 로고-->
        <a class="navbar-brand brand-logo mr-5" href="/pub"><img src="/resources/mng/images/harubookslogo3.png" class="mr-2" alt="logo"/></a>
        <!-- 사이드바 넣기 후 로고 -->
        <a class="navbar-brand brand-logo-mini" href="/pub"><img src="/resources/mng/images/harubookslogo2.png" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav navbar-nav-right">
          <button onclick="location.href='/harubooks/main'" style="margin-top: 15px; border: 1px solid #57B657;border-radius: 10px;background:#4dac27;color: white; height : 30px; font-weight: 900;">하루북스 이동</button>
          <c:if test="${not empty sessionScope['SPRING_SECURITY_CONTEXT']}">
	          <span style="margin: 19px;"><sec:authentication property="name"/>님 </span><%-- <sec:authentication property="name"/>님</p>	 --%>
          </c:if>
          <li class="nav-item nav-profile dropdown">
            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
              <img src="/resources/mng/images/profile.jpg" alt="profile"/>
            </a>
            <!-- nav바 프로필 사진 누르면 나타나는 div-->
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
              <a class="dropdown-item" href="/login/logout">
                <i class="ti-power-off text-primary"></i>
                	로그아웃
              </a>
            </div>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>