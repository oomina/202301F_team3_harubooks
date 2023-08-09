<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>하루북스</title>
    <link rel="shortcut icon" href="/resources/assets/img/로고1.png">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.4.0/fonts/remixicon.css" rel="stylesheet">
    <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js" integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <style>
        #container {
            width: 400px;
            height: 700px;
            margin: 5% auto;
            display: flex;
            flex-direction: column;
            align-content: center;
        }

        #logo {
            width: 150px;
            height: 110px;
            align-items: center;
        }

        #main-logo {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-item {
            margin-top: 60px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        .input-items {
            width: 80%;
            text-decoration: none;
        }

        .input-info {
            border: 1px solid #d5d5d5;
            width: 100%;
            height: 50px;
            border-radius: 10px;
            margin-bottom: 20px;
        }
        .input-title{
        	font-weight: bold;
        	color:#767676
        }
    </style>
</head>

<body>
	
  <form action="/login/nonMemberOrderList.do?${_csrf.parameterName }=${_csrf.token}" method="post" id="nonMemForm">
    <div id="container">
        <div id="main-logo"><img src="/resources/asset/image/logo1.png" alt="" id="logo"></div>
        <div class="form-item">
        		<div class="input-items" id="join-title">
	        		<h3 style=" border-bottom: 1px solid black;">비회원 주문 조회</h3>
         		</div>
                <div class="input-items">
                	<p class="input-title">주문자명</p>
                    <input type="text" name="user_nm" class="input-info" placeholder="주문자명을 입력해 주세요" id="name">
                </div>
                <div class="input-items">
                	<p class="input-title">이메일</p>
                   	<input type="email" name="mbr_email" class="input-info" placeholder="이메일을 입력해 주세요" id="email">
                </div>
                
                <div class="input-items" style="margin-bottom: 30px;">
                    <p class="input-title">비밀번호</p>
                    <input type="password" name="ae_pw" class="input-info" placeholder="비밀번호를 입력해 주세요" id="pw">
                </div> 
           
            <div class="input-items">
                <div class="input-info">
                    <button class="input-info" type="submit" 
                        style="background-color: white; border: 1px solid #3cb454; color: #3cb454; font-weight: bold; font-size: 1.2em;" id="orderListBtn">배송 조회</button>
                </div>
                <div class="input-info">
                    <button class="input-info" type="button" onclick="location.href='/login/signinForm'"
                        style="background-color: white; border: 1px solid #767676; color:#767676 ; font-weight: bold; font-size: 1.2em;">회원가입</button>
                </div>
                <a href="/harubooks/main" style="color: #767676; font-weight: bold; font-size: small; text-decoration: none">하루북스 메인으로 이동</a>
            </div>
        </div>  
    </div>
  </form>
    <script>
        var orderListBtn = document.querySelector('#orderListBtn');
		var nonMemForm = document.querySelector('#nonMemForm');
        orderListBtn.addEventListener('click',function(){
            event.preventDefault();
	    	var name = document.querySelector('#name').value;
	        var email = document.querySelector('#email').value;
	        var pw = document.querySelector('#pw').value;
            if(name == ""){
                swal('주문자명을 입력해주세요', '', 'warning'); 
                return false;
            }
            if(email == ""){
                swal('이메일을 입력해주세요', '', 'warning');
                return false;
            }
            if(pw == ""){
                swal('비밀번호를 입력해주세요', '', 'warning');
                return false;
            }
            
            nonMemForm.submit();
        })
    </script>
</body>

</html>