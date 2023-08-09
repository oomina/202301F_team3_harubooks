<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/resources/assets/css/prod-order.css">
<body>
	<div id="container">
	<input type="hidden" value="<sec:authentication property="name"/>" id="buyerId">
		<div id="container-1">
			<div class="info-content" style="margin-top: 60px; border: none;">
				<c:if test="${empty sessionScope['SPRING_SECURITY_CONTEXT'] }">
					<p style="font-size: 25px; font-weight: bold;">비회원 주문/결제</p>
				</c:if>
				<c:if test="${not empty sessionScope['SPRING_SECURITY_CONTEXT'] }">
					<p style="font-size: 25px; font-weight: bold;">주문/결제</p>
				</c:if>
			</div>
			<c:if test="${empty sessionScope['SPRING_SECURITY_CONTEXT']}">
				<div class="info-content" style="background-color: #f7f7f7;">
					<div style="margin-top: 30px;">
						<p style="font-size: 14px; color: #595959; text-align: center;">"비회원으로 주문시에는 할인, 마일리지 적립의 혜택을 받을 수 없습니다."</p>
					</div>
					<div style="display: flex; align-items: center; justify-content: center; margin-bottom: 30px;">
						<button onclick="location.href='/login/signupForm'" id="signupBtn" style="margin-right: 20px; width: 102px; height: 44px; border: 1px solid #5055b1; border-radius: 15px; background-color: white;"><span style="color: #5055b1; font-weight: bold;">회원가입</span></button> 
						<button onclick="location.href='/login/signinForm'" id="signinBtn" style="margin-left: 20px; width: 89px; height: 44px; border: 1px solid #5055b1; background-color: #5055b1; border-radius: 15px;"><span style="color: white; font-weight: bold;">로그인</span></button>
					</div>
				</div>
			</c:if>
			<div class="info-content" id="orderInfo">
				<div>
					<p style="font-size: 18px; font-weight: bold;" class="semi-title">주문자 입력정보</p>
				</div>
				<div id="inputInfo">
					<c:if test="${not empty sessionScope['SPRING_SECURITY_CONTEXT']}">
						<input type="text" name="" value="${userInfo.user_nm }" class="inputInfo" disabled="disabled" id="buyerName">
						<input type="text" name="" value="${userInfo.mbr_email }" class="inputInfo" disabled="disabled" id="buyerEmail">
						<input type="text" name="" value="${userInfo.mbr_telNo }" class="inputInfo" style="margin-bottom: 20px;" disabled="disabled" id="buyerTel">
						<!-- 사용자 아이디 -->
						
					</c:if>
					
					<!--비회원일때만 보여줌-->
					<c:if test="${empty sessionScope['SPRING_SECURITY_CONTEXT']}">
						<input type="text" name="" value="" placeholder="이름을 입력해주세요." class="inputInfo" id="buyerName">
						<input type="text" name="" value="" placeholder="이메일 주소를 입력해주세요." class="inputInfo" id="buyerEmail">
						<input type="text" name="" value="" placeholder="휴대폰 번호를 입력해주세요." class="inputInfo" style="margin-bottom: 20px;" id="buyerTel">
						<p style="font-size: 14px; font-weight: bold;margin-bottom: 10px;">주문조회 비밀번호 입력</p>
						<input type="password" name="" value="" placeholder="비밀번호를 입력해주세요." class="inputInfo" id="nonMemPw">
						<input type="password" name="" value="" placeholder="비밀번호를 한번 더 입력해주세요." class="inputInfo">
					</c:if>

				</div>
			</div>
			<div class="info-content" id="addrInfo">
				<div>
					<p style="font-size: 18px; font-weight: bold;"class="semi-title">배송지 정보</p>
				</div>
				<c:if test="${not empty sessionScope['SPRING_SECURITY_CONTEXT']}">
					<div id="zipInfo">
						<div style="display: flex;">
							<input type="text" name="" value="${userInfo.mbr_zip }" id="postcode" class="inputInfo" readonly="readonly">
							<button id="postcodeBtn" style="margin-left: 20px; width: 25%; height: 44px; border: 1px solid #5055b1; background-color: #5055b1; border-radius: 15px;"><span style="color: white; font-weight: bold;">배송지 변경</span></button>
						</div>
						<input type="text" name="" value="${userInfo.mbr_addr }" id="address" class="inputInfo" readonly="readonly">
						<input type="text" name="" value="${userInfo.mbr_dAddr }" id="detailAddress" class="inputInfo">
					</div>
				</c:if>
				<c:if test="${empty sessionScope['SPRING_SECURITY_CONTEXT']}">
					<div id="zipInfo">
						<div style="display: flex;">
							<input type="text" name="" value="" placeholder="우편번호" id="postcode" class="inputInfo" readonly="readonly">
							<button id="postcodeBtn" style="margin-left: 20px; width: 25%; height: 44px; border: 1px solid #5055b1; background-color: #5055b1; border-radius: 15px;"><span style="color: white; font-weight: bold;">우편번호 찾기</span></button>
						</div>
						<input type="text" name="" value="" id="address" placeholder="주소를 입력해주세요." class="inputInfo" readonly="readonly">
						<input type="text" name="" value="" id="detailAddress" placeholder="상세주로를 입력해주세요." class="inputInfo">
					</div>
				</c:if>
			</div>
			<div class="info-content" id="prodInfo">
				<div style="border-bottom:1px solid #d5d5d5; display: flex;">
					<p style="font-size: 18px; font-weight: bold; margin-right: 100px;"class="semi-title">주문상품</p>
					<c:choose>
						<c:when test="${empty stat }">
							<p style="font-size: 14px; font-weight: bold; margin-right: 100px;"class="semi-title">총 ${cnt }개</p>
							<input type="hidden" value="${cnt }" id="prodCnt">
						</c:when>
						<c:otherwise>
							<p style="font-size: 14px; font-weight: bold; margin-right: 100px;"class="semi-title">총 ${cnt }개</p>
							<input type="hidden" value="${cnt }" id="prodCnt">
						</c:otherwise>
					</c:choose>		
				</div>
				<div style="display: flex;flex-direction: column;">
					<!--JSTL로 반복문 사용하여 주문상품 내역 출력하기-->
					<c:choose>
						<c:when test="${empty stat }">
							<div style="width: 90%;height: 120px; margin: 0 auto; display: flex;margin-top: 20px;margin-bottom: 20px;">
								<div style="width: 90px;height: 100%;"><img style="width: 100%; height: 100%" alt="" src="${book.book_cover }"></div>
								<div class="bookInfo" style="width: 45%;font-size: 14px;font-weight: bold;">
									<p>[${book.ccg_b002 }] ${book.book_title }</p>
								</div>
								<div class="bookInfo" style="width: 15%; font-size: 14px;">
									<p>${pl_cnt }개</p>
								</div>
								<div class="bookInfo" style="width: 30%;font-weight: bold;font-size: 14px;">
									<p>${book.book_ntsl_amt *pl_cnt }원</p>
								</div>
							</div>																
						</c:when>
						<c:otherwise>
							<c:forEach items="${cartList }" var="cartBook">
								<div style="width: 90%;height: 120px; margin: 0 auto; display: flex;margin-top: 20px;margin-bottom: 20px;">
									<div style="width: 90px;height: 100%;"><img style="width: 100%; height: 100%" alt="" src="${cartBook.book_cover }"></div>
									<div class="bookInfo" style="width: 45%;font-size: 14px;font-weight: bold;">
										<p>[${cartBook.ccg_b002 }] ${cartBook.book_title }</p>
									</div>
									<div class="bookInfo" style="width: 15%; font-size: 14px;">
										<p>${cartBook.cartVO.cart_cnt }개</p>
									</div>
									<div class="bookInfo" style="width: 30%;font-weight: bold;font-size: 14px;">
										<p><fmt:formatNumber value="${cartBook.book_ntsl_amt *cartBook.cartVO.cart_cnt }" pattern="#,###" />원</p>	
									</div>
								</div>			
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			

		</div>
		<div id="container-2" style="position: fixed;z-index: 100;right: 13%;">
			<div style=" width: 90%;margin: 0 auto; border: 1px solid #d5d5d5;margin-top: 60px;border-radius: 10px;">
				<div class="orderDecision">
					<div style="display: flex; justify-content: space-between;width: 90%;margin: 0 auto; margin-top: 20px;">
						<p class="subFont">상품금액</p>
						<c:choose>
							<c:when test="${empty stat }">
								<p class="subFont" style="font-weight: bold;"><fmt:formatNumber value="${book.book_ntsl_amt * pl_cnt }" pattern="#,###" />원</p>							
							</c:when>
							<c:otherwise>
								<p class="subFont" style="font-weight: bold;"><fmt:formatNumber value="${totalPrice }" pattern="#,###" />원</p>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="orderDecision">
					<div style="display: flex; justify-content: space-between;width: 90%;margin: 0 auto;">
						<p class="subFont">배송비</p>
						<p class="subFont">0원</p>
					</div>
				</div>
				<div class="orderDecision" style="margin-bottom: 20px; border-bottom: 1px solid #d5d5d5;">
					<div style="display: flex; justify-content: space-between;width: 90%;margin: 0 auto;">
						<p class="subFont">적립 마일리지</p>
						<c:if test="${empty sessionScope['SPRING_SECURITY_CONTEXT'] }">
							<p class="subFont" id="reciMileage">0P</p>	
						</c:if>
						<c:if test="${not empty sessionScope['SPRING_SECURITY_CONTEXT'] }">
							<c:if test="${empty stat }">
								<p class="subFont"><span id="reciMileage"><fmt:formatNumber value="${book.book_mileage * book.book_ntsl_amt }" type="number" pattern="#.#" /></span>P</p>
							</c:if>
							<c:if test="${not empty stat }">
								<p class="subFont"><span id="reciMileage"><fmt:formatNumber value="${0.05 * totalPrice }" type="number" pattern="#.#" /></span>P</p>
							</c:if>
						</c:if>
					</div>
				</div>
				<c:if test="${not empty sessionScope['SPRING_SECURITY_CONTEXT'] }">
					<div class="orderDecision" style="margin-bottom: 20px; border-bottom: 1px solid #d5d5d5;">
						<div style="display: flex; justify-content: space-between;width: 90%;margin: 0 auto; align-items: center;">
							<button type="button" id="mileageBtn" style="margin-bottom: 20px;height: 44px; border: 1px solid #5055b1; border-radius: 15px; background-color: white;"><span style="color: #5055b1; font-weight: bold;font-size: 12px;">마일리지 사용</span></button>
							<p class="subFont"> <span id="myMileage" style="color: #3fa715;font-weight: bold;">${userInfo.mbr_mileage }</span><span style="color: #3fa715;font-weight: bold;">P</span></p>
						</div>
						<div id="usageMileage" style="display: none;">
							<div id="usageMileage2">
								<input id="mileageVal" type="text" placeholder="사용하실  마일리지를 입력해주세요." style="margin-bottom: 20px;border : 1px solid #d5d5d5; border-radius: 10px;font-size: 10px; width: 220px;height: 30px; text-align: center;margin-right: 5%;">
								<button id="usageMileageBtn" style="width:60px; margin-bottom: 20px;height: 34px; border: 1px solid #5055b1; border-radius: 15px; background-color: #5055b1; "><span style="color: white; font-weight: bold;">적용</span></button>
							</div>
						</div>
					</div>
				</c:if>
				<div class="orderDecision">
					<div style="display: flex;flex-direction:column; width: 90%;margin: 0 auto;">
						<div style="display: flex;justify-content: space-between;width: 100%;margin: 0 auto;">
							<c:if test="${not empty sessionScope['SPRING_SECURITY_CONTEXT'] }">
								<p class="subFont" style="font-weight: bold;">적용 마일리지</p>
								<p class="subFont" style="font-size: 18px;font-weight: bold;">-<span id="usedMil">0</span>P</p>
							</c:if>
						</div>
						<div style="display: flex;justify-content: space-between;width: 100%;margin: 0 auto;">
							<p class="subFont" style="font-weight: bold;">최종결제금액</p>
							<c:if test="${empty sessionScope['SPRING_SECURITY_CONTEXT'] }">
								<p class="subFont" style="font-size: 18px;font-weight: bold;"><span id="finalPrice"><fmt:formatNumber value="${book.book_ntsl_amt * pl_cnt }" pattern="#,###" /></span>원</p>
							</c:if>
							<c:if test="${not empty sessionScope['SPRING_SECURITY_CONTEXT'] }">
								<c:if test="${not empty stat }">
									<p class="subFont" style="font-size: 18px;font-weight: bold;"><span id="finalPrice"><fmt:formatNumber value="${totalPrice }" pattern="#,###" /></span>원</p>
								</c:if>
								<c:if test="${empty stat }">
									<p class="subFont" style="font-size: 18px;font-weight: bold;"><span id="finalPrice"><fmt:formatNumber value="${book.book_ntsl_amt * pl_cnt }" pattern="#,###" /></span>원</p>
										<input type="hidden" value="${book.book_ntsl_amt }" id="book_ntsl_amt">
										<input type="hidden" value="${book.book_amt }" id="book_amt">
								</c:if>
							</c:if>
						</div>
					</div>
				</div>
				<div class="orderDecision" style="margin-bottom: 20px;">
					<div style="display: flex; justify-content: space-between;width: 90%;margin: 0 auto;">
						<!-- 현재 보유중인 마일리지 -->
						<input type="hidden" value="${userInfo.mbr_mileage }" id="currentMileage">
						<!-- 사용한 마일리지 -->
						<input type="hidden" value="0" id="usedMileage">					
						<button id="paymentBtn" style=" width: 100%; height: 44px; border: 1px solid #5055b1; background-color: #5055b1; border-radius: 15px;"><span style="color: white; font-weight: bold;">결제하기</span></button>													
					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" value="${stat }" id="stat">
	<input type="hidden" value="${book.book_no }" id="bookNo">
	<input type="hidden" value="${pl_cnt }" id="pl_cnt">
	
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!--결제 API -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
	// 다음 주소API
    var postcode = document.querySelector("#postcode");
    var postcodeBtn = document.querySelector('#postcodeBtn');
    var address = document.querySelector('#address');
    var detailAddress = document.querySelector('#detailAddress');
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                   
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                postcode.value = data.zonecode;
                address.value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                detailAddress.focus();
            }
       }).open();
    }
	postcodeBtn.addEventListener('click',function(){
		daumPostcode();
		console.log(document.querySelector('#buyerId').value)
	})
	
	// 회원가입한 클라이언트만 이용가능하다.
	if(document.querySelector('#buyerId').value != 'anonymousUser'){	
		// 마일리지 사용 버튼 클릭 이벤트
		let mileageBtn = document.querySelector('#mileageBtn');
		let usageMileage = document.querySelector('#usageMileage');
		let usageMileageBtn = document.querySelector('#usageMileageBtn');
		// 적용 마일리지 나타내는 곳
		let usedMil = document.querySelector('#usedMil');
		// 현재 보유중인 마일리지 히든값
		let currentMileage = document.querySelector('#currentMileage');
		// 사용할 마일리지
		let usedMileage = document.querySelector('#usedMileage');
		
		// 최종 결제금액
		let finalPrice = document.querySelector('#finalPrice');
		
		// 적립 예정 마일리지
		let reciMileage = document.querySelector('#reciMileage');
		
		// 현재 보유중인 마일리지 화면단
		let myMileage = document.querySelector('#myMileage');
		
		mileageBtn.addEventListener('click',function(){
			usageMileage.style.display = 'block';
		})
	
		usageMileageBtn.addEventListener('click',function(){
			// sweet alert 적용
			const swalWithBootstrapButtons = Swal.mixin({
	            customClass: {
	                confirmButton: 'btn btn-success',
	                cancelButton: 'btn btn-danger'
	            },
	            buttonsStyling: false
	        })
	        // 마일리지 입력값
			let mileageVal = document.querySelector('#mileageVal').value;
			if(mileageVal == ''){
				swalWithBootstrapButtons.fire(
	                    '마일리지를 입력해주세요',
	                    '',
	                    'error'
	            )
			}else if(isNaN(mileageVal)){
				swalWithBootstrapButtons.fire(
	                    '올바르지 않는 입력 값입니다.',
	                    '',
	                    'error'
	            )
			}else if(parseInt(mileageVal) > parseInt(currentMileage.value)){
				swalWithBootstrapButtons.fire(
	                    '사용가능한 마일리지가 초과되었습니다.',
	                    '',
	                    'error'
	            )
			}else if(parseInt(mileageVal)>(parseInt(finalPrice.innerText.replace(/[^\d.-]/g, ""))) || usedMileage.value>(parseInt(finalPrice.innerText.replace(/[^\d.-]/g, "")))){
				swalWithBootstrapButtons.fire(
	                    '마일리지가 최종 결제금액을 초과할 수 없습니다',
	                    '',
	                    'error'
	            )
			}else{
				formatFinalPrice = (parseInt(finalPrice.innerText.replace(/[^\d.-]/g, "")) - parseInt(mileageVal));
				finalPrice.innerText = formatFinalPrice.toLocaleString();
				usedMil.innerText = (parseInt(usedMil.innerText) + parseInt(mileageVal));
				usedMileage.value = (parseInt(usedMileage.value) + parseInt(mileageVal));
				myMileage.innerText = (parseInt(myMileage.innerText) - parseInt(mileageVal));
				currentMileage.value = (parseInt(currentMileage.value) - parseInt(mileageVal));
				reciMileage.innerText = 0;
				swalWithBootstrapButtons.fire(
	                    '마일리지 적용이 완료되었습니다.',
	                    '마일리지 사용 시 책 구매시 마일리지 적립은 하실 수 없습니다.',
	                    'success'
	            )
			}
		})
	}
	
	// 회원일때 결제 처리
	if(document.querySelector('#buyerId').value != 'anonymousUser'){ 
		
		// 결제 버튼 클릭시 이벤트
		let paymentBtn = document.querySelector('#paymentBtn');
		paymentBtn.addEventListener('click',function(){
			
			// 구매자 아이디 비회원은 이메일로 대체
			let ae_id = document.querySelector('#buyerId').value;
			// 총 구매 건수 다른책 3권샀으면 3
			let prodCnt = document.querySelector('#prodCnt').value;
			// 마일리지 사용 금액
			let useMile = usedMileage.value;;
			// 책번호 만약 바로구매로 들어왔을경우 책번호,수량 값 삽입가능 
			// 그러나 장바구니로 들어왔을경우엔 사용자 아이디로 서버단에서 장바구니목록으로 책 번호, 수량 삽입함
			let bookNo = document.querySelector('#bookNo').value; //책 번호
			let pl_cnt = document.querySelector('#pl_cnt').value; // 각 책당 개수
			// 구매자 주소, 상세주소, 우편번호
			let postcode = document.querySelector('#postcode').value; // 우편번호
			let address = document.querySelector('#address').value; //주소
			let detailAddress = document.querySelector('#detailAddress').value; // 상세주소
			// 구매자 이메일
			let buyerEmail = document.querySelector("#buyerEmail").value;
			// 구매자 핸드폰 번호
			let buyerTel = document.querySelector("#buyerTel").value;
			// 구매자 이름
			let buyerName = document.querySelector("#buyerName").value;
			
			// 구매 후 마일리지 적립 금액
			let reciMileage = document.querySelector("#reciMileage").innerText;
			
			// 현재 장바구니로 들어왔는지 바로 구매로 들어왔는지 여부체크
			let stat = document.querySelector("#stat").value;
			
			let data = {
				"buyerId" : ae_id,
				"prodCnt" : prodCnt,
				"useMile" : useMile,
				"bookNo" : bookNo,
				"pl_cnt" : pl_cnt,
				"postcode" : postcode,
				"address" : address,
				"detailAddress" : detailAddress,
				"buyerEmail" : buyerEmail,
				"buyerTel" : buyerTel,
				"buyerName" : buyerName,
				"reciMileage" : reciMileage,
			};
			// 장바구니를 통해들어온 데이터
			let cartData = {
				"buyerId" : ae_id,
				"prodCnt" : prodCnt,
				"useMile" : useMile,
				"postcode" : postcode,
				"address" : address,
				"detailAddress" : detailAddress,
				"buyerEmail" : buyerEmail,
				"buyerTel" : buyerTel,
				"buyerName" : buyerName,
				"reciMileage" : reciMileage,
				"stat" : stat,
			};

			var IMP = window.IMP; 
	    	IMP.init('imp17257104');	// 가맹점 식별 코드 
	    	IMP.request_pay({
	    		pg : "kakaopay", 
	        	pay_method : 'card',
	        	merchant_uid : 'merchant_' + new Date().getTime(),
	        	name : '결제',
	        	amount : prodCnt,
	        	buyer_email : buyerEmail,
	        	buyer_name : buyerName,
	        	buyer_tel : buyerTel,
	        	buyer_addr : address,
	        	buyer_postcode : postcode,
	        	m_redirect_url : 'redirect url'
	    	}, function(rsp) {
	        	if ( rsp.success ) {
					// 결제 성공했을때 로직 구현
	        		let xhr = new XMLHttpRequest();
					xhr.open("post","/harubooks/memOrder",true);
					xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					xhr.onreadystatechange = function(){
						if(xhr.readyState == 4 && xhr.status == 200){
							let res = xhr.responseText;
							if(res == 'OK'){
								location.href='/harubooks/orderComplete?ae_id='+ae_id;
							}else{
								alert("실패");
							}
						}
					}
					if(stat == 'cart'){
		            	xhr.send(JSON.stringify(cartData));						
					}else{
						xhr.send(JSON.stringify(data));	
					}
	        	} else {
	            	var msg = '결제에 실패하였습니다.';
					swalWithBootstrapButtons.fire(
					    '결제에 실패하였습니다',
					    '',
					    'error'
					)
	            	rsp.error_msg; 
	        	}
	    	});
		})
		
	}else{	// 비회원일때 결제 처리 
		// 결제 버튼 클릭시 이벤트
		let paymentBtn = document.querySelector('#paymentBtn');
		paymentBtn.addEventListener('click',function(){

			// 비회원 결제 비밀번호
			let nonMemPw = document.querySelector("#nonMemPw").value;
			console.log("결제 비밀번호 : "+nonMemPw);
			
			// 총 구매 건수 다른책 3권샀으면 3
			let prodCnt = document.querySelector('#prodCnt').value;
			console.log("총 구매 건수 : "+prodCnt);
			
			// 책번호 만약 바로구매로 들어왔을경우 책번호,수량 값 삽입가능 
			// 그러나 장바구니로 들어왔을경우엔 사용자 아이디로 서버단에서 장바구니목록으로 책 번호, 수량 삽입함
			let bookNo = document.querySelector('#bookNo').value; //책 번호
			console.log("책 번호 : "+bookNo);
			let pl_cnt = document.querySelector('#pl_cnt').value; // 각 책당 개수
			console.log("권당 책 개수 :"+pl_cnt);
			// 구매자 주소, 상세주소, 우편번호
			let postcode = document.querySelector('#postcode').value; // 우편번호
			console.log("우편번호 : "+postcode);
			let address = document.querySelector('#address').value; //주소
			console.log("주소 : "+address);
			let detailAddress = document.querySelector('#detailAddress').value; // 상세주소
			console.log("상세주소 : "+detailAddress);
			// 구매자 이메일
			let ae_id = document.querySelector("#buyerEmail").value;
			console.log("구매자 이메일 : "+buyerEmail);
			// 구매자 핸드폰 번호
			let buyerTel = document.querySelector("#buyerTel").value;
			console.log("구매자 전화번호 : "+buyerTel);
			// 구매자 이름
			let buyerName = document.querySelector("#buyerName").value;
			console.log("구매자 이름 : "+buyerName);
			
			let data = {
				"nonMemPw" : nonMemPw,
				"prodCnt" : prodCnt,
				"bookNo" : bookNo,
				"pl_cnt" : pl_cnt,
				"postcode" : postcode,
				"address" : address,
				"detailAddress" : detailAddress,
				"buyerEmail" : ae_id,
				"buyerTel" : buyerTel,
				"buyerName" : buyerName
			}
			var IMP = window.IMP; 
	    	IMP.init('imp17257104');	// 가맹점 식별 코드 
	    	IMP.request_pay({
	    		pg : "kakaopay", 
	        	pay_method : 'card',
	        	merchant_uid : 'merchant_' + new Date().getTime(),
	        	name : '결제',
	        	amount : prodCnt,
	        	buyer_email : buyerEmail,
	        	buyer_name : buyerName,
	        	buyer_tel : buyerTel,
	        	buyer_addr : address,
	        	buyer_postcode : postcode,
	        	m_redirect_url : 'redirect url'
	    	}, function(rsp) {
	        	if ( rsp.success ) {
					// 결제 성공했을때 로직 구현
	        		let xhr = new XMLHttpRequest();
					xhr.open("post","/harubooks/nonMemOrder",true);
					xhr.setRequestHeader("Content-Type","application/json;charset=utf-8");
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					xhr.onreadystatechange = function(){
						if(xhr.readyState == 4 && xhr.status == 200){
							let res = xhr.responseText;
							if(res == 'OK'){
								var msg = '결제가 완료되었습니다.';
								location.href='/harubooks/orderComplete?ae_id='+ae_id;
							}else{
								alert("실패");
							}
						}
					}
					xhr.send(JSON.stringify(data));
	        	} else {
	            	var msg = '결제에 실패하였습니다.';
					
	            	rsp.error_msg; 
	        	}
	    	});
		})
	}
</script>
