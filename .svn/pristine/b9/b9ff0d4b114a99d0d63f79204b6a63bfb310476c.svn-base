<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!-- content wrapper -->
	<div class="content-wrapper" style="padding : 10px;">
		<div class="row" style=" padding : 10px;">
			<div class="col-lg-12 grid-margin stretch-card">
				<div class="card">
					<div class="card-body">
						<div class="card-title-wrapper">
							<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">출판사 목록</h4>
							<p class="card-description">
								전체 <code id="total"></code>건
						   </p>	
						</div>
						<div class="table-responsive" style="width : 1100px;">
							<table class="table">
								<thead>
									<tr class="table-primary">
										<th style="width : 5%;">번호</th>
										<th style="width : 15%;">출판사 이름</th>
										<th style="width : 10%;">아이디</th>
										<th>위치</th>
										<th style="width : 15%;">전화번호</th>
										<th style="width : 15%;">이메일</th>
									</tr>
								</thead>
								<tbody id="tblDisp">
								</tbody>
							</table>
						</div>
					</div>
					<div id="pagingArea"></div>
					<div style="margin-bottom: 20px;">
						<div style="float: right; padding-right : 20px;">
							<button type="button" class="btn btn-primary" id="pubBtn">출판사 등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<button id="pubInsertModal" type="button" class="btn btn-primary" data-toggle="modal" data-target=".pubInsertModal-bg" style="display : none;" >modalShow</button>

<div class="modal fade pubInsertModal-bg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
	<div class="modal-content" style="margin : 0 auto; width: 800px; top: -35px;">
		<div class ="modal-header">
			<h4>출판사 등록</h4>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body" style="display: flex; max-height: 700px; padding : 10px 10px; justify-content: center;">
			<div class="table-responsive" style="width : 90%;">
				<table class="table">
					<tbody>
						<tr>
							<th class="table-primary" style="width : 20%; text-align : center;">아이디</th>
							<td><input type="text" name="ae_id" id="ae_id" value="" style="width:100%;"></td>
						</tr>
						<tr>
							<th class="table-primary" style="text-align : center;">출판사 이름</th>
							<td><input type="text" name="pub_nm" id="pub_nm" value="" style="width:100%;"></td>
						</tr>
						<tr>
							<th class="table-primary" style="text-align : center;">우편번호</th>
							<td><input type="text" name="pub_zip" id="pub_zip" value="" style="width:77%;" readonly>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary btn-sm" id="postcodeBtn" onclick="DaumPostcode()">우편번호 찾기</button></td>
						</tr>
						<tr>
							<th class="table-primary" style="text-align : center;">주소</th>
							<td><input type="text" name="pub_addr" id="pub_addr" value="" style="width:100%;" readonly></td>
						</tr>
						<tr>
							<th class="table-primary" style="text-align : center;">상세주소</th>
							<td><input type="text" name="pub_daddr" id="pub_daddr" value="" style="width:100%;"></td>
						</tr>
						<tr>
							<th class="table-primary" style="text-align : center;">전화번호</th>
							<td><input type="text" name="pub_telno" id="pub_telno" value="" style="width:100%;"></td>
						</tr>
						<tr>
							<th class="table-primary" style="text-align : center;">이메일</th>
							<td><input type="text" name="pub_eml_addr" id="pub_eml_addr" value="" style="width:100%;"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-outline-primary" data-dismiss="modal">취소</button>
			<button id="pubInsert" type="button" class="btn btn-primary" >가입</button>
		</div>
	</div>
	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
const tblDisp = document.querySelector("#tblDisp");
const ae_id = document.querySelector("#ae_id");
const pub_nm = document.querySelector("#pub_nm");
const pub_zip = document.querySelector("#pub_zip");
const pub_addr = document.querySelector("#pub_addr");
const pub_daddr = document.querySelector("#pub_daddr");
const pub_telno = document.querySelector("#pub_telno");
const pub_eml_addr = document.querySelector("#pub_eml_addr");
const pagingArea = document.querySelector("#pagingArea");	// 페이징 div
let page = 1;

$(function(){
	fPubList();

	$("#pubBtn").on("click", function(){
		$("#pubInsertModal").click();
	});

	$("#pubInsert").on("click", function(){
		fPubInsert();
	})
	
	pagingArea.addEventListener("click", function(){	
		if(event.target.tagName === "A") {
			event.preventDefault();
			tblDisp.innerHTML = "";
			console.log(event.target.getAttribute("data-page"));
			page = event.target.getAttribute("data-page");

			fPubList();
		}
	});
});

function fPubList(){
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "/mng/pub/list?page=" + page, true);
	xhr.onreadystatechange = function(){
		if (xhr.readyState == 4 && xhr.status == 200){
			let pubList = JSON.parse(xhr.responseText);
			console.log(pubList);
			let tblstr = "";
			if(pubList.totalRecord == 0){
				tblstr += "<tr><td>등록된 출판사가 존재하지 않습니다.</td></tr>";
			} else {
				for(let i=0; i<pubList.dataList.length; i++){
					tblstr += "<tr>"
					tblstr +=	"<td>"+(pubList.startRow + i)+"</td>"
					tblstr += 	"<td>"+pubList.dataList[i].pub_nm+"</td>"
					tblstr += 	"<td>"+pubList.dataList[i].ae_id+"</td>"
					tblstr += 	"<td>"+pubList.dataList[i].pub_addr+"</td>"
					tblstr += 	"<td>"+pubList.dataList[i].pub_telno+"</td>"
					tblstr += 	"<td>"+pubList.dataList[i].pub_eml_addr+"</td>"
					tblstr += "</tr>"
				}
				tblDisp.innerHTML = tblstr;

				let total = document.querySelector("#total");
				total.innerText = pubList.totalRecord;

				pagingArea.innerHTML = pubList.pagingHTML;
			}
		}
	}
	xhr.send();
}

//우편번호 찾기
function DaumPostcode() {
	new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';
			
            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }
			
            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }
            pub_zip.value = data.zonecode;
            pub_addr.value = addr;
            pub_daddr.focus();
        }
    }).open();
}

// 임시 비밀번호 발급
function generateRandomPassword(length) {
		var charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		var password = "";
		for (var i = 0; i < length; i++) {
			var randomIndex = Math.floor(Math.random() * charset.length);
			password += charset[randomIndex];
		}
		return password;
	}

function fPubInsert(){
	let randomPassword = generateRandomPassword(6);
	let id = ae_id.value;
	let email = pub_eml_addr.value
	let data = {
		ae_id : id,
		ae_pw : randomPassword,
		pub_nm : pub_nm.value,
		pub_zip : pub_zip.value,
		pub_addr : pub_addr.value,
		pub_daddr : pub_daddr.value,
		pub_eml_addr : pub_eml_addr.value,
		pub_telno : pub_telno.value
	}
	console.log("출판사 가입 정보",data);
	let xhr = new XMLHttpRequest();
	xhr.open("POST", "/mng/pub/insert", true);
	xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){	
			let res =xhr.responseText;
			if(res == "success"){
				Swal.fire({
					title : '회원가입 성공', 
					html : '메일로 아이디와 임시비밀번호를 전송합니다.<br>메일을 확인해주세요.', 
					icon : 'success',
					confirmButtonText: '확인'
				}).then(function (result) {
                    if (result.isConfirmed) {
                       	// 확인 버튼을 클릭한 경우
                       	//$("#pubInsertModal").hide();
                       	sendMail(id, randomPassword, email);
                       	location.href="/mng/publisher";
					}
				}); 
			} else{
				swal.fire('회원가입 실패', '다시 시도해주세요', 'error');
			}

		}
	}
	xhr.send(JSON.stringify(data));
}

function sendMail(id, pw, email){
	console.log(id, pw, email);
	var resetLink = "http://192.168.146.66/login/signinForm";
	var content = "<html>" +
	"<body>" +
	"    <div style=\"border: 1px solid #d5d5d5; border-radius: 15px; align-items: center; display: flex; flex-direction: column; width: 70%; margin: 0 auto;\">" +
	"        <img src='https://i.imgur.com/c82VjqM.png' alt=\"\" style=\"width: 150px; height: 100px; margin-top: 20px;\">" +
	"        <h2 style=\"text-align: center;\">안녕하세요 <span style=\"color: #4dac27;\">하루북스</span>입니다</h2>" +
	"		 <p style=\"font-weight: bold; color: #767676; \">하루북스와 제휴를 맺어주셔서 감사합니다.</p>"  +
	"        <p style=\"font-weight: bold; color: #767676;\">귀사의 아이디와 임시 비밀번호를 발급해드렸습니다. 임시 비밀번호로 로그인 후 <span style=\"color: red;\">반드시 비밀번호 재설정</span>으로 비밀번호 변경해주세요.</p>" +
	"        <h3 style=\"color: #767676;\">아이디 : <span style=\"color: #4dac27;\" id=\"pubid\">" + id + "</span></h3>" +
	"        <h3 style=\"color: #767676;\">임시 비밀번호 : <span style=\"color: #4dac27;\" id=\"pubpw\">" + pw + "</span></h3>" +
	"        <a href=\"" + resetLink + "\"><button type=\"button\" id=\"resetBtn\" style=\"background-color: #4dac27; color: white; border: 1px solid #3fa715; width: 300px; height: 50px; border-radius: 10px; font-size: medium; font-weight: bold; margin-bottom: 20px;\">비밀번호 변경하러가기</button></a>" +
	"    </div>" +
	"</body>" +
	"</html>";

	let data = {
		"eMail": email,
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
				swal.fire('이메일이 전송되었습니다', '', 'success'); 
			} else {
				swal.fire('이메일 전송에 실패해였습니다', '', 'error'); 
			}
		}
	}
	xhr.send(JSON.stringify(data));
}	

</script>
	<!-- content wrapper End-->