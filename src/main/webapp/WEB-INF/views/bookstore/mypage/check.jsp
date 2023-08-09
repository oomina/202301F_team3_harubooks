<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
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
<title>탈퇴 페이지</title>

<style>
#out{
	font-size : 40px;
	margin-top : 180px;
	text-align: center;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
	color : #33b052;
}
#deleteBtn{
	margin-top : 70px;
	height:50px;
	width : 160px;
	border : none;
	color : white;
	background-color: #6A5ACD;
	border-radius: 7px;
	font-weight: bold;
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
}
#cancel{
	margin-top : 70px;
	height:50px;
	width : 160px;
	border : none;
	color : white;
	background-color: gray;
	border-radius: 7px;
	font-weight: bold;
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
}
#red{
	margin-top : 20px;
	font-size: 17px;
	color : red;
	text-align: center;
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
				<p style="font-size: 18px; font-weight: bold; margin-bottom: -10px;">나의 정보 탈퇴</p>
			</div>
			<div id="inquiryDetail">
					<div style="display: flex; flex-direction: column; border-bottom:1px solid gray;">
						<p style="font-size: 28px; font-weight: bold; margin-right: 30px; margin-bottom: 20px; font-family: 'Noto Sans KR', sans-serif;" class="semi-title">회원탈퇴 확인</p>
					</div>
					
					<div id="out">정말 탈퇴 하시겠습니까?</div>
					<div id="red">※삭제하시면 다시는 복구가 불가능합니다.※</div>
					
<form action="/mypage/delete?${_csrf.parameterName }=${_csrf.token}" method="post" id="delForm">
<input type="hidden" id="ae_id" name="ae_id" value="${userId}"/>
<div style="text-align: center;"><button id="cancel" name="cancel" type="button" onclick="location.href='/harubooks/main'">탈퇴 취소</button>&nbsp;&nbsp;
<button type="submit" id="deleteBtn">회원탈퇴</button></div>
<sec:csrfInput/>
</form>
</div>
</div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" charset="utf-8"></script>
<script>
var delForm = document.querySelector("#delForm");

$("#deleteBtn").on("click", function(event) {
	  event.preventDefault();
	  Swal.fire({
	    title: "확인 버튼을 누르시면 탈퇴가 완료됩니다.",
	    icon: "question",
	    showDenyButton: true,
	    confirmButtonText: '확인',
	    denyButtonText: '취소',
	  }).then((result) => {
	    if (result.isConfirmed) {
	      Swal.fire({
	        title: '탈퇴가 완료되었습니다.',
	        icon: 'success'
	      }).then((result) => {
	    	  delForm.submit();
	      });
	    } else {
	      Swal.fire({
	        title: '탈퇴가 취소되었습니다.',
	        icon: 'warning'
	      });
	    }
	  });
	});

</script>
</body>
