<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>하루북스</title>
<link rel="shortcut icon" href="/resources/assets/img/로고1.png">
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@3.4.0/fonts/remixicon.css"
	rel="stylesheet">
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
	margin-top: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	border: 1px solid #d5d5d5;
	border-radius: 15px

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
</style>
</head>

<body>
	<form action="/login/resetPw?${_csrf.parameterName }=${_csrf.token}" method="post" id="resetForm">
		<div id="container">
			<div id="main-logo">
				<img src="/resources/asset/image/logo1.png" alt="" id="logo">
			</div>
			<div class="form-item">
				
					<div class="input-items">
						<h3 style="text-align: center;">임시비밀번호 재설정</h3>
						<p style="text-align: center; color: #4dac27;">비밀번호 재설정을 진행해주세요</p>
					</div>
					<div class="input-items">
						<input type="password" name="ae_pw" class="input-info"
							placeholder="비밀번호를 입력해주세요" id="password">
					</div>
					<div class="input-items">
						<input type="password" class="input-info"
							placeholder="비밀번호를 다시 입력해주세요" id="password2">
					</div>

					<div class="input-items"
						style="margin-top: 30px; margin-bottom: 30px;">
						<button class="input-info" type="submit" id="resetBtn"
							style="background-color: #4dac27; border: 1px solid #4dac27; color: white; font-weight: bold; font-size: 1.2em;">비밀번호
							재설정</button>
						<br>
						<p style="text-align: center;"><a href="/harubooks/main" style="display: inline-block; text-align: center; color: #767676; text-decoration: none">다음에 변경하기</a></p>
					</div>		
			</div>
		</div>
	</form>
	<script>
		
		var resetBtn = document.querySelector('#resetBtn');
		var resetForm = document.querySelector('#resetForm');
		resetBtn.addEventListener('click',function(){
			event.preventDefault();
			var password = document.querySelector('#password').value;
			var password2 = document.querySelector('#password2').value;
			if(password == ""){
				alert("비밀번호를 입력해주세요");
				return false;
			}
			if(password2 == ""){
				alert("비밀번호를 입력해주세요");
				return false;
			}

			if(password != password2){
				alert("비밀번호가 일치하지 않습니다 다시 입력해주세요");
				return false;
			}
			resetForm.submit();
		})
		
	</script>
</body>

</html>