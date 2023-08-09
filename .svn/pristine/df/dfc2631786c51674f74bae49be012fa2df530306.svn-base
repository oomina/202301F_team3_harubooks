<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- content wrapper -->
<div class="content-wrapper" style="padding : 10px;">
	<div class="row" style=" padding : 10px;">
		<div class="col-lg-2 grid-margin stretch-card" style="margin-bottom: 0; float : left;">
			<div class="card">
				<div class="card-body">
					<div class="card-title-wrapper">
						<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">출판사 목록</h4>
						<div class="mb-2" style="display: flex;">
							<input type="text" class="form-control" placeholder="검색" id="searchPubNm" style="width: 100%; height: 30px;">
							<div class="input-group-prepend hover-cursor" id="navbar-search-icon2">
								<button type="button" id="searchPub" style="width: 30px; border: 1px solid lightgray;">
									<i class="icon-search"></i>
								</button>
							</div>
						</div>
						<div id="pubListDisp" class="scrollBar">
						</div>
						<div id="pubPagingDisp"></div>
					</div>
				</div>
			</div>		
		</div>
		<div class="col-lg-10 grid-margin stretch-card" style="margin-bottom: 0; float : right;">
			<div class="card">
				<div class="card-body">
					<div class="card-title-wrapper">
						<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">발주 신청 목록</h4>
						<div style="float:left;">
							<p class="card-description">
								전체 <code id="total"></code>건
							</p>
						</div>
						<div class="row dropdown" style="float:right; margin-bottom: 5px; margin-right : 8px;">
							<select id="option" name="searchType" style="width: 100px; border: 1px solid lightgray;">
								<option value="title" selected>도서명</option>
								<option value="author">저자</option>
								<option value="publisher">출판사</option>
							</select>
							<ul class="navbar-nav mr-lg-2">
								<li class="nav-item nav-search d-none d-lg-block">
									<div class="input-group">
										<input type="text" class="form-control" name="searchWord" id="searchWord" placeholder="검색" aria-label="search" aria-describedby="search"/>
										<div class="input-group-prepend hover-cursor" id="navbar-search-icon">
											<button type="button" id="search" style="width: 100px; border: 1px solid lightgray;">검색
												<i class="icon-search"></i>
											</button>
										</div>
									</div>
								</li>
							</ul>
						</div>
					</div>
					<div id="searchDisp" class="scrollBar" style="border : 1px solid black; width: 630px; height : 300px; position: absolute; z-index: 999; float : right; left: 310px; top: 105px; background: rgba(255,255,255, 1); overflow-y : scroll; display: none;">
					</div>
					<div class="table-responsive" style="width : 920px;" >
						<table id="poreqTable" class="table table-hover" >
							<thead style="display : block;">
								<tr class="table-primary">
									<th style="width : 9%;">번호</th>
									<th style="width: 13%; padding-left:7px; padding-right : 5px;">상품번호</th>
									<th style="width: 18%;  padding-left:5px; padding-right : 5px;">도서명</th>
									<th style="width : 11%; padding-left:3px; padding-right : 5px;">저자</th>
									<th style="width : 13%; padding-left:3px; padding-right : 5px;">출판사</th>
									<th style="width: 6%;padding-left: 3px; ">재고</th>
									<th style="width: 10%; padding-left: 6px; padding-right : 5px;">발주 수량</th> 
									<th style="width : 7%; padding-left:3px; padding-right : 3px; text-align : right;">판매단가</th>
									<th style="width: 6%; padding-left: 3px; padding-right : 3px; text-align : right;">총 금액</th> 
									<th style="width : 2%; padding-right: 20px; padding-left: 16px;"><input type="checkbox" id="chkAll"></th>
								</tr>
							</thead>
							<tbody id="tblDisp" class="scrollBar"  style="display : block; height: 350px; overflow-y: auto;">
								<tr style="display: table-row;">
									<td colspan="10" style="text-align: center;" >출판사를 먼저 선택하세요</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div>
					<div class="row" style="float:right; margin-right: 30px; margin-bottom: 18px">
						<button type="button" class="btn btn-primary" id="poBtn">발주</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
const tblDisp = document.querySelector("#tblDisp");
const search = document.querySelector("#search");				// 검색 btn
const option = document.querySelector("#option");				// select 박스
const searchInput = document.querySelector("#searchWord");		// 검색 input
const poBtn	= document.querySelector("#poBtn");					// 발주 버튼
const searchDisp = document.querySelector("#searchDisp");		// 검색 목록 출력할 div
const pubListDisp = document.querySelector("#pubListDisp");		// 출판사 목록 출력할 div
const pubPagingDisp = document.querySelector("#pubPagingDisp");// 페이징 출력할 div
const searchPubNm = document.querySelector("#searchPubNm");		// 출판사 검색 input
const searchPub = document.querySelector("#searchPub");			// 출판사 검색 버튼

let page = 1;
let id="";
let pubNm = "";
let pubPage = 1;

$(function(){
	fPubList();
	let searchType = option.value;
	let searchWord = searchInput.value;

	// 검색
	search.addEventListener("click", function(){
		page = 1;
		fRemainList();
	});

	// 전체 체크
	$(document).on("click", "#chkAll", function(){
		if($(this).is(":checked")){ //전체 체크
			$(".chkSub").attr("checked", true);
		}else{ //전체 해제
			$(".chkSub").attr("checked", false);
		}	
	});
	
	// 개별 체크시 발주 신청 내역에서 존재하는지 확인
	$(document).on("click", ".chkSub", function(){
		if($(this).is(":checked")){ 
			let bookNo = $(this).closest('tr').find('td').eq(1).text();
			fPoListCheck(bookNo);
		}
	});

	// 발주버튼
	$(document).on("click", "#poBtn", function(){
		let poList = [];
		let checkCnt = $(".chkSub:checked").length;
		let flag = false;
		let totalPrice = 0;
		// 발주 수량  1미만일 때와 체크 안했을 때 확인
		$(".chkSub:checked").each(function(){
			let bookQty = $(this).closest('tr').find("input[name='book_qty']").val();
			if (bookQty < 1 ){
				flag = true;
			}
		});
		if(checkCnt < 1 || flag){
			Swal.fire({
				title : '발주 내역을 확인해주세요!', 
				text : '최소 발주 수량은 1권입니다.', 
				icon : 'error',
				confirmButtonText: '확인',
				confirmButtonColor: '#3085d6',
			}).then(function (result) {
				if (result.isConfirmed) {
					// 확인 버튼을 클릭한 경우
					$(this).closest('tr').find("input[name='book_qty']").focus();
				} 
			});
			return false; 
		} else{
			$(".chkSub:checked").each(function(){
				let bookNo = $(this).closest('tr').find('td').eq(1).text();
				let pubNm = $(this).closest('tr').find('td').eq(4).text();
				let bookAmtStr = $(this).closest('tr').find('td').eq(7).text();
				bookAmtStr = bookAmtStr.replace(",", "");
				let bookAmt = Number(bookAmtStr);
				let bookQty = $(this).closest('tr').find("input[name='book_qty']").val();
				totalPrice = totalPrice + Number(bookQty) * bookAmt;
				console.log("totalPrice",totalPrice);
				let poData = {
					"book_no" : bookNo, 
					"pub_nm" : pubNm,
					"book_qty" : Number(bookQty),
				}
				poList.push(poData);
			});
			fPoReqList(poList, totalPrice);
		}	
	});
	
	// 수량바꿀 때 가격 바꾸기
	$(document).on("change", ".book_qty", function(){
		let bookQty = Number($(this).val());
		let bookAmtStr = $(this).closest('tr').find('td').eq(7).text();
		bookAmtStr = bookAmtStr.replace(",", "");
		let bookAmt = Number(bookAmtStr);
		let totalAmt = bookQty * bookAmt;
		$(this).closest('tr').find('td').eq(8).text(totalAmt.toLocaleString());
	})

	// 출판사 이름 누를때 
	$(document).on("click", ".pubName", function(){
		$(".pubName").css('background-color', 'white');
		$(this).css('background-color' ,'#ffc100');
		id = $(this).data("id");
		pubNm = $(this).text().trim();
		console.log(pubNm);
		fRemainListCntStatus(2, id);
	});
	
	// 출판사 이름 검색
	searchPub.addEventListener("click", function(){
		fPubList();
	});
	
	// 페이징 처리
	pubPagingDisp.addEventListener("click", function(){	
		if(event.target.tagName === "A") {
			event.preventDefault();
			pubPage = event.target.getAttribute("data-page");
			
			fPubList();
		}
	});

});

// 발주 내역에 있는지 확인
function fPoListCheck(bookNo){
	let cheSubs = document.querySelectorAll(".chkSub");
	let bookNos = document.querySelectorAll(".bookNos");
	$.ajax({
		url : "/mng/remain/polist",
		type : "GET",
		success : function(res){
			for(let i=0; i<res.mngPaginationInfoVO.dataList.length; i++){
				if(res.mngPaginationInfoVO.dataList[i].book_no == bookNo && res.mngPaginationInfoVO.dataList[i].ccg_r001 == '요청대기'){
					Swal.fire({
						title : '이미 발주된 상품입니다.', 
						text : '더 주문하시겠습니까?', 
						icon : 'question',
						showCancelButton: true,	// 취소버튼 생성
						cancelButtonText: '취소',
						confirmButtonText: '확인',
						confirmButtonColor: '#3085d6',
						cancelButtonColor: '#d33'
					}).then(function (result) {
						if (result.isConfirmed) {
							// 확인 버튼을 클릭한 경우
							for(let j=0; j<bookNos.length; j++) {
								if(bookNos[j].innerText == bookNo){
									cheSubs[j].checked = true;
								}
							}
						} else {
							for(let j=0; j<bookNos.length; j++) {
								if(bookNos[j].innerText == bookNo){
									cheSubs[j].checked = false;
								}
							}
						}
					}); 

				} 
			}
		}
	});
};

// 수동 발주 리스트 넘기기
function fPoReqList(poList1, totalPrice){
	console.log(totalPrice);
	// 리스트로 넘길 때는 
	// 넘기는 data를 배열을 JSON.stringify로 해서 전달
	// controller에서 받을 때는 List<VO> 형태로 받아서 vo의 필드 값과 list에 담긴 json 객체의 key값이 같으면 자동 바인딩 됨.
	Swal.fire({
		  title: '발주하시겠습니까?',
		  html: "발주 건수 : " + poList1.length + "건 <br/>총 금액 : " + totalPrice.toLocaleString() + "원",
		  icon: 'info',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '발주',
		  cancelButtonText : '취소',
		}).then(function (result){
		  if (result.isConfirmed) {
			  // 발주 눌렸을 때
			  $.ajax({
				url : "/mng/remain/poreqlist",
				type : "POST",
				beforeSend : function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				data : JSON.stringify(poList1),
				contentType : "application/json;charset=utf-8",
				success : function(res){
					if(res == "success"){
						Swal.fire({
							title : '발주되었습니다.', 
							text : '발주 내역에서 확인해주세요.', 
							icon : 'success',
							confirmButtonText: '확인'
						}).then(function (result) {
							if (result.isConfirmed) {
								// 확인 버튼을 클릭한 경우
								location.href="/mng/po";
							}
						}); 
					}
				} 
			});
	  	}
	})
}

// 검색 결과 재고 리스트 가져오기
function fRemainList(){
	var searchType = option.value;
	var searchWord = searchInput.value;
	
	$.ajax({
		url : "/mng/remain/list",
		type : "get",
		data : {
			searchType : searchType,
			searchWord : searchWord,
			page : page,
			status : "search"
		},
		contentType : "application/json;charset=utf-8",
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(res){
			searchDisp.style.display = 'block'; 	
			let searchstr = "";
			console.log(res);
			searchstr += '<button type="button" class="close" aria-label="Close" onclick="fSearchClose()" style="float:right;"><span float:right; aria-hidden="true">&times;</span></button>';
			searchstr += "<table class='table table-hover' style='max-width: 615px; table-layout: fixed;'>"
			if(res.mngPaginationInfoVO.dataList.length == 0){
				searchstr += "<tr><td colspan='5' style='text-align : center;'>검색내역이 존재하지 않습니다.</td></tr>"
			} else {
				for(let i= 0; i<res.mngPaginationInfoVO.dataList.length; i++){
					searchstr += `<tr onclick="fAddList('\${res.mngPaginationInfoVO.dataList[i].book_no}', '\${res.mngPaginationInfoVO.dataList[i].pub_nm}')">`
					searchstr += 	`<td style="width : 65px; padding : 3px;"><img src='\${res.mngPaginationInfoVO.dataList[i].book_cover}' style="border-radius : 0; width : 60px; height : 60px;"></td>`
					searchstr += 	`<td style="width : 200px; padding : 3px; word-wrap: break-word; white-space: pre-wrap; height : auto;">\${res.mngPaginationInfoVO.dataList[i].book_title}</td>`
					searchstr += 	`<td style="width : 100px; padding : 3px; word-wrap: break-word; white-space: pre-wrap;">\${res.mngPaginationInfoVO.dataList[i].book_author}</td>`
					searchstr += 	`<td style="width : 100px; padding : 3px; word-wrap: break-word; white-space: pre-wrap;">\${res.mngPaginationInfoVO.dataList[i].pub_nm}</td>`
					searchstr += 	`<td style="width : 60px; padding : 3px; text-align : right;">\${(res.mngPaginationInfoVO.dataList[i].book_amt*0.8).toLocaleString()}</td>`
					if(`\${res.mngPaginationInfoVO.dataList[i].bm_cnt_status}` == 1){
						searchstr += 	`<td style="width : 20px; padding : 5px; background-color : #ff4747; color : white; text-align : center;">\${res.mngPaginationInfoVO.dataList[i].bm_cnt}</td>`
					} else if(`\${res.mngPaginationInfoVO.dataList[i].bm_cnt_status}` == 2){
						searchstr += 	`<td style="width : 20px; padding : 5px; background-color : #ffc100; text-align : center;">\${res.mngPaginationInfoVO.dataList[i].bm_cnt}</td>`
					} else {
						searchstr += 	`<td style="width : 20px; padding : 5px; text-align : center;">\${res.mngPaginationInfoVO.dataList[i].bm_cnt}</td></tr>`
					}
				}
			}
			searchDisp.innerHTML = searchstr;
		}
	});
}

// yellow 재고 상태 리스트 가져오기
function fRemainListCntStatus(bm_cnt_status, id){
	$.ajax({
		url : "/mng/remain/list/"+bm_cnt_status,
		type : "get",
		data : {
			bm_cnt_status : bm_cnt_status,
			page : page,
			ae_id : id,
			status : "po"
		},
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(res){
			console.log(res);
			let tblstr = "";
			let book_qty = 0;
			tblDisp.innerHTML = "";
			if(res.mngPaginationInfoVO.dataList.length == 0){
				tblstr += "<tr style='display: table-row;'><td colspan ='10' style='text-align : center;'>경고 재고 내역이 존재하지 않습니다.</td></tr>";
			} else {
				for(let i= 0; i<res.mngPaginationInfoVO.dataList.length; i++){
					//2/10/32/10/9/7/8/10/10/2
					tblstr += `<tr><td style="width : 2%;">\${res.mngPaginationInfoVO.startRow + i}</td>`
					tblstr +=		`<td class="bookNos" style="width : 9%;">\${res.mngPaginationInfoVO.dataList[i].book_no}</td>`
					tblstr +=		`<td style="width : 30%; word-wrap: break-word; white-space: pre-wrap; height : auto; padding-left: 3px;">\${res.mngPaginationInfoVO.dataList[i].book_title}</td>`
					tblstr +=		`<td style="width : 18%; word-wrap: break-word; white-space: pre-wrap; height : auto; padding-left: 3px;">\${res.mngPaginationInfoVO.dataList[i].book_author}</td>`
					tblstr +=		`<td style="width : 20%; word-wrap: break-word; white-space: pre-wrap; height : auto; padding-left: 3px;">\${res.mngPaginationInfoVO.dataList[i].pub_nm}</td>`
					if(`\${res.mngPaginationInfoVO.dataList[i].bm_cnt_status}` == 1){
						tblstr += 	`<td style="width : 7%; background-color : #ff4747; color : white; text-align : center;">\${res.mngPaginationInfoVO.dataList[i].bm_cnt}</td>`
					} else if(`\${res.mngPaginationInfoVO.dataList[i].bm_cnt_status}` == 2){
						tblstr += 	`<td style="width : 7%; background-color : #ffc100; text-align : center;">\${res.mngPaginationInfoVO.dataList[i].bm_cnt}</td>`
					} else {
						tblstr += 	`<td style="width : 7%; text-align : center;">\${res.mngPaginationInfoVO.dataList[i].bm_cnt}</td>`
					}
					book_qty = res.mngPaginationInfoVO.dataList[i].bm_bsc_cnt - res.mngPaginationInfoVO.dataList[i].bm_cnt;
					tblstr += 		`<td style="width : 8%; text-align: center;"><input type="number" class="book_qty" name="book_qty" value='\${book_qty}' min = "1" max="80" style="width: 50px;"></td>`
					tblstr += 		`<td style="width : 10%; padding : 3px; text-align : right;">\${(res.mngPaginationInfoVO.dataList[i].book_amt*0.8).toLocaleString()}</td>`
					tblstr += 		`<td style="width : 10%; padding : 3px; text-align : right;">\${((res.mngPaginationInfoVO.dataList[i].book_amt*0.8) * book_qty).toLocaleString()}</td>`
					tblstr +=		'<td style="width : 2%; text-align : center; padding-left: 16px;padding-right: 20px;">';
					tblstr +=			'<input type="checkbox" class="chkSub">';
					tblstr += 		'</td>';
					tblstr += "</tr>";
				}
			}
			tblDisp.innerHTML = tblstr;

			let total = document.querySelector("#total");
			total.innerText = res.mngPaginationInfoVO.totalRecord;
		}
	});
}

// 검색 후 발주 신청 목록에 추가
function fAddList(book_no, pub_nm){
	console.log("파라미터 값 : ",pub_nm);
	console.log("전역변수 값 : ", pubNm);
	console.log("addList " + book_no);
	if(pub_nm != pubNm){
		Swal.fire({
				title : '출판사가 다릅니다', 
				html : '지금은' +  pubNm +' 도서만 발주 가능합니다.<br>' + pub_nm + ' 도서는 출판사를 다시 선택하여 발주 해주세요.', 
				icon : 'error',
				confirmButtonText: '확인',
				confirmButtonColor: '#3085d6',
			}).then(function (result) {
				if (result.isConfirmed) {
					// 확인 버튼을 클릭한 경우
					searchDisp.style.display = 'none';
				} 
			});
			return false; 
	}
	$.ajax({
		url : "/mng/remain/detail/"+book_no,
		type : "get",
		success : function(res){
			console.log(res);
			if(res.bm_cnt>= res.bm_cnt_indct2 && res.bm_cnt <= res.bm_cnt_indct1){
				Swal.fire({
						title : '이미 발주 신청 목록에 존재하는 도서입니다.', 
						text : '목록을 확인해주세요!', 
						icon : 'error',
						confirmButtonText: '확인'
					});
			} else {
				let tblstr = "";
				tblstr += 		"<td style='width : 2%;'>추가</td>";
				tblstr += 		"<td style='width : 9%;'>" + res.book_no + "</td>";
				tblstr += 		"<td style='width : 30%; word-wrap: break-word; white-space: pre-wrap; height : auto; padding-left: 3px;'>" + res.book_title + "</td>";
				tblstr += 		"<td style='width : 18%; word-wrap: break-word; white-space: pre-wrap; height : auto; padding-left: 3px;'>" + res.book_author + "</td>";
				tblstr += 		"<td style='width : 20%; word-wrap: break-word; white-space: pre-wrap; height : auto; padding-left: 3px;'>" + res.pub_nm + "</td>";
				if(res.bm_cnt <= res.bm_cnt_indct2){
					tblstr += 	'<td style="width : 7%; background-color : #ff4747; color : white; text-align : center;">'+res.bm_cnt+'</td>';
				} else if(res.bm_cnt <= res.bm_cnt_indct1){
					tblstr += 	'<td style="width : 7%; background-color : #ffc100; text-align : center;">'+res.bm_cnt + '</td>';
				} else {
					tblstr += 	'<td style="width : 7%; text-align : center;">'+ res.bm_cnt + '</td>';
				}
				tblstr += 		'<td style="width : 8%; padding-left: 25px;"><input type="number" class="book_qty" name="book_qty" value="1" min = "1" max="80" style="width: 50px;"></td>';
				tblstr += 		"<td style='width : 10%; word-wrap: break-word; white-space: pre-wrap; height : auto; padding : 3px; text-align : right;'>" + res.book_amt.toLocaleString() + "</td>";
				tblstr += 		"<td style='width : 10%; word-wrap: break-word; white-space: pre-wrap; height : auto; padding : 3px; text-align : right;'>" + res.book_amt.toLocaleString() + "</td>";
				tblstr += 		'<td style="width : 2%; text-align : center">';
				tblstr +=			'<input type="checkbox" class="chkSub">';
				tblstr += 		'</td>';
				
				// 테이블에 추가
				var table = document.querySelector("#poreqTable")
				var row = table.insertRow(1);
				row.innerHTML = tblstr;
	
				// 총 갯수 증가
				let totalDisp = document.querySelector("#total");
				let total = totalDisp.innerHTML;
				totalDisp.innerHTML = Number(total)+ 1;
			}
			// 검색 div 없애기
			searchDisp.style.display = 'none'; 
		}
	})
}

// 검색 div 닫기
function fSearchClose(){
	searchDisp.style.display = 'none';
}

// 출판사 리스트 가져오기
function fPubList(){
	let searchPubName = searchPubNm.value;
	$.ajax({
		url : "/mng/pub/list",
		type : "GET",
		data : {
			status : "po",
			searchWord : searchPubName,
			page : pubPage
		},
		success : function(res){
			pubListDisp.innerHTML = "";
			let pubList = res;
			console.log(pubList);
			for(let i=0; i< pubList.dataList.length; i++) {
				let pTag = document.createElement("p");
				pTag.setAttribute("class", "pubName");
				pTag.setAttribute("data-id", pubList.dataList[i].ae_id);
				pTag.style.fontFamily = "orbit";
				pTag.style.fontSize = "16px";

				// 아이콘을 감싸는 span 태그 생성
				let iconSpan = document.createElement("span");
				let iTag = document.createElement("i");
				iTag.setAttribute("class", "ri-store-2-line");
				iconSpan.appendChild(iTag);

				// 텍스트를 감싸는 span 태그 생성
				let textSpan = document.createElement("span");
				textSpan.innerHTML = "&nbsp;" + pubList.dataList[i].pub_nm;

				// iconSpan과 textSpan을 pTag에 추가
				pTag.appendChild(iconSpan);
				pTag.appendChild(textSpan);

				// pubListDisp에 pTag 추가
				pubListDisp.appendChild(pTag);
			}
			pubPagingDisp.innerHTML = pubList.pagingHTML;
		}
	});
}	


</script>
	<!-- content wrapper End-->