<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<input type="hidden" value="<sec:authentication property="name"/>" id="sec-name">
<div class="content-wrapper">
	<div class="row">
		<div class="col-md-12 grid-margin">
			<div class="row">
				<div class="col-12 col-xl-8 mb-4 mb-xl-0">
					<h3 class="font-weight-bold" style="font-family: 'orbit', sans-serif;">하루북스 출판사 페이지</h3>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12 grid-margin transparent">
			<div class="row">
				<div class="col-md-3 mb-3 stretch-card transparent">
					<div class="card card-tale">
						<div class="card-body" style="display : flex; align-items: center;">
							<div class="col-md-6" style="padding : 0;">
								<p class="mb-4" style="font-weight: bold;">도서 수</p>
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
								<p class="mb-4" style="font-weight: bold;"><span id="curMonth"></span>월 판매량</p>
								<p id="totalSalesDisp" class="fs-30 mb-2" style="font-weight: bold;"></p>
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
								<p class="mb-4" style="font-weight: bold;"><span id="curMonth2"></span>월 매출액</p>
								<p id="monthlySalesDisp" class="fs-30 mb-2" style="font-size: 22px; font-weight: bold;"></p>
							</div>   
							<div class="col-md-6" style="text-align : right; padding : 0;">
								<i class="ri-bar-chart-2-line" style="font-size: 80px;"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3  mb-3 stretch-card transparent">
					<div id="getAddr"></div>
					<!-- 날씨 정보 -->
					<div id="back" style="padding : 27px; color : #fff; height : 144px; width: 246px; border-radius: 20px; display: flex; justify-content: space-between;">
						<div style="float : left; width: 30%; height: 58%;">
							<div class="weather_icon"></div>
						</div><br>
						<div style="float : right; margin-left: 45px; margin-top:-23px; font-weight: bold;">
							<div class="current_temp" style="font-size: 34pt;margin-top: 4px;"></div>
							<div class="weather_description" style="font-size: 23pt;margin-top: -10px;"></div>
							<div class="city" style="font-size : 18pt"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-6 grid-margin stretch-card" style="height: 230px;">
			<div class="card"> <!--  position-relative -->
				<div class="card-body">
					<div id="detailedReports" class="carousel slide detailed-report-carousel position-static pt-2" data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<div class="col-md-12 mt-1">
									<div class="charts-data">
										<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center;">발주 승인</p>
										<div class="col-md-12 mt-5" style="display : flex;">
											<div class="col-md-4 mr-1">
												<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center;">대기</p>
												<p class="fs-30 mb-4" style="font-weight: bold; font-family: 'orbit', sans-serif; text-align : center;">
													<a href="/pub/po" id="waitCntDisp"></a>
												</p>
											</div>
											<div class="col-md-4 mr-1">
												<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center;">수락</p>
												<p class="fs-30 mb-2" style="font-weight: bold; font-family: 'orbit', sans-serif; text-align : center;">
													<a href="/pub/po" id="acceptCntDisp"></a>
												</p>
											</div>
											<div class="col-md-4 mr-1">
												<p class="card-title" style="font-family: 'orbit', sans-serif; text-align : center;">거절</p>
												<p class="fs-30 mb-2" style="font-weight: bold; font-family: 'orbit', sans-serif; text-align : center;">
													<a href="/pub/po" id="refuseCntDisp"></a>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ToDoList -->
		<div class="col-lg-6 grid-margin stretch-card" style="height: 230px;">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title" style="font-family: 'orbit', sans-serif; margin-bottom: 0.2rem;">하루 할 일</h4>
					<div class="list-wrapper pt-2" style="overflow : hidden;">
						<ul class="d-flex flex-column-reverse todo-list todo-list-custom">
							<li style='height: 20px; margin-bottom: 0.2rem;'>
								<div class="form-check form-check-flat">
									<label class="form-check-label">
										<input class="checkbox" type="checkbox">신규 도서 요청 등록
									</label>
								</div>
								<i class="remove ti-close"></i>
							</li>
							<li style='height: 20px; margin-bottom: 0.2rem;'>
								<div class="form-check form-check-flat">
									<label class="form-check-label">
										<input class="checkbox" type="checkbox">발주 요청 수락
									</label>
								</div>
								<i class="remove ti-close"></i>
							</li>
						</ul>
						<div class="add-items d-flex mb-0 mt-2">
							<input type="text" class="form-control todo-list-input" placeholder="&nbsp;할 일을 입력해주세요." style="border : 1px solid #CED4DA; height: 20px;">
							<button class="add btn btn-icon text-primary todo-list-add-btn bg-transparent" style="width : auto; height: auto;"><i class="icon-circle-plus"></i></button>
						</div>
					</div>
				</div>
			</div>
			<!-- ToDoList END -->
		</div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=36584831e197b98edd86956a97705ecb&libraries=services"></script>
<script src="https://kit.fontawesome.com/87e7dd5b05.js" crossorigin="anonymous"></script>
<script type="text/javascript">
const bookCntDisp = document.querySelector("#bookCntDisp");
const totalSalesDisp = document.querySelector("#totalSalesDisp");
const monthlySalesDisp = document.querySelector("#monthlySalesDisp");
const curMonth = document.querySelector("#curMonth");
const curMonth2 = document.querySelector("#curMonth2");
const waitCntDisp = document.querySelector("#waitCntDisp");
const acceptCntDisp = document.querySelector("#acceptCntDisp");
const refuseCntDisp = document.querySelector("#refuseCntDisp");

let totalCnt = 0;

$(document).ready(function(){
	// 화면 출력
	fRemainCnt();
	fTotalSale();
	monthlySales();
	waitCnt();
	acceptCnt();
	refuseCnt();
});

function fRemainCnt(){
	$.ajax({
		url : "/pub/remain/list",
		type : "get",
		success : function(res){
			totalCnt = res.totalRecord;
			bookCntDisp.innerText = totalCnt;
		}
	});
}

function fTotalSale(){
	$.ajax({
		url : "/pub/sales/monthlyCnt",
		type : "get",
		contentType : "application/json; charset=utf-8",
		success : function(res){
			console.log(res);
			var now = new Date();	// 현재 날짜 및 시간
			console.log(now)
			var month = now.getMonth() + 1;	// 현재 월
			console.log(month);
			if(month.length = 1){
				month = "0" + month;
			}
			curMonth.innerText = month;
			console.log(month)
			for(let i= 0; i<res.length; i++){
				if(res[i].month == month){
					let total = Number(res[i].total_cnt).toLocaleString();
					totalSalesDisp.innerText = total; 
					console.log(total);
				}
			}
		}
	})
}

function monthlySales(){
	$.ajax({
		url : "/pub/sales/monthlySales",
		type : "get",
		contentType : "application/json; charset=utf-8",
		success : function(res){
			console.log(res);
			var now = new Date();	// 현재 날짜 및 시간
			console.log(now)
			var month = now.getMonth() + 1;	// 현재 월
			console.log(month);
			if(month.length = 1){
				month = "0" + month;
			}
			curMonth2.innerText = month;
			console.log(month)
			for(let i= 0; i<res.length; i++){
				if(res[i].month == month){
					let total = Number(res[i].total_sales).toLocaleString();
					monthlySalesDisp.innerText = total; 
					console.log(total);
				}
			}
		}
	})
}

// 요청 대기 개수
function waitCnt(){
	$.ajax({
		url : "/pub/remain/waitCnt",
		type : "get",
		success : function(res){
			waitCntDisp.innerText = res + "건";
			console.log("waitCnt " + res);
		}
	});
}

// 요청 수락 개수
function acceptCnt(){
	$.ajax({
		url : "/pub/remain/acceptCnt",
		type : "get",
		success : function(res){
			acceptCntDisp.innerText = res + "건";
			console.log("acceptCnt " + res);
		}
	});
}

// 요청 거절 개수
function refuseCnt(){
	$.ajax({
		url : "/pub/remain/refuseCnt",
		type : "get",
		success : function(res){
			refuseCntDisp.innerText = res + "건";
			console.log("refuseCnt " + res);
		}
	});
}

// 변환할 주소값을 받기위해 id에 해당하는 주소를 받아서 
// hidden으로 넣어준 후 그 주소 값을 좌표로 변환
$(function(){
	var ae_id = document.querySelector("#sec-name").value;
	var getAddr = document.querySelector("#getAddr");
	$.ajax({
		// ae_id 값에 해당하는 vo의 값 가져오기 
		url: "/myHaru/getAddr?ae_id="+ae_id,
		type: "get",
		success: function (res) {
			// hidden 값으로 주소값 value에 넣기
			str = "<input type='hidden' id='addr' value="+res.mbr_addr+">"
			// str getAddr이라는 div만들어서 그안에 넣기
			getAddr.innerHTML = str
			// 받은 주소를 좌표로 변환해주고 callback 함수를 호출 
			geocoder.addressSearch($("#addr").val(), callback)
		}
	})
	//날씨 api - fontawesome 아이콘
	var weatherIcon = {
	    '01' : 'fas fa-sun',
	    '02' : 'fas fa-cloud-sun',
	    '03' : 'fas fa-cloud',
	    '04' : 'fas fa-cloud-sun',
	    '09' : 'fas fa-cloud-sun-rain',
	    '10' : 'fas fa-cloud-showers-heavy',
	    '11' : 'fas fa-poo-storm',
	    '13' : 'far fa-snowflake',
	    '50' : 'fas fa-smog'
	};
	// 주소를 좌표로 변환해주는 카카오맵 api (카카오맵 cdn 필요함)
	var geocoder = new kakao.maps.services.Geocoder();
	var lon;
	var lat;
	// result[0].x,y가 좌표
	var callback = function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			// 좌표를 해당 lon, lat에 넣고
			lon = result[0].x;
			lat = result[0].y;
			// url에 좌표를 넣어서 해당 지역의 날씨 받기
			var url = `https://api.openweathermap.org/data/2.5/weather?lat=\${lat}&lon=\${lon}&appid=2cca97bad916999f428d2d1f7d81dc7a&lang=kr&units=metric`;
			// url로 들어온 json 데이터 가공
			$.ajax({
			    url: url,
			    dataType: "json",
			    type: "GET",
			    async: false,
			    success: function(resp) {
			        var $Icon = (resp.weather[0].icon).substr(0,2);
			        var $weather_description = resp.weather[0].main;
			        var $Temp = Math.floor(resp.main.temp) + 'º';
			        var $city = resp.name;
			        var $humidity = '습도&nbsp;&nbsp;&nbsp;&nbsp;' + resp.main.humidity+ ' %';
			        /*var $wind = '바람&nbsp;&nbsp;&nbsp;&nbsp;' +resp.wind.speed + ' m/s';
			        var $cloud = '구름&nbsp;&nbsp;&nbsp;&nbsp;' + resp.clouds.all +"%";
			        var $temp_min = '최저 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_min) + 'º';
			        var $temp_max = '최고 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_max) + 'º'; */

			        if($Icon == 50){
			        	$('.weather_icon').append('<i class="' + weatherIcon[$Icon] +'" fa-5x style="font-size: 4.3em; margin-top:9px;"></i>');
				        $('#back').css(style="background", "url('/resources/asset/image/weather_smog.gif') center center/100% no-repeat");
			        }else if($Icon == 13){
			        	$('.weather_icon').append('<i class="' + weatherIcon[$Icon] +'" fa-5x style="font-size: 4.3em; margin-top:9px;"></i>');
				        $('#back').css(style="background", "url('/resources/asset/image/weather_snowing.gif') center center/100% no-repeat");
			        }else if($Icon == 11){
			        	$('.weather_icon').append('<i class="' + weatherIcon[$Icon] +'" fa-5x style="font-size: 4.3em; margin-top:9px;"></i>');
				        $('#back').css(style="background", "url('/resources/asset/image/weather_strom.gif') center center/100% no-repeat");
			        }else if($Icon == 10 || $Icon == 9){
			        	$('.weather_icon').append('<i class="' + weatherIcon[$Icon] +'" fa-5x style="font-size: 4.3em; margin-top:9px;"></i>');
				        $('#back').css(style="background", "url('/resources/asset/image/weather_rainy.gif') center center/100% no-repeat");
			        }else if($Icon == 3 || $Icon == 4){
			        	$('.weather_icon').append('<i class="' + weatherIcon[$Icon] +'" fa-5x style="font-size: 4.3em; margin-top:9px;"></i>');
				        $('#back').css(style="background", "url('/resources/asset/image/weather_cloudy.gif') center center/100% no-repeat");
			        }else{
			        	$('.weather_icon').append('<i class="' + weatherIcon[$Icon] +'" fa-5x style="font-size: 4.3em; margin-top:9px;"></i>');
				        $('#back').css(style="background", "url('/resources/asset/image/weather_sunny.gif') center center/100% no-repeat");
			        }

			        $('.weather_description').prepend($weather_description);
			        $('.current_temp').prepend($Temp);
			        $('.city').append($city);
			        
			        /* $('.humidity').prepend($humidity);
			        $('.wind').prepend($wind);
			        $('.cloud').append($cloud);
			        $('.temp_min').append($temp_min);
			        $('.temp_max').append($temp_max); */
			    }
			})
		}
	};
})
</script>