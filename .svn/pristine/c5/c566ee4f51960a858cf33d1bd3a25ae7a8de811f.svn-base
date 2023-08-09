<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0" style="margin-bottom: 1.5rem;">
                  <h3 class="font-weight-bold" style="font-family: 'orbit', sans-serif;">하루북스 관리자 페이지</h3>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <!-- 카드느낌 -->
            <div class="col-md-12 grid-margin transparent">
              <div class="row">
                <div class="col-md-3 mb-3 stretch-card transparent">
                  <div class="card card-tale">
	                <div class="card-body" style="display : flex; align-items: center;">
	                  <div class="col-md-6" style="padding : 0;">
		                  <p class="mb-4" style="font-weight: bold;">도서수</p>
		                  <p id="bookCntDisp" class="fs-30 mb-2" style="font-weight: bold;"></p>
	                  </div>
	                  <div class="col-md-6" style="text-align : right; padding : 0;">
	                  	<i class="ri-book-2-line" style="font-size: 80px;"></i>
	                  </div>
	                </div>
                  </div>
                </div>
                <div class="col-md-3 mb-3 stretch-card transparent">
                  <div class="card card-dark-blue">
                    <div class="card-body" style="display : flex; align-items: center;">
                      <div class="col-md-6" style="padding : 0;">
                        <p class="mb-4" style="font-weight: bold;"><span id="curDay"></span>&nbsp;주문</p>
                        <p id="orderCntDisp" class="fs-30 mb-2" style="font-weight: bold;"></p>
                      </div>
                      <div class="col-md-6" style="text-align : right; padding : 0;">
	                    <i class="ri-shopping-bag-2-line" style="font-size: 80px;"></i>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-3 mb-3 stretch-card transparent">
                  <div class="card card-light-blue">
                    <div class="card-body" style="display : flex; align-items: center;">
                       <div class="col-md-6" style="padding : 0;">
	                      <p class="mb-4" style="font-weight: bold;"><span id="curMonth"></span>월 매출</p>
	                      <p id="totalSalesDisp" class="fs-30 mb-2" style="font-size: 22px; font-weight: bold;"></p>
	                   </div>   
                       <div class="col-md-6" style="text-align : right; padding : 0;">
	                     <i class="ri-bar-chart-2-line" style="font-size: 80px;"></i>
	                   </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-3  mb-3 stretch-card transparent">
                  <div class="card card-light-danger">
                  	<div class="card-body" style="display : flex; align-items: center;">
	                  <div class="col-md-6" style="padding : 0;">
		                  <p class="mb-4" style="font-weight: bold;">출판사</p>
		                  <p id="pubCntDisp" class="fs-30 mb-2" style="font-weight: bold;"></p>
	                  </div>
	                  <div class="col-md-6" style="text-align : right; padding : 0;">
	                    <i class="ri-store-2-line" style="font-size: 80px;"></i>
	                  </div>
	                </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
          	<div class="col-lg-6 grid-margin stretch-card" style="height: 330px;">
	          <div class="card">
	            <div class="card-body">
	            	<div class="row">
                       	<h4 class="card-title ml-3 mt-1" style="font-family: 'orbit', sans-serif;"><a href="/mng/remains" style="color : black;">재고 내역</a></h4>
                        	<div class="col-md-12 mt-1" style="display : flex;">
                          		<div class="col-md-4 mr-1">
		                       		<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center; color : #ff4747;">위험</p>
		                       		<p id="dangerDisp" class="fs-30 mb-4" style="font-weight: bold; font-family: 'orbit', sans-serif; text-align : center;">
		                       		</p>
		                        </div>
		                        <div class="col-md-4 mr-1">
		                       		<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center; color : #ffc100;">경고</p>
		                       		<p id="warnigDisp" class="fs-30 mb-2" style="font-weight: bold; font-family: 'orbit', sans-serif; text-align : center;">
		                       		</p>
		                        </div>
		                        <div class="col-md-4 mr-1">
		                       		<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center; color : #4dac27;">양호</p>
		                       		<p id="fineDisp" class="fs-30 mb-2" style="font-weight: bold; font-family: 'orbit', sans-serif;text-align : center;">
		                       		</p>
		                        </div>
                          </div>
                      </div>
                      <div class="row">
                      	<h4 class="card-title ml-3 mt-4" style="font-family: 'orbit', sans-serif;">요청 내역</h4>
                        <div class="col-md-12 mt-1" style="display : flex;">
                          <div class="col-md-4 mr-1">
                        	<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center;">문의</p>
                        	<p  class="fs-30 mb-4" style="font-weight: bold; font-family: 'orbit', sans-serif; text-align : center;">
                        		<a href="/mng/inquiry" id="inqCntDisp"></a>
                        	</p>
                          </div>
                          <div class="col-md-4 mr-1">
                        	<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center;">환불</p>
                        	<p class="fs-30 mb-2" style="font-weight: bold; font-family: 'orbit', sans-serif; text-align : center;">
                        		<a href="/mng/refunds" id="refundCntDisp"></a>
                        	</p>
                          </div>
                          <div class="col-md-4 mr-1">
                        	<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center;">도서등록</p>
                        	<p class="fs-30 mb-2" style="font-weight: bold; font-family: 'orbit', sans-serif;text-align : center;">
                        		<a href="/mng/bookRequest" id="bookreqCntDisp"></a>
                        	</p>
                          </div>
                      </div>
                    </div>
                  </div>
	            </div>
	          </div>
	        
          <!-- 좌우로 이동  -->
<!--             <div class="col-lg-6 grid-margin stretch-card" style="height: 330px;">
              <div class="card">  position-relative
                <div class="card-body">
                  <div id="detailedReports" class="carousel slide detailed-report-carousel position-static pt-2" data-ride="carousel">
				    <a class="carousel-control-prev" href="#detailedReports" role="button" data-slide="prev">
	                  <span class="carousel-control-prev-icon position-static" aria-hidden="true"></span>
	                  <span class="sr-only">Previous</span>
	                </a>
	                <a class="carousel-control-next" href="#detailedReports" role="button" data-slide="next">
	                  <span class="carousel-control-next-icon position-static" aria-hidden="true"></span>
	                  <span class="sr-only">Next</span>
	                </a>
                    <div class="carousel-inner">
                    	<div class="carousel-item active">
                        	<h4 class="card-title" style="font-family: 'orbit', sans-serif;">재고 내역</h4>
                        	<div class="col-md-12 mt-4" style="display : flex;">
                          		<div class="col-md-4 mr-1">
		                       		<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center; color : #ff4747;">위험</p>
		                       		<p id="dangerDisp" class="fs-30 mb-4" style="font-weight: bold; font-family: 'orbit', sans-serif; text-align : center;">
		                       		</p>
		                        </div>
		                        <div class="col-md-4 mr-1">
		                       		<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center; color : #ffc100;">경고</p>
		                       		<p id="warnigDisp" class="fs-30 mb-2" style="font-weight: bold; font-family: 'orbit', sans-serif; text-align : center;">
		                       		</p>
		                        </div>
		                        <div class="col-md-4 mr-1">
		                       		<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center; color : #4dac27;">양호</p>
		                       		<p class="fs-30 mb-2" style="font-weight: bold; font-family: 'orbit', sans-serif;text-align : center;">
		                       		</p>
		                        </div>
                          </div>
                      </div>
                      <div class="carousel-item">
                      	<h4 class="card-title" style="font-family: 'orbit', sans-serif;">요청 내역</h4>
                        <div class="col-md-12 mt-4" style="display : flex;">
                          <div class="col-md-4 mr-1">
                        	<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center;">문의</p>
                        	<p  class="fs-30 mb-4" style="font-weight: bold; font-family: 'orbit', sans-serif; text-align : center;">
                        		<a href="/mng/inquiry" id="inqCntDisp"></a>
                        	</p>
                          </div>
                          <div class="col-md-4 mr-1">
                        	<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center;">환불</p>
                        	<p class="fs-30 mb-2" style="font-weight: bold; font-family: 'orbit', sans-serif; text-align : center;">
                        		<a href="/mng/refunds" id="refundCntDisp"></a>
                        	</p>
                          </div>
                          <div class="col-md-4 mr-1">
                        	<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center;">신청</p>
                        	<p class="fs-30 mb-2" style="font-weight: bold; font-family: 'orbit', sans-serif;text-align : center;">
                        		<a href="/mng/bookRequest" id="bookreqCntDisp"></a>
                        	</p>
                          </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div> -->
          <!-- 좌우로 이동 END -->
          <!-- ToDoList -->
	      <div class="col-lg-6 grid-margin stretch-card" style="height: 330px;">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title" style="margin-bottom: 0.2rem; font-family: 'orbit', sans-serif;">하루 할 일</h4>
              <div class="list-wrapper pt-2" style="overflow : hidden;">
                <ul class="d-flex flex-column-reverse todo-list todo-list-custom">
                  <!--to do ㅣist 1개-->
                  <li style='height: 20px;margin-bottom: 0.2rem;'>
                    <div class="form-check form-check-flat">
                      <label class="form-check-label">
                        <input class="checkbox" type="checkbox">요청글 확인
                      </label>
                    </div>
                    <i class="remove ti-close"></i>
                  </li>
                  <!--to do list 2개 class="completed" -->
                  <li style='height: 20px;margin-bottom: 0.2rem;'>
                    <div class="form-check form-check-flat">
                      <label class="form-check-label">
                        <input class="checkbox" type="checkbox">도서 신청글 확인
                      </label>
                    </div>
                    <i class="remove ti-close"></i>
                  </li>
                </ul>
                <div class="add-items d-flex mb-0 mt-2">
                  <input type="text" class="form-control todo-list-input"  placeholder="&nbsp;할 일을 입력해주세요." style="border : 1px solid #CED4DA; height: 20px;">
                  <button class="add btn btn-icon text-primary todo-list-add-btn bg-transparent" style="width : auto; height: auto;"><i class="icon-circle-plus"></i></button>
                </div>
              </div>
            </div>
           </div>
	      </div>
          <!-- ToDoList END -->
         </div>
       </div>  
<script>
const bookCntDisp = document.querySelector("#bookCntDisp");
const orderCntDisp = document.querySelector("#orderCntDisp");
const warnigDisp = document.querySelector("#warnigDisp");
const dangerDisp = document.querySelector("#dangerDisp");
const pubCntDisp = document.querySelector("#pubCntDisp");
const totalSalesDisp = document.querySelector("#totalSalesDisp");
const refundCntDisp = document.querySelector("#refundCntDisp");
const inqCntDisp = document.querySelector("#inqCntDisp");
const bookreqCntDisp = document.querySelector("#bookreqCntDisp");
const curMonth = document.querySelector("#curMonth");
const curDay = document.querySelector("#curDay");
const fineDisp = document.querySelector("#fineDisp");
let totalCnt = 0;
let warnigCnt = 0;
let dangerCnt = 0;
let fineCnt = 0;

$(document).ready(function(){
	// 화면 출력
	fRemainCnt();
	fRemainWarnigCnt();
	fRemainDangerCnt();
	fRemainFineCnt();
	fOrderCnt();
	fPubCnt();
	fTotalSale();
	fRefundCnt();
	fInquiryCnt();
	fNewBookRequestCnt();
  
});

function fRemainWarnigCnt(){
	$.ajax({
		url : "/mng/remain/list/2",
		type : "get",
		success : function(res){
			warnigCnt = res.mngPaginationInfoVO.totalRecord;
			warnigDisp.innerText = warnigCnt + "권";
		}
	});
}

function fRemainDangerCnt(){
	$.ajax({
		url : "/mng/remain/list/1",
		type : "get",
		success : function(res){
			dangerCnt = res.mngPaginationInfoVO.totalRecord;
			dangerDisp.innerText = dangerCnt + "권";
		}
	});
}

function fRemainFineCnt(){
	$.ajax({
		url : "/mng/remain/list/3",
		type : "get",
		success : function(res){
			console.log("finecnt : " + res);
			fineCnt = res.mngPaginationInfoVO.totalRecord;
			fineDisp.innerText = fineCnt + "권";
		}
	});
}

function fRemainCnt(){
	$.ajax({
		url : "/mng/remain/list",
		type : "get",
		success : function(res){
			console.log(res);
			totalCnt = res.mngPaginationInfoVO.totalRecord;
			bookCntDisp.innerText = totalCnt;
		}
	});
}

function fOrderCnt(){
	$.ajax({
		url : "/mng/order/today",
		type : "get",
		success : function(res){
			orderCntDisp.innerText = res;
		}
	}); 
}

function fTotalSale(){
	$.ajax({
		url : "/mng/sales/monthlySales",
		type : "get",
		contentType : "application/json; charset=utf-8",
		success : function(res){
			var now = new Date();	// 현재 날짜 및 시간
			var curday = now.toISOString().substring(5,10).replace(/-/g,'/');
			curDay.innerText = curday;
			var month = now.getMonth() + 1;	// 현재 월
			if(month.length = 1){
				month = "0" + month;
			}
			curMonth.innerText = month;
			console.log(month)
			for(let i= 0; i<res.length; i++){
				if(res[i].month == month){
					let total = Number(res[i].total_sales).toLocaleString();
					totalSalesDisp.innerText = total; 
				}
			}
		}
	})
}

function fPubCnt(){
	$.ajax({
		url : "/mng/pub/cnt",
		type : "get",
		success : function(res){
			pubCntDisp.innerText = res;
		}
	});
}

function fRefundCnt(){
	$.ajax({
		url : "/mng/order/refundcnt",
		type : "get",
		success : function(res){
			refundCntDisp.innerText = res + "건";
		}
	});
}

function fInquiryCnt(){
	$.ajax({
		url : "/mng/board/inqcnt",
		type : "get",
		success : function(res){
			inqCntDisp.innerText = res + "건";
		}
	});
}

function fNewBookRequestCnt(){
	$.ajax({
		url : "/mng/bookRequest/bookreqcnt",
		type : "get",
		success : function(res){
			bookreqCntDisp.innerText = res + "건";
		}
	});
}
</script>