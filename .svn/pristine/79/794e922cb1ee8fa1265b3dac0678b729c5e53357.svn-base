<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="/resources/assets/img/로고1.png">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>하루북스</title>
        <style>
            #container {
                width: 400px;
                height: 100%;
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
                height: 100%;
                display: flex;
                justify-content: center;
                align-items: center;
                flex-direction: column;
                border: 1px solid #d5d5d5;
                border-radius: 10px;
            }

            .input-items {
                width: 80%;
                text-decoration: none;
                margin: 0 auto;
            }

            .input-info {
                border: 1px solid #d5d5d5;
                width: 100%;
                height: 50px;
                border-radius: 10px;
                margin-bottom: 20px;
            }

            #findResult {
                width: 100%;
                height: 90px;
                border: 1px solid #d5d5d5;
                border-radius: 10px;
                text-align: center;
                margin-bottom: 30px;
            }

            #selectOpt {
                display: flex;
                flex-direction: row;
                margin-bottom: 30px;
            }

            .findOption {
                width: 130px;
                border: 1px solid #d5d5d5;
                height: 50px;
                display: flex;
                justify-items: center;
                align-items: center;
            }

            .find-form {
                width: 100%;
                height: 100%;
                display: flex;
                flex-direction: column;
                align-items: center;
            }
        </style>
    </head>

    <body>
        <div id="container">
            <div id="main-logo"><img src="/resources/asset/image/logo1.png" alt="" id="logo"></div>

            <div class="form-item">
                <div id="selectOpt" style="margin-top: 20px;">
                    <div class="findOption" id="findId" style="border:2px solid #1b9c3b;">
                        <p style="margin: 0 auto; font-weight: bold;">아이디찾기</p>
                    </div>
                    <div class="findOption" id="findPw">
                        <p style="margin: 0 auto; font-weight: bold;">비밀번호찾기</p>
                    </div>
                </div>
                <!--아이디 찾기-->
                <form class="find-form" id="id-form">
                    <div class="input-items">
                        <input type="text" name="name" class="input-info" placeholder="이름을 입력해주세요" id="name">
                    </div>
                    <div class="input-items">
                        <input type="email" name="eMail" class="input-info" placeholder="이메일을 입력해주세요" id="eMail">
                    </div>
                    <!--AJAX로 처리해야한다.-->
                    <div class="input-items" style="margin-top: 30px;margin-bottom: 30px;">
                        <button class="input-info" type="button"
                            style="background-color: #767676; border: 1px solid #767676; color: white; font-weight: bold; font-size: 1.2em;"
                            id="findIdBtn">아이디 찾기</button>
                        <br>
                    </div>

                    <div class="input-items" id="resultForm" style="display: none;">
                        <div id="findResult">
                            <h3>현재 고객님의 아이디는</h3>
                            <p><span style="color: rgb(29, 139, 29); font-weight: bold;" id="inputFindId"></span> 입니다
                            </p>
                        </div>
                    </div>
                    <div class="input-items">
                        <div style="text-align: center; margin-bottom: 20px;">
                            <a href="/login/signinForm" style="color: #767676;">로그인</a>
                            <a href="/login/signupForm" style="color: #767676;">회원가입</a>
                        </div>
                    </div>
                </form>
                <!--비밀번호 찾기-->
                <form class="find-form" id="pw-form" style="display: none;">
                    <div class="input-items">
                        <input type="text" name="name" class="input-info" placeholder="이름을 입력해주세요" id="name2">
                    </div>
                    <div class="input-items">
                        <input type="text" name="id" class="input-info" placeholder="아이디를 입력해주세요" id="id2">
                    </div>
                    <div class="input-items">
                        <input type="email" name="eMail" class="input-info" placeholder="이메일을 입력해주세요" id="eMail2">
                    </div>

                    <div class="input-items" style="margin-top: 30px;margin-bottom: 30px;">
                        <button class="input-info" type="button"
                            style="background-color: #767676; border: 1px solid #767676; color: white; font-weight: bold; font-size: 1.2em;"
                            id="findPwBtn">비밀번호 찾기</button>
                        <br>
                    </div>
                    <div class="input-items" id="resultForm2" style="display: none;">
                        <div id="findResult">
                            <p><span style="color: rgb(29, 139, 29); font-weight: bold;" id="inputFindPw">이메일로 임시비밀번호
                                    발송</span></p>
                            <button type='button' id="tempPwBtn">임시비밀번호 받기</button>
                        </div>
                    </div>
                    <div class="input-items">
                        <div style="text-align: center; margin-bottom: 20px;">
                            <a href="/login/signinForm" style="color: #767676;">로그인</a>
                            <a href="/login/signupForm" style="color: #767676;">회원가입</a>
                        </div>
                    </div>
                </form>
            </div>

        </div>
        <script>
            let findId = document.querySelector('#findId');
            let findPw = document.querySelector('#findPw');
            let idForm = document.querySelector('#id-form');
            let pwForm = document.querySelector('#pw-form');

            findId.addEventListener('click', function () {
                findPw.style.border = "1px solid #d5d5d5";
                findId.style.border = "2px solid #1b9c3b";
                idForm.style.display = "block";
                pwForm.style.display = "none";
            })
            findPw.addEventListener('click', function () {
                findId.style.border = "1px solid #d5d5d5";
                findPw.style.border = "2px solid #1b9c3b";
                idForm.style.display = "none";
                pwForm.style.display = "block";
            })


            // 아이디 찾기 이벤트
            let findIdBtn = document.querySelector('#findIdBtn');
            let findResult = document.querySelector('#resultForm');
            findIdBtn.addEventListener('click', function (event) {
                event.preventDefault();
                let name = document.querySelector('#name').value;
                let eMail = document.querySelector('#eMail').value;
                console.log(name);
                console.log(eMail);
                if (name == "") {
                    swal('이름을 입력해주세요', '', 'warning'); 
                    return false;
                }
                if (eMail == "") {
                    swal('이메일을 입력해주세요', '', 'warning'); 
                    return false;
                }
                let xhr = new XMLHttpRequest();
                const data = {
                    "user_nm": name,
                    "mbr_email": eMail
                };
                xhr.open("post", "/login/findId.do", true);
                xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");

                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        let result = xhr.responseText;
                        console.log(result);
                        // ajax통신시 성공시 구현 로직
                        if (result == "" || result == null) {
                            document.querySelector('#inputFindId').innerText = "존재하지 않는 아이디";
                        } else {
                            document.querySelector('#inputFindId').innerText = result;
                        }
                        findResult.style.display = "block";
                    }
                }
                xhr.send(JSON.stringify(data));
            })


            // 비밀번호 찾기 이벤트
            let findPwBtn = document.querySelector('#findPwBtn');
            let findResult2 = document.querySelector('#resultForm2');
            findPwBtn.addEventListener('click', function (event) {
                event.preventDefault();
                let name = document.querySelector('#name2').value;
                let id = document.querySelector('#id2').value;
                let eMail = document.querySelector('#eMail2').value;
                console.log(name);
                console.log(id);
                console.log(eMail);
                if (name == "") {
                    swal('이름을 입력해주세요', '', 'warning'); 
                    return false;
                }
                if (id == "") {
                    swal('아이디를 입력해주세요', '', 'warning'); 
                    return false;
                }
                if (eMail == "") {
                    swal('이메일을 입력해주세요', '', 'warning'); 
                    return false;
                }
                const data2 = {
                    "name": name,
                    "id": id,
                    "eMail": eMail
                }
                let xhr = new XMLHttpRequest();
                xhr.open("post", "/login/findPw.do", true);
                xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");

                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        // ajax 통신 성공시 로직
                        let result = xhr.responseText;
                        console.log(result);
                        if (result == 'OK') {
                            findResult2.style.display = "block";
                        } else {
                            document.querySelector('#inputFindPw').innerText = "회원정보가 잘못되었습니다";
                            findResult2.style.display = "block";
                        }
                    }
                }
                xhr.send(JSON.stringify(data2));
            })
            
			// 임시비밀번호 메일 내용
            var tempPwBtn = document.querySelector('#tempPwBtn');
            tempPwBtn.addEventListener('click', function () {
                let eMail = document.querySelector('#eMail2').value;
                let id = document.querySelector('#id2').value;
                function generateRandomPassword(length) {
                    var charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                    var password = "";
                    for (var i = 0; i < length; i++) {
                        var randomIndex = Math.floor(Math.random() * charset.length);
                        password += charset[randomIndex];
                    }
                    return password;
                }
                var randomPassword = generateRandomPassword(6);
                var resetLink = "http://192.168.146.66/login/resetPw?id=" + encodeURIComponent(id) + "&pw=" + encodeURIComponent(randomPassword);
                var content = "<html>" +
                "<body>" +
                "    <div style=\"border: 1px solid #d5d5d5; border-radius: 15px; align-items: center; display: flex; flex-direction: column; width: 70%; margin: 0 auto;\">" +
                "        <img src='https://i.imgur.com/c82VjqM.png' alt=\"\" style=\"width: 150px; height: 100px; margin-top: 20px;\">" +
                "        <h2 style=\"text-align: center;\">안녕하세요 <span style=\"color: #4dac27;\">하루북스</span>입니다</h2>" +
                "        <p style=\"font-weight: bold; color: #767676;\">귀하의 임시 비밀번호를 발급해드렸습니다. 임시 비밀번호로 로그인 후 <span style=\"color: red;\">반드시 비밀번호 재설정</span>으로 비밀번호 변경을 하셔야 서비스 이용이 가능합니다</p>" +
                "        <h3 style=\"color: #767676;\">임시 비밀번호 : <span style=\"color: #4dac27;\" id=\"pw\">" + randomPassword + "</span></h3>" +
                "        <a href=\"" + resetLink + "\"><button type=\"button\" id=\"resetBtn\" style=\"background-color: #4dac27; color: white; border: 1px solid #3fa715; width: 300px; height: 50px; border-radius: 10px; font-size: medium; font-weight: bold; margin-bottom: 20px;\">비밀번호 변경하러가기</button></a>" +
                "    </div>" +
                "</body>" +
                "</html>";

                let resetData = {
                    "eMail": eMail,
                    "id": id,
                    "content": content
                }
                let xhr = new XMLHttpRequest();
                xhr.open("post", "/email/send.do", true);
                xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");

                xhr.onreadystatechange = function () {
                    if (xhr.readyState == 4 && xhr.status == 200) {
                        let result = xhr.responseText;
                        if (result == 'OK') {
                            swal('이메일이 전송되었습니다', '', 'success'); 
                        } else {
                            swal('이메일 전송에 실패해였습니다', '', 'error'); 
                        }
                    }
                }
                xhr.send(JSON.stringify(resetData));
            })
        </script>
    </body>

    </html>