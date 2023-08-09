<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Title -->
    <title>Shop v1 | Bookworm</title>

    <!-- Required Meta Tags Always Come First -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Favicon -->
    <link rel="shortcut icon" href="/resources/assets/img/로고1.png">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/resources/assets/vendor/font-awesome/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="/resources/assets/vendor/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="/resources/assets/vendor/animate.css/animate.css">
    <link rel="stylesheet" href="/resources/assets/vendor/bootstrap-select/dist/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="/resources/assets/vendor/slick-carousel/slick/slick.css"/>
    <link rel="stylesheet" href="/resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">

    <!-- CSS Bookworm Template -->
    <link rel="stylesheet" href="/resources/assets/css/theme.css">
</head>
<body class="left-sidebar">
    
    <!-- ====== MAIN CONTENT ====== -->
    <div class="page-header border-bottom mb-8">
        <div class="container">
            <div class="d-md-flex justify-content-between align-items-center py-4">
            	<c:choose>
            		<c:when test="${empty pagingVO.ccg_b002 and empty pagingVO.ccg_b003 }">
            			<h1 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg">검색</h1>
		                <nav class="woocommerce-breadcrumb font-size-2">
		                    <a href="/harubooks/category?ccg_b002=국내도서" class="h-primary">Home</a>
		                    <span class="breadcrumb-separator mx-1"><i class="fas fa-angle-right"></i></span>
		                    <a class="h-primary">도서 검색</a>
		                </nav>
            		</c:when>
            		<c:when test="${not empty pagingVO.ccg_b002 and empty pagingVO.ccg_b003 }">
            			<h1 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg">${pagingVO.getCcg_b002() }</h1>
		                <nav class="woocommerce-breadcrumb font-size-2">
		                    <a href="/harubooks/category?ccg_b002=국내도서" class="h-primary">Home</a>
		                    <span class="breadcrumb-separator mx-1"><i class="fas fa-angle-right"></i></span>
		                    <a href="/harubooks/category?ccg_b002=${pagingVO.ccg_b002 }" class="h-primary">${pagingVO.getCcg_b002() }</a>
		                </nav>
            		</c:when>
            		
            		<c:otherwise>
		                <h1 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg">국내도서</h1>
		                <nav class="woocommerce-breadcrumb font-size-2">
		                    <a href="/harubooks/category?ccg_b002=국내도서" class="h-primary">Home</a>
		                    <span class="breadcrumb-separator mx-1"><i class="fas fa-angle-right"></i></span>
		                    <a href="/harubooks/category?ccg_b002=${pagingVO.ccg_b002 }" class="h-primary">${pagingVO.getCcg_b002() }</a>
		                    <span class="breadcrumb-separator mx-1"><i class="fas fa-angle-right"></i></span>
		                    <a href="/harubooks/category?ccg_b002=${pagingVO.ccg_b002 }&&ccg_b003=${pagingVO.ccg_b003}" class="h-primary">${pagingVO.getCcg_b003() }</a>
		                </nav>
            		</c:otherwise>
            	</c:choose>
            </div>
        </div>
    </div>
    <div class="site-content space-bottom-3" id="content">
        <div class="container">
            <div class="row">
                <div id="primary" class="content-area order-2">
                    <div class="shop-control-bar d-lg-flex justify-content-between align-items-center mb-5 text-center text-md-left">
                    	<c:choose>
                    		<c:when test="${empty pagingVO.ccg_b002 and empty pagingVO.ccg_b003 }">
                    			 <div class="shop-control-bar__left mb-4 m-lg-0">
		                            <p class="woocommerce-result-count m-0 font-size-10">검색 결과</p>
		                        </div>
                    		</c:when>
                    		<c:when test="${not empty pagingVO.ccg_b002 and empty pagingVO.ccg_b003 }">
                    			 <div class="shop-control-bar__left mb-4 m-lg-0">
		                            <p class="woocommerce-result-count m-0 font-size-10">${pagingVO.getCcg_b002() }</p>
		                        </div>
                    		</c:when>
                    		<c:otherwise>
		                        <div class="shop-control-bar__left mb-4 m-lg-0">
		                            <p class="woocommerce-result-count m-0 font-size-10">${pagingVO.getCcg_b003() }</p>
		                        </div>
                    		</c:otherwise>
                    	</c:choose>
                        <div class="shop-control-bar__right d-md-flex align-items-center" style="border-radius: 10px;background: white;border: 1px solid #3cb454;width: 35%;">
                            <!--검색 폼-->
                            <form class="form-inline my-2 overflow-hidden" method="post" id="searchForm" style="width: 100%;height: 100%;">
                            	<input type="hidden" name = "page" id="page">
<!--                                 <div class="input-group flex-nowrap w-100"> -->
<!--                                     <div class="input-group-prepend"> -->
<!--                                         <i class="glph-icon flaticon-loupe py-2d75 bg-white-100 border-white-100 text-dark pl-3 pr-0 rounded-0"></i> -->
<!--                                     </div> -->
<%--                                     <input class="form-control bg-white-100 py-2d75 height-4 border-white-100 rounded-0" name="searchWord" value="${searchWord }" type="search" placeholder="검색" aria-label="Search"> --%>
<!--                                 </div> -->
<!--                                 <button class="btn btn-outline-success my-2 my-sm-0 sr-only" type="submit">Search</button> -->      
                                
                                <div class="input-group" style="border-radius: 10px;background: white;width: 100%;display: flex;">
									<div class="input-group-prepend">
										<i class="ri-search-line" style="font-size: 20px;color: #3cb454;margin-right: 15px;margin-left: 10px;"></i>
									</div>
									<input id="searchWord" value="${searchWord }" type="text" name="searchWord" placeholder="[${pagingVO.ccg_b002 }] 제목/작가를 검색하세요" aria-label="Search" onkeyup="searchEnter()" style="border: none;width: 73%;">							
									<input id="searchBtn" style="border: none; background: white;border-left: 1px solid #3cb454;text-align: center;" type="submit" value="검색">
								</div>	
                                <sec:csrfInput/>
                            </form>
                        </div>
                    </div>
                    <!-- 국내 도서 리스트(전체) -->
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-one-example1" role="tabpanel" aria-labelledby="pills-one-example1-tab">
                            <!-- Mockup Block -->
	                           <ul class="products list-unstyled row no-gutters row-cols-2 row-cols-lg-3 row-cols-wd-4 border-top border-left mb-6">
	                           <c:set value="${pagingVO.dataList }" var="bookList"/>  
	                                         
	                           <c:choose>
	                           		<c:when test="${empty bookList }">
	                           			<li class="w-100">
	                           				<h6>검색결과가 존재하지 않습니다...</h6>
	                           			</li>
	                           		</c:when>                       	
	                           		<c:otherwise>
	                           			<c:choose>
	                           				<c:when test="${pagingVO.ccg_b002 eq null }">
	                           					<c:forEach items="${bookList }" var="book" varStatus="status">
					                                <li class="product col prodItem" data-index="${status.index }" style="border-radius: 10px;">
					                                    <div class="product__inner overflow-hidden p-3 p-md-4d875">
					                                        <div class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
					                                            <div class="woocommerce-loop-product__thumbnail">
					                                                <a href="/harubooks/detailBook?bookNo=${book.book_no }&ccg_b002=${book.ccg_b002 }" class="d-block"><img src="${book.book_cover }" class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid" alt="image-description"></a>
					                                            </div>
					                                            <div class="woocommerce-loop-product__body product__body pt-3 bg-white">
					                                                <div class="text-uppercase font-size-1 mb-1 text-truncate"><a href="/harubooks/detailBook?bookNo=${book.book_no }&ccg_b002=${book.ccg_b002 }">${book.getCcg_b001() }</a></div>
					                                                <h2 class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark"><a href="/harubooks/detailBook?bookNo=${book.book_no }&ccg_b002=${book.ccg_b002 }">${book.getBook_title() }</a></h2>
					                                                <div class="font-size-2  mb-1 text-truncate"><a href="/harubooks/detailBook?bookNo=${book.book_no }&ccg_b002=${book.ccg_b002 }" class="text-gray-700">${book.getBook_author() } / ${book.pub_nm }</a></div>
					                                                <div class="price d-flex align-items-center font-weight-medium font-size-3">
					                                                    <span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol"></span><fmt:formatNumber value="${book.getBook_amt() }" pattern="#,###" />원</span>
					                                                    <input type="hidden" value="${book.getBook_amt() }" id="price${status.index }">
					                                                    <input type="hidden" value="${book.book_no }" id="bookNo${status.index }">
					                                                    <input type="hidden" value="${book.book_cover }" id="bookCover${status.index }">
					                                                    <input type="hidden" value="${book.getBook_title() }" id="bookTitle${status.index }">
					                                                    <input type="hidden" value="${pagingVO.ccg_b002 }" id="ccg_b002${status.index }">
					                                                    <input type="hidden" value="${book.getCcg_b001() }" id="ccg_b001${status.index }">
					                                                </div>
					                                            </div>
					                                            <div class="product__hover d-flex align-items-center">
					                                                <a href="#" class="text-uppercase text-dark h-dark font-weight-medium mr-auto addToCartBtn" data-toggle="tooltip" data-placement="right" title="" data-original-title="ADD TO CART" data-index="${status.index }">
					                                                    <span class="product__add-to-cart" >장바구니 추가</span>
					                                                    <span class="product__add-to-cart-icon font-size-4"><i class="flaticon-icon-126515"></i></span>
					                                                </a>
					                                               
					                                                <!-- 찜목록 추가하기 -->
					                                                <a href="#" class="h-p-bg btn btn-outline-primary border-0 wishListBtn" data-index = "${status.index }">
					                                                    <i class="flaticon-heart"></i>
					                                                </a>
					                                            </div>
					                                        </div>
					                                    </div>
					                                </li>
					                            </c:forEach>		
	                           				</c:when>
	                           				<c:otherwise>
	                           					<c:forEach items="${bookList }" var="book" varStatus="status">
					                                <li class="product col prodItem" data-index="${status.index }">
					                                    <div class="product__inner overflow-hidden p-3 p-md-4d875">
					                                        <div class="woocommerce-LoopProduct-link woocommerce-loop-product__link d-block position-relative">
					                                            <div class="woocommerce-loop-product__thumbnail">
					                                                <a href="/harubooks/detailBook?bookNo=${book.book_no }&ccg_b002=${pagingVO.ccg_b002 }" class="d-block"><img src="${book.book_cover }" class="img-fluid d-block mx-auto attachment-shop_catalog size-shop_catalog wp-post-image img-fluid" alt="image-description"></a>
					                                            </div>
					                                            <div class="woocommerce-loop-product__body product__body pt-3 bg-white">
					                                                <div class="text-uppercase font-size-1 mb-1 text-truncate"><a href="/harubooks/detailBook?bookNo=${book.book_no }&ccg_b002=${pagingVO.ccg_b002 }">${book.getCcg_b001() }</a></div>
					                                                <h2 class="woocommerce-loop-product__title product__title h6 text-lh-md mb-1 text-height-2 crop-text-2 h-dark"><a href="/harubooks/detailBook?bookNo=${book.book_no }&ccg_b002=${pagingVO.ccg_b002 }">${book.getBook_title() }</a></h2>
					                                                <div class="font-size-2  mb-1 text-truncate"><a href="/harubooks/detailBook?bookNo=${book.book_no }&ccg_b002=${pagingVO.ccg_b002 }" class="text-gray-700">${book.getBook_author() } / ${book.pub_nm }</a></div>
					                                                <div class="price d-flex align-items-center font-weight-medium font-size-3">
					                                                    <span class="woocommerce-Price-amount amount"><span class="woocommerce-Price-currencySymbol"></span><fmt:formatNumber value="${book.getBook_amt() }" pattern="#,###" />원</span>
					                                                    <input type="hidden" value="${book.getBook_amt() }" id="price${status.index }">
					                                                    <input type="hidden" value="${book.book_no }" id="bookNo${status.index }">
					                                                    <input type="hidden" value="${book.book_cover }" id="bookCover${status.index }">
					                                                    <input type="hidden" value="${book.getBook_title() }" id="bookTitle${status.index }">
					                                                    <input type="hidden" value="${pagingVO.ccg_b002 }" id="ccg_b002${status.index }">
					                                                    <input type="hidden" value="${book.getCcg_b001() }" id="ccg_b001${status.index }">
					                                                    
					                                                </div>
					                                            </div>
					                                            <div class="product__hover d-flex align-items-center">
					                                                <a href="#" class="text-uppercase text-dark h-dark font-weight-medium mr-auto addToCartBtn" data-toggle="tooltip" data-placement="right" title="" data-original-title="ADD TO CART" data-index="${status.index }">
					                                                    <span class="product__add-to-cart" >장바구니 추가</span>
					                                                    <span class="product__add-to-cart-icon font-size-4"><i class="flaticon-icon-126515"></i></span>
					                                                </a>
					                                               
					                                                <!-- 찜목록 추가하기 -->
					                                                <a href="#" class="h-p-bg btn btn-outline-primary border-0 wishListBtn" data-index = "${status.index }">
					                                                    <i class="flaticon-heart"></i>
					                                                </a>
					                                            </div>
					                                        </div>
					                                    </div>
					                                </li>
					                            </c:forEach>		
	                           				</c:otherwise>
	                           			</c:choose>		
	                           		</c:otherwise>		
	                           </c:choose>	                           			
	                           </ul>
                            <!-- End Mockup Block -->
                        </div>
                    </div>
                    <!-- End Tab Content -->

                    <!--페이징 -->
                    <div class="" id="pagingArea" style="background: none; border: none; display: flex;align-items: center;justify-content: center;margin: 0 auto;">
                    	${pagingVO.pagingHTML }
                    </div>
                </div>
                <div id="secondary" class="sidebar widget-area order-1" role="complementary">
                    <div id="widgetAccordion">
                        <div id="woocommerce_product_categories-2" class="widget p-4d875 border woocommerce widget_product_categories">
                            <div id="widgetHeadingOne" class="widget-head">
                                <a class="d-flex align-items-center justify-content-between text-dark" href="#"
                                    data-toggle="collapse"
                                    data-target="#widgetCollapseOne"
                                    aria-expanded="true"
                                    aria-controls="widgetCollapseOne">

                                    <h3 class="widget-title mb-0 font-weight-bold font-size-3 ">도서 분류</h3>

                                    <svg class="mins" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="2px">
                                        <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                    </svg>

                                    <svg class="plus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="15px">
                                        <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                    </svg>
                                </a>
                            </div>

                            <div id="widgetCollapseOne" class="mt-3 widget-content collapse show"
                                aria-labelledby="widgetHeadingOne"
                                data-parent="#widgetAccordion">
                                <ul class="product-categories">
                                    <li class="cat-item cat-item-9 cat-parent">
                                        <a href="/harubooks/category?ccg_b002=국내도서">국내도서</a>
                                    </li>
                                    <li class="cat-item cat-item-69 cat-parent">
                                        <a href="/harubooks/category?ccg_b002=해외도서">해외도서</a>
                                    </li>
                                    <li class="cat-item cat-item-65 cat-parent">
                                    	<a href="/harubooks/category?ccg_b002=인터넷도서">e-Book</a>
                                    </li>
                                    
                                </ul>
                            </div>
                        </div>

                        <div id="Authors" class="widget widget_search widget_author p-4d875 border">
                            <div id="widgetHeading21" class="widget-head">
                                <a class="d-flex align-items-center justify-content-between text-dark" href="#"
                                    data-toggle="collapse"
                                    data-target="#widgetCollapse21"
                                    aria-expanded="true"
                                    aria-controls="widgetCollapse21">

                                    <h3 class="widget-title mb-0 font-weight-bold font-size-3">카테고리</h3>

                                    <svg class="mins" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="2px">
                                        <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                    </svg>

                                    <svg class="plus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="15px">
                                        <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                    </svg>
                                </a>
                            </div>
                            <!--도서 카테고리-->
                            <div id="widgetCollapse21" class="mt-4 widget-content collapse show"
                                aria-labelledby="widgetHeading21"
                                data-parent="#widgetAccordion">
                                <c:set value="${category }" var="category"/>
                                <ul class="product-categories">
                                	<c:forEach items="${category }" var="category">
	                                    <li class="cat-item cat-item-9 cat-parent"><a href="/harubooks/category?ccg_b002=${pagingVO.ccg_b002 }&&ccg_b003=${category}">${category }</a></li>                                	
                                	</c:forEach>
                                    
                                </ul>
                            </div>
                        </div>
                        <!--최근 본책 -->
                        <div id="Featuredbooks" class="widget p-4d875 border">
                            <div id="widgetHeading25" class="widget-head">
                                <a class="d-flex align-items-center justify-content-between text-dark" href="#"
                                    data-toggle="collapse"
                                    data-target="#widgetCollapse25"
                                    aria-expanded="true"
                                    aria-controls="widgetCollapse25">

                                    <h3 class="widget-title mb-0 font-weight-bold font-size-3">최근본책</h3>

                                    <svg class="mins" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="2px">
                                        <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                    </svg>

                                    <svg class="plus" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="15px" height="15px">
                                        <path fill-rule="evenodd" fill="rgb(22, 22, 25)" d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                    </svg>
                                </a>
                            </div>
							<!-- 최근 본책 리스트  -->
                            <div id="widgetCollapse25" class="mt-5 widget-content collapse show"
                                aria-labelledby="widgetHeading25"
                                data-parent="#widgetAccordion">
<!--                                 <div class="mb-5"> -->
<!--                                     <div class="media d-md-flex"> -->
<!--                                         <a class="d-block" href="../shop/book-detail.html"> -->
<!--                                             <img class="img-fluid" src="https://placehold.it/60x92" alt="Image-Description"> -->
<!--                                         </a> -->
<!--                                         <div class="media-body ml-3 pl-1"> -->
<!--                                             <h6 class="font-size-2 text-lh-md font-weight-normal"> -->
<!--                                                 <a href="">최근 본책1</a> -->
<!--                                             </h6> -->
<!--                                             <span class="font-weight-medium">책 가격</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" value='<sec:authentication property="name"/>' id="secId">
    <!-- ====== END MAIN CONTENT ====== -->

    <!-- ========== FOOTER ========== -->


    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="/resources/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script src="/resources/assets/vendor/jquery-migrate/dist/jquery-migrate.min.js"></script>
    <script src="/resources/assets/vendor/popper.js/dist/umd/popper.min.js"></script>
    <script src="/resources/assets/vendor/bootstrap/bootstrap.min.js"></script>
    <script src="/resources/assets/vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
    <script src="/resources/assets/vendor/slick-carousel/slick/slick.min.js"></script>
    <script src="/resources/assets/vendor/multilevel-sliding-mobile-menu/dist/jquery.zeynep.js"></script>
    <script src="/resources/assets/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>


    <!-- JS HS Components -->
    <script src="/resources/assets/js/hs.core.js"></script>
    <script src="/resources/assets/js/components/hs.unfold.js"></script>
    <script src="/resources/assets/js/components/hs.malihu-scrollbar.js"></script>
    <script src="/resources/assets/js/components/hs.header.js"></script>
    <script src="/resources/assets/js/components/hs.slick-carousel.js"></script>
    <script src="/resources/assets/js/components/hs.selectpicker.js"></script>
    <script src="/resources/assets/js/components/hs.show-animation.js"></script>

    <!-- JS Bookworm -->
    <!-- <script src="/resources/assets/js/bookworm.js"></script> -->
    <script>
        $(document).on('ready', function () {
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
                onClosed: function () {
                    // enable main wrapper element clicks on any its children element
                    $("body main").attr("style", "");

                    console.log('the side menu is closed.');
                },
                onOpened: function () {
                    // disable main wrapper element clicks on any its children element
                    $("body main").attr("style", "pointer-events: none;");

                    console.log('the side menu is opened.');
                }
            });

            // handle zeynep overlay click
            $(".zeynep-overlay").click(function () {
                zeynep.close();
            });

            // open side menu if the button is clicked
            $(".cat-menu").click(function () {
                if ($("html").hasClass("zeynep-opened")) {
                    zeynep.close();
                } else {
                    zeynep.open();
                }
            });
        });
        var searchForm = document.getElementById("searchForm");
        var pagingArea = document.getElementById("pagingArea");
        var pageNo = 1;
        let page = document.querySelector('#page');
        pagingArea.addEventListener("click", function(event) {
            event.preventDefault();
            if(event.target.tagName === 'SPAN'){            	
            	let dd = event.target.innerText;
            	pageNo = dd;
            	page.value = pageNo; 
            }else{
	            pageNo = event.target.getAttribute("data-page"); // 페이지 번호가 넘어옴
	            page.value = pageNo;            	
            }
            searchForm.submit();
        });
        
        
        // 장바구니 추가 클릭시 이벤트
        let secId = document.querySelector("#secId").value;
        let basketList = document.querySelectorAll(".addToCartBtn");
        basketList.forEach(function(item){
        	item.addEventListener('click', function () {
    	        	let index = item.getAttribute("data-index");
    	        	let bookNo = document.querySelector("#bookNo"+index).value;
    	        	let price = document.querySelector("#price"+index).value;
    	        	console.log(secId)
    	        	console.log(bookNo)
    	        	console.log(price)
    	                if (secId == 'anonymousUser') {
    	                    Swal.fire({
    	                        title: '장바구니추가는 로그인이 필요합니다',
    	                        text: '로그인 하시겠습니까?',
    	                        icon: 'question',
    	                        iconHtml: '!',
    	                        confirmButtonText: '네',
    	                        cancelButtonText: '아니요',
    	                        showCancelButton: true,
    	                        showCloseButton: true
    	                    }).then(function (result) {
    	                        if (result.isConfirmed) {
    	                            // '네' 버튼을 클릭한 경우
    	                            window.location.href = '/login/signinForm'; // 장바구니 페이지로 이동
    	                        } else {
    	                            return false;
    	                        }
    	                    });
    	                }else{
    		                Swal.fire({
    		                    title: '장바구니에 추가하시겠습니까?',
    		                    icon: 'question',
    		                    iconHtml: '?',
    		                    confirmButtonText: '네',
    		                    cancelButtonText: '아니요',
    		                    showCancelButton: true,
    		                    showCloseButton: true
    		                }).then(function (result) {
    		                    if (result.isConfirmed) {
    		                        // '네' 버튼을 클릭한 경우
    		                        let info = {
    		                            "cart_cnt": "1",    // 수량
    		                            "totalPrice": price,
    		                            "book_no": bookNo,
    		                            "ae_id" : secId
    		                        };
    		                        let xhr = new XMLHttpRequest();
    		                        xhr.open("post", "/harubooks/basketList",true);
    		                        xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
    		                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    		                        xhr.onreadystatechange = function () {
    		                            if (xhr.readyState == 4 && xhr.status == 200) {
    		                            	const swalWithBootstrapButtons = Swal.mixin({
    		                                    customClass: {
    		                                        confirmButton: 'btn btn-success',
    		                                        cancelButton: 'btn btn-danger'
    		                                    },
    		                                    buttonsStyling: false
    		                                })
    		                                let res = xhr.responseText;
    		                                if (res == 'OK') {
    		                                	
    		                                    Swal.fire({
    		                                        title: '장바구니에 추가되었습니다!',
    		                                        text: '장바구니로 이동 하시겠습니까?',
    		                                        icon: 'success',
    		                                        confirmButtonText: '장바구니로 이동',
    		                                        cancelButtonText: '아니요',
    		                                        showCancelButton: true,
    		                                        showCloseButton: true
    		                                    }).then(function (result) {
    		                                        if (result.isConfirmed) {
    		                                            // '네' 버튼을 클릭한 경우
    		                                            window.location.href = '/harubooks/myCart'; // 장바구니 페이지로 이동
    		                                        } else {
    		                                            return false;
    		                                        }
    		                                    });
    		                                } else if (res == 'EXIST') {
    		                                    swalWithBootstrapButtons.fire(
    		                                            '이미 장바구니에 존재합니다',
    		                                            '',
    		                                            'error'
    		                                    )
    		                                } else {
    		                                    return false;
    		                                }
    		                            }
    		                        }
    		                        xhr.send(JSON.stringify(info));
    		                    } else {
    		                        return false;
    		                    }
    		                });	
    	                }     
    	            })	
        })
        
        // 찜목록 추가
        let wishListBtn = document.querySelectorAll('.wishListBtn');
        wishListBtn.forEach(function(item){
        	item.addEventListener('click',function(){
        		let index = item.getAttribute("data-index");
        		let bookNo = document.querySelector("#bookNo"+index).value;
        		if (secId == 'anonymousUser') {
                    Swal.fire({
                        title: '찜하기는 로그인이 필요합니다',
                        text: '로그인 하시겠습니까?',
                        icon: 'question',
                        iconHtml: '!',
                        confirmButtonText: '네',
                        cancelButtonText: '아니요',
                        showCancelButton: true,
                        showCloseButton: true
                    }).then(function (result) {
                        if (result.isConfirmed) {
                            // '네' 버튼을 클릭한 경우
                            window.location.href = '/login/signinForm'; // 장바구니 페이지로 이동
                        } else {
                            return false;
                        }
                    });
                } else {
                    // 내가 찜한 목록 저장위치 경로 설정하기(권한도 비회원 제외 회원, 관리자, 출판사만 접근가능하게 조치)
                    const swalWithBootstrapButtons = Swal.mixin({
                        customClass: {
                            confirmButton: 'btn btn-success',
                            cancelButton: 'btn btn-danger'
                        },
                        buttonsStyling: false
                    })
                    Swal.fire({
                        title: '찜목록에 추가하시겠습니까?',
                        icon: 'question',
                        iconHtml: '?',
                        confirmButtonText: '네',
                        cancelButtonText: '아니요',
                        showCancelButton: true,
                        showCloseButton: true
                    }).then(function (result) {
                        if (result.isConfirmed) {
                            // '네' 버튼을 클릭한 경우
                            // 여기서 찜목록 추가하는 로직 설계를 해야한다. ajax로 비동기 처리한다.
                            console.log("책번호 : " + bookNo);
                            console.log("사용자 아이디 : " + secId);
                            let info = {
                                "book_no": bookNo,
                                "ae_id": secId
                            }
                            let xhr = new XMLHttpRequest();
                            xhr.open("post", "/harubooks/wishList", true);
                            xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");

                            xhr.onreadystatechange = function () {
                                if (xhr.readyState == 4 && xhr.status == 200) {
                                    let result = xhr.responseText;
                                    if (result == 'OK') {
                                        swalWithBootstrapButtons.fire(
                                            '추가 완료!',
                                            '찜목록에 추가되었습니다.',
                                            'success'
                                        )
                                    } else if (result == 'EXIST') {
                                        swalWithBootstrapButtons.fire(
                                            '이미 찜한 책이에요..',
                                            '',
                                            'error'
                                        )
                                    } else {
                                        return false;
                                    }
                                }
                            }
                            xhr.send(JSON.stringify(info));
                        } else {
                            return false;
                        }
                    });
                }
        	})
        })
        


        let recent = JSON.parse(localStorage.getItem('recent')) || [];
        let prodItem = document.querySelectorAll('.prodItem');
        prodItem.forEach(function(item){
            item.addEventListener('click',function(){
                let index = item.getAttribute("data-index");
                let bookNo = document.querySelector("#bookNo"+index).value;
    	        let price = document.querySelector("#price"+index).value;
                let bookCover = document.querySelector("#bookCover"+index).value;
                let bookTitle = document.querySelector("#bookTitle"+index).value;
                let ccg_b002 = document.querySelector("#ccg_b002"+index).value;
                let ccg_b001 = document.querySelector("#ccg_b001"+index).value;
               
                recent.push({"bookCover":bookCover,
                             "price":price,
                             "bookTitle":bookTitle,
                             "ccg_b002":ccg_b002,
                             "ccg_b001":ccg_b001,
                             "bookNo" : bookNo});
                if (recent.length > 3) {
                    recent.splice(0, recent.length - 3);
                }
                localStorage.setItem("recent",JSON.stringify(recent));
            })
        })
        let recentList = '';
        recent.forEach((product) => {
        		let wonPrice = parseInt(product.price).toLocaleString('ko-KR');
                recentList += `<div class="mb-5">`;
                recentList += `<div class="media d-md-flex">`;
                recentList += '<a class="d-block" href="/harubooks/detailBook?bookNo='+product.bookNo+'&ccg_b002='+product.ccg_b002+'">';
                recentList += `<img class="img-fluid" src="\${product.bookCover}" alt="Image-Description" style="width:60px;heigth:92;">`;
                recentList += `</a>`;
                recentList += `<div class="media-body ml-3 pl-1">`;
                recentList += `<h6 class="font-size-2 text-lh-md font-weight-normal">`;
                recentList += `<a href="/harubooks/detailBook?bookNo=\${product.bookNo}&ccg_b002=\${product.ccg_b002}">\${product.bookTitle}</a>`;
                recentList += `</h6>`;
                recentList += ` <span class="font-weight-medium">\${wonPrice}원</span>`;
                recentList += `</div>`;
                recentList += `</div>`;
                recentList += `</div>`;
                document.querySelector('#widgetCollapse25').innerHTML = recentList;
        });


    </script>
</body>
</html>
