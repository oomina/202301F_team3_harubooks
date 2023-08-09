<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!--게시물 나오는곳-->
<link rel="stylesheet" href="/resources/asset/css/chatting.css">

<!--메인 피드 -->
<div class="chatting">
	<div id="chatting-tex">
		<h1>채팅방</h1>
	</div>
	<div id="chatting-search">
		<select id="chatting-search-select">
			<option value="chatting_title">제목</option>
			<option value="chatting_no">채팅방 번호</option>
		</select>
		<input id="chatting-search-input" type="text" placeholder="찾을 채팅방을 입력하세요" maxlength="30">
		<button type="button" id="chatting-search-input-btn">검색</button>
	</div>
	<div id="chatting-select-list">
		<select id="chatting-select">
			<option value="order-inq" selected="selected">과거순</option>
			<option value="order-recent">최신순</option>
		</select>		
	</div>
	<div id="chatting-upload-btn" onclick="iModalOpen()">
          <i class="ri-add-circle-fill"></i>
          <div class="btn-text">채팅방 생성하기</div>
    </div>
</div>

<!-- 채팅방 작성 모달 -->
<div id="imodal">
	<div class="imcontainer">
			<input type="hidden" id="id" value="<sec:authentication property="name"/>"/>		

			<!-- 모달 작성 DIV -->
			<div id="chatting-insert-div">
				<div id="div-title" class="chatting-divs">
					<div id="iClose-div">
						<i onclick="imodalClose()" class="ri-close-line ibtn"></i>
					</div>
					<h2>채팅방 작성</h2>
				</div>
				<div id="chatting-title" class="chatting-divs">
					<label for="chatting-title"><span>제목</span></label>
					<input id="imodal-title" name='chatting-title' type="text" placeholder="채팅방 이름을 입력하세요!" maxlength="30">
				</div>
				<div id="chatting-content" class="chatting-divs">
					<label for="chatting-content"><span>소개글</span></label>
					<textarea id="imodal-content" name="chatting-content" rows="" cols="" placeholder="채팅방 소갯글을 입력하세요!" maxlength="150"></textarea>
				</div>
				<div id="iSetPassword" class="chatting-divs">
					<div id="iRadio">
						공개<input value="all" type ="radio" id="iradio-true" name="ccg_r003" checked="checked">
						비밀<input value="false" type ="radio" id="iradio-false" name="ccg_r003">
					</div>
					<div id="iPassword">
						<label for="chatting-password"><span>비밀번호</span></label>
						<input id="imodal-password" type="text" name="chatting-password" placeholder="비밀번호를 입력하세요!" maxlength="10">
					</div>
				</div>
				<div id="iCount" class="chatting-divs">
					<label for="chatting-member-count"><span>채팅 인원 수</span></label>
					<input id="imodal-count" name="chatting-member-count" type="number" max="10" min="2" value=2>
				</div>
				<div id="iBtn">
					<input type="button" class="iBtns" id="imodal-insert" value="생성">				
					<input type="button" class="iBtns" id="imodal-close" value="취소">				
				</div>
			</div>			
	</div>
</div>

<!-- 채팅방 상세 모달 -->
<div id="dmodal">
	<div class="dcontainer">
		<div id="chatting-detail-div">
			<div id="div-title" class="chatting-divs">
				<div id="dClose-div">
					<i onclick="dmodalClose()" class="ri-close-line dbtn"></i>
				</div>
				<h2>채팅방 정보</h2>
			</div>
			<div id="chatting-info-div"></div>
		</div>
	</div>
</div>

<!-- 채팅방 리스트 -->
<div id="chattingList" class='main-posts'></div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

var chattingSearchSelect = document.querySelector("#chatting-search-select"); 		// 검색할 채팅방 목록
var chattingSearchInput = document.querySelector("#chatting-search-input"); 		// 검색할 채팅방 이름
var chattingSelect = document.querySelector("#chatting-select"); 					// 정렬할 채팅방 목록
var chattingSearchInputBtn = document.querySelector("#chatting-search-input-btn")	// 검색 하기 버튼
var aeId = document.querySelector("#id"); // 세션 아이디

var chattingList = $("#chattingList");  // 채팅방 리스트

var iModal = document.querySelector("#imodal");	// 생성 모달창
var iMoalInsert = document.querySelector("#imodal-insert"); // 생성 버튼
var iMoalClose = document.querySelector("#imodal-close"); // 생성 취소 버튼
var imodalTitle = document.querySelector("#imodal-title"); // 채팅방 제목
var imodalContent = document.querySelector("#imodal-content"); // 채팅방 소개글
var imodalPassword = document.querySelector("#imodal-password"); // 채팅방 비밀번호
var imodalCount = document.querySelector("#imodal-count"); // 채팅방 인원수
var iradioTrue = document.querySelector("#iradio-true");  // 공개버튼
var iradioFalse = document.querySelector("#iradio-false");  // 비공개버튼
var iPassword = document.querySelector("#iPassword");	// 비밀번호 공간

var dModal = document.querySelector("#dmodal"); // 상세 모달창
var chattingInfoDiv = document.querySelector("#chatting-info-div") // 상세 모달 내용을 담을 div

chatPage = 1;											// 채팅방 리스트 무한 스크롤 페이지									
scrollCheck = false;									// 스크롤을 모두 내렸는지 체크		

$(function(){
	
	chatList();		// 채팅방 리스트 가져오기

	// 스크롤바를 모두 내렸을 때 무한 스크롤를 위한 함수
	window.onscroll = function(){
	    let scrollTop = document.documentElement.scrollTop;
	    let clientHeight = document.documentElement.clientHeight;
	    let scrollHeight = document.documentElement.scrollHeight;
	    
	    const tunningVal = 50; // 60px 전에 발생시키려 함
	    if((scrollTop + clientHeight) >= (scrollHeight - tunningVal)) {
	    	if(scrollCheck){
	    		chatPage++;
	    		chatList();
	    	}
	    }
	}

	// 검색 버튼을 눌렀을 때
	chattingSearchInputBtn.addEventListener("click", function(){
		chatReset();	
	})

	// 정렬할 때마다
	chattingSelect.addEventListener("change", function(){
		chatReset();	
	})
	
	// enter 눌러도 검색 가능
	$("#chatting-search-input").keyup((event) => {
		if(event.keyCode == 13){
			$("#chatting-search-input-btn").click();
		}
	});	

	
	// 생성 버튼을 눌렀을 때
	iMoalInsert.addEventListener("click", function(){
		if(imodalTitle.value.trim() == ""){
			Swal.fire('제목을 입력하세요!')
			return false;
		}	
		
		if(imodalContent.value.trim() == ""){
			Swal.fire('소개글을 입력하세요!')
			return false;
		}	
		
	   if ($("input:radio[name=ccg_r003]:checked").val()=='false' && imodalPassword.value.trim() == "") {
	        Swal.fire('비밀번호를 입력하세요!');
			return false;
	   }
	   
	   
	   if(parseInt(imodalCount.value) > 10 || parseInt(imodalCount.value) < 2){
	        Swal.fire('인원수 제한이 맞지 않습니다!');
			return false;
	   }
	   
	   
	   	$.ajax({
			type : "post",
			url : "/haruter/insertChat",
			data: {
				 "ae_id":aeId.value.trim()
				,"cr_nm":imodalTitle.value.trim()
				,"cr_info":imodalContent.value
				,"ccg_r003": $("input:radio[name=ccg_r003]:checked").val()
				,"cr_pw":imodalPassword.value
				,"cr_max_nope":imodalCount.value.trim()
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(res){
				if(res='OK'){
				iModal.style.display = "none";
				imodalTitle.value = "";
				imodalContent.value = "";
				imodalPassword.value = "";
				imodalCount.value = 2;
				iradioTrue.check;
				window.location.reload();
				chatReset();
	     		}	
			},
	     	error: function(ex){
	     		console.log("error");
	     	}
	    })
	})
	
	// 생성 취소 버튼을 눌렀을 때
	iMoalClose.addEventListener("click", function(){
		imodalCancle();
	})
	
	// 공개 라디오 버튼 선택 시
	iradioTrue.addEventListener("change", function(){
		iPassword.style.display = "none";
	})
	
	// 비공개 라디오 버튼 선택 시
	iradioFalse.addEventListener("change", function(){
		iPassword.style.display = "flex";
	})
	
	// 채팅방 접속 버튼을 눌렀을 때 상세모달
	$(document).on("click", "#chatDetail", function(){
		dModal.style.display = "block";
		crNo =  $(this).parent().parent().parent().attr("data-no");
		chatOne(crNo);
	})
	
	// 최종 접속 버튼을 눌렀을 때
	$(document).on("click", "#chat-btn", function(){
		var no = $(this).parent().find("#detail-table").attr("data-no");
		chattingRoomIn(no);
	})
	
})

// 채팅방 리스트 가져오기
function chatList(){

   	$.ajax({
		type : "get",
		url : "/haruter/getChatList",
		data: {
			"currentPage":chatPage,
			"searchSelect":chattingSearchSelect.value,
			"searchWord":chattingSearchInput.value,
			"searchType":chattingSelect.value,
			"ae_id":aeId.value
		}, 
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(res){
			var tempDiv = "";
			for(let i = 0; i < res.length; i++){
				var nm = res[i].cr_nm.replaceAll(/<script>/gi, "");
				var info = res[i].cr_info.replaceAll(/<script>/gi, "");
				tempDiv += " <div class='post-box' data-no='"+res[i].cr_no+"'>";
				tempDiv += " 	<div class='header-div'>";
				tempDiv += " 		<div class='title-div'>";
				tempDiv += " 			<div class='chat-info'>";					
				tempDiv += " 				<span id='chat-no'>"+res[i].cr_temp_no+"번</span>"
				tempDiv += " 				<span id='chat-type'>"+res[i].ccg_r003+" 채팅방</span>"
				tempDiv += " 			</div>";
				if (nm.length > 9){
				tempDiv += " 			<span>"+ nm.substring(0, 9) + "..."+"</span>"					
				}else{
				tempDiv += " 			<span>"+nm+"</span>"										
				}
				tempDiv += " 		</div>";
				tempDiv += " 		<div class='chat-num-div'>";
				tempDiv += " 			<div class='chat-data-div'>";
				tempDiv += " 				<div class='chat-data-span'>";
				tempDiv += " 					<span>생성날짜 / </span>";
				tempDiv += " 					<span>마지막 활성화날짜</span>";
				tempDiv += " 				</div>";
				tempDiv += " 				<div class='chat-data'>";
				tempDiv += " 					<span>"+res[i].cr_estbl_ymd.replace(/\//g, '') +" / </span>";
				if(res[i].cr_last_actvtn_ymd=='0'){
				tempDiv += " 					<span>활성화기간X</span>";												
				}else{
				tempDiv += " 					<span>"+res[i].cr_last_actvtn_ymd.replace(/\//g, '')+"</span>";						
				}
				tempDiv += " 				</div>";
				tempDiv += " 			</div>";
				tempDiv += " 			<div class='chat-count-div'>";
				tempDiv += " 				<div class='chat-data-span'>";
				tempDiv += " 					<span>현가입인원 / </span>";
				tempDiv += " 					<span>최대가능인원</span>";
				tempDiv += " 				</div>";
				tempDiv += " 				<div class='chat-data'>";
				tempDiv += " 					<span>"+res[i].cr_nope+" / </span>";						
				tempDiv += " 					<span>"+res[i].cr_max_nope+"</span>";						
				tempDiv += " 				</div>";
				tempDiv += " 			</div>";
				tempDiv += " 		</div>";
				tempDiv += " 	</div>";
				tempDiv += " 	<div class='main-div'>";
				tempDiv += " 		<div class='main-info'>";
				tempDiv += 				info;
				tempDiv += " 		</div>";
				tempDiv += " 		<div class='main-btn'>";
				tempDiv += " 			<input type='button' id='chatDetail' value='채팅방 접속'>";
				tempDiv += " 		</div>";
				tempDiv += " 	</div>";
				tempDiv += " </div>";
			}
			if(res.length < 6){
				scrollCheck = false;
			}else{
				scrollCheck = true;
			}
			
			chattingList.append(tempDiv);		
     	},
     	error: function(ex){
     		console.log("error");
     	}
    });
}

// 채팅방 초기화
function chatReset(){
	$("#chattingList").html("");
	chatPage = 1;
	chatList();
}

// 채팅방 생성 모달 열기 
function iModalOpen(){
	iModal.style.display = "block"; // 보이게
	document.body.style.overflowY = "hidden";
	page = 0;
	inputModal = false;
}

// 채팅방 생성 모달 닫기
function imodalClose(){
	imodalCancle()
}

// 채팅방 생성 취소 함수
function imodalCancle(){
	Swal.fire({
		  title: '채팅방 생성을 취소하시겠습니까?',
		  showDenyButton: true,
		  confirmButtonText: '네',
		  denyButtonText: '아니요',
		  width: '700px',
		}).then((result) => {
		  if (result.isConfirmed) {
			iModal.style.display = "none";
			imodalTitle.value = "";
			imodalContent.value = "";
			imodalPassword.value = "";
			imodalCount.value = 2;
			iradioTrue.check;
		  }
	})
}

// 채팅방 하나 보여주기
function chatOne(crNo){
	$.ajax({
		type : "get",
		url : "/haruter/getChatOne",
		data: {
			'cr_no':crNo
		}, 
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(res){
			var nm = res.cr_nm.replaceAll(/<script>/gi, "");
			var info = res.cr_info.replaceAll(/<script>/gi, "");
			var tempDiv = "";
			tempDiv += "<table id='detail-table' data-no = '"+res.cr_no+"'>";
			tempDiv += "	<tr>";
			tempDiv += "		<th>방번호</th>";			
			tempDiv += "		<td>"+res.cr_temp_no+"번</td>";			
			tempDiv += "		<th>방종류</th>";			
			tempDiv += "		<td id='ccg-r003-text'>"+res.ccg_r003+"</td>";			
			tempDiv += "	</tr>";	
			tempDiv += "	<tr>";
			tempDiv += "		<th>제목</th>";		
			tempDiv += "		<td colspan='3'>"+nm+"</td>";				
			tempDiv += "	</tr>";	
			tempDiv += "	<tr>";
			tempDiv += "		<th>가입인원</th>";
			tempDiv += "		<th colspan='2'>접속가능인원</th>";
			tempDiv += "		<th>현접속인원</th>";			
			tempDiv += "	</tr>";			
			tempDiv += "	<tr>";			
			tempDiv += "		<td id='cr-nope-text'>"+res.cr_nope+"</td>";			
			tempDiv += "		<td colspan='2' id='cr-max-text'>"+res.cr_max_nope+"</td>";			
			tempDiv += "		<td>"+res.cr_cntn_nope+"</td>";									
			tempDiv += "	<tr>";		
			tempDiv += "	<tr>";
			tempDiv += "		<th colspan='4'>소개글</th>";
			tempDiv += "	</tr>";
			tempDiv += "	<tr>";
			tempDiv += "		<td colspan='4' id='detail-info'>"+info+"</td>";
			tempDiv += "	</tr>";
			if(res.ccg_r003=='비공개'){	
			tempDiv += "	<tr>";
			tempDiv += "		<th>비밀번호</th>";
			tempDiv += "		<td colspan='3'>";
			tempDiv += "				<input type='text' id='detail-pw' placeholder='비밀번호를 입력하세요'>";
			tempDiv += "		</td>";
			tempDiv += "	</tr>";
			}
			tempDiv += "</table>";
			tempDiv += "		<input type='button' id='chat-btn' value='채팅방 접속' maxlength='10'>";
			chattingInfoDiv.innerHTML = tempDiv;
			if(res.ccg_r003=='비공개'){	
			$('.dcontainer').css("height", "65%");				
			}else{
			$('.dcontainer').css("height", "62%");								
			}
     	},
     	error: function(ex){
     		console.log("error");
     	}
    });
}

// 채팅방 상세 모달 닫기
function dmodalClose(){
	dModal.style.display = "none";
}

// 채팅방 들어가기 및 제한
function chattingRoomIn(crNo){
	$.ajax({
		type : "get",
		url : "/haruter/chattingRoomIn",
		data: {
			'cr_no':crNo,
			'ccg_r003':$("#ccg-r003-text").text(),
			'cr_pw':$("#detail-pw").val(), 
			'cr_nope':$("#cr-nope-text").text(),
			'cr_max_nope':$("#cr-max-text").text(),
			'ae_id' : aeId.value
		}, 
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(res){
			if(res != 'OK'){
				Swal.fire(res)
				return false;
			}else{
				chatReset();
				chattingDetail(crNo);
			}
     	},
     	error: function(ex){
     		console.log("error");
     	}
    });	
}

// 채팅 들어가기
function chattingDetail(crNo) {
	dModal.style.display = "none";
	var width = 700;
	var height = 540;

	var left = (window.screen.width - width) / 2;
	var top = (window.screen.height - height) / 2;

	var newWindow = window.open("/haruter/setChattingRoom?cr_no=" + crNo +"&ae_id="+aeId.value,
			"_blank", "width=" + width + ", height=" + height + ", left="
					+ left + ", top=" + top);

	newWindow.onresize = function() {
		newWindow.resizeTo(width, height + 70);
	};

	// 새 창을 고정
	newWindow.onbeforeunload = function() {
		newWindow.scrollTo(0, 0);
	};
}

</script>
