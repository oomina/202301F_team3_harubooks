<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<div class="content-wrapper" style="padding: 10px;">
	<div class="row" style="padding: 10px;">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">도서 관리</h4>
					<form action="" method="post" id="searchForm">
						<input type="hidden" name="page" id="page"/>
						<div class="col-lg-12">
							<div class="row dropdown" style="float:right; margin-bottom: 5px; margin-right: -22px;">
								<select id="option" name="searchType" style="width: 100px; border: 1px solid lightgray;">
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
					</form>
					<p class="card-description">전체 <code><span id="requestCount"></span></code>건</p>
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr class="table-primary">
									<th style="width: 5%; text-align : center;">번호</th>
									<th style="width: 15%; text-align : center;">요청번호</th>
									<th style="width: 35%; text-align : center;">도서명</th>
									<th style="width: 20%; text-align : center;">저자</th>
									<th style="width: 13%; text-align : center;">요청일자</th>
									<th style="width: 12%; text-align : center;">요청상태</th>
								</tr>
							</thead>
							<input type="hidden" value="<sec:authentication property='name'/>" id="sec-name">
							<tbody id="requestList"></tbody>
						</table>
					</div>
				</div>
				<div class="row" style="float : right; margin: 0px 0px 0px 1030px;">
					<button type="button" class="btn btn-primary" onclick="location.href='/pub/bookRequestForm'">도서 등록</button>
				</div>
				<div id="pagingArea" style="margin-bottom: 20px;"></div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var requestList = document.querySelector("#requestList");
var requestCount = document.querySelector("#requestCount");
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

// 도서 등록 요청 리스트
function list(){
	let id = $("#sec-name").val();
	console.log(id);
	var list = document.querySelector("#requestList");
	var searchType = option.value;
	var searchWord = searchInput.value;
	list.innerHTML = '';
	$.ajax({
		type : "get",
		url : "/pub/bookRequest/selectRequestList",
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
				html += `<td colspan='6' align='center'>요청 목록이 존재하지 않습니다.</td>`
				html += "</tr>"
			} else {
				for (var i = 0; i < result.pagingVO.dataList.length; i++) {
					console.log(result.pagingVO.dataList[i].nbr_no);
					html += "<tr>"
					html += "<td style='text-align : center;'>"+ result.pagingVO.dataList[i].rnum +"</td>"
					html += "<td style='text-align : center;'>"+ result.pagingVO.dataList[i].nbr_no +"</td>"
					html += "<td>"+ result.pagingVO.dataList[i].nbr_nm +"</td>"
					html += "<td style='text-align : center;'>"+ result.pagingVO.dataList[i].nbr_author +"</td>"
					html += "<td style='text-align : center;'>"+ result.pagingVO.dataList[i].nbr_ymd +"</td>"
					html += "<td style='text-align : center;'>"+ result.pagingVO.dataList[i].ccg_r001 +"</td>"
					html += "</tr>"
				}
			}
			$("table tbody").append(html);
			pagingArea.innerHTML = result.pagingVO.pagingHTML;
			requestCount.innerText = result.pagingVO.totalRecord;
		},
		error: function(error) {
			console.log("error");
		}
	});
}
</script>