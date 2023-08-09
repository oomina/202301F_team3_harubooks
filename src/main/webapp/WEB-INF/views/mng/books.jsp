<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="content-wrapper" style="padding: 10px;">
	<div class="row" style="padding: 10px;">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">도서 정보</h4>
					<form action="" method="post" id="searchForm">
						<input type="hidden" name="page" id="page"/>
						<div class="col-lg-12">
							<div class="row dropdown" style="float: right; margin-bottom: 5px; margin-right: -22px;">
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
					</form>
					<p class="card-description">전체 <code><span id="booksCount"></span></code>건</p>
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr class="table-primary">
									<th style="width: 5%; text-align : center;">번호</th>
									<th style="width: 10%; text-align : center;">도서번호</th>
									<th style="width: 43%; text-align : center;">도서명</th>
									<th style="width: 22%; text-align : center;">저자</th>
									<th style="width: 11%; text-align : center;">출판사</th>
									<th style="width: 9%; text-align : center;">출간일</th>
								</tr>
							</thead>
							<tbody id="booksList"></tbody>
						</table>
					</div>
				</div>
				<div id="pagingArea" style="margin-bottom: 20px;"></div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var booksList = document.querySelector("#booksList");
var booksCount = document.querySelector("#booksCount");
var search = document.querySelector("#search");
var option = document.querySelector("#option");
var searchInput = document.querySelector("#searchWord");
var pagingArea = document.querySelector("#pagingArea");
var page = 1;

window.onload = function(){
	list();
	pagingArea.addEventListener("click", function(event) {
		if(event.target.tagName === "A") {
			event.preventDefault();
			page = event.target.getAttribute("data-page");
			list();
		}
	});
}

search.addEventListener("click", function() {
	page = 1;
	list();
});

// 도서 정보 리스트
function list() {
	var list = document.querySelector("#booksList");
	var searchType = option.value;
	var searchWord = searchInput.value;
	list.innerHTML = '';
	$.ajax({
		type : "get",
		url : "books/selectBooksList",
		data : {
			searchType:searchType,
			searchWord:searchWord,
			page:page
		},
		contentType : "application/json; charset=utf-8",
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			console.log("result : " + result);
			console.log(JSON.stringify(result));
			var html = "";
			if(result.pagingVO.dataList.length == 0){
				html += "<tr>"
				html += `<td colspan="6" align="center">도서 목록이 존재하지 않습니다.</td>`
				html += "</tr>"
			} else {
				for (var i = 0; i < result.pagingVO.dataList.length; i++) {
					html += `<tr class='list' data-no = \${result.pagingVO.dataList[i].book_no}>`
					html += "<td style='width: 5%; text-align : center;'>"+ result.pagingVO.dataList[i].rnum +"</td>"
					html += "<td style='width: 10%; text-align : center;'>"+ result.pagingVO.dataList[i].book_no +"</td>"
					html += "<td style='width: 43%; word-wrap: break-word; white-space: pre-wrap; height: auto;'>"+ result.pagingVO.dataList[i].book_title +"</td>"
					html += "<td style='width: 22%; text-align : center; word-wrap: break-word; white-space: pre-wrap; height: auto;'>"+ result.pagingVO.dataList[i].book_author +"</td>"
					html += "<td style='width: 11%; text-align : center;'>"+ result.pagingVO.dataList[i].pub_nm +"</td>"
					html += "<td style='width: 9%; text-align : center;'>"+ result.pagingVO.dataList[i].book_spmt_ymd +"</td>"
					html += "</tr>"
				}
				booksList.innerHTML += html;
				$(document).on('click','.list',function(){
					let no = $(this).data('no');
					location.href="/mng/booksInfo/"+no;
				});
			}
			pagingArea.innerHTML = result.pagingVO.pagingHTML;
			booksCount.innerText = result.pagingVO.totalRecord;
		},
		error: function(error) {
			console.log("error");
		}
	});
}
</script>