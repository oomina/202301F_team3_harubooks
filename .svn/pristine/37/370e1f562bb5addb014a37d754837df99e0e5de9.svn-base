<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
<!-- content wrapper -->
<div class="content-wrapper" style="padding : 10px;">
	<div class="row" style=" padding : 10px;">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<div class="card-title-wrapper">
						<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">발주 내역</h4>
						<div style="float:left;">
							<p class="card-description">
								전체 <code id="total"></code>건
							</p>
						</div>
						<div class="mb-2" style="display : flex; float : right;">
							<div class="table-responsive mr-2" >
								<table>
									<tr class="mr-2">
										<td>발주시작 : <input type="date" id="startDay" value="" max="today"> ~ 발주종료 : <input type="date" id="endDay" value=""></td>
									</tr>
								</table>
							</div>
							<div class="input-group-prepend hover-cursor" id="navbar-search-icon">
								<button type="button" id="search" style="width: 80px; border: 1px solid lightgray;">검색
									<i class="icon-search"></i>
								</button>
							</div>
						</div>
					</div>
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr class="table-primary">
									<th style="width : 5%;">번호</th>
									<th style="width : 10%;">발주일자</th>
									<th style="width : 15%;">상품번호</th>
									<th>도서명</th>
									<th style="text-align : right;">판매단가</th>
									<th style="width : 10%;">발주 수량</th>
									<th style="text-align : right;">총 금액</th>
									<th style="width : 10%;">승인여부</th>
									<th style="width : 35px;"><input type="checkbox" id="chkAll"></th>
									<th>발주서</th>
								</tr>
							</thead>
							<tbody id="tblDisp">
							</tbody>
						</table>
					</div>
				</div>
				<div id="pagingArea" style="margin-bottom: 20px; z-index : 0;"></div>
				<div>
					<div class="row" style="float:right; margin-right: 30px; margin-bottom: 18px">
						<button type="button" class="btn btn-danger mr-2" id="poRejectBtn">거절</button>
						<button type="button" class="btn btn-primary mr-2" id="poBtn">발주</button>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
<input type="hidden" value="<sec:authentication property='name'/>" id="sec-name">
<script>
const tblDisp = document.querySelector("#tblDisp");
const poBtn	= document.querySelector("#poBtn");					// 발주 승인버튼
const poRejectBtn = document.querySelector("#poRejectBtn");	// 발주 거절버튼
const pagingArea = document.querySelector("#pagingArea");	// 페이징 div
const startDay = document.querySelector("#startDay");		// 발주 기간 시작
const endDay = document.querySelector("#endDay");			// 발주 기간 끝
let id = $("#sec-name").val();
let page = 1;

$(function(){
	fPoPubList();

	// 전체 체크
	$("#chkAll").on("click", function(){
		if($(this).is(":checked")){ //전체 체크
			$(".chkSub").attr("checked", true);
		}else{ //전체 해제
			$(".chkSub").attr("checked", false);
		}	
	});
	
	// 발주 승인
	poBtn.addEventListener("click", function(){
		let poList = [];
		let checkCnt = $(".chkSub:checked").length;
		if(checkCnt <1){
			Swal.fire({
				title : '선택 내역을 확인해주세요!', 
				text : '선택된 내역이 없습니다', 
				icon : 'error',
				confirmButtonText: '확인',
				confirmButtonColor: '#3085d6',
			}).then(function (result) {
				if (result.isConfirmed) {
					// 확인 버튼을 클릭한 경우
				} 
			});
			return false;
		}
		$(".chkSub:checked").each(function(){
			let bookNo = $(this).closest('tr').find('td').eq(2).text();
			let bookQty = $(this).closest('tr').find('td').eq(5).text();
			let br_no = $(this).data("no");
			let poData = {
				"br_no" : br_no,
				"book_no" : bookNo, 
				"book_qty" : bookQty 
			}
			poList.push(poData);
		});
		fPoReqPubList(poList);
	});

	// 발주 거절
	poRejectBtn.addEventListener("click", function(){
		let poRejectList = [];
		let checkCnt = $(".chkSub:checked").length;
		if(checkCnt <1){
			Swal.fire({
				title : '선택 내역을 확인해주세요!', 
				text : '선택된 내역이 없습니다', 
				icon : 'error',
				confirmButtonText: '확인',
				confirmButtonColor: '#3085d6',
			}).then(function (result) {
				if (result.isConfirmed) {
					// 확인 버튼을 클릭한 경우
				} 
			});
			return false;
		}
		$(".chkSub:checked").each(function(){
			let bookNo = $(this).closest('tr').find('td').eq(2).text();
			let bookQty = $(this).closest('tr').find('td').eq(5).text();
			let br_no = $(this).data("no");
			let poRejData = {
				"br_no" : br_no,
				"book_no" : bookNo, 
				"book_qty" : bookQty 
			}
			poRejectList.push(poRejData);
		});
		fPoRejPubList(poRejectList);
	});
	
	// 페이징
	pagingArea.addEventListener("click", function(){	
		if(event.target.tagName === "A") {
			event.preventDefault();
			console.log(event.target.getAttribute("data-page"));
			page = event.target.getAttribute("data-page");
			
			fPoPubList();
		}
	});
	
	
	// 발주서 다운
	$(document).on("click", ".poDown", function(){
		let ccg_r001 = $(this).closest('tr').find('td').eq(7).text();
		let br_no = $(this).closest('tr').attr("data-no");
		if(ccg_r001 == '요청대기'){
			Swal.fire({
				title : '승인 여부를 먼저 확인해주세요.', 
				text : '발주 요청 승인 또는 거절 이후에 발주서 다운이 가능합니다.', 
				icon : 'error',
				confirmButtonText: '확인',
				confirmButtonColor: '#3085d6',
			}).then(function (result) {
				if (result.isConfirmed) {
					// 확인 버튼을 클릭한 경우
					// flag = false;
				} 
			});
		} else {
			fpoDown(br_no, id);
		}
	});
	
	// 발급 기간 출력
	let today = new Date();
	today = today.toISOString().slice(0, 10);
	startDay.value= today;
	endDay.value = today;
	startDay.setAttribute("max", today);
	endDay.setAttribute("max", today);
	
	// 발주 기간 검색
	$("#search").on("click", function(){
		let startD = startDay.value;
		let endD = endDay.value;
		let data = {
				start_day : startD,
				end_day : endD
		}
		$.ajax({
			url : "/pub/remain/posearch",
//			type : "POST",
			type : "GET",
			data : data,
			//data : JSON.stringify(data),
			//contentType : "application/json;charset=utf-8",
			success : function(res){
				console.log(res);
			}
		});
	});
});

function fPoPubList(){
	let xhr = new XMLHttpRequest();
	xhr.open("GET", "/pub/remain/polist?page=" + page, true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let poPubList = JSON.parse(xhr.responseText); 
			console.log(poPubList);
			let tblstr = "";
			if(poPubList.totalRecord == 0){
				tblstr += "<tr><td colspan='6' style='text-align : center;'>발주내역이 존재하지 않습니다.</td></tr>"
			} else {
				for(let i= 0; i<poPubList.dataList.length; i++){
					tblstr += `<tr data-no='\${poPubList.dataList[i].br_no}'>`
					tblstr += 	`<td>\${poPubList.startRow + i}</td>`
					tblstr += 	`<td>\${poPubList.dataList[i].br_ymd}</td>` 
					tblstr += 	`<td>\${poPubList.dataList[i].book_no}</td>` 
					tblstr += 	`<td style="word-wrap: break-word; white-space: pre-wrap; height : auto;">\${poPubList.dataList[i].book_title}</td>` 
					tblstr += 	`<td style="text-align : right;">\${poPubList.dataList[i].book_amt.toLocaleString()}</td>`
					tblstr += 	`<td style="text-align:center;">\${poPubList.dataList[i].book_qty}</td>`
					tblstr += 	`<td style="text-align : right;">\${(poPubList.dataList[i].book_qty * poPubList.dataList[i].book_amt).toLocaleString()}</td>`
					if(poPubList.dataList[i].ccg_r001 == '요청대기'){
						tblstr += 	`<td style=""><label class="badge badge-warning">\${poPubList.dataList[i].ccg_r001}</label></td>`
					} else if(poPubList.dataList[i].ccg_r001 == '요청수락') {
						tblstr += 	`<td style=""><label class="badge badge-info">\${poPubList.dataList[i].ccg_r001}</label></td>`
					} else {
						tblstr += 	`<td style=""><label class="badge badge-danger">\${poPubList.dataList[i].ccg_r001}</label></td>`
					}
					tblstr +=	'<td style="width : 35px; text-align : center">';
					if(poPubList.dataList[i].ccg_r001 == '요청대기'){
						tblstr += 			'<input type="checkbox" data-no='+poPubList.dataList[i].br_no+' class="chkSub">';
					} else {
						tblstr +=			'<input type="checkbox" data-no='+poPubList.dataList[i].br_no+' class="chkSub" disabled>';
					}
					tblstr += 	"</td>";
					if(poPubList.dataList[i].ccg_r001 == '요청대기'){
						tblstr += 		`<td style="text-align : center;"><button type="button" class="poDown" style="border : 0px; background-color : transparent;"><i class="ri-download-2-fill" style="fot-size: 20px; color : gray;"></i></button></td>`
					} else {
						tblstr += 		`<td style="text-align : center;"><button type="button" class="poDown" style="border : 0px; background-color : transparent;"><i class="ri-download-2-fill" style="fot-size: 20px;"></i></button></td>`
					}
					
					tblstr += "</tr>";
				}
			}
			tblDisp.innerHTML = tblstr;
			let total = document.querySelector("#total");
			total.innerText = poPubList.totalRecord;
			
			pagingArea.innerHTML = poPubList.pagingHTML;
		}
	}
	xhr.send();
}

function fPoReqPubList(poList){
	let xhr = new XMLHttpRequest();
	xhr.open("POST", "/pub/remain/poreq", true);
	xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let res = xhr.responseText;
			if(res == 'success'){
				Swal.fire({
						title : '발주 승인되었습니다.',
						text : '발주서  출력이 가능합니다.',
						icon : 'success',
						confirmButtonText: '확인',
						confirmButtonColor: '#3085d6'
					}).then(function (result) {
					if (result.isConfirmed) {
						// 확인 버튼을 클릭한 경우
						location.reload();
					} 
				});
			} else {
				Swal.fire({
						title : '발주 승인 실패되었습니다.',
						text : '다시 시도해주세요.', 
						icon : 'error',
						confirmButtonText: '확인'
					});
			}
		}
	};
	xhr.send(JSON.stringify(poList));
}

function fPoRejPubList(poRejectList){
	let xhr = new XMLHttpRequest();
	xhr.open("POST", "/pub/remain/porej", true);
	xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}"); 
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let res = xhr.responseText;
			if(res == 'success'){
				Swal.fire({
						title : '발주 거절되었습니다.', 
						icon : 'success',
						confirmButtonText: '확인',
						confirmButtonColor: '#3085d6'
					}).then(function (result) {
					if (result.isConfirmed) {
						// 확인 버튼을 클릭한 경우
						location.reload();
					} 
				});
			} else {
				Swal.fire({
						title : '발주 거절 실패되었습니다.',
						text : '다시 시도해주세요.', 
						icon : 'error',
						confirmButtonText: '확인'
					});
			}
		}
	};
	xhr.send(JSON.stringify(poRejectList));
}

function fpoDown(brNo, aeId){
	let data2 = {
		"br_no" : brNo,
		"ae_id" : aeId
	};
	$.ajax({
		url : "/pub/remain/podown",
		type : "post",
		data : JSON.stringify(data2),
		contentType : "application/json;charset=utf-8",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(res){
			console.log(res);
			if(res == null || res == "" || res.length == 0){
				Swal.fire({
					title : '발주서 파일을 준비중입니다.', 
					html : '발주서가 준비되면 다운로드 가능합니다.<br>하루북스로 문의해주세요.', 
					icon : 'error',
					confirmButtonText: '확인'
				}).then(function (result) {
                    if (result.isConfirmed) {
                       	// 확인 버튼을 클릭한 경우
                       	location.href="/pub/po";
                   }
				}); 
			} else { // 파일 존재
				let aTag = document.createElement("a");
				aTag.href = "/upload/excel/"+aeId +"/" + res;
				aTag.download ="하루북스 발주서_"+ aeId + "_" + res;
				aTag.click();
				Swal.fire({
					title : '발주서 다운로드 완료되었습니다.', 
					text : '다운로드 폴더에서 확인해주세요.', 
					icon : 'success',
					confirmButtonText: '확인',
					confirmButtonColor: '#3085d6',
				}).then(function (result) {
					if (result.isConfirmed) {
						// 확인 버튼을 클릭한 경우
						location.href="/pub/po";
					} 
				}); 
			}
			console.log(res);
		}
	});
} 
</script>