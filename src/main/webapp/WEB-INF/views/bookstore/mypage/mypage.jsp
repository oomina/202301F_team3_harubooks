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

#word{
	margin-left : 10px;
	font-size : 14px;
	font-weight : bold;
	font: sans-serif;
}
#word2{
	margin-left : 178px;
	font-size : 14px;
	font-weight : bold;
	font: sans-serif;
}

#ae_id{
	border: none;
	margin-left: 130px;
	font-size : 15px;
	font-family: 'Noto Sans KR', sans-serif;
	margin-right: 100px;
}

#password{
	width : 30%;
	padding : 13px;
	height : 45px;
	border-radius: 5px;
	border:none;
	outline : 1px solid #D8D8D8;
	font-size: 14px;
	margin-left : 82px;
	margin-right: 30px;
}

#password2{
	width : 30%;
	padding : 13px;
	height : 45px;
	border-radius: 5px;
	border:none;
	outline : 1px solid #D8D8D8;
	font-size: 14px;
	margin-left : 53px;
	margin-right: 30px;
}
#name{
	width : 30%;
	padding : 13px;
	height : 45px;
	border-radius: 5px;
	border:none;
	outline : 1px solid #D8D8D8;
	font-size: 14px;
	margin-left : 124px;
	margin-right: 30px;
}
#mbr_telno{
	width : 30%;
	padding : 13px;
	height : 45px;
	border-radius: 5px;
	border:none;
	outline : 1px solid #D8D8D8;
	font-size: 14px;
	margin-left : 98px;
}

#postcode{
	width : 76%;
	line-height : 40px;
	border:none;
	font-size: 14px;
}
#address{
	width : 30%;
	padding : 13px;
	height : 45px;
	border-radius: 5px;
	border:none;
	outline : 1px solid #D8D8D8;
	font-size: 14px;
	margin-left : 126px;
}
#detailAddress{
	width : 30%;
	padding : 13px;
	height : 45px;
	border-radius: 5px;
	border:none;
	outline : 1px solid #D8D8D8;
	font-size: 14px;
	margin-left : 100px;
}
#birth{
	width : 30%;
	padding : 13px;
	height : 45px;
	border-radius: 5px;
	border:none;
	outline : 1px solid #D8D8D8;
	font-size: 14px;
	margin-left : 95px;
}
#email{
	width : 30%;
	padding : 13px;
	height : 45px;
	border-radius: 5px;
	border:none;
	outline : 1px solid #D8D8D8;
	font-size: 14px;
	margin-left : 124px;
}

#word1{
	margin-left : 10px;
	font-size : 14px;
	font-weight : bold;
	font: sans-serif;
	margin-right : 135px;
}
#m1{
	margin-left : 50px;
}
#hap{
	display : inline-block;
	border : 1px solid #D8D8D8;
	width : 30.3%;
	height : 45px;
	padding-left : 14px;
	border-radius: 5px;
	margin-left : 94px;
}
#postcodeBtn{
	border: none;
	background-color: #33b052;
	color : white;
	border-radius: 5px;
	width : 55px;
	line-height: 30px;
}
#modifyBtn{
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
#deleteBtn{
	height:50px;
	width : 200px;
	border : none;
	color : white;
	background-color: gray;
	border-radius: 7px;
	font-weight: bold;
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
}

</style>
<body>

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
				<p style="font-size: 18px; font-weight: bold">회원 정보 수정</p>
			</div>
			<div id="inquiryDetail">
					<div style="display: flex; flex-direction: column; border-bottom:1px solid black;">
					<p style="margin-top:30px; font-size: 18px; font-weight: bold; margin-right: 30px; font-family: 'Noto Sans KR', sans-serif;" class="semi-title">기본 정보</p>
					</div>
<form id="memberForm" action="/mypage/modify?${_csrf.parameterName }=${_csrf.token}" method="post">

<div style="padding-top : 25px; padding-left: 10px;">

<span id="word">아이디</span>
<input type="text" id="ae_id" name="ae_id" value="${userId}" readonly="readonly"> 

<span id="word">우편 번호</span>
<div id="hap">
<input type="text" id="postcode" name="mbr_zip" value="${member.mbr_zip }"  readonly="readonly"/>
<button id="postcodeBtn" onclick="daumPostcode()" type="button">검색</button> 
</div> <br/><br/>


<span id="word">새 비밀번호</span> <input type="password" id="password" name="ae_pw" placeholder="새 비밀번호를 입력해 주세요."/> 
<span id="word">주소 </span><input type="text" id="address" name="mbr_addr" value="${member.mbr_addr }" readonly="readonly"/>
<br/><br/>

<span id="word">새 비밀번호 확인</span> <input type="password" id="password2" placeholder="새 비밀번호를 한번 더 입력해 주세요."> 
<span id="word">상세 주소</span><input type="text" id="detailAddress" name="mbr_dAddr" value="${member.mbr_dAddr }"/>
<br/><br/>

<span id="word">이름</span> <input type="text" id="name" name="user_nm" value="${member.user_nm }" />
<span id="word">생년 월일</span> <input type="date" name="mbr_brdt" id="birth" value="${member.mbr_brdt}">
<br/><br/>
 
<span id="word1">성별</span> <input type="radio" name="mbr_gender" value="남자">남자
	   						<input type="radio" name="mbr_gender" id="m1" value="여자">여자
	   						
<span id="word2">메일</span> <input type="text" id="email" name="mbr_email" value="${member.mbr_email}"/>	   						
<br/><br/>
	   
<span id="word">전화번호</span> <input type="text" id="mbr_telno" name="mbr_telNo" value="${member.mbr_telNo}"/> <br/><br/>

</div>
<div style="text-align: center; margin-top: 20px;">
<input type="submit" id="modifyBtn" value="수정"/>
<input type="button" id="deleteBtn" value="탈퇴"/>
</div>
<sec:csrfInput/>
</form>
</div>
</div>
</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" charset="utf-8"></script>

<script>



var memberForm = document.querySelector("#memberForm");
var modifyBtn = document.querySelector("#modifyBtn");
var deleteBtn = document.querySelector("#deleteBtn");

modifyBtn.addEventListener('click', function(event){
    event.preventDefault();
    let name = document.querySelector("#name").value;
    let password = document.querySelector("#password").value;
    let password2 = document.querySelector("#password2").value;
    let tel = document.querySelector("#mbr_telno").value;
    let postcode = document.querySelector("#postcode").value;
    let address = document.querySelector("#address").value;
    let detailAddress = document.querySelector("#detailAddress").value;
    let birth = document.querySelector("#birth").value;
    let email = document.querySelector("#email").value;
    var mbr_gender = document.getElementsByName('mbr_gender');
    var chk_cnt = 0;
	
    for(var i = 0; i < mbr_gender.length; i++){
        if(mbr_gender[i].checked == true) chk_cnt++;
    }

    if(name == "" || name == null){
        Swal.fire({
            title: '이름을 입력해주세요!',
            icon: 'error'
        });
        return false;
    }
    if(password != password2){
        Swal.fire({
            title: '비밀번호가 일치하지 않습니다!',
            icon: 'error'
        });
        return false;
    }
    if((password == "" || password == null) || (password2 == "" || password2 == null)){
        Swal.fire({
            title: "비밀번호를 입력해주세요!",
            icon: 'error'
        });
        return false;
    }
    if(tel == "" || tel == null){
        Swal.fire({
            title: "연락처를 입력해주세요",
            icon: 'error'
        });
        return false;
    }
    if((postcode ==  "" || postcode == null) || (address ==  "" || address == null) || (detailAddress ==  "" || detailAddress == null)){
        Swal.fire({
            title: '주소를 입력해주세요',
            icon: 'error'
        });
        return false;
    }
    if(birth == "" || birth == null){
        Swal.fire({
            title: '생년월일을 입력해주세요',
            icon: 'error'
        });
        return false;
    }
    if(email == "" || email == null){
        Swal.fire({
            title: "이메일을 입력해주세요",
            icon: 'error'
        });
        return false;
    }
	
    if(chk_cnt < 1){
        Swal.fire({
            title: "성별을 골라주세요",
            icon: 'error'
        });
        return false;
    }
	
    Swal.fire({
        title: "수정 하시겠습니까?",
        icon: "question",
        showDenyButton: true,
        confirmButtonText: '네',
        denyButtonText: '아니요',
    }).then(function(result) {
        if (result.isConfirmed) {
            Swal.fire({
                icon: 'success',
                title: '수정이 완료되었습니다!',
            }).then(() => {
                memberForm.submit();											
            });
        } else {
            Swal.fire({
                icon: 'warning',
                title: '수정이 취소되었습니다.',
            });
            return false;
        }
    });
});

deleteBtn.addEventListener("click", function(){
	
	Swal.fire({
        title: "삭제를 진행 하시겠습니까?",
        icon: "question",
        showDenyButton: true,
        confirmButtonText: '네',
        denyButtonText: '아니요',
    }).then(function(result) {
        if (result.isConfirmed) {
            Swal.fire({
                icon: 'success',
                title: '삭제 페이지로 이동합니다.',
            }).then(() => {
            	
                memberForm.setAttribute("method", "get");
                memberForm.setAttribute("action", "/mypage/agree2");
                memberForm.submit();										
            });
        } else {
            Swal.fire({
                icon: 'warning',
                title: '페이지 이동 취소',
            });
            return false;
        }
    });

});

// 다음 주소 API
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

</script>
</body>
</html>