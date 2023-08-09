<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!--게시물 나오는곳-->
<link rel="stylesheet" href="/resources/asset/css/chattingBoard.css">

<!--메인 피드 -->
<div class="chatting-board">
	<div id="chatting-board-tex">
		<h1>모집게시판</h1>
	</div>
	<div id="chatboard-search">
		<select id="chatboard-search-select">
			<option value="chatting_title">제목</option>
			<option value="chatting_no">채팅방 번호</option>
		</select>
		<input id="chatboard-search-input" type="text" placeholder="찾을 채팅방을 입력하세요" maxlength="30">
		<button type="button" id="chatboard-search-input-btn">검색</button>
	</div>
	<div id="chatboard-select-list">
		<select id="chatboard-select">
			<option value="order-inq">과거순</option>
			<option value="order-recent" selected="selected">최신순</option>
		</select>		
	</div>
	<div id="chatboard-upload-btn" onclick="iModalOpen()">
          <i class="ri-add-circle-fill"></i>
          <div class="chatboard-btn-text">모집게시판 생성하기</div>   
    </div>
</div>

<!-- 모집게시판 생성 작성 모달 -->
<div id="diModal">
	<div class="diContainer">
			<input type="hidden" id="id" value="<sec:authentication property="name"/>"/>		
			<div id="diClose-div">
				<i onclick="dimodalClose()" class="ri-close-line dibtn"></i>
			</div>
	 
			<!-- 모달 작성 DIV -->
			<div id="chatboard-insert-div">
				<div id="chatBoard-header" class="chatboard-divs">
					<h2>모집게시판 작성</h2>
				</div>
				<table id='chatboard-table'>
					<tr id="chatboard-title-div" class="chatting-divs"> 
						<th class='chatboard-content-title'>제목</th>
						<td>
							<input id="chatboard-title" name='chatboard-title' type="text" placeholder="모집게시판 이름을 입력하세요!" maxlength="30">
						</td>
					</tr>
					<tr>
						<th class='chatboard-content-title up-padding-div' id="diSelect-option-text">모집할 채팅방</th>
						<td id="diSelect-option" class='up-padding-div'></td>
					</tr>
					<tr>
						<th colspan="2" id="diSelect-content-text">내용</th>
					</tr>
					<tr>
						<td colspan="2">
							<textarea id="chatboard-content" name="chatboard-content" rows="" cols="" placeholder="모집게시판 내용을 입력하세요!" maxlength="250"></textarea>
						</td>						
					</tr>


				</table>
				<div id="idBtns"> 
					<input type="button" class="idBtns" id="idModal-insert" value="생성">
					<input type="button" class="idBtns" id="idModal-close" value="취소">				
				</div>

			</div>			
	</div>
</div>

<!-- 모집게시판 리스트 -->
<div id="chattingBoardList" class='main-posts'></div>

<!-- 상세 모집 게시판  -->
<div id="ddModal"></div>

<!-- 게시글 수정 모달 -->
<div id="uModal">
	<div class='uContainer'>
		<i id='uHeader' class="ri-close-line" onclick="MmodalClose()"></i>
		<div class='uTitle'>
			<input type="text" id="uText" placeholder="제목을 입력하세요"  maxlength="40" />
		</div>
		<div class='uContent'>
			<textarea rows="" cols="" id="uContent" placeholder="내용을 입력하세요" maxlength="1500"></textarea>	
		</div>
		<div id="uBtns">
			<input type='button' id="uUpdateBtn" value='수정'>
			<input type='button' id="uCancleBtn" value='취소'>
		</div>
	</div>
</div>

<!-- 댓글 수정 모달 -->
<div id="rModal">
	<div class='rContainer'>
		<i id='rHeader' class="ri-close-line" onclick="RmodalClose()"></i>
		<div class='rTitle'>
			<input type="text" id="rText" placeholder="댓글을 수정하세요"  maxlength = '100' />
		</div>
		<div id="rBtns">
			<input type='button' id="rUpdateBtn" value='수정'>
			<input type='button' id="rCancleBtn" value='취소'>
		</div>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
var chatboardSearchSelect = document.querySelector("#chatboard-search-select"); 		// 검색할 모집게시판 목록
var chatboardSearchInput = document.querySelector("#chatboard-search-input"); 		// 검색할 모집게시판 이름
var chatboardSelect = document.querySelector("#chatboard-select"); 					// 정렬할 모집게시판 목록
var chatboardSearchInputBtn = document.querySelector("#chatboard-search-input-btn")	// 검색 하기 버튼
var aeId = document.querySelector("#id");											 // 세션 아이디

var chattingBoardList = $("#chattingBoardList")										// 모집게시판 리스트	

var diModal = document.querySelector("#diModal");									// 게시판 작성 모달
var ddModal = document.querySelector("#ddModal");									// 게시판 상세 모달

const uModal = document.querySelector("#uModal");							// 게시글 수정모달
const uText	= document.querySelector("#uText");								// 게시글 수정 제목
const uContent = document.querySelector("#uContent");						// 게시글 수정 내용
const uCancleBtn = document.querySelector("#uCancleBtn");					// 게시글 취소
const uUpdateBtn = document.querySelector("#uUpdateBtn");					// 최종 업데이트 버튼

chatBoardPage = 1;														// 채팅방 리스트 무한 스크롤 페이지
chatBoardReplyPage = 1;															// 보여줄 댓글 목록 1로 시작		
chatBoardSubReplyPage = 1;														// 보여줄 대댓글 목록 1로 시작



scrollCheck = false;									// 스크롤을 모두 내렸는지 체크	


tempBoardAeID = "";														// 게시판 작성자 저장
replyTemp = "";															// 대댓글에 쓰인 부모 댓글 임시저장
boardTemp = "";															// 상세 게시판 임시 저장

$(function(){
	
	chatBoardList();		// 모집게시판 리스트 가져오기
	
	// 스크롤바를 모두 내렸을 때 무한 스크롤를 위한 함수
	window.onscroll = function(){
	    let scrollTop = document.documentElement.scrollTop;
	    let clientHeight = document.documentElement.clientHeight;
	    let scrollHeight = document.documentElement.scrollHeight;
	    
	    const tunningVal = 50; // 60px 전에 발생시키려 함
	    if((scrollTop + clientHeight) >= (scrollHeight - tunningVal)) {
	    	if(scrollCheck){
	    		chatBoardPage++;
	    		chatBoardList();
	    	}
	    }
	}
	
	// 검색 할 때
	chatboardSearchInputBtn.addEventListener("click",function(){
		resetBoard();		
	})
	
	// 정렬 할 때
	chatboardSelect.addEventListener("change", function(){
		resetBoard();
	})
	
	
	// enter 눌러도 검색 가능
	$("#chatboard-search-input").keyup((event) => {
		if(event.keyCode == 13){
			$("#chatboard-search-input-btn").click();
		}
	});	
	
	
	// 취소 버튼을 눌렀을 때
	$("#idModal-close").on('click',function(){
		dimodalClose();
	})
	
	// 생성 버튼을 눌렀을 때
	$("#idModal-insert").on("click", function(){
		crateChatBoard();		
	})		
	
	// 상세 조회
	$(document).on("click", ".chatBoard-all-div",function(){
		var no = $(this).attr("data-no");
		var cnt = $(this).find("#chatBoard-cnt");
		
		cnt.text((parseInt(cnt.text()) + 1));
		chatBoardCall(no)
	})
	
	// 공개 버튼을 눌렀을 때
	$(document).on("click", "#reply-open", function(){
		if($(this).css("color") == "#2b930a"){
			$(this).css("color", "black");
			$(this).parent().find("#reply-no-open").css("color", "#2b930a");
		}else{
			$(this).css("color", "#2b930a");
			$(this).parent().find("#reply-no-open").css("color", "black");			
		}
	})

	// 비공개 버튼을 눌렀을 때
	$(document).on("click", "#reply-no-open", function(){
		if($(this).css("color") == "#2b930a"){
			$(this).css("color", "black");
			$(this).parent().find("#reply-open").css("color", "#2b930a");
		}else{
			$(this).css("color", "#2b930a");
			$(this).parent().find("#reply-open").css("color", "black");			
		}
	})
	
	// enter 눌러도 검색 가능
	$(document).on("keyup", "#dApplyText", function(event){
		if(event.keyCode == 13){
			$("#reply-insert").click();
		}
	})	
	
	// 댓글 작성
	$(document).on('click', '#reply-insert', function(){
		var no = $(this).parent().find("#dApplyBoardNo").val();
		var content = $(this).parent().find("#dApplyText").val();
	  	var id = aeId.value;
	  	var type = $(this).parent().parent().find("#big-comment").attr("data-nick")
	  	var ccg = "";
		  	
	  	if($(this).parent().parent().find("#reply-open").css("color") == "rgb(43, 147, 10)"){
	  		ccg = "공개";
	  	}else{
	  		ccg = "비공개";	  		
	  	}
	  	console.log('ccg')
	  	
		if(content.trim() == ""){
			Swal.fire("댓글을 작성해주세요!")
		}
		
		$.ajax({
			type : "post",
			url : "/haruter/insetChat",
			data: {
				"reply_content": content,
				"board_no": no,
				"ae_id":id,
				"reply_type":type,
				"ccg_r003": ccg
			}, 
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(res){
				console.log("res", res);
		 		if(res == "OK"){
			 		Swal.fire('작성 완료'); 			
		 		}
		 		chatBoardReplyPage = 1;
		 		chatBoardCall(no);
	     	},
	     	error: function(ex){
	     		console.log("error");
	     	}
	    });
	})
	
	
	// 댓글 더보기 눌렀을 때
	$(document).on("click", ".commnet-append", function() {
		addView = $(this).parent();
		addView.css("display", "none");
		
		var boardTemp = $(this).parent().attr("data-board");
		
		console.log("boardTemp : "+boardTemp)
		console.log("chatBoardReplyPage : "+chatBoardReplyPage)
		chatBoardReplyPage++;
		getChatBoardReplyList(boardTemp);
	});

	// 대댓글 작성하기
	$(document).on("click", "#dReplyInsert", function(){
		var nick = $(this).parent().attr("data-nick")
		var no = $(this).parent().attr("data-no")
		
		var close = $("#reply-close")
		var selectNick = $("#big-comment")
		
		close.css("display", "block")
		selectNick.text(nick)
		selectNick.attr("data-nick", no)
		
	})
	
	// 대댓글 작성 취소
	$(document).on("click", "#reply-close", function(){
		var close = $("#reply-close")
		var selectNick = $("#big-comment")
		
		close.css("display", "none")
		selectNick.text("all")
		selectNick.attr("data-nick", "NO")
	})
	
	// 대댓글 보기
	$(document).on("click", "#dReplyView", function(){
		var no = $(this).parent().attr("data-no");
		var id = $(this).parent().attr("data-id");
		var dList = $(this).parent().parent().parent().parent().find("[data-subReply='" + no + "']");
		
		var close = $(this).parent().find("#dReplyClose")
		var open = $(this);
		close.css("display", "contents");
		open.css("display", "none");
		getBigComment(no, dList, id);
	})
	
	//대댓글 닫기
	$(document).on("click", "#dReplyClose", function(){
		chatBoardSubReplyPage = 1
		var no = $(this).parent().attr("data-no");
		var dList = $(this).parent().parent().parent().parent().find("[data-subReply='" + no + "']");
		dList.html("");
		
		var open = $(this).parent().find("#dReplyView")
		var close = $(this);
		
		close.css("display", "none");
		open.css("display", "contents");
	})
	
	//대댓글 더보기
	$(document).on("click", ".sub-reply-append", function(){
		addView = $(this).parent();
		addView.css("display", "none");
	
		var dList = $(this).parent().parent().parent().find("[data-subReply='" + replyTemp + "']");
		
		chatBoardSubReplyPage++;
		getBigComment(replyTemp, dList);
	})
	
	//비밀댓글 보기
	$(document).on("click", "#dReply-open-reply", function(){
		$(this).parent().css('display', 'none');
		$(this).parent().parent().find(".dReplyProfile-king-content").css('display', 'inline');
	})
	
	//비밀댓글 닫기
	$(document).on("click", ".dReplyProfile-king-content", function(){
		$(this).css('display', 'none');
		$(this).parent().parent().find("#dReplyProfile-content").css('display', 'inline');
	})
	
	// 게시글 수정 눌렀을 때 수정 폼 나옴
	$(document).on("click","#ddmodal-update", function(){
		uModal.style.display = "block"; // 보이게
		uText.value = document.querySelector("#ddmodal-title").textContent.trim();
		uContent.value = document.querySelector("#ddmodal-content").textContent.trim();
	})
	
	// 게시글 수정 폼 이후 취소버튼
	uCancleBtn.addEventListener("click", function(){
		Swal.fire({
			  title: '수정을 취소하시겠습니까?',
			  showDenyButton: true,
			  confirmButtonText: '네',
			  denyButtonText: '아니요',
			}).then((result) => {
			  /* Read more about isConfirmed, isDenied below */
			  if (result.isConfirmed) {
				 uModal.style.display = "none";
			  }
		})
	})
	
	// 게시글 수정 폼 이후 수정버튼
	uUpdateBtn.addEventListener("click", function(){
		var id = aeId.value;
		Swal.fire({
			  title: '모집게시판을 수정하시겠습니까??',
			  showDenyButton: true,
			  confirmButtonText: '네',
			  denyButtonText: '아니요',
			}).then((result) => {
			  /* Read more about isConfirmed, isDenied below */
			  if (result.isConfirmed) {
				  var updateText = uText.value
				  var updateContent = uContent.value
				  var boardNo = $("#ddmodal-update").attr('data-no');
				  
				  if(updateText.trim() == ""){
					  Swal.fire("제목을 입력하세요!")
					  return false;
				  }
	
				  if(updateContent.trim() == ""){
					  Swal.fire("내용을 입력하세요!")
					  return false;
				  }
	
				  $.ajax({
						type : "post",
						url : "/haruter/updateChatBoard",
						data : {
							"board_no":boardNo,
							"ae_id" : id,
							"board_title" : updateText,
							"board_content" : updateContent
						},
						beforeSend : function(xhr){
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success: function(res){
						   console.log(res+"res")
						   if(res == "OK"){
							   Swal.fire({
								   title: '수정 완료',
								   icon: 'success',
								   showCancelButton: false,
								   confirmButtonColor: '#3085d6',
								   confirmButtonText: '확인'
								 }).then((result) => {
								   if (result.isConfirmed) {
									   uModal.style.display = "none";
									   resetBoard(boardNo);
									   chatBoardCall(boardNo);
								   }
								 });
						   }else{
							  Swal.fire('삭제 실패! 다시 시도하세요');
						   }
				     	},
				     	error: function(ex){
				     		console.log("error", ex);
				     	}
					});	
				  	 
			  }
		})
	})
	
	// 게시글 삭제 눌렀을 때
	$(document).on("click", "#ddmodal-delete", function(event){
		var id = aeId.value;
		Swal.fire({
			  title: '정말 게시글을 삭제하시겠습니까?',
			  showDenyButton: true,
			  confirmButtonText: '네',
			  denyButtonText: '아니요',
			}).then((result) => {
			  if (result.isConfirmed) {
				  var boardNo = $(this).attr("data-no");
				  var boardId = $(this).attr("data-id");
					$.ajax({
						type : "post",
						url : "/haruter/deleteChatBoard",
						data : {
							"board_no":boardNo,
							"ae_id" : id,
							"ua_no" : boardId
						},
						beforeSend : function(xhr){
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success: function(res){
						   if(res == "OK"){
							   Swal.fire({
								   title: '삭제 완료',
								   icon: 'success',
								   showCancelButton: false,
								   confirmButtonColor: '#3085d6',
								   confirmButtonText: '확인'
								 }).then((result) => {
								   if (result.isConfirmed) {
									  ddModal.style.display = "none";
									  inputDetila = false;
									  resetBoard();
								   }
								 });
						   }else{
							  Swal.fire('삭제 실패! 다시 시도하세요');
						   }
				     	},
				     	error: function(ex){
				     		console.log("error", ex);
				     	}
					});	
			  }
			})
	})

	//댓글 삭제
	$(document).on("click", "#dReplyDelete", function(){
		var replyTemp = $(this).parent().attr("data-reply");
		var boardTemp = $(this).parent().attr("data-board");
		
		Swal.fire({
			  title: '댓글을 삭제하시겠습니까?',
			  showDenyButton: true,
			  confirmButtonText: '네',
			  denyButtonText: '아니요',
			}).then((result) => {
			  /* Read more about isConfirmed, isDenied below */
			  if (result.isConfirmed) {
				  $.ajax({
						type : "post",
						url : "/haruter/chatBoatdReplyDelete",
						async : false,
						data : {
							"reply_no" : replyTemp,
						},
						beforeSend : function(xhr){
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success: function(res){
							chatBoardReplyPage = 1;
					 		chatBoardCall(boardTemp);
				     	},
				     	error: function(ex){
				     		console.log("error", ex);
				     	
				     	}
					 });
			  }
			})
		
	})	
	
	//댓글 수정
	$(document).on("click", "#dReplyUpdate", function(){
		replyTemp = $(this).parent().attr("data-reply");
		boardTemp = $(this).parent().attr("data-board");
		
		rModal.style.display = "block";
		rText.value = $(this).parent().parent().find("#dReplyProfile-content").text();
		if(rText.value.trim()==""){
			rText.value = $(this).parent().parent().parent().find("#dReplyProfile-content").text();	
		}
		if($(this).parent().parent().parent().find("#dReplyProfile-content").attr("data-open")=="NO" 
				|| 	$(this).parent().parent().find("#dReplyProfile-content").attr("data-open")=="NO"){
			rText.value = $(this).parent().parent().parent().find("#dReplyProfile-one").text();				
		}
		
	})
	
	//댓글 수정 폼 이후 취소버튼
	rCancleBtn.addEventListener("click", function(){
		Swal.fire({
			  title: '수정을 취소하시겠습니까?',
			  showDenyButton: true,
			  confirmButtonText: '네',
			  denyButtonText: '아니요',
			}).then((result) => {
			  /* Read more about isConfirmed, isDenied below */
			  if (result.isConfirmed) {
				 rModal.style.display = "none";
			  }
		})
	})
	
	//댓글 수정 폼 이후 수정버튼
	rUpdateBtn.addEventListener("click", function(){
		var id = aeId.value;

		Swal.fire({
			  title: '댓글을 수정하시겠습니까??',
			  showDenyButton: true,
			  confirmButtonText: '네',
			  denyButtonText: '아니요',
			}).then((result) => {
			  /* Read more about isConfirmed, isDenied below */
			  if (result.isConfirmed) {
				  var updateText = rText.value
				  
				  if(updateText.trim() == ""){
					  Swal.fire("수정할 댓글을 입력하세요!")
					  return false;
				  }
	
				  $.ajax({
						type : "post",
						url : "/haruter/chatBoatdReplyUpdate",
						data : {
							"reply_no":replyTemp,
							"ae_id" : id,
							"reply_content" : updateText,
						},
						beforeSend : function(xhr){
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success: function(res){
						   if(res == "OK"){
							   Swal.fire({
								   title: '수정 완료',
								   icon: 'success',
								   showCancelButton: false,
								   confirmButtonColor: '#3085d6',
								   confirmButtonText: '확인'
								 }).then((result) => {
								   if (result.isConfirmed) {
									   rModal.style.display = "none";
									   chatBoardReplyPage = 1;
									   chatBoardCall(boardTemp);
								   }
								 });
						   }else{
							  Swal.fire('삭제 실패! 다시 시도하세요');
						   }
				     	},
				     	error: function(ex){
				     		console.log("error", ex);
				     	}
					});	
				  	 
			  }
		})
	})
	
	// 각각의 알림 부분 눌렀을 때
	$(document).on("click", "#echo-reply",function(){
		var boardNo = $(this).attr("data-board");
		chatBoardCall(boardNo);
	})

	
})

// 게시판 상세 조회
function chatBoardCall(no){
  	var id = aeId.value;
  	boardTemp = no;
  	
	var elementsWithDataBoard1 = $("#bell-div").find("[data-board='"+boardTemp+"']");

	// 원하는 작업을 수행합니다.
	elementsWithDataBoard1.each(function() {
		$(this).remove();
	});
	
	if($(".echo-count").length <= 0 && $("#bell-div").html() == ""){
		$("#yellow-bell").css("display", "none");
		$("#black-bell").css("display", "block");	
		$("#bell-div").css("display", "none");
		tempDiv =  "<div id='echo-reply'>"
		tempDiv += "		<span>알림이 없습니다.</span>"
		tempDiv += "</div>";
		$("#bell-div").append(tempDiv);
	}
  	
	$.ajax({
		type : "get",
		url : "/haruter/getChatBoardOne",
		data: {
			"board_no":no
		}, 
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(res){
			var tempBoardOne = "";
			var title = res.board_title.replaceAll(/<script>/gi, "");
			title = title.replaceAll(/<\/script>/gi, "");
			var content = res.board_content.replaceAll(/<script>/gi, "");
			content = content.replaceAll(/<\/script>/gi, "");
			tempBoardAeID = res.ae_id;
			tempBoardOne += "<div id='ddContainer'>";
			tempBoardOne += "	<i onclick='ddmodalClose()' class='ri-close-line bbtn'></i>";
			tempBoardOne += "	<div id='ddmodal-all-div'>";
			tempBoardOne += "		<div id='ddmodal-title-div'>";				
			tempBoardOne += "			<div id='ddmodal-title'>"+title+"</div>";	
			if(id == res.ae_id){					
			tempBoardOne += "			<div id='ddmodal-update-div'>";				
			tempBoardOne += "				<span id='ddmodal-update' data-no='"+no+"'>수정</span>";				
			tempBoardOne += "				<span id='ddmodal-delete' data-no='"+no+"'>삭제</span>";			
			tempBoardOne += "			</div>";				
			}
			tempBoardOne += "		</div>";				
			tempBoardOne += "		<div id='ddmodal-content-div'>";				
			tempBoardOne += "			<div id='ddmodal-content'>";			
			tempBoardOne += 				content;								
			tempBoardOne += "			</div>";				
			tempBoardOne += "		</div>";				
			tempBoardOne += "		<div id='ddmodal-sub-title-div'>";							
			tempBoardOne += "			<div id='ddmodal-profile-div'>";				
			tempBoardOne += "				<img class='ddmodal-profile' src='/upload/images/"+res.mem_profile+"'/>";				
			tempBoardOne += "				<span id='ddmodal-nicknm'>"+res.mem_nicknm+"</span>";				
			tempBoardOne += "			</div>";							
			tempBoardOne += "			<div id='ddmodal-data-div'>";				
			tempBoardOne += "				<table>";				
			tempBoardOne += "					<tr>";				
			tempBoardOne += "						<th class='table-padding'>작성일자</th>";				
			tempBoardOne += "						<th class='table-padding'>수정일자</th>";				
			tempBoardOne += "						<th class='table-padding'>조회수</th>";				
			tempBoardOne += "					<tr>";				
			tempBoardOne += "					<tr>";				
			tempBoardOne += "						<td class='table-padding'>"+res.wrt_ymd+"</td>";				
			if(res.last_mdfcn_ymd == '0'){
			tempBoardOne += "				<td class='chatBoard-date'>-</td>";					
			}else{
			tempBoardOne += "				<td class='chatBoard-date'>"+res.last_mdfcn_ymd+"</td>";					
			}			
			tempBoardOne += "						<td class='table-padding'>"+res.inq_cnt+"</td>";				
			tempBoardOne += "					<tr>";				
			tempBoardOne += "				</table>";				
			tempBoardOne += "			</div>";			
			tempBoardOne += "		</div>";				
			tempBoardOne += "	</div>";
			tempBoardOne += "	<div id='ddmodal-apply-div'>";
			tempBoardOne += "		<div id='ddmodal-reply-list'></div>";
			tempBoardOne += "		<div id='ddmodal-reply-state'>";
			tempBoardOne += "			<div id='reply-status'>";
			tempBoardOne += "				<div id='reply-check'>"
			tempBoardOne += "					<span>댓글 :</span><span id='big-comment' data-nick='NO'>all</span>"			
			tempBoardOne += "				</div>";
			tempBoardOne += "				<div id='reply-close' style='display: none;'>"
			tempBoardOne += "					<i class='ri-close-line'></i>"
			tempBoardOne += "				</div>";
			tempBoardOne += "			</div>";
			tempBoardOne += "			<div id='reply-open-status'>";
			tempBoardOne += "				<span id='reply-open'>공개</span>";
			tempBoardOne += "				<span id='reply-no-open'>비공개</span>";
			tempBoardOne += "			</div>";
			tempBoardOne += "		</div>";
			tempBoardOne += "		<div id='ddmodal-reply-input'>";
			tempBoardOne += "			<input type='hidden' id='dApplyBoardNo' value='"+res.board_no+"'>";
			tempBoardOne += "			<input type='text' id='dApplyText' placeholder='댓글을 작성하세요' maxlength = '100'/>";
			tempBoardOne += "			<span id='reply-insert'>게시</span> " 
			tempBoardOne += "		</div>";
			tempBoardOne += "	</div>";
			tempBoardOne += "</div>";
			
			ddModal.innerHTML = tempBoardOne;
			ddModal.style.display = "block";
			if(id != res.ae_id){
				$("#ddmodal-content-div").css('height', '415px');
			}
			getChatBoardReplyList(no)
     	},
     	error: function(ex){
     		console.log("error");
     	}
    });
}


// 게시판 댓글 리스트가 나온다.
function getChatBoardReplyList(boardNo){
  	var id = aeId.value;
	$.ajax({
		type : "get",
		url : "/haruter/getChatBoardReplyList",
		async : false,
		data : {
			"board_no":boardNo,
			"currentPage": chatBoardReplyPage 
		},
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(res){
			replyList = "";
			if(res.length > 0){
				for(let j = 0; j < res.length; j++){
				var content = res[j].reply_content.replaceAll(/<script>/gi, "");
				replyList += "<div class='dReplyTitleList'>";
				replyList += "		<div id='dReplyTitle'>";						
				replyList += "			<div id='dReplyProfile'>";						
				replyList += "				<img class='dReplyProimg' src='/upload/images/"+res[j].mem_profile+"'/>";					
				replyList += "				<div id='dReplyProfile-all'>";
				replyList += "					<span id='dReplyProfile-nick'>"+res[j].mem_nicknm+"</span>";
				if(res[j].ccg_r003 == '공개'){
				replyList += "					<div id='dReplyProfile-content'>"+content+"</div>";										
				}else{
				if(tempBoardAeID == id || res[j].ae_id == id){
				replyList += "					<div id='dReplyProfile-content' data-open='NO'><span class='secret-reply'>비밀댓글</span>"
				replyList += "					<span class='secret-reply' id='dReply-open-reply'>(비밀댓글 보기)</span></div>";																				
				replyList += "					<div style='display: none' id ='dReplyProfile-one' class='dReplyProfile-king-content'>"+content+"</div>";																							
				}else{
				replyList += "					<div id='dReplyProfile-content' data-open='NO'><span class='secret-reply'>비밀댓글</span></div>";																									
				replyList += "					<div style='display: none' id ='dReplyProfile-one' class='dReplyProfile-king-content'>"+content+"</div>";																							
				}
				}
				replyList += "				</div>";
				replyList += "			</div>";
				if(res[j].ae_id == id){						
				replyList += "			<div id='dReplyStatus' data-reply ="+res[j].reply_no+" data-board="+boardNo+">";
				replyList += "				<span id='dReplyUpdate'>수정</span>";
				replyList += "				<span id='dReplyDelete'>삭제</span>";					
				replyList += "			</div>";
				}
				replyList += "		</div>";					
				replyList += "		<div id='digComent-div'>";					
				replyList += "			<div id='allDate'>";
				if(res[j].reply_mdfcn_ymd != 0){						
				replyList += "				<span id='write-date'>수정: "+res[j].reply_mdfcn_ymd+"</span>";
				}else{
				replyList += "				<span id='write-date'>"+res[j].reply_wrt_ymd+"</span>";					
				}
				replyList += "			</div>";
				replyList += "			<div id='allComent-div' data-id="+res[j].ae_id+" data-nick="+res[j].mem_nicknm+" data-no="+res[j].reply_no+">";
				if(res[j].reply_count != 0){
				replyList += "				<span id='dReplyView'>대댓글 "+res[j].reply_count+"개 보기</span>";
				replyList += "				<span id='dReplyClose' style='display: none;'>대댓글 닫기</span>";					
				}
				if(res[j].ccg_r003 == '공개'|| (res[j].ccg_r003 == '비공개' && tempBoardAeID == id) ||(res[j].ccg_r003 == '비공개' && res[j].ae_id == id)){
				replyList += "				<span id='dReplyInsert'>대댓글 작성</span>";
				}
				replyList += "			</div>";
				replyList += "		</div>";					
				replyList += "</div>";
				replyList += "<div class='dSubReplyTitleList' data-subReply="+res[j].reply_no+"></div>";
				}
				if(res.length >= 8){						
				replyList += "<div class='dReplyTitleList' style='text-align: center;' data-board="+res[0].board_no+">";					
				replyList += "	<span class='commnet-append'>댓글 더보기</span>";
				replyList += "</div>";
				}
			}
			$("#ddmodal-reply-list").append(replyList);		
     	},
     	error: function(ex){
     		console.log("error", ex);
     	
     	}
   });	
}

//대댓글 보기
function getBigComment(replyNo, dList, wrId){
	replyTemp = replyNo;
  	var id = aeId.value;

	$.ajax({
		type : "get",
		url : "/haruter/getChatBoardSubReplyList",
		async : false,
		data : {
			"reply_type":replyNo,
			"currentPage": chatBoardSubReplyPage 
		},
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(res){
				replyList = "";
				
			for(let j = 0; j < res.length; j++){
				var content = res[j].reply_content.replaceAll(/<script>/gi, "");
				replyList += "<div class='dReplyTitleList' style='margin-left: 10px;''>";
				replyList += "		<div id='dReplyTitle'>";						
				replyList += "			<div id='dReplyProfile'>";				
				replyList += "				<span id='dSubReplyIcon'>└</span>";					
				replyList += "				<img class='dReplyProimg' src='/upload/images/"+res[j].mem_profile+"'/>";					
				replyList += "				<div id='dReplyProfile-all'>";
				replyList += "					<span id='dReplyProfile-nick'>"+res[j].mem_nicknm+"</span>";
				if(res[j].ccg_r003 == '공개'){
				replyList += "					<div id='dReplyProfile-content'>"+content+"</div>";										
				}else{
				if(tempBoardAeID == id || res[j].ae_id == id || id == wrId){
				replyList += "					<div id='dReplyProfile-content' data-open='NO'><span class='secret-reply'>비밀댓글</span><span class='secret-reply' id='dReply-open-reply'>(비밀댓글 보기)</span></div>";																				
				replyList += "					<div style='display: none;' id ='dReplyProfile-one' class='dReplyProfile-king-content'>"+content+"</div>";																							
				}else{
				replyList += "					<div id='dReplyProfile-content' data-open='NO'><span class='secret-reply'>비밀댓글</span></div>";																									
				replyList += "					<div style='display: none;' id ='dReplyProfile-one' class='dReplyProfile-king-content'>"+content+"</div>";																							
				}
				}					
				replyList += "				</div>";
				replyList += "			</div>";
				replyList += "		</div>";
				replyList += "		<div id='allDate' class='dSubReplyDate'>";
				if(res[j].reply_mdfcn_ymd != 0){						
				replyList += "			<span id='write-date'>수정: "+res[j].reply_mdfcn_ymd+"</span>";
				}else{
				replyList += "			<span id='write-date'>"+res[j].reply_wrt_ymd+"</span>";					
				}
				if(res[j].ae_id == id){						
				replyList += "			<div id='dReplyStatus' data-reply ="+res[j].reply_no+" data-board="+boardTemp+">";
				replyList += "				<span id='dReplyUpdate'>수정</span>";
				replyList += "				<span id='dReplyDelete'>삭제</span>";					
				replyList += "			</div>";
				}
				replyList += "		</div>";
				replyList += "</div>";
			}
				if(res.length >= 5){						
				replyList += "<div class='dReplyTitleList' style='text-align: center;'>";					
				replyList += "		<span class='sub-reply-append'>대댓글 더보기</span>";
				replyList += "</div>";
				}
     	},
     	error: function(ex){
     		console.log("error", ex);
     	
     	}
   });		
	dList.append(replyList);	
}

// 게시판 작성 모달이 나온다.
function iModalOpen(){
	diModal.style.display = 'block';
	var aeId = $("#id").val();
	
	$.ajax({
		type : "get",
		url : "/haruter/getChatRoomNo",
		data: {
			"ae_id":aeId 
		},
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(res){
			var tempOption = ""
			tempOption += "<select id='chatboardNo-select'>"
			tempOption += "	<option value='0'>NO</option>"
			if(res.length > 0){
				for(let i = 0; i < res.length; i++){
					tempOption += "<option value="+res[i].cr_no+">"+res[i].cr_temp_no+"</option>"		
				}
			}
			tempOption += "</select>"
			$("#diSelect-option").html(tempOption);
		},
     	error: function(ex){
     		console.log("error");
     	}
    })
}


// 상세 모달 닫기
function ddmodalClose(){
	ddModal.style.display = 'none';
	chatBoardReplyPage = 1;
}

// 게시판 작성 모달 없애기
function dimodalClose(){
	diModal.style.display = 'none';
	$("#chatboard-title").val("");
	$("#chatboard-content").val("");
	
}

// 게시판 생성
function crateChatBoard(){
	var aeId = $("#id").val();
	Swal.fire({
		  title: '모집게시판을 게시하겠습니까?',
		  showDenyButton: true,
		  confirmButtonText: '네',
		  denyButtonText: '아니요',
		  width: '700px',
		}).then((result) => {
		  if (result.isConfirmed) {
				if($("#chatboard-title").val().trim() == ""){
					Swal.fire("제목을 입력하세요!");
					return false;
				}

				if($("#chatboard-content").val().trim() == ""){
					Swal.fire("내용을 입력하세요!");
					return false;
				}

				$.ajax({
					type : "post",
					url : "/haruter/createChatBoard",
					data: {
						"ae_id":aeId,
						"board_title":$("#chatboard-title").val(),
						"board_content":$("#chatboard-content").val(),
						"ccg_b004":'모임게시판',
						"cr_no":$("#chatboardNo-select").val(),
						"cr_temp_no":$("#chatboardNo-select option:selected").text()
					},
					beforeSend : function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success: function(res){
						Swal.fire("작성 완료!");
						dimodalClose();
						resetBoard();

					},
			     	error: function(ex){
			     		console.log("error");
			     	}
			    })
		  }
	})

}

//수정 폼 닫기
function MmodalClose(){
	uModal.style.display = "none";
}

//댓글 수정 폼 닫기
function RmodalClose(){
	rModal.style.display = "none"
}


// 게시판 리셋 및 다시 나오게 하기
function resetBoard(){
	chattingBoardList.html("")
	chatBoardPage = 1;									
	chatBoardList()
}

// 모집게시판 리스트를 불러온다
function chatBoardList(){
	var aeId = $("#id").val();
   	$.ajax({
		type : "get",
		url : "/haruter/getChatBoardList",
		data: {
			"currentPage":chatBoardPage,
			"searchSelect":chatboardSearchSelect.value,
			"searchWord":chatboardSearchInput.value,
			"searchType":chatboardSelect.value,
			"ae_id":aeId
		}, 
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(res){
			console.log("RES", res)
			var tempDiv = "";
			for(let i = 0; i < res.length; i++){	
				var title = res[i].board_title.replaceAll(/<script>/gi, "");
				var content = res[i].board_content.replaceAll(/<script>/gi, "");
				tempDiv += "<div class='chatBoard-all-div' data-no="+res[i].board_no+">";
				tempDiv += "	<div class='chatBoard-header'>";
				tempDiv += "		<div class='chatBoard-header-header'>"
				tempDiv += "			<div class='chatBoard-temp-no'>"
				tempDiv += " 				<span class='chatBoard-temp-no-span'>채팅방번호</span>";
				if(res[i].cr_temp_no == 'NO'){
				tempDiv += "				<span>NO</span>";					
				}else{
				tempDiv += "				<span>"+res[i].cr_temp_no+"번</span>";										
				}
				tempDiv += "			</div>";
				tempDiv += "			<div class='chatBoard-title'>";
				if(res[i].board_title.length > 11){
				tempDiv += "				<span class='chatBoard-title-span'>"+title.substring(0,11) + "..."+"</span>";								
				}else{
				tempDiv += "				<span class='chatBoard-title-span'>"+title+"</span>";				
				}
				tempDiv += "			</div>";
				tempDiv += "		</div>";
				tempDiv += "		<div class='chatBoard-content'>";
				if(res[i].board_content.length > 100){
				tempDiv += 					content.substring(0,100) + "...";								
				}else{
				tempDiv += 					content;				
				}
				tempDiv += "		</div>";			
				tempDiv += "	</div>";
				tempDiv += "	<div class='chatBoard-header-content'>";
				tempDiv += "		<table>";
				tempDiv += "			<tr>";
				tempDiv += "				<th class='chatBoard-date'>작성일자</th>";
				tempDiv += "				<th class='chatBoard-date'>수정일자</th>";
				tempDiv += "				<th class='chatBoard-date'>조회수</th>";
				tempDiv += "			<tr>";
				tempDiv += "				<td class='chatBoard-date'>"+res[i].wrt_ymd+"</td>";
				if(res[i].last_mdfcn_ymd == '0'){
				tempDiv += "				<td class='chatBoard-date'>-</td>";					
				}else{
				tempDiv += "				<td class='chatBoard-date'>"+res[i].last_mdfcn_ymd+"</td>";					
				}
				tempDiv += "				<td class='chatBoard-date' id='chatBoard-cnt'>"+res[i].inq_cnt+"</td>";
				tempDiv += "			<tr>";
				tempDiv += "		</table>";
				tempDiv += "	</div>";
				tempDiv += "</div>";
			}
			
			
			if(res.length < 6){
				scrollCheck = false;
			}else{
				scrollCheck = true;
			}
			
			chattingBoardList.append(tempDiv);		
     	},
     	error: function(ex){
     		console.log("error");
     	}
    });
}



</script>
