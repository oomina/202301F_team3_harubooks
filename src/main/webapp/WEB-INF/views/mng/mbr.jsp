<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="content-wrapper" style="padding: 10px;">
	<div class="row" style="padding: 10px;">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">회원 정보</h4>
					<form action="" method="post" id="searchForm">
						<input type="hidden" name="page" id="page"/>
						<div class="col-lg-12">
							<div class="row dropdown" style="float:right; margin-bottom: 5px; margin-right: -22px;">
								<select id="option" name="searchType" style="width: 100px; border: 1px solid lightgray;">
									<option value="id" selected>아이디</option>
									<option value="nm">회원명</option>
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
					<p class="card-description">전체 <code><span id="mbrCount"></span></code>건</p>
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr class="table-primary">
									<th style="text-align : center;">번호</th>
									<th style="text-align : center;">아이디</th>
									<th style="text-align : center;">회원명</th>
									<th style="text-align : center;">핸드폰</th>
									<th style="text-align : center;">이메일</th>
									<th style="text-align : center;">등급</th>
									<th style="text-align : center;">마일리지</th>
								</tr>
							</thead>
							<tbody id="mbrList">
							</tbody>
						</table>
					</div>
				</div>
				<div id="pagingArea" style="margin-bottom: 20px;"></div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var mbrList = document.querySelector("#mbrList");
var mbrCount = document.querySelector("#mbrCount");
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

// 회원 정보 리스트
function list() {
	var list = document.querySelector("#mbrList");
	var searchType = option.value;
	var searchWord = searchInput.value;
	list.innerHTML = '';
	$.ajax({
		type : "get",
		url : "mbr/selectMbrList",
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
				html += `<td colspan="7" align="center">회원 목록이 존재하지 않습니다.</td>`
				html += "</tr>"
			} else {
				for (var i = 0; i < result.pagingVO.dataList.length; i++) {
					console.log(result.pagingVO.dataList[i].ae_id);
					console.log(result.pagingVO.dataList[i].rnum);
					html += `<tr class='list' data-id = \${result.pagingVO.dataList[i].ae_id}>`
					html += "<td style='text-align : center;'>"+ result.pagingVO.dataList[i].rnum +"</td>"
					html += "<td style='text-align : center;'>"+ result.pagingVO.dataList[i].ae_id +"</td>"
					html += "<td style='text-align : center;'>"+ result.pagingVO.dataList[i].user_nm +"</td>"
					html += "<td style='text-align : center;'>"+ result.pagingVO.dataList[i].mbr_telno +"</td>"
					html += "<td>"+ result.pagingVO.dataList[i].mbr_email +"</td>"
					if(result.pagingVO.dataList[i].rank_name == "브론즈"){
						html += "<td style='text-align : center;'><label class='badge badge-success'>"+ result.pagingVO.dataList[i].rank_name +"</label></td>"
					}else if(result.pagingVO.dataList[i].rank_name == "실버"){
						html += "<td style='text-align : center;'><label class='badge badge-info'>"+ result.pagingVO.dataList[i].rank_name +"</label></td>"
					}else if(result.pagingVO.dataList[i].rank_name == "골드"){
						html += "<td style='text-align : center;'><label class='badge badge-warning'>"+ result.pagingVO.dataList[i].rank_name +"</label></td>"
					}else{
						html += "<td style='text-align : center;'><label class='badge badge-danger'>"+ result.pagingVO.dataList[i].rank_name +"</label></td>"
					}
					html += "<td style='text-align : right;'>"+ result.pagingVO.dataList[i].mbr_mileage.toLocaleString() +"</td>"
					html += "</tr>"
				}
				$(document).on('click','.list',function(){
					let id = $(this).data('id');
					location.href="/mng/mbrInfo/"+id;
				});
			}
			$("table tbody").append(html);
			pagingArea.innerHTML = result.pagingVO.pagingHTML;
			mbrCount.innerText = result.pagingVO.totalRecord;
		},
		error: function(error) {
			console.log("error");
		}
	});
}
</script>