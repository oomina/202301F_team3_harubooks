<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/resources/assets/css/myPage.css">
<link rel="stylesheet" href="/resources/assets/css/prod-order.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<meta name="_csrf_header" id="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" id="_csrf" content="${_csrf.token }"/>

<style>
#memberPw{
	border-radius: 7px; 
	border:1px solid #d5d5d5; 
	width : 500px; 
	height:44px; 
	padding-left:15px; 
	font-size: 14px; 
	font-family: 'Noto Sans KR', sans-serif;
}

#dPw{
	height:50px;
	width : 200px;
	border : none;
	color : white;
	background-color: #6A5ACD;;
	border-radius: 7px;
	font-weight: bold;
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
}

</style>
<body>
<input type='hidden' id="state" name="state"/>
<input type="hidden" id="msg" name="msg" value="${msg }"/>
<!-- 유저 아이디 -->
<input type="hidden" value="<sec:authentication property="name"/>" id="ae_id" name="ae_id">
	<div id="container">
		<div id="sidebar">
			<div>
				<p style="font-weight: bold;font-size: 24px;">마이페이지</p>
			</div>
			<div id="myInfo">
				<div class="info" style="display: flex; flex-direction: column;">
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
				<p style="font-size: 18px;font-weight: bold;">내 정보 수정</p>
			</div>
			<div id="prodInfo">
			<div>
				<p style="font-size: 18px; font-weight: bold">나의 정보 수정</p>
			</div>
			<div id="inquiryDetail">
					<div style="display: flex; flex-direction: column; border-bottom:1px solid black;">
						<p style="font-size: 28px; font-weight: bold; margin-right: 30px; margin-bottom: 10px; font-family: 'Noto Sans KR', sans-serif;" class="semi-title">비밀번호 확인</p>
					<div style="padding-left:15px; font-size: 14px; color : gray; padding-bottom : 30px;">안전한 개인정보보호를 위해 비밀번호를 입력해 주세요.</div>
					</div>
			<form action="/mypage/test?${_csrf.parameterName }=${_csrf.token}" method="post" id="modifyForm">
			<div style="margin-top : 30px; border-bottom : 1px solid lightgray; padding-bottom : 30px;">
			<div style="padding-left:10px;  font-size:14px; text-align: left; font-weight: bold; display: inline; font-family: 'Noto Sans KR', sans-serif;">비밀번호</div> 
			<div style="display: inline; padding-left: 50px;">
			<input type="password" name="memberPw"  id="memberPw" placeholder="비밀번호를 입력해주세요." /></div>
			</div>
			<div style="text-align: center; margin-top : 40px;6">
			<input id="dPw" type="submit" value="확인"/>
			</div>
			</form>
			<sec:csrfInput/>
			</div>
			</div>
		</div>
	</div>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" charset="utf-8"></script>
<script>

var modifyForm = document.querySelector("#modifyForm");
   
$("#dPw").on("click", function() {
	var memberPw = document.querySelector("#memberPw").value;
	
    if (memberPw.trim() === "") {
        Swal.fire({
            title: '비밀번호를 입력해주세요.',
            icon: 'error'
        });
        return false;
    }
});
</script>
</body>