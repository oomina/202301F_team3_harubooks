<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content-wrapper" style="padding: 10px;">
	<div class="row" style="padding: 10px;">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">회원 상세 정보</h4>
					<form action="" style="margin-top : -40px; margin-left : 15px;">
						<div class="row" style="padding-left : 30px; margin-top : 20px; margin-right : -7px; margin-bottom: 5px; float:right;">
							<input type="file" name="imgFile" id="imgFile" style="display:none" accept=".jpg,.png">
							<button type="button" class="btn btn-outline-primary btn-sm" id="imgPutBtn" style="border: 1px solid lightgray;">사진 수정</button>&nbsp;
							<button type="button" class="btn btn-outline-danger btn-sm" id="imgDelBtn" style="border: 1px solid lightgray;">사진 삭제</button>&nbsp;&nbsp;
						</div>
						<div class="table-responsive" style="overflow:hidden">
							<table class="table" style="border:1px solid #CED4DA;">
								<tbody>
									<tr>
										<th class="table-primary" style="width:10%; text-align : center;">아이디</th>
										<td style="width:40%;"><input type="text" name="ae_id" id="ae_id" value="" style="width:100%;" readonly></td>
										<th class="table-primary" style="width:10%; text-align : center;">성별</th>
										<td style="width:25%;"><input type="radio" class="mbr_gender" name="mbr_gender" id="mbr_gender1" value="남자"> 남자&nbsp;&nbsp;&nbsp;<input type="radio" class="mbr_gender" name="mbr_gender" id="mbr_gender2" value="여자"> 여자</td>
										<td rowspan="3" style="width:15%; padding: 0px;">
											<img src="" name="mem_profile" id="mem_profile" style="width:108%; height:100%; border-radius: 0%; margin-top : -2px; margin-left : -13px;"><br>
										</td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">회원명</th>
										<td><input type="text" name="user_nm" id="user_nm" value="" style="width:100%;"></td>
										<th class="table-primary" style="text-align : center;">생년월일</th>
										<td><input type="text" name="mbr_brdt" id="mbr_brdt" value="" style="width:95%;"></td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">닉네임</th>
										<td><input type="text" name="mem_nicknm" id="mem_nicknm" value="" style="width:100%;"></td>
										<th class="table-primary" style="text-align : center;">핸드폰번호</th>
										<td><input type="text" name="mbr_telno" id="mbr_telno" value="" style="width:95%;"></td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">우편번호</th>
										<td><input type="text" name="mbr_zip" id="mbr_zip" value="" style="width:69%;" readonly>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary btn-sm" id="postcodeBtn" onclick="DaumPostcode()">우편번호 찾기</button></td>
										<th class="table-primary" style="text-align : center;">이메일</th>
										<td colspan="2"><input type="text" name="mbr_email" id="mbr_email" value="" style="width:100%;"></td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">주소</th>
										<td><input type="text" name="mbr_addr" id="mbr_addr" value="" style="width:100%;" readonly></td>
										<th class="table-primary" style="text-align : center;">등급</th>
										<td colspan="2">
											<select name="rank_name" id="rank_name" style="width:100%;">
												<option value="브론즈">브론즈</option>
												<option value="실버">실버</option>
												<option value="골드">골드</option>
												<option value="플래티넘">플래티넘</option>
											</select>
										</td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">상세주소</th>
										<td><input type="text" name="mbr_daddr" id="mbr_daddr" value="" style="width:100%;"></td>
										<th class="table-primary" style="text-align : center;">마일리지</th>
										<td colspan="2"><input type="text" name="mbr_mileage" id="mbr_mileage" value="" style="width:100%;"></td>
									</tr>
								</tbody>
							</table>
							<div class="row" style="padding-left : 30px; margin-top : 20px; margin-right : 0px; float:right;">
								<input type="button" class="btn btn-primary" id="putBtn" onclick="mbrUpdate()" value="수정">&nbsp;&nbsp;
								<input type="button" class="btn btn-danger" id="delBtn" onclick="mbrDelete()" value="삭제">&nbsp;&nbsp;
								<a href="/mng/mbr"><button type="button" class="btn btn-outline-primary" id="listBtn">목록</button></a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
var mem_profile = document.querySelector("#mem_profile");	// 프로필 사진
var imgPutBtn = document.querySelector("#imgPutBtn");		// 프로필 사진 수정 버튼
var imgDelBtn = document.querySelector("#imgDelBtn");		// 프로필 사진 삭제 버튼
var mbr_zip = document.querySelector("#mbr_zip");			// 우편번호
var mbr_addr = document.querySelector("#mbr_addr");			// 주소
var mbr_daddr = document.querySelector("#mbr_daddr");		// 상세주소
var postcodeBtn = document.querySelector("#postcodeBtn");	// 우편번호 찾기 버튼
var putBtn = document.querySelector("#putBtn");				// 회원 정보 수정 버튼
var delBtn = document.querySelector("#delBtn");				// 회원 정보 삭제 버튼
var imgFile = document.querySelector("#imgFile");			// 이미지 파일
var fileName;

// 회원 상세 정보
window.onload = function(){
	const url = document.location.href;
	const urlArr = url.split("/");
	const id = urlArr[urlArr.length-1];
	
	$.ajax({
		type : "get",
		url : "/mng/mbr/mbrInfo/"+id,
		data : "",
		contentType : "application/json; charset=utf-8",
		success : function(result){
			$("#ae_id").val(result.ae_id);
			$("#user_nm").val(result.user_nm);
			$("#mem_profile").attr("src","/upload/images/" + result.mem_profile);
			$("#mem_nicknm").val(result.mem_nicknm);
			$("#mbr_brdt").val(result.mbr_brdt);
			$('input:radio[name="mbr_gender"][value="'+ result.mbr_gender +'"]').attr('checked', 'checked');
			$("#mbr_telno").val(result.mbr_telno);
			$("#mbr_email").val(result.mbr_email);
			$("#rank_name").val(result.rank_name);
			$("#mbr_mileage").val(result.mbr_mileage);
			$("#mbr_zip").val(result.mbr_zip);
			$("#mbr_addr").val(result.mbr_addr);
			$("#mbr_daddr").val(result.mbr_daddr);
		}
	});
}

// 우편번호 찾기
function DaumPostcode() {
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
			
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
			
            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            }
			
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            mbr_zip.value = data.zonecode;
            mbr_addr.value = addr;
            mbr_daddr.focus();
        }
    }).open();
}

// 프로필 사진 수정
imgPutBtn.addEventListener("click", function(){
	imgFile.click();
});

// 프로필 이미지 선택
imgFile.addEventListener("change", function() {
	fileName = event.target.files[0];
	
	if(isImageFile(fileName)){
		var reader = new FileReader();
		reader.onload = function(e) {
			mem_profile.src = e.target.result;
		}
		reader.readAsDataURL(fileName);
		console.log(imgFile);
		console.log(fileName);
		console.log(mem_profile.src);
		console.log(mem_profile);
		console.log(mem_profile.src);
	} else {	// 이미지 파일을 선택하지 않음
		alert("이미지 파일을 선택해주세요!");
	}
});

// 이미지 파일인지 체크(확장자를 이용해서)
function isImageFile(file) {
	var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다.
	return ($.inArray(ext, ["jpg","jpeg","gif","png"]) === -1) ? false : true;
}

// 프로필 사진 삭제
imgDelBtn.addEventListener("click", function(){
	mem_profile.src = "/upload/images/noImage.jpg";
});

// 회원 정보 수정
putBtn.onclick = function () {
	let formData = new FormData();
	formData.append("ae_id",ae_id.value);
	formData.append("user_nm",user_nm.value);
	formData.append("mem_nicknm",mem_nicknm.value);
	formData.append("mbr_gender",$('input[name=mbr_gender]:checked').val());
	formData.append("mbr_brdt",mbr_brdt.value);
	formData.append("mbr_telno",mbr_telno.value);
	formData.append("mbr_email",mbr_email.value);
	formData.append("rank_name",rank_name.value);
	formData.append("mbr_mileage",mbr_mileage.value);
	formData.append("mbr_zip",mbr_zip.value);
	formData.append("mbr_addr",mbr_addr.value);
	formData.append("mbr_daddr",mbr_daddr.value);
	
	const src = mem_profile.src;
	const srcArr = src.split("/");
	const profile = srcArr[srcArr.length-1];
	
	if(imgFile.files[0] != undefined){
		if(mem_profile.src != "/upload/images/noImage.jpg"){
			formData.append("mem_profile_file", imgFile.files[0]);
		}
	} else {
		formData.append("mem_profile", profile);
	}
	
	$.ajax({
		type : "put",
		url : "/mng/mbr/mbrUpdate",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		data : formData,
		dataType : "text",
		processData : false,
		contentType : false,
		success : function(result){
			if(result == "fail"){
				alert("수정 실패! 다시 시도해주세요.");
			} else {
				alert("수정되었습니다.");
				location.href="/mng/mbr";
			}
		}
	});
}

// 회원 정보 삭제
function mbrDelete() {
	var id = $("#ae_id").val();
	$.ajax({
		type : "delete",
		url : "/mng/mbr/mbrDelete/"+id,
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		data : "",
		success : function(result){
			if(result == "fail"){
				alert("삭제 실패! 다시 시도해주세요.");
			} else {
				alert("삭제되었습니다.");
				location.href="/mng/mbr";
			}
		}
	});
}
</script>