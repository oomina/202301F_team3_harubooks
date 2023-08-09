<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>     
<style>
.fa-5x {
    margin-top: -14px;
    font-size: 2.3em;
}
div#back{
	padding: 30px;
	color: rgb(255, 255, 255);
	height: 70px; width: 420px;
	display: flex;
	justify-content: space-between;
	border-radius: 3px;
	font-weight: bold;
	max-width: 800px;
}
div.current_temp{
	font-size : 28pt;
	margin-top : -22px;
}
div.weather_description{
	font-size : 20pt;
	margin-top: -25px;
}
div.city{
	font-size : 18pt;
	margin-top: -14px;
}

.bell{
	cursor: pointer;
}

#yellow-bell{
	display : none;
	color : #FFC100;
}

</style>
 <div class="header">
       <!-- <div class="search">
           <i class="ri-search-line"></i>
           <input type="text" placeholder="search">
       </div> -->
       <!-- 날씨 정보 -->
        <div id="back">
		    <div style="width: 40px;">
		        <div class="weather_icon"></div>
		    </div>
	        <div class="current_temp"></div>
	        <div>
		        <div class="weather_description"></div>
		       	<div class="humidity" style="text-align: center;"></div> 
	        </div>
	        
	        <div class="city"></div>
		</div>
	   <input type="hidden" value="<sec:authentication property="name"/>" id="sec-name">
	   <input type="hidden" value="${status }" id="site-status">
       <div class="header-content">
      	   <i id="yellow-bell" class="ri-notification-4-fill bell"></i>
      	   <i id="black-bell"  class="ri-notification-fill bell"></i>
      	   <div id='bell-div'></div>
 <!--      <i class="ri-mail-unread-fill"></i> -->
           <!--버튼-->
           <a href="/harubooks/main" class="btn" id="go-back1">
               <div class="btn-text">하루북스로 이동</div>
           </a>
           <a href="/myHaru/myHaruMain" class="btn" id="go-back2">
               <div class="btn-text">나의하루로 이동</div>
           </a>
<!--            <a href="#" class="btn"> -->
<!--                <i class="ri-add-circle-fill"></i> -->
<!--                <div class="btn-text">하루피드 작성하기</div> -->
<!--            </a> -->
       </div>
 </div>
 <div id="getAddr"></div>
<script type="text/javascript">
$(function(){
var ae_id = document.querySelector("#sec-name").value;
var getAddr = document.querySelector("#getAddr");
var websocket;	
	connectEcho();			// 알람 확인

	$(".bell").on("click", function(){
		if($("#bell-div").css("display") == "grid"){
			$("#bell-div").css("display", "none")
		}else{	
			$("#bell-div").css("display", "grid")
		}
	})
	
	$.ajax({
		url: "/haruter/getAddr?ae_id="+ae_id,
		type: "get",
		success: function (res) {
			str = "<input type='hidden' id='addr' value="+res.mbr_addr+">"
			getAddr.innerHTML = str
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
	var geocoder = new kakao.maps.services.Geocoder();
	var lon;
	var lat;
	// result[0].x,y가 좌표
	var callback = function(result, status) {
		if (status === kakao.maps.services.Status.OK) {
			lon = result[0].x;
			lat = result[0].y;
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
			        var $humidity = '습도&nbsp;' + resp.main.humidity+ '%';
			        /*var $wind = '바람&nbsp;&nbsp;&nbsp;&nbsp;' +resp.wind.speed + ' m/s';
			        var $cloud = '구름&nbsp;&nbsp;&nbsp;&nbsp;' + resp.clouds.all +"%";
			        var $temp_min = '최저 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_min) + 'º';
			        var $temp_max = '최고 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_max) + 'º'; */
			        
			        if($Icon == 50){
				        $('.weather_icon').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="font-size : 2.4em;"></i>');
				        $('#back').css(style="background", "url('/resources/asset/image/weather_smog.gif') center center/100% no-repeat");
			        }else if($Icon == 13){
				        $('.weather_icon').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="font-size : 2.4em;"></i>');
				        $('#back').css(style="background", "url('/resources/asset/image/weather_snowing.gif') center center/100% no-repeat");
			        }else if($Icon == 11){
				        $('.weather_icon').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="font-size : 2.4em;"></i>');
				        $('#back').css(style="background", "url('/resources/asset/image/weather_strom.gif') center center/100% no-repeat");
			        }else if($Icon == 10 || $Icon == 9){
				        $('.weather_icon').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="font-size : 2.4em;"></i>');
				        $('#back').css(style="background", "url('/resources/asset/image/weather_rainy.gif') center center/100% no-repeat");
			        }else if($Icon == 3 || $Icon == 4){
				        $('.weather_icon').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="font-size : 2.4em;"></i>');
				        $('#back').css(style="background", "url('/resources/asset/image/weather_cloudy.gif') center center/100% no-repeat");
			        }else{
			        	$('.weather_icon').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="font-size : 2.4em;"></i>');
				        $('#back').css(style="background", "url('/resources/asset/image/weather_sunny.gif') center center/100% no-repeat");
			        }

			        $('.weather_description').prepend($weather_description);
			        $('.current_temp').prepend($Temp);
			        $('.city').append($city);
			        $('.humidity').prepend($humidity);
			        
			        /* $('.wind').prepend($wind);
			        $('.cloud').append($cloud);
			        $('.temp_min').append($temp_min);
			        $('.temp_max').append($temp_max); */               
			    }
			})
		}
	};  
	
	// 하루피드 부분이 아니면 하루피드로 간다
	$(document).on("click", "#go-harufeed",function(){
		location.href = "/haruter/haruFeed";
	})

	// 모집게시판 부분이 아니면 모집게시판으로 간다.
	$(document).on("click", "#go-chatBoard",function(){
		location.href = "/haruter/chattingBoard";
	})

	
})


// 알림 연결
function connectEcho(){
	var ae_id = document.querySelector("#sec-name").value;
	var wsUrl = "ws://192.168.146.66/echo"
	websocket = new WebSocket(wsUrl);	
	
	websocket.onopen = function() {
		console.log("연결완료");
		messageObj = { message : "NO",
				   		    my : ae_id,
				   		   you : ae_id,
					 };

		websocket.send(JSON.stringify(messageObj));
	};

	websocket.onmessage = function(event) {
		console.log(event.data);
		var message = event.data;
		var firstColonIndex = message.indexOf(":");
		
		var messageType = message.substring(0, firstColonIndex);
		var messageContent = message.substring(firstColonIndex + 1);
		var status = $("#site-status").val();
		
		// 만약 중간에 누가 댓글을 달았을 때 알림이 없습니다라는 글이 있으면 해당 글을 없애준다
		function resetCheckBell(){
			if($("#bell-div").html() == "알림이 없습니다."){
				$("#bell-div").html();
			}			
		}
		
		// 받은 메세지가 하루피드이면서, 페이지가 하루피드일 때 기본 메세지를 준다
		if(messageType == 'status1' && status == 1){
			resetCheckBell();
			$("#yellow-bell").css("display", "block");
			$("#black-bell").css("display", "none");
			$("#bell-div").append(messageContent);
		}	
		
		// 받은 메세지가 하루피드이면서, 페이지가 하루피드가 아닐 때 하루피드로 갈 수 있는 메세지를 준다
		else if(messageType == 'status1' && status != 1){
			resetCheckBell();
			$("#yellow-bell").css("display", "block");
			$("#black-bell").css("display", "none");
			tempDiv = ""
			tempDiv += "<div id='go-harufeed'>"
			tempDiv += "	<span><span style='color: #0443ff;'>하루 피드</span>에 댓글이 달렸습니다!</span>"
			tempDiv += "</div>"
			$("#bell-div").append(tempDiv);
		}	
		
		// 받은 메세지가 모집게시판이면서, 페이지가 모집게시판일 때 기본 메세지를 준다	
		else if(messageType == 'status3' && status == 3){
			resetCheckBell();
			$("#yellow-bell").css("display", "block");
			$("#black-bell").css("display", "none");
			$("#bell-div").append(messageContent);
		}	
		
		// 받은 메세지가 모집게시판이면서, 페이지가 모집게시판이 아닐 때 모집게시판으로 갈 수 있는 메세지를 준다
		else if(messageType == 'status3' && status != 3){
			resetCheckBell();
			$("#yellow-bell").css("display", "block");
			$("#black-bell").css("display", "none");
			tempDiv = ""
			tempDiv += "<div id='go-chatBoard'>"
			tempDiv += "	<span><span style='color: #ff3504;'>모집게시판</span>에 댓글이 달렸습니다!</span>"
			tempDiv += "</div>"
			$("#bell-div").append(tempDiv);
		}	
		
		// 알림이 없을 때
		else if(messageType == 'status2' && $("#bell-div").html() == ""){
			$("#yellow-bell").css("display", "none");
			$("#black-bell").css("display", "block");
			$("#bell-div").append(messageContent);
		}	
		
	};

	websocket.onclose = function() {
	    console.log('close');
	};
	
	
}

</script>