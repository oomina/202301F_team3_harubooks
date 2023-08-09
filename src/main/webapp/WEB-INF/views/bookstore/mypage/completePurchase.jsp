<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/resources/assets/css/myPage.css">
<link rel="stylesheet" href="/resources/assets/css/prod-order.css">
<body>
	<div id="container">
		<div id="sidebar">
			<div>
				<p style="font-weight: bold;font-size: 24px;">마이페이지</p>
			</div>
			<div id="myInfo">
				<div class="info" style="display: flex;flex-direction: column;">
					<div style="display: flex;margin: 0 auto; flex-direction: column;">
						<p style="font-size: 18px;color: white;margin: 5px;font-weight: bold;">${userInfo.user_nm }님</p>
						<div style="background-color: #3cb454;height: 24px;border-radius: 15px;"><p style="margin-bottom: 0px;color: white;text-align: center;font-weight: bold;">${userInfo.rank_name }</p></div>
					</div>
					<div id="info-1" style="display: flex;flex-direction: column;width: 90%;margin: 0 auto;margin-top: 20px;">
						<div style="display: flex;justify-content: space-between;align-items: center;">
							<p style="font-size: 13px;color: white;">보유 마일리지</p><p style="font-size: 15px;color: white;font-weight: bold;">${userInfo.mbr_mileage }P</p>
						</div>
						<div style="display: flex;justify-content: space-between;align-items: center;">
							<p style="font-size: 13px;color: white;">찜 목록</p><p style="font-size: 15px;color: white;font-weight: bold;">${wishCnt }개</p>
						</div>
						<div style="display: flex;justify-content: space-between;align-items: center;">
							<p style="font-size: 13px;color: white;">장바구니</p><p style="font-size: 15px;color: white;font-weight: bold;">${cartCnt }개</p>
						</div>
					</div>
				</div>
			</div>
			<div id="category">
				<div class="categoryInfo">
					<p>쇼핑내역</p>
					<a href="/harubooks/myPage/orderList?status=order">주문/배송목록</a>
					<a href="/harubooks/myPage/orderList?status=complete" >구매확정목록</a>
					<a href="/harubooks/myPage/orderList?status=refund">환불내역</a>
					<a href="/wish/list" >찜 목록</a>
					<a href="/harubooks/myCart">장바구니 목록</a>
				</div>
				<div class="categoryInfo">
					<p>문의 내역</p>
					<a href="/inquiry/list" >1:1문의</a>
				</div>
				<div class="categoryInfo">
					<p>나의 정보</p>
					<a href="/mypage/agree" >내 정보 수정</a>
				</div>
			</div>
		</div>
		<div id="content">
			<div>
				<p style="font-size: 18px;font-weight: bold;">구매확정</p>
			</div>
			<div id="contentInfo">
				<div class="deliveryInfo" style="width: 24%;">
					<div>
						<p class="di-1">주문내역</p>
					</div>
					<div>
						<p class="di-2"><a href="/harubooks/myPage/orderList?status=order" style="color: #767676;">주문/배송안내</a></p>
					</div>
				</div>
				<div class="deliveryInfo" style="width: 18%;">
					<div>
						<p class="di-1">${preparedDelivery }</p>
					</div>
					<div>
						<p class="di-2">배송 준비중</p>
					</div>
				</div>
				<div class="deliveryInfo" style="width: 18%;">
					<div>
						<p class="di-1">${DeliveringCnt }</p>
					</div>
					<div>
						<p class="di-2">배송중</p>
					</div>
				</div>
				<div class="deliveryInfo" style="width: 18%;">
					<div>
						<p class="di-1">${finishDelivery }</p>
					</div>
					<div>
						<p class="di-2">배송완료</p>
					</div>
				</div>
				<div class="deliveryInfo" style="width: 18%; border: none;">
					<div>
						<p class="di-1">${refundCnt }</p>
					</div>
					<div>
						<p class="di-2"><a href="/harubooks/myPage/orderList?status=refund">환불</a></p>
					</div>
				</div>
			</div>
			
			<div id="prodInfo">
				<div>
					<p style="font-size: 18px; font-weight: bold;">구매확정 목록&nbsp;<span style="font-size: 16px;color: #5055b1;">(총 <span id="totalPost"></span>개)</span></p>
				</div>
				<div id="completeDelivery">
					<div style="border-bottom:1px solid #d5d5d5; display: flex; flex-direction: column;">
						<p style="font-size: 16px; font-weight: bold; margin-right: 100px;"class="semi-title">구매확정 상품</p>
					</div>
					<div id="printCompleteDelivery" style="display: flex;flex-direction: column;"></div>
				</div>
				<div id="printPaging" style="display: flex; align-items: center;margin-top: 20px;"></div>
			</div>
		</div>
	</div>
	
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--결제 API -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	
	//  환불 대기/완료 리스트 출력하기
	let printCompleteDelivery = document.querySelector('#printCompleteDelivery');
	let printPaging = document.querySelector('#printPaging');
	let existCnt = 0;
	let page = 1;
	let totalPost = document.querySelector('#totalPost');
	function ajaxPaging(page){
		let xhr2 = new XMLHttpRequest();
		xhr2.open("get","/harubooks/myPage/completePurchase?page="+page,true);
		xhr2.onload = function(){
			if(xhr2.status == 200){
				var data2 = JSON.parse(xhr2.responseText);
				totalPost.innerText = data2.pagingVO.totalPostCnt;
				let code = "";
				if(data2.resultList == '' || data2.resultList == null){
					code += "<div style='width: 90%;height: 120px; margin: 0 auto; display: flex;margin-top: 20px;margin-bottom: 20px;align-items: center;'>";
					code += "<div class='bookInfo' style='width: 100%;font-size: 16px;font-weight: bold;'><p style='text-align: center;'>배송된 상품이 존재하지 않습니다</p></div>";
					code += "</div>";
				}else{
						for (let i = 0; i < data2.resultList.length; i++) {				
							code += "<div style='width: 95%;height: 120px; margin: 0 auto; display: flex;margin-top: 20px;margin-bottom: 20px;align-items: center;'>";
							code += "<div class='bookInfo' style='width: 30%;font-size: 14px;font-weight: bold;display:flex; flex-direction:column;'><p>[주문번호]</p><p style='color:#5055b1;'>" + data2.resultList[i].order_no + "</p></div>";
							code += "<div class='bookInfo' style='width: 90px;height: 90%;'><img style='width: 100%; height: 90%' alt='' src='" + data2.resultList[i].book_cover + "'></div>";
							code += "<div class='bookInfo' style='width: 55%;font-size: 14px;font-weight: bold;'><p>[" + data2.resultList[i].ccg_b001 + "] " + data2.resultList[i].book_title + "</p></div>";
							code += "<div class='bookInfo' style='width: 15%; font-size: 14px;'><p>" + data2.resultList[i].pl_cnt + "개</p></div>";
							code += "<div class='bookInfo' style='width: 20%;font-weight: bold;font-size: 14px;display:flex; flex-direction:column;'><p>[구매금액]</p><p>" + parseInt(data2.resultList[i].book_ntsl_amt * data2.resultList[i].pl_cnt).toLocaleString() + "원</p></div>";
							code += "<div class='bookInfo' style='width: 20%;font-weight: bold;font-size: 14px;'><button class='reviewBtn' style='background:white;color:black;border-radius:10px;border:1px solid #5055b1;font-weight:bold;height:40px;color:#5055b1;'>리뷰작성</button></div>";
							code += "</div>";
						}
						code2 = data2.pagingVO.pagingHtml;
						if(data2.resultList == null){
							code += "<div style='width: 90%;height: 120px; margin: 0 auto; display: flex;margin-top: 20px;margin-bottom: 20px;align-items: center;'>";
							code += "<div class='bookInfo' style='width: 100%;font-size: 16px;font-weight: bold;'><p style='text-align: center;'>구매확정 내역이 존재 하지않습니다.</p></div>";
							code += "</div>";
						}
				}
				printCompleteDelivery.innerHTML = code;
				printPaging.innerHTML = code2;

				
				let reviewBtn = document.querySelectorAll('.reviewBtn');
				for(let j=0; j<reviewBtn.length; j++){
					reviewBtn[j].addEventListener('click',function(){
						location.href = "/harubooks/detailBook?bookNo="+data2.resultList[j].book_no+"&ccg_b002="+data2.resultList[j].ccg_b002+"#reviewContent";
					})
				}
			}
		}
		xhr2.send();		
	}
	ajaxPaging(page);
	
	printPaging.addEventListener('click',function(event){
		event.preventDefault();
		var pageNo = event.target.getAttribute("data-page");
		page = pageNo;
		ajaxPaging(page);
	})
</script>
