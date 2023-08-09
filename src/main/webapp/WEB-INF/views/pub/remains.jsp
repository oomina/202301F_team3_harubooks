<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!-- content wrapper -->
<div class="content-wrapper" style="padding : 10px;">
	<div class="row" style=" padding : 10px;">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<div class="card-title-wrapper">
						<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">재고 내역</h4>
						<div style="float:left;">
							<p class="card-description">
								전체 <code id="total"></code>건
							</p>
							<div style="width : 15px; height: 15px; border-radius: 100%; border : #ff4747; background-color: #ff4747; display: inline-block;"></div>&nbsp;위험&nbsp;&nbsp;
							<div style="width : 15px; height: 15px; border-radius: 100%; border : #ffc100; background-color: #ffc100; display: inline-block;"></div>&nbsp;경고&nbsp;&nbsp;
						</div>	
						<div class="row dropdown" style="float:right; margin-bottom: 5px; margin-right : 8px;">
							<select id="searchType" name="searchType" style="width: 100px; border: 1px solid lightgray;">
								<option value="title" selected>도서명</option>
								<option value="author">저자</option>
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
					<div class="table-responsive" style="width : 1100px;">
						<table class="table table-hover">
							<thead>
								<tr class="table-primary">
									<th style="width : 5%;">번호</th>
									<th style="width : 10%;">상품번호</th>
									<th style="width : 10%;">카테고리</th>
									<th>도서명</th>
									<th style="width : 20%;">저자</th>
									<th style="width : 10%;">
										<select id="remain2" style="border : none; width: 95%; background-color: #cdcce8; font-weight: 600; font-size: .875rem; text-align: center;">
											<option value="all">재고</option>
											<option id="red" value="red">위험</option>
											<option id="yellow" value="yellow">경고</option>
										</select>
									</th>
								</tr>
							</thead>
							<input type="hidden" value="<sec:authentication property='name'/>" id="sec-name">
							<tbody id="tblDisp">
							</tbody>
						</table>
					</div>
				</div>
				<div id="pagingArea" style="margin-bottom: 15px;"></div>
			</div>
		</div>
	</div>
</div>
<script>
const tblDisp = document.querySelector("#tblDisp");
const pagingArea = document.querySelector("#pagingArea");	// 페이징 div
const search = document.querySelector("#search");			// 검색 btn
const sType = document.querySelector("#searchType");		// 검색 조건 select 
const searchInput = document.querySelector("#searchWord");	// 검색 input
const remainSelect = document.querySelector("#remain2");	// 재고 선택
let page = 1;


$(function(){
	fRemainPubList();

	// 페이징 이동
	pagingArea.addEventListener("click", function(){
		console.log(event.target)	
		if(event.target.tagName === "A") {
			event.preventDefault();
			console.log(event.target.getAttribute("data-page"));
			page = event.target.getAttribute("data-page");

			fRemainPubList();
		}
	});
	// 검색
	search.addEventListener("click", function(){
		page = 1;
		fRemainPubList();
	});
	
	remainSelect.addEventListener("change", function(){
		if($(this).val() == "red"){
			tblDisp.innerHTML = "";
			page = 1;
			fRemainPubListCntStatus(1);
		} else if($(this).val() == "yellow"){
			tblDisp.innerHTML = "";
			page = 1;
			fRemainPubListCntStatus(2);
		} else {
			fRemainPubList();
		}
	});
	
});

// 출판사 재고리스트
function fRemainPubList(){
	// 시큐리티 id값 가져오기
	//let id = $("#sec-name").val();
	let searchType = sType.value;
	let searchWord = searchInput.value;
	
	$.ajax({
		url : "/pub/remain/list",
		type : "get",
		data : {
			searchType : searchType,
			searchWord : searchWord,
			page : page
		},
		contentType : "application/json;charset=utf-8",
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(res){
			console.log(res);
			let tblstr = "";
			if(res.dataList.length == 0){
				tblstr += "<tr><td colspan='6' style='text-align : center;'>재고 목록이 존재하지 않습니다. </td></tr>"
			} else{
				for(let i= 0; i<res.dataList.length; i++){
					tblstr += `<tr><td>\${res.startRow + i}</td>`
					tblstr +=		`<td>\${res.dataList[i].book_no}</td>`
					tblstr +=		`<td>\${res.dataList[i].ccg_b003}</td>`
					tblstr +=		`<td style="word-wrap: break-word; white-space: pre-wrap; height : auto;">\${res.dataList[i].book_title}</td>`
					tblstr +=		`<td style="word-wrap: break-word; white-space: pre-wrap; height : auto;">\${res.dataList[i].book_author}</td>`
					if(res.dataList[i].bm_cnt <= res.dataList[i].bm_cnt_indct2){
						tblstr += 	`<td style="background-color : #ff4747; color : white; text-align : center;">\${res.dataList[i].bm_cnt}</td>`
					} else if(res.dataList[i].bm_cnt <= res.dataList[i].bm_cnt_indct1){
						tblstr += 	`<td style="background-color : #ffc100; text-align : center;">\${res.dataList[i].bm_cnt}</td>`
					} else {
						tblstr += 	`<td style="text-align : center;">\${res.dataList[i].bm_cnt}</td>`
					}			
					tblstr += "</tr>"
				}
			}
			tblDisp.innerHTML = tblstr;
			// 총갯수와 paging 고민해보기
			let total = document.querySelector("#total");
			total.innerText = res.totalRecord;
			
			pagingArea.innerHTML = res.pagingHTML;
		}
	});
//	 escape   encodeURI  encodeURIComponent
//	 unescape decodeURI   decodeURIComponent

	/* let xhr = new XMLHttpRequest();
	xhr.open("GET", "/pub/remain/list", true);
	xhr.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let remainPubList = JSON.parse(xhr.responseText);
			console.log(remainPubList);
			let tblstr = "";
			for(let i= 0; i<remainPubList.dataList.length; i++){
				tblstr += `<tr><td>\${remainPubList.startRow + i}</td>`
				tblstr +=		`<td>\${remainPubList.dataList[i].book_no}</td>`
				tblstr +=		`<td>\${remainPubList.dataList[i].ccg_b003}</td>`
				tblstr +=		`<td style="word-wrap: break-word; white-space: pre-wrap; height : auto;">\${remainPubList.dataList[i].book_title}</td>`
				tblstr +=		`<td style="word-wrap: break-word; white-space: pre-wrap; height : auto;">\${remainPubList.dataList[i].book_author}</td>`
				if(remainPubList.dataList[i].bm_cnt_status == 1){
					tblstr += 	`<td style="background-color : #ff4747; color : white; text-align : center;">\${remainPubList.dataList[i].bm_cnt}</td>`
				} else if(remainPubList.dataList[i].bm_cnt_status == 2){
					tblstr += 	`<td style="background-color : #ffc100; text-align : center;">\${remainPubList.dataList[i].bm_cnt}</td>`
				} else {
					tblstr += 	`<td style="text-align : center;">\${remainPubList.dataList[i].bm_cnt}</td>`
				}			
				tblstr += "</tr>"
			}
			tblDisp.innerHTML = tblstr;
			// 총갯수와 paging 고민해보기
			let total = document.querySelector("#total");
			total.innerText = remainPubList.totalRecord;
			
			pagingArea.innerHTML = remainPubList.pagingHTML;
		}
	}
	xhr.send(data); */
}

//재고 yellow, red 리스트
function fRemainPubListCntStatus(bm_cnt_status){
	console.log(bm_cnt_status, page);
	$.ajax({
		url : "/pub/remain/list/"+bm_cnt_status,
		type : "get",
		data : {
			bm_cnt_status : bm_cnt_status,
			page : page
		},
		contentType : "application/json;charset=utf-8",
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(res){
			console.log(res);
			let tblstr = "";
			console.log(res);
			if(res.dataList.length == 0){
				if(bm_cnt_status == 1){
					tblstr += "<tr><td colspan='6' style='text-align : center;'>위험 재고 내역이 존재하지 않습니다.</td></tr>";
				} else if(bm_cnt_status == 2){
					tblstr += "<tr><td colspan='6' style='text-align : center;'>경고 재고 내역이 존재하지 않습니다.</td></tr>";
				} else {
					tblstr += "<tr><td colspan='6' style='text-align : center;'>전체 재고 내역이 존재하지 않습니다.</td></tr>";
				}
			} else {
				for(let i= 0; i<res.dataList.length; i++){
					tblstr += `<tr><td>\${res.startRow + i}</td>`
					tblstr +=		`<td>\${res.dataList[i].book_no}</td>`
					tblstr +=		`<td>\${res.dataList[i].ccg_b003}</td>`
					tblstr +=		`<td style="word-wrap: break-word; white-space: pre-wrap; height : auto;">\${res.dataList[i].book_title}</td>`
					tblstr +=		`<td style="word-wrap: break-word; white-space: pre-wrap; height : auto;">\${res.dataList[i].book_author}</td>`
					if(res.dataList[i].bm_cnt <= res.dataList[i].bm_cnt_indct2){
						tblstr += 	`<td style="background-color : #ff4747; color : white; text-align : center;">\${res.dataList[i].bm_cnt}</td>`
					} else if(res.dataList[i].bm_cnt <= res.dataList[i].bm_cnt_indct1 ){
						tblstr += 	`<td style="background-color : #ffc100; text-align : center;">\${res.dataList[i].bm_cnt}</td>`
					} else {
						tblstr += 	`<td style="text-align : center;">\${res.dataList[i].bm_cnt}</td>`
					}			
					tblstr += "</tr>"
				}
			}
			tblDisp.innerHTML = tblstr;

			let total = document.querySelector("#total");
			total.innerText = res.totalRecord;
			
			pagingArea.innerHTML = res.pagingHTML;
		}
	})
}	
</script>