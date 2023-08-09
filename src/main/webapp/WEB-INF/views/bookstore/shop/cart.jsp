<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<body class="right-sidebar woocommerce-cart">
	<!--===== HEADER CONTENT =====-->



	<!--===== END HEADER CONTENT =====-->

	<!-- ====== MAIN CONTENT ====== -->
	<div class="page-header border-bottom">
		<div class="container">
			<div
				class="d-md-flex justify-content-between align-items-center py-4">
				<h1 class="page-title font-size-3 font-weight-medium m-0 text-lh-lg">장바구니
					목록</h1>
				<nav class="woocommerce-breadcrumb font-size-2">
					<a href="/harubooks/main" class="h-primary">Home</a> <span
						class="breadcrumb-separator mx-1"><i
						class="fas fa-angle-right"></i></span> <a href="/harubooks/myCart" class="h-primary">장바구니
						목록</a>
				</nav>
			</div>
		</div>
	</div>
	<div class="site-content overflow-hidden" id="content">
		<div class="container" style="background-color: white;">
			<header class="entry-header space-top-2 space-bottom-1 mb-2">
				<h1 class="entry-title font-size-7">장바구니에 담긴 책 <span style="color: #3cb454;font-weight: bold;">${cartCnt }</span>권</h1>
				<input type="hidden" value="${cartCnt }" id="cartCnt">
			</header>

			<div class="row pb-8">
				<div id="primary" class="content-area">
					<main id="main" class="site-main ">
						<div class="page type-page status-publish hentry">
							<!-- .entry-header -->
							<div class="entry-content">
								<div class="woocommerce">
									<form class="woocommerce-cart-form table-responsive" action="#"
										method="post">
										<table
											class="shop_table shop_table_responsive cart woocommerce-cart-form__contents">
											<thead>
												<tr>
													<th class="product-name">상품</th>
													<th class="product-price">가격</th>
													<th class="product-quantity">수량</th>
													<th class="product-subtotal">총 합계</th>
													<th class="product-remove">&nbsp;</th>
												</tr>
											</thead>

											<tbody>
												<c:choose>
													<c:when test="${empty cart }">
														<tr class="woocommerce-cart-form__cart-item cart_item">
															<td colspan="6">
																<p style="color: #767676;font-weight: bold;">장바구니에 담긴 상품이 없어요.</p>
															</td>
														</tr>
													</c:when>
													<c:otherwise>
														<c:forEach items="${cart }" var="book" varStatus="status">
															<input type="hidden" id="bookNo${status.index }" value="${book.book_no }">
															<tr class="woocommerce-cart-form__cart-item cart_item">
																<td class="product-name" data-title="Product">
																	<div class="d-flex align-items-center">
																		<a href="/harubooks/detailBook?bookNo=${book.book_no }&ccg_b002=${book.ccg_b002}&ccg_b003=${book.ccg_b003}"> <img src="${book.book_cover }"
																			class="attachment-shop_thumbnail size-shop_thumbnail wp-post-image"
																			alt="">
																		</a>
																		<div class="ml-3 m-w-200-lg-down">
																			<a href="/harubooks/detailBook?bookNo=${book.book_no }&ccg_b002=${book.ccg_b002}&ccg_b003=${book.ccg_b003}">${book.book_title }</a> 
																			<a
																				href="/harubooks/detailBook?bookNo=${book.book_no }&ccg_b002=${book.ccg_b002}&ccg_b003=${book.ccg_b003}" class="text-gray-700 font-size-2 d-block"
																				tabindex="0">${book.book_author }</a>
																		</div>
																	</div>
																</td>
			
																<td class="product-price" data-title="Price"><span
																	class="woocommerce-Price-amount amount"><span
																		class="woocommerce-Price-currencySymbol"><fmt:formatNumber value="${book.book_ntsl_amt }" pattern="#,###" /></span>원</span></td>
																															
																<td class="product-quantity" data-title="Quantity">
																	<div class="quantity d-flex align-items-center">
																		<!-- Quantity -->
																		<div class="border width-120">
																			<div class="js-quantity">
																				<div class="d-flex align-items-center">
																					<label class="screen-reader-text sr-only">Quantity</label>
																					 <input type="text"
																						class="input-text qty text js-result form-control text-center border-0" disabled="disabled"
																						step="1" min="1" max="100" name="quantity" value="x ${book.cartVO.cart_cnt }"
																						title="Qty"> 
																				</div>
																			</div>
																		</div>
																		<!-- End Quantity -->
																	</div>
																</td>
																																																	
																<td class="product-subtotal " data-title="Total"><span class="woocommerce-Price-amount amount prod-price">${book.book_ntsl_amt * book.getCartVO().getCart_cnt() }</span>원</td>
																<td class=""><a href="#" class="removeBooks" data-index="${status.index }"
																	aria-label="Remove this item"> <svg
																			xmlns="http://www.w3.org/2000/svg"
																			xmlns:xlink="http://www.w3.org/1999/xlink" width="15px"
																			height="15px">
			                                                                <path
																				fill-rule="evenodd" fill="rgb(22, 22, 25)"
																				d="M15.011,13.899 L13.899,15.012 L7.500,8.613 L1.101,15.012 L-0.012,13.899 L6.387,7.500 L-0.012,1.101 L1.101,-0.012 L7.500,6.387 L13.899,-0.012 L15.011,1.101 L8.613,7.500 L15.011,13.899 Z" />
			                                                            </svg>
																</a></td>
															</tr>														
														
														</c:forEach>
													</c:otherwise>
												</c:choose>
												
											</tbody>
										</table>
									</form>
								</div>
							</div>
							<!-- .entry-content -->
						</div>
					</main>
				</div>
				<div id="secondary" class="sidebar cart-collaterals order-1"
					role="complementary">
					<div id="cartAccordion"
						class="border border-gray-900 bg-white mb-5">
						<div class="p-4d875 border">
							<div id="cartHeadingOne" class="cart-head">
								<a
									class="d-flex align-items-center justify-content-between text-dark"
									href="#" data-toggle="collapse" data-target="#cartCollapseOne"
									aria-expanded="true" aria-controls="cartCollapseOne">

									<h3 class="cart-title mb-0 font-weight-medium font-size-3">총 상품 금액</h3> <svg class="mins" xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink" width="15px"
										height="2px">
                                        <path fill-rule="evenodd"
											fill="rgb(22, 22, 25)"
											d="M0.000,-0.000 L15.000,-0.000 L15.000,2.000 L0.000,2.000 L0.000,-0.000 Z" />
                                    </svg> <svg class="plus"
										xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink" width="15px"
										height="15px">
                                        <path fill-rule="evenodd"
											fill="rgb(22, 22, 25)"
											d="M15.000,8.000 L9.000,8.000 L9.000,15.000 L7.000,15.000 L7.000,8.000 L0.000,8.000 L0.000,6.000 L7.000,6.000 L7.000,-0.000 L9.000,-0.000 L9.000,6.000 L15.000,6.000 L15.000,8.000 Z" />
                                    </svg>
								</a>
							</div>

							<div id="cartCollapseOne" class="mt-4 cart-content collapse show"
								aria-labelledby="cartHeadingOne" data-parent="#cartAccordion">
								<table class="shop_table shop_table_responsive">
									<tbody>
										<tr class="cart-subtotal">
											<th>총 상품 금액</th>
											<td data-title="Subtotal" class="bookTotalPrice"></td>
										</tr>

										<tr class="order-shipping">
											<th>총 상품 수량</th>
											<td data-title="Shipping">총 ${cartCnt }권</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="p-4d875 border">
							<table class="shop_table shop_table_responsive">
								<tbody>
									<tr class="order-total">
										<th>총 상품 금액</th>
										<td data-title="Total" class="bookTotalPrice"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="wc-proceed-to-checkout" id="paymentBtn" style="height: 84px;">
						<button style="width:100%; height:70%; right: 5%;border: 1px solid #5055b1; background-color: #5055b1;border-radius: 10px;color: white;font-size: 16px;font-weight: bold;">결제하기</button>
							<input type="hidden" id="totalPrice" name="totalPrice">
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<!-- ====== END MAIN CONTENT ====== -->
	<script type="text/javascript">
		let totalPrice = document.querySelector('#totalPrice');
		let paymentBtn = document.querySelector('#paymentBtn');
		let prodPrices = document.querySelectorAll('.prod-price');
		let bookTotalPrices = document.querySelectorAll('.bookTotalPrice');
		let total = 0;
		prodPrices.forEach(function(prod){
			let prodPrice = parseInt(prod.innerText);
			total += prodPrice;
		})
		
		// 토탈 금액 넣기
		bookTotalPrices.forEach(function(price){
			price.innerText = total.toLocaleString()+"원";
		})
		totalPrice.value = total;
		console.log(total);
		
		//x 누르면 장바구니 목록에서 삭제 시키는 비동기통신처리
		let removeBooks = document.querySelectorAll(".removeBooks");
		
		removeBooks.forEach(function(book){
			book.addEventListener('click',function(){
				let index = book.getAttribute("data-index");
				let bookNo = document.querySelector('#bookNo'+index).value;
				let xhr = new XMLHttpRequest();
				xhr.open("get","/harubooks/cartDelete?bookNo="+bookNo);
				xhr.setRequestHeader("Content-Type","application/json;charset=utf-8");
				xhr.onreadystatechange = function(){
					if(xhr.readyState == 4 && xhr.status == 200){
						let res = xhr.responseText;
						if(res == 'OK'){
							location.reload();
						}
					}
				}
				xhr.send();
			})
		})
// 		&totalPrice="+total
		// 결제하기 버튼 클릭시 이벤트\
		let cartCnt = document.querySelector('#cartCnt').value;
		paymentBtn.addEventListener('click',function(){
			const swalWithBootstrapButtons = Swal.mixin({
				customClass: {
					confirmButton: 'btn btn-success',
					cancelButton: 'btn btn-danger'
				},
				buttonsStyling: false
			})
			if(cartCnt == "0"){
				swalWithBootstrapButtons.fire(
					'결제할 상품이 존재하지 않습니다',
					'장바구니에 상품을 추가해야 결제를 할 수 있습니다.',
					'error'
				)
			}else{
				location.href= "/harubooks/prodOrderForm?status=cart&totalPrice="+total;
			}
		})
	</script>
</body>

