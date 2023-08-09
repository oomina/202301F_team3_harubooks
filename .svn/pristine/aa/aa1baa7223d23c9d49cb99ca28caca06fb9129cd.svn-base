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
						<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">발주서 조회</h4>
						
					</div>
					<div style="display : flex; border : 1px solid black; box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.08);">
						<div class="table-responsive col-9" >
							<table border="1">
								<tr>
									<th>발급 기간</th>
								</tr>
								<tr>
									<td>시작일자 : <input type="date" id="startDay" value="" max="today"> ~ 종료일자 : <input type="date" id="endDay" value=""></td>
								</tr>
							</table>
						</div>
						<div class="col-3" style=" margin-right: 10px; margin-bottom: 18px">
							<button type="button" class="btn btn-outline-success mr-2" id="downBtn">검색</button>
							<button type="button" class="btn btn-outline-danger mr-2" id="resetBtn">초기화</button>
						</div>
					</div>
					<div style="height : 50px;"></div>
					<div class="card-title-wrapper">
						<h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">발주서 목록</h4>
						<div style="float:left;">
							<p class="card-description">
								전체 <code id="total"></code>건
							</p>
						</div>
					</div>
					<div style="border : 1px solid black; clear : both;" >
						<div class="col-md-12">
							<div id="poFileDisp" style="display : grid; grid-template-columns: repeat(auto-fit,minmax(150px, auto)); margin-left: 20px;">
							</div>
						</div>
					</div>
				</div>
				<div id="pagingArea" style="margin-bottom: 20px; z-index : 0;"></div>
				<div>
					<div class="row" style="float:right; margin-right: 30px; margin-bottom: 18px">
						<button type="button" class="btn btn-outline-primary mr-2" id="downBtn">출력</button>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
<button id="poModal" type="button" class="btn btn-primary" data-toggle="modal" data-target=".poModal-bg" style="display : none;" >modalShow</button>

<div class="modal fade poModal-bg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" style="">
	<div class="modal-content" style="margin : 0 auto; width: 1100px; top: -35px;">
		<div class ="modal-header">
			<h4>주문 상세 내역</h4>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body" style="display: flex; max-height: 700px; padding : 10px 10px;">
			<div style="float: left; /* border : 1px solid black; */ width: 38%;">
				<div id="orderOneDisp" >
				</div>
				<div id="payDisp">
				</div>
			</div>
			<div style="float :left; width : 2%; /* border: 1px solid black; */" ></div>
			<div style="float: right; /* border : 1px solid black;  */width: 60%;">
				<div id="purchsDisp">
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-outline-primary" data-dismiss="modal">확인</button>
		</div>
	</div>
	</div>
</div>


<input type="hidden" value="<sec:authentication property="name"/>" id="sec-name">
<script>
const startDay = document.querySelector("#startDay");
const endDay = document.querySelector("#endDay");
const poFileDisp = document.querySelector("#poFileDisp");
let id = $("#sec-name").val();
$(function(){
	fpoFileList();
	
	// 발급 기간 출력
	let today = new Date();
	today = today.toISOString().slice(0, 10);
	startDay.value= today;
	endDay.value = today;
	startDay.setAttribute("max", today);
	endDay.setAttribute("max", today);
	
});


// 파일 리스트 가져오기
function fpoFileList(){
	$.ajax({
		url : "/pub/remain/poFileList",
		type : "get",
		success : function(res){
			// poFileMap 으로 받아옴
			// fileList - file명을 다 가져옴
			// file명 - [br_no]를 배열로 가져옴
			console.log(res);
			if(res.fileList == null || res.fileList.length == 0){
				console.log("발급받을 발주서 내역이 존재하지 않습니다.");
			} else {
				for(let i=0; i<res.fileList.length; i++){
					let fileName = res.fileList[i];
					let divTag = document.createElement("div");
					divTag.classList.add("card");
					divTag.classList.add("poFile");
					divTag.classList.add("mr-2");
					divTag.setAttribute("onclick", "fCheckPo('"+fileName+"')");
					divTag.style.boxShadow = "0 2px 6px rgba(0, 0, 0, 0.1)";
				    divTag.style.transition = "transform 0.2s ease-in-out";
				   	divTag.style.marginBottom = "10px";
					// 이미지 태그
					let imgTag = document.createElement("img");
					imgTag.src = "/resources/mng/images/icon/icon-excel.png";
					imgTag.style.width = "100px";
					imgTag.style.height = "100px";
					imgTag.style.margin = "0 auto";
	
					// 파일 명
					let pTag = document.createElement("p");
					pTag.innerHTML = res.fileList[i];

					divTag.appendChild(imgTag);
					divTag.appendChild(pTag);
					poFileDisp.appendChild(divTag);
					
				}
			}
			let total = document.querySelector("#total");
			total.innerText = res.fileList.length;
		}
	
	});
}

// 엑셀 파일 가져오기
function fCheckPo(fileName){
	// 요청 승인/거절 확인
	fileName = fileName.split(".")[0];
	let fileSplit = fileName.split("_");
	let brNoList = []; 
	for(let i=2; i<fileSplit.length; i++){
		brNoList.push(fileSplit[i]);
	}
	$.ajax({
		url : "/pub/remain/checkpo",
		type : "post",
		data : JSON.stringify(brNoList),
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		async : false,
		contentType : "application/json;charset=utf-8",
		success : function(res){
			let flag = true;
			console.log(res);
			// res = map 
			// key : br_no/ value : poMngVO
			$.each(res, function(i , v){
				if(v == null || v == ""){
					
					Swal.fire({ //비동기
						title : '발주 내역이 존재하지 않습니다.', 
						text : '하루북스에 문의해주세요.', 
						icon : 'error',
						confirmButtonText: '확인',
						confirmButtonColor: '#3085d6',
					}).then(function (result) {
						if (result.isConfirmed) {
							// 확인 버튼을 클릭한 경우
							location.href = "/pub/podown";
							flag = false;
							callSuccessFunction(flag, fileName);
						} 
					});
				} else {
					// 요청 대기
					if(v.ccg_r001 == '요청대기'){
						//flag = false;
						Swal.fire({
							title : '발주 요청을 먼저 확인해주세요.', 
							text : '발주승인 또는 거절 이후에 발주서 다운이 가능합니다.', 
							icon : 'error',
							confirmButtonText: '확인',
							confirmButtonColor: '#3085d6',
						}).then(function (result) {
							if (result.isConfirmed) {
								// 확인 버튼을 클릭한 경우
								location.href = "/pub/po";
								flag = false;
								callSuccessFunction(flag, fileName);
							} 
						});
					} 
				} // else 문 끝
			}) // $.each문 끝
			//callSuccessFunction(flag, fileName);
			
		}// success 끝
	});
}

function callSuccessFunction(flag, fileName){
	console.log(flag, fileName);
	if(flag){
		let aTag = document.createElement("a");
		aTag.href = "/upload/excel/"+id +"/" + fileName + ".xlsx";	
		aTag.download ="하루북스 발주서_"+ id + "_" + fileName + ".xlsx";
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
	} else {
		location.href = "/pub/podown";
	}
}
</script>