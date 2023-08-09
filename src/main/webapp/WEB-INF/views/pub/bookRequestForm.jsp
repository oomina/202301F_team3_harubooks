<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<div class="content-wrapper" style="padding: 10px;">
	<div class="row" style="padding: 10px;">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">도서 등록</h4>
					<form action="">
						<div class="table-responsive" style="overflow : hidden;">
							<table class="table" style="border : 1px solid #CED4DA;">
								<tbody>
									<tr>
										<th class="table-primary" style="width:10%; text-align : center;">ISBN</th>
										<td style="width:40%;"><input type="text" name="book_isbn" id="book_isbn" value="" style="width:100%;"></td>
										<th class="table-primary" style="width:10%; text-align : center;">유형</th>
										<td style="width:40%;"><input type="radio" checked class="ccg_b001" name="ccg_b001" id="ccg_b001_1" value="종이책"> 종이책&nbsp;&nbsp;&nbsp;<input type="radio" class="ccg_b001" name="ccg_b001" id="ccg_b001_2" value="E북"> E북</td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">도서명</th>
										<td><input type="text" name="nbr_nm" id="nbr_nm" value="" style="width:100%;"></td>
										<th class="table-primary" style="text-align : center;">분류</th>
										<td><input type="radio" class="ccg_b002" name="ccg_b002" id="ccg_b002_1" value="국내도서" checked> 국내도서&nbsp;&nbsp;&nbsp;<input type="radio" class="ccg_b002" name="ccg_b002" id="ccg_b002_2" value="해외도서"> 해외도서&nbsp;&nbsp;&nbsp;<input type="radio" class="ccg_b002" name="ccg_b002" id="ccg_b002_3" value="인터넷도서"> 인터넷도서</td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">저자</th>
										<td><input type="text" name="nbr_author" id="nbr_author" value="" style="width:100%;"></td>
										<th class="table-primary" style="text-align : center;">종류</th>
										<td>
											<select name="ccg_b003" id="ccg_b003" style="width:100%;">
												<option value="건강/스포츠">건강/스포츠</option>
												<option value="경제/경영">경제/경영</option>
												<option value="과학">과학</option>
												<option value="소설">소설</option>
												<option value="시/에세이">시/에세이</option>
												<option value="아동/청소년">아동/청소년</option>
												<option value="여행">여행</option>
												<option value="예술/건축">예술/건축</option>
												<option value="외국어">외국어</option>
												<option value="요리">요리</option>
												<option value="인문">인문</option>
												<option value="정치/사회">정치/사회</option>
												<option value="컴퓨터/IT">컴퓨터/IT</option>
											</select>
										</td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">번역자</th>
										<td><input type="text" name="book_talt" id="book_talt" value="" style="width:100%;"></td>
										<th class="table-primary" style="text-align : center;">페이지 수</th>
										<td colspan="2"><input type="text" name="book_page_cnt" id="book_page_cnt" value="" style="width:100%;"></td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">출간일</th>
										<td><input type="text" name="nbr_spmt_ymd" id="nbr_spmt_ymd" value="" style="width:100%;"></td>
										<th class="table-primary" style="text-align : center;">표지</th>
										<td><input type="file" name="nbr_cover" id="nbr_cover"></td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">가격</th>
										<td colspan="3"><input type="text" name="book_amt" id="book_amt" value="" style="width:41%;"></td>
									</tr>
									<tr>
										<th class="table-primary" style="text-align : center;">내용</th>
										<td colspan="5"><textarea rows="5" cols="130" name="nbr_content" id="nbr_content"></textarea></td>
										<input type="hidden" value="<sec:authentication property='name'/>" id="sec-name">
									</tr>
								</tbody>
							</table>
							<div class="row" style="padding-left : 30px; margin-top : 15px; margin-right : -20px; float:right;">
								<button type="button" class="btn btn-info" onclick="bookAutocomplete()">자동완성</button>&nbsp;&nbsp;
								<button type="button" class="btn btn-primary" onclick="bookRequestInsert()">등록</button>&nbsp;&nbsp;
								<button type="button" class="btn btn-outline-primary" onclick="location.href='/pub/bookRequest'">목록</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
var book_isbn = document.querySelector("#book_isbn");
var nbr_nm = document.querySelector("#nbr_nm");
var nbr_spmt_ymd = document.querySelector("#nbr_spmt_ymd");
var nbr_author = document.querySelector("#nbr_author");
var book_amt = document.querySelector("#book_amt");
var nbr_content = document.querySelector("#nbr_content");
var ccg_b001 = document.querySelector("#ccg_b001");
var ccg_b002 = document.querySelector("#ccg_b002");
var ccg_b003 = document.querySelector("#ccg_b003");
var book_page_cnt = document.querySelector("#book_page_cnt");
var book_talt = document.querySelector("#book_talt");
var nbr_cover = document.querySelector("#nbr_cover");

var ccg_b001_1 = document.querySelector("#ccg_b001_1");
var ccg_b002_1 = document.querySelector("#ccg_b002_1");

// 도서 등록 요청
function bookRequestInsert() {
	let id = $("#sec-name").val();
	console.log(id);
	let formData = new FormData();
	formData.append("book_isbn",book_isbn.value);
	formData.append("nbr_nm",nbr_nm.value);
	formData.append("nbr_spmt_ymd",nbr_spmt_ymd.value);
	formData.append("nbr_author",nbr_author.value);
	formData.append("book_amt",book_amt.value);
	formData.append("nbr_content",nbr_content.value);
	formData.append("ccg_b001",$('input[name=ccg_b001]:checked').val());
	formData.append("ccg_b002",$('input[name=ccg_b002]:checked').val());
	formData.append("ccg_b003",ccg_b003.value);
	formData.append("book_page_cnt",book_page_cnt.value);
	formData.append("book_talt",book_talt.value);
	if(nbr_cover.files[0] != undefined){ // 파일이 있으면
		formData.append("book_file_cover", nbr_cover.files[0]);
	} else {
		formData.append("book_file_cover", "/upload/images/noImage.jpg");
	}
	$.ajax({
		type : "post",
		url : "/pub/bookRequest/bookRequestInsert",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		data : formData,
		dataType : "text",
		processData : false,
		contentType : false,
		success : function(result){
			if(result == "fail"){
				alert("등록 실패! 다시 시도해주세요.");
			} else {
				alert("등록되었습니다.");
				location.href="/pub/bookRequest";
			}
		}
	});
}

// 자동완성
function bookAutocomplete(){
	book_isbn.value = '9791161340463';
	nbr_nm.value = '파이썬 클린 코드';
	nbr_spmt_ymd.value = '2022-05-12';
	nbr_author.value = '마리아노 아나야';
	book_amt.value = 28000;
	nbr_content.value = '파이썬으로 소프트웨어를 만들고 동료 프로그래머를 가르치는데 대부분의 시간을 보낸 소프트웨어 엔지니어이다. 파이썬 외에는 소프트웨어 아키텍처, 함수형 프로그래밍(functional programming), 분산 시스템과 컨퍼런스 발표에 관심을 가지고 있다. Euro Python 2016과 2017에서 연사로 활동했다. 저자에 대해 더 자세히 알기 원한다면 GitHub에서 rmariano 계정으로 검색할 수 있다. 발표 자료를 공유하는 http://speakerdeck.com 사이트의 사용자 이름은 rmariano이다.';
 	ccg_b001_1.checked;
	ccg_b002_1.checked;
	ccg_b003.value = '컴퓨터/IT';
	book_page_cnt.value = 336;
	book_talt.value = '김창수';
}
</script>