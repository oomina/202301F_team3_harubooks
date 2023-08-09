<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					</div>
					<div class="table-responsive">
						<table class="table table-hover">
							<thead>
								<tr class="table-primary">
									<th>번호</th>
									<th>발주분류</th>
									<th>발주일자</th>
									<th style="padding-left : 5px;">출판사</th>
									<th>상품번호</th>
									<th style="padding-left : 5px;">도서명</th>
									<th style="padding-left : 5px;">발주수량</th>
									<th>승인여부</th>
									<!-- <th style="width : 35px;"><input type="checkbox" id="chkAll"></th> -->
									<th>발주서</th>
								</tr>
							</thead>
							<tbody id="tblDisp">
							</tbody>
						</table>
					</div>
				</div>
				<div id="pagingArea" style="margin-bottom: 20px; "></div>
				<!-- <div style="margin-bottom: 20px; ">
					<div style="float: right; padding-right : 20px; ">
						<button type="button" class="btn btn-primary mr-2" id="downBtn">출력</button>
					</div>
				</div> -->
			</div>
		</div>
	</div>
</div>
<script>
const tblDisp = document.querySelector("#tblDisp");
const pagingArea = document.querySelector("#pagingArea");	// 페이징 div
let page = 1;
$(function(){
	fPoList();
	
	// 페이징
	pagingArea.addEventListener("click", function(){	
		if(event.target.tagName === "A") {
			event.preventDefault();
			console.log(event.target.getAttribute("data-page"));
			page = event.target.getAttribute("data-page");
			
			fPoList();
		}
	});
	
	// 전체 체크
	$(document).on("click", "#chkAll", function(){
		if($(this).is(":checked")){ //전체 체크
		// if($(".chkSub").prop("diabled", true)){
		// 	$(".chkSub").attr("checked", true);	
		// } else {
			$(".chkSub").attr("checked", true);
		// }
		}else{ //전체 해제
			$(".chkSub").attr("checked", false);
		}	
	});
	
})

function fPoList(){
	$.ajax({
		url : "/mng/remain/polist",
		type : "get",
		data : {
			page : page,
		},
		success : function(res){
			console.log(res);
			let tblstr = "";
			console.log(res);
			if(res.mngPaginationInfoVO.dataList.length == 0){
				tblstr += "<tr><td colspan='9' style='text-align : center;'>발주내역이 존재하지 않습니다.</td></tr>"
			} else {
				for(let i= 0; i<res.mngPaginationInfoVO.dataList.length; i++){
					tblstr += `<tr onclick="">`
					tblstr += 	`<td style="width : 40px;">\${res.mngPaginationInfoVO.startRow + i}</td>`
					if(res.mngPaginationInfoVO.dataList[i].ccg_p001 == '자동발주'){
						tblstr += 	`<td style="width : 80px; "><label class="badge badge-success">\${res.mngPaginationInfoVO.dataList[i].ccg_p001}</label></td>` 
					} else {
						tblstr += 	`<td style="width : 80px; "><label class="badge badge-light">\${res.mngPaginationInfoVO.dataList[i].ccg_p001}</label></td>`
					}
					tblstr += 	`<td style="width : 100px; ">\${res.mngPaginationInfoVO.dataList[i].br_ymd}</td>` 
					tblstr += 	`<td style="width : 150px; padding : 3px; word-wrap: break-word; white-space: pre-wrap;">\${res.mngPaginationInfoVO.dataList[i].pub_nm}</td>`
					tblstr += 	`<td style="width : 180px;">\${res.mngPaginationInfoVO.dataList[i].book_no}</td>` 
					tblstr += 	`<td style="width : 300px; padding : 3px; word-wrap: break-word; white-space: pre-wrap; height : auto;">\${res.mngPaginationInfoVO.dataList[i].book_title}</td>` 
					tblstr += 	`<td style="width : 40px; padding : 5px;">\${res.mngPaginationInfoVO.dataList[i].book_qty}</td>`
					if(res.mngPaginationInfoVO.dataList[i].ccg_r001 == '요청대기'){
						tblstr += 	`<td style=""><label class="badge badge-warning">\${res.mngPaginationInfoVO.dataList[i].ccg_r001}</label></td>`
					} else if(res.mngPaginationInfoVO.dataList[i].ccg_r001 == '요청수락'){
						tblstr += 	`<td style=""><label class="badge badge-info">\${res.mngPaginationInfoVO.dataList[i].ccg_r001}</label></td>`
					} else {
						tblstr += 	`<td style=""><label class="badge badge-danger">\${res.mngPaginationInfoVO.dataList[i].ccg_r001}</label></td>`
					}
					/* tblstr +=		'<td style="width : 2%; text-align : center">';
					if(res.mngPaginationInfoVO.dataList[i].ccg_r001 == '요청수락'){
						tblstr +=			'<input type="checkbox" class="chkSub">';
					} else {
						tblstr += 			'<input type="checkbox" class="chkSub" disabled>';
					}
					tblstr += 		'</td>' */
					//tblstr += 		'<td style="text-align : center;"><button style="border : 0px; background-color : transparent; onclick="fPoDown()"><i class="ri-file-excel-2-line" style="font-size: 20px;"></i></button></td>'
					tblstr += 		`<td style="text-align : center;"><button type="button" id="poDown" onclick="fpoDown('\${res.mngPaginationInfoVO.dataList[i].br_no}', '\${res.mngPaginationInfoVO.dataList[i].ae_id}')" style="border : 0px; background-color : transparent;"><i class="ri-download-2-fill" style="fot-size: 20px;"></i></button></td>`
					tblstr += "</tr>";
				}
			}
			tblDisp.innerHTML = tblstr;
			let total = document.querySelector("#total");
			total.innerText = res.mngPaginationInfoVO.totalRecord;
			
			pagingArea.innerHTML = res.mngPaginationInfoVO.pagingHTML;
		}
		
	})
}

function fpoDown(brNo, aeId){
	let data2 = {
		"br_no" : brNo,
		"ae_id" : aeId
	};
	$.ajax({
		url : "/mng/remain/podown",
		type : "post",
		data : JSON.stringify(data2),
		contentType : "application/json;charset=utf-8",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(res){
			if(res == null || res == "" || res.length == 0){
				Swal.fire({
					title : '발주서 파일을 준비중입니다.', 
					html : '발주서가 준비되면 다운로드 가능합니다.<br>다음에 다시 시도해주세요.', 
					icon : 'error',
					confirmButtonText: '확인'
				}).then(function (result) {
                    if (result.isConfirmed) {
                       	// 확인 버튼을 클릭한 경우
                       	location.href="/mng/po";
                   }
				}); 
			} else { // 파일 존재
				let aTag = document.createElement("a");
				//aTag.innerHTML = fileList[0].ua_nm;
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
					} 
				}); 
			}
			console.log(res);
		}
	});
}


</script>
	<!-- content wrapper End-->