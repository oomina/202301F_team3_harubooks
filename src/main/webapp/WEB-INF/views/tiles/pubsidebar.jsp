<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
      <ul class="nav">
        <!-- 출판사 메뉴 -->
        <!-- aside 1번 탭-->
        <li class="nav-item">
          <a class="nav-link" href="/pub/bookRequest" aria-expanded="false">
            <i class="ri-book-open-line" style="font-size: 16px;"></i>&nbsp;&nbsp;&nbsp;
            <span class="menu-title">도서 관리</span>
          </a>
        </li>
        <!-- aside 2번 탭-->
        <li class="nav-item">
          <a class="nav-link" data-toggle="collapse" href="#remain" aria-expanded="false">
            <i class="ri-file-list-2-line" style="font-size: 16px;"></i>&nbsp;&nbsp;&nbsp;
            <span class="menu-title">재고 관리</span>
            <i class="menu-arrow"></i>
          </a>
          <div class="collapse" id="remain">
            <ul class="nav flex-column sub-menu">
              <li class="nav-item"> <a class="nav-link" href="/pub/remains">재고 내역</a></li>
              <li class="nav-item"> <a class="nav-link" href="/pub/po">발주 내역</a></li>
              <!-- <li class="nav-item"> <a class="nav-link" href="/pub/podown">발주서 확인</a></li> -->
            </ul>
          </div>
        </li>
        <!-- aside 3번 탭-->
        <li class="nav-item">
          <a class="nav-link" href="/pub/sales" aria-expanded="false">
            <i class="ri-pie-chart-line" style="font-size: 16px;"></i>&nbsp;&nbsp;&nbsp;
            <span class="menu-title">판매 관리</span>
          </a>
        </li>
      </ul>
        <!-- 출판사 메뉴 END -->
        
      </nav>