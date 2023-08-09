<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/asset/css/ebook.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" value='<sec:authentication property="name"/>' id="sec-name">
	<input id="bookNo" type='hidden' value='${ebook.book_no }'>
	<input id="readPage" type='hidden' value='${ebook.em_read_page }'>
	
	<div id="bookForm">
		<div id="voice-span-div"><span id="voice-choice">음성으로 들을 페이지를 선택해주세요!</span></div> 
		<div class="flip_book flipbook"></div>
		<div class="mark" id="bookMark"></div>
		<div id="btns"> 
			<div id="sound-check">				
				<img class='img-size' id="voice-play" src="/resources/asset/image/sound.png">
				<img class='img-size' id="voice-stop" src="/resources/asset/image/sound1.png">
				<div id="sound-anis">
					<span class="sound-ani"></span>
					<span class="sound-ani"></span>
					<span class="sound-ani"></span>
					<span class="sound-ani"></span>
					<span class="sound-ani"></span>
					<span class="sound-ani"></span>
					<span class="sound-ani"></span>
				</div>
			</div>
			<button class="book-btn" id="bookmark-input">책갈피 등록</button>
			<button class="book-btn book-close-btn" id="bookmark-out">책갈피 해제</button>
			<button class="book-btn" id="memo-open">메모 보기</button>
			<button class="book-btn book-close-btn" id="memo-close">메모 닫기</button>
			<button class="book-btn book-close-btn" id="memo-save">메모 저장</button>
			<button class="book-btn" id="bookmark-list">책갈피 리스트</button>
			<button class="book-btn book-close-btn" id="bookmark-list-close">리스트 닫기</button>
			<button class="book-btn" id="voice-select">음성 : 선택</button>			
			<button class="book-btn book-close-btn" id="voice-close">선택 취소</button>		
			<button class="book-btn" id="trans-e">영어로 번역</button>
			<button class="book-btn" id="trans-k">한글로 번역</button>
			<button class="book-btn" id="page-save">현재 페이지 저장</button>
		</div>
		<div id="mark-list">
			<div id='book-mark-div'>
				<div id='book-mark-h2'>
					<h2>책갈피 리스트</h2>
				</div>
				<div id="book-marks-div"></div>
			</div>
		</div>

	</div>
	<div id="controls">
		<div class="btn previous-button">◀</div>
		<label class="spacing" for="page-number">Page:</label>
		<input type="text" size="3" id="now-page" class="page-number spacing"><span class="spacing">of</span><span class="number-pages spacing"></span>
		<div class="btn next-button">▶</div>
	</div>
	<div id="memo-div"  >
		<div contenteditable="true"  id="memo-div2"></div>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.min.js"></script>
<script type="text/javascript" src="../resources/js/turnjs/lib/turn.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript">
	var readPage = $("#readPage");             // 읽어온 페이지 string형
	var startPage = parseInt(readPage.val());  // 읽어온 페이지를 int형으로 변환
	var bookMark = $("#bookMark");			   // 책갈피 부분
	var pageSave = $("#page-save");			   // 책 저장하는 부분
	var bookmarkInput = $("#bookmark-input");  // 책갈피 등록 버튼
	var bookmarkOut = $("#bookmark-out");	   // 책갈피 해제 버튼
	var bookmarkList = $("#bookmark-list");	   // 책갈피 리스트 버튼
	var memoOpen =$("#memo-open");					   // 메모장 열기 버튼
	var memoSave =$("#memo-save");				  	   // 메모장 저장 버튼
	var memoClose =$("#memo-close");				   // 메모장 닫기 버튼
	var memoDiv = $("#memo-div");					   // 메모장  div
	var memoDiv2 = $("#memo-div2");					   // 실제 메모를 쓰는 div
	var bookmarkListClose = $("#bookmark-list-close") // 책갈피 리스트 닫기 버튼
	var voiceSelect = $("#voice-select");					// 음성인식선택버튼
	var voiceClose = $("#voice-close");					    // 음성인식취소버튼
	var voiceChoice = $("#voice-choice");					// 음성인식문구
	var voicePlay = $("#voice-play");						// 재생버튼
	var voiceStop = $("#voice-stop");						// 정지버튼
	var soundAnis = $("#sound-anis");						// 재생 애니메이션들
	var transE = $("#trans-e");								// 영어로 번역하기
	var transK = $("#trans-k");								// 한글로 번역하기
 	var markList = $("#mark-list");			   // 책갈피 리스트 div
	var prev = $(".previous-button");		   // 이전 페이지
	var next = $(".next-button");			   // 다음 페이지
	var numberOfPages = 0;					   // 전체 페이지 처음엔 0으로 설정 후 pdf 파일을 읽어서 다시 저장
	var maxLength = 150;						// 메모장 글자 수 제한
	textarea = '';								// 음성으로 전환할 텍스트를 저장할 공간
	voiceChoise = false;							// 음성인식선택버튼을 눌렀는지 확인
	voiceNowCheck = false;							// 현재페이지 읽기를 선택했을 때
	voiceTran = false;								// 번역 버튼 눌렀는지 체크
	pageNum  = 1;									// 음성인식 자동변환을 위한 page번호를 저장한다.
	
	var name = document.querySelector("#sec-name").value;	// 세션 사용자 정보 가져오기
	var bookNo = document.querySelector("#bookNo").value; // 책 번호 가져오기
	var rendered = [];			
	var firstPagesRendered = false;
	url = "../resources/ebook/"+bookNo+".pdf"; // e북 파일 이름을 토대로 꺼내기

	var pdf 		= null;
	// 크기 조절
	var scale 	= 0.6;
	width = 1248;
	height = 430;
	
	// 페이지 저장, 책갈피 저장 삭제
	function allSave(info){
		var pageCount = $('.page-number').val();
		var urlInfo;
		var successContent;
		if(info==1){
			urlInfo = "/myHaru/updateReadPage";
			successContent = "저장 성공!";
		}else if(info==2){
			urlInfo = "/myHaru/insertBookRecode";
		}else if(info==3){
			urlInfo = "/myHaru/deleteBookRecode";
		}
		
		$.ajax({
			type : "post",
			url : urlInfo,
			data: {
				ae_id:name,
				em_read_page:pageCount,
				book_no:bookNo
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(res){
				if(res!='OK'){
					alert("네트워크 오류! 다시 눌러주세요!");
					window.opener.location.reload();
				}else{
					if(successContent!=null){
						Swal.fire({
							  icon: 'success',
							  title: successContent,
							  showConfirmButton: false,
							  timer: 700
						});					
					}
					window.opener.location.reload();
				}
         	},
         	error: function(ex){
         		console.log("error", ex);
         	}
		});	
	}
	
	// 현재 페이지 저장
	pageSave.on('click',function(){
		allSave(1);		
	});
	
	// 책갈피 저장
	bookmarkInput.on('click', function(){
		allSave(2);
		getBookMarkLists();
		
		bookmarkInput.css('display', 'none')
		bookmarkOut.css('display', 'block')
		
		// #bookMark 요소 보이기
	    bookMark.css('display', 'block');
	    bookMark.css('opacity', '0'); // 초기 투명도 설정

	    // 애니메이션 효과 추가
	    bookMark.animate(
	        {
	            width: '30px', // 오른쪽으로 펼쳐짐
	            opacity: '1' // 투명도 증가
	        },
	        500, // 애니메이션 지속 시간
	        function(){
	            // 애니메이션 완료 후 초기화
	            $(this).css({
	                opacity: ''
	            });
	        }
	    );
	    getBookMarkLists();
	})
	
	// 책갈피 삭제
	bookmarkOut.on('click', function(){
		allSave(3)
		getBookMarkLists();
		
		bookmarkInput.css('display', 'block')
		bookmarkOut.css('display', 'none')
		
		bookMark.animate(
			    {
			        width: '0px', // 왼쪽으로 접히도록 변경
			        opacity: '0' // 투명도 감소
			    },
			    500, // 애니메이션 지속 시간
			    function(){
			        // 애니메이션 완료 후 숨김 처리
			        $(this).css({
			            display: 'none'
			        });
			    }
		);
		getBookMarkLists();
	})
	
	// 책갈피 리스트를 불러오는 함수
	function getBookMarkLists(){
		$.ajax({
			type : "get",
			url : "/myHaru/getBookMarkList",
			data: {
				ae_id:name,
				book_no:bookNo
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(res){
				$("#book-marks-div").empty();
				code = ""
				if(res.length != 0){
					for(var i = 0; i < res.length; i++){
						code += "<span class='mark-btns' onclick=moveBookMarkPage("+res[i]+")>"+res[i]+"</span>";
					}					
				}else{
					code += "<h3 id='book-mark-h3'>책갈피가 존재하지 않습니다!</h3>";
				}
				$("#book-marks-div").html(code);
         	},
         	error: function(ex){
         		console.log("error", ex);
         	}
		});	
	}
	
	// 책갈피 리스트
	bookmarkList.on('click', function(){
		getBookMarkLists();
	
		markList.css('display', 'block');
		bookmarkListClose.css('display', 'block');
		bookmarkList.css('display', 'none');
	})
	
	// 책갈피 리스트 닫기
	bookmarkListClose.on('click', function(){
		bookmarkListClose.css('display', 'none');
		bookmarkList.css('display', 'block');
		markList.css('display', 'none');
	})
	
	// 책갈피 리스트에서 책갈피를 선택할 때
	function moveBookMarkPage(pageCheck){
		var pageInt =  parseInt(pageCheck);
		$('.flip_book').turn('page', pageInt);
		var range = $(this).turn('range', pageInt);
		renderPage(range);
		$('.page-number').val(pageInt);
	}
	
	// 책 메모장 열기 및 불러오기
	memoOpen.on('click', function(){
	    memoOpen.css('display', 'none');
	    memoClose.css('display', 'block');
	    memoSave.css('display', 'block');
	    memoDiv.css('display', 'block');
	    memoDiv.css('animation', 'slideUp 0.5s ease');
	    memoDiv.css('bottom', '-150px');
	    memoGet();
	});

	// 책 메모장  닫기
	memoClose.on('click', function(){
	    memoOpen.css('display', 'block');
	    memoClose.css('display', 'none');
	    memoSave.css('display', 'none');
	    memoDiv.css('animation', 'slideDown 0.5s ease');
	    setTimeout(function() {
	        memoDiv.css('display', 'none');
	    }, 300); // 0.3초 후에 메모장을 숨김 처리
	    
	});
	
	// 메모장 저장
	memoSave.on('click', function(){
		memoManage();
	})
	
	// 메모장 글자 수 제한
	memoDiv2.on('input', function() {
		  var text = $(this).text();
		  if (text.length > maxLength) {
		    $(this).text(text.substring(0, maxLength));
		    return false;
		  }
	});
	
	// 메모장 저장 또는 삽입 하는 함수
	function memoManage(){
		var pageCount = $('.page-number').val();
		var content = memoDiv2.html();
		var type;
		var url;

		$.ajax({
			type : "post",
			url : "/myHaru/insertOrUpdateEbookMemo",
			data: {
				ae_id:name,
				book_no:bookNo,
				em_page:pageCount,
				em_content:content
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(res){
				if(res=="OK"){	
					Swal.fire({
						  icon: 'success',
						  title: "저장 완료!",
						  showConfirmButton: false,
						  timer: 700
					})	
				}
         	},
         	error: function(ex){
         		console.log("error", ex);
         	}
		});	
		
	}
	
	// 메모를 불러오는 함수
	function memoGet(){
		var pageCount = $('.page-number').val();
		
		$.ajax({
			type : "get",
			url : "/myHaru/getEbookMemo",
			data: {
				ae_id:name,
				book_no:bookNo,
				em_page:pageCount
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(res){
				if(res.em_content != null){
					memoDiv2.empty();
					memoDiv2.html(res.em_content);
				} else {
					memoDiv2.empty();
				}

         	},
         	error: function(ex){
         		console.log("error", ex);
         	}
		});	
	}
	
	
	$(document).ready(function(){
			
		let timerInterval
		Swal.fire({
		  title: '책을 불러오는 중입니다!',
		  html: '로딩까지 <b></b>',
		  timer: 2000,
		  timerProgressBar: true,
		  didOpen: () => {
		    Swal.showLoading()
		    const b = Swal.getHtmlContainer().querySelector('b')
		    timerInterval = setInterval(() => {
		      b.textContent = Swal.getTimerLeft()
		    }, 100)
		  },
		  willClose: () => {
		    clearInterval(timerInterval)
		  }
		}).then((result) => {
		  /* Read more about handling dismissals below */
		  if (result.dismiss === Swal.DismissReason.timer) {
		    console.log('책 불러오기 완료!')
		  }
		})
		
		pdfjsLib.getDocument(url).promise.then(function(pdfDoc) {
			numberOfPages = pdfDoc.numPages; 
			console.log("numberOfPages: " + numberOfPages)
			// PDF의 총 페이지수를 저장
			$('.flip_book').turn.pages = numberOfPages;

			pdf = pdfDoc;
			
			// 책 펼칠 때 첫 셋팅, 함수
			$('.flip_book').turn({
				width: width,	
				height: height,
				acceleration: false,	// 가속 여부
				pages: numberOfPages,	// 총 페이지 수 등록
				elevation: 50,			// 측면 효과 높을 수록 더 실제 효과
				gradients: true,		// 그라데이션 효과 사용여부 !$.isTouch를 사용하여 Touch가 불가능하다
				when: {
					// 아직 책을 펼치기 전에 현재 페이지 기준으로 2쪽 전 ~ 2쪽 후 까지 미리 랜더링 
					turning: function(e, page, view) {
						var range = $(this).turn('range', page);
						for (page = range[0]; page<=range[1]; page++) {
							addPage(page, $(this));
						};
					},
					// 책을 펼칠 때 다시 2쪽 전 2쪽을 후를 보여주기(첫 페이지, 마지막 페이지도 조건에 맞추어서 체크한다.);
					turned: function(e, page) {
							console.log(page);
							if(pageNum != page){
								voiceNowCheck = false;
							}
							var range=$(this).turn('range', page);
							var pageNow = 0;
							if(range[0]==page){
								pageNow = range[0];
							}else if(page==2||page==3){
								pageNow = range[0]+1;
							}else if(numberOfPages%2!=0 && (page==numberOfPages||page==(numberOfPages-1))){
								pageNow = (numberOfPages-1);								
							}else if(numberOfPages%2==0 && page==numberOfPages){
								pageNow = (numberOfPages);
							}else if(numberOfPages%2==0 && (page==(numberOfPages-2)||page==(numberOfPages-1))){
								pageNow = (numberOfPages-2);
							}else{					
								pageNow = (range[0]+2);
							}
							$('.page-number').val(pageNow);

							for (var page=range[0]; page<=range[1]; page++) {
								if (!rendered[page]) {
									renderPage(page); 
									rendered[page]=true;
								}
							}
		                    // 모든 페이지가 로드되었는지 확인
		                    var allPagesLoaded = rendered.every(function(value) {
		                        return value;
		                    });
							
		                    if (allPagesLoaded) {
			                    // 책 펼칠 때 마다 계속 해당 하는 페이지에 책갈피 및 메모장을 확인한다
		                        checkBookMark(pageNow);        
		                        memoGet();

		        				const synth = window.speechSynthesis;
		                        if(!voiceNowCheck){
			                        cancelSpeech()		                        	
		                        }
		                    }	
           
		                                 
					},
					// 아직 펼치기 전, 펼쳤을 때 등 랜더링이 안된 상태에서 넘어갈 때 해당 페이지를 미리 추가 및 보여주기
					missing : function(e, page){
						var range=$(this).turn('range', page);
						$('.page-number').val(range[0]+2);
						var n = numberOfPages;
						n = n > 6 ? (6 + 1) : n;
						for (page = 1; page < n; page++){
							addPage(page, $(this));
							renderPage(page);
							rendered[page] = true;
						}
						firstPagesRendered = true;
					}
				}
			});
			

			// 처음 펼칠 때 마지막 저장 페이지를 기준으로 랜더링하기 
			$('.flip_book').turn('page', startPage);
			for(var i = startPage - 2; i < startPage + 2; i++){
				if (!rendered[i]) {
					renderPage(i); 
					rendered[i]=true;		
				}
			}
			
			checkBookMark(startPage);
			// 처음에 현재 번호 및 마지막 번호 웹사이트 상에 표시
			$('.page-number').val(startPage);
			$('.number-pages').text($('.flip_book').turn.pages);
					
			// 페이지 입력 후 엔터 키 눌렀을 때 해당 페이지로 넘기기
			$('.page-number').keydown(function(e){
				var p = $('.page-number').val();
				if (e.keyCode==13) {
					$('.flip_book').turn('page', p);
					var range=$(this).turn('range', page);
					renderPage(range);
					$('.page-number').val(range[0]+2);
				}
			});
			
			// 선택음성듣기 누르면 선택한 페이지를 음성듣기 할 수 있게 한다.
			voiceSelect.on('click', function(){
				voiceChoise = true;
				voiceSelect.css('display', 'none');
				voiceClose.css('display', 'block');
				voiceChoice.css('display', 'block');
			})
			
			// 선택음성듣기 취소
			voiceClose.on('click', function(){
				voiceChoise = false;
				voiceSelect.css('display', 'block');
				voiceClose.css('display', 'none');
				voiceChoice.css('display', 'none');
			})
			
			
		 	// 일시정지 해재, 일시정지 내역 없으면 현재 페이지부터 재생
			voicePlay.on('click', function(){
				 const synth = window.speechSynthesis;
				 if (synth.speaking && synth.paused) {
				   synth.resume();
				 } else{
					voiceNowCheck = true;
					var pageCount = $('.page-number').val();
					pageNum = parseInt(pageCount);
					pdfText(parseInt(pageCount));
				 }
				voicePlay.css('display', 'none');
				voiceStop.css('display', 'block');
				soundAnis.css('height', '40px');
				soundAnis.css('margin-top', '0px');
			})
			
			// 일시정지
			voiceStop.on('click', function(){
				 const synth = window.speechSynthesis;
				 if (synth.speaking && !synth.paused) {
				   synth.pause();
				 }
				voicePlay.css('display', 'block');
				voiceStop.css('display', 'none');
				soundAnis.css('height', '5px');
				soundAnis.css('margin-top', '15px');
			})
			
			// 음성듣기 할 때 해당 페이지의 텍스트를 추출한다.
			function pdfText(pdfPageNum){
				pdfjsLib.getDocument(url).promise.then(function (pdf) {
				  // 첫 번째 페이지 가져오기
				  pdf.getPage(pdfPageNum).then(function (page) {
				    // 페이지 텍스트 추출
				    page.getTextContent().then(function (textContent) {
				      var text = '';
				      // 추출된 텍스트 조각을 병합하여 전체 텍스트 생성
				      textContent.items.forEach(function (item) {
				        text += item.str + ' ';
				      });
				      // 추출된 텍스트 출력
				      textarea = text;
					  speakText();
				    });
				  });
				});
			}	
			
			// 음성 합성 취소
			function cancelSpeech() {
				const synth = window.speechSynthesis;
				if (synth.speaking) {
				   synth.cancel();
				}
				if(voiceTran){
					voicePlay.css('display', 'none');
				}else{
					voicePlay.css('display', 'block');				
				}
				voiceStop.css('display', 'none');
				soundAnis.css('height', '5px');
				soundAnis.css('margin-top', '15px');
			}
			
			// 초성도 읽을 수 있게
			function convertToRomanization(text) {
			    const chosungMap = {
			        'ㄱ': '그', 'ㄲ': '끄', 'ㄴ': '느', 'ㄷ': '드', 'ㄸ': '뜨', 'ㄹ': '르', 'ㅁ': '므', 'ㅂ': '브',
			        'ㅃ': '쁘', 'ㅅ': '스', 'ㅆ': '쓰', 'ㅇ': '으', 'ㅈ': '즈', 'ㅉ': '쯔', 'ㅊ': '츠', 'ㅋ': '크',
			        'ㅌ': '트', 'ㅍ': '프', 'ㅎ': '흐', 'ㅏ':'아', 'ㅔ':'에','ㅐ':'애','ㅣ':'이','ㅓ':'어','ㅗ':'오','ㅜ':'우','ㅠ':'유',
			        'ㅒ':'얘','ㅖ':'예','ㅛ':'요','ㅑ':'야'
			    };

			    let result = '';
			    for (let i = 0; i < text.length; i++) {
			        const charText = text[i];
			        if (chosungMap[charText]) {
			            result += chosungMap[charText];
			        } else {
			            result += charText;
			        }
			    }

			    return result;
			}

			
			// 추출된 해당 페이지의 텍스트를 읽어준다.
			function speakText(){
			    const romanizedText = convertToRomanization(textarea);
			    const synth = window.speechSynthesis;
			    
			    const textToRead = new SpeechSynthesisUtterance(romanizedText);
			    textToRead.lang = 'ko-KR';
			    textToRead.volume = 1;
			    textToRead.rate = 0.9;
			    textToRead.pitch = 1;
			    synth.cancel();
				
			    // 음성합성이 완료되었을 때 페이지 넘어가기
			    textToRead.onend = function() {
			        if(voiceNowCheck){
			        	if(pageNum % 2 == 1){
			        		$('.flip_book').turn('next');
			        	}
				        pageNum = (pageNum + 1)
			    		pdfText(pageNum);
			        }else{
						voicePlay.css('display', 'block');
						voiceStop.css('display', 'none');
						soundAnis.css('height', '5px');
						soundAnis.css('margin-top', '15px');       	
			        }
			    };
			    
				synth.speak(textToRead);	    	
			}
			
			
			// 영어로 번역
			transE.on("click", function(){
				transE.css("display", "none");
				transK.css("display", "block");
		        voicePlay.css('display', 'none');
				voiceStop.css('display', 'none');
				soundAnis.css('height', '5px');
				soundAnis.css('margin-top', '15px');
				url = '../resources/ebook/'+ bookNo +"_E.pdf" ;
				voiceSelect.css('display', 'none');
				voiceTran = true;
				transAll();
			})	
			
			// 한글로 번역
			transK.on("click", function(){
				transE.css("display", "block");
				transK.css("display", "none");
				voiceSelect.css('display', 'block');
		        voicePlay.css('display', 'block');
				voiceStop.css('display', 'none');
				soundAnis.css('height', '5px');
				soundAnis.css('margin-top', '15px');
				url = "../resources/ebook/"+ bookNo+".pdf" ;
				voiceTran = false;
				transAll();
			})
			
			// 한글, 영어로 해당 페이지 번역
			function transAll(){
				
				const synth = window.speechSynthesis;
		        cancelSpeech()		                        		    				
				
				pdfjsLib.getDocument(url).promise.then(function(pdfDoc) {
					// Update the necessary variables and elements with the new PDF
					startPage = parseInt(readPage.val());
					numberOfPages = pdfDoc.numPages;
					$('.flip_book').turn.pages = numberOfPages;
					pdf = pdfDoc;
					pageNumber = parseInt($(".page-number").val());
					$('.flip_book').turn('pages', numberOfPages);
					$('.number-pages').text(numberOfPages);
					$('.flip_book').turn('page', pageNumber);
					rendered = []; // Reset the rendered pages array

					// Render the necessary pages for the new PDF
					for(var i = pageNumber - 2; i < pageNumber + 2; i++){
						if (!rendered[i]) {
							renderPage(i); 
							rendered[i] = true;		
						}
					}
				});
			}
			
			function addPage(page, book) {
				if (!book.turn('hasPage', page)) {
					var element = $('<div />', {'id': 'page-'+page});
					element.html('<div class="data"><canvas id="canv' + page + '"></canvas></div><div class="gradient" data-page="'+ page +'"></div>');
					book.turn('addPage', element, page);
	
					// 페이지 선택해서 음성 들을 때
					element.find('.gradient').on('click', function(){
			        	var p = $(this).data('page');
			        	pageNum = parseInt(p);
			        	if(voiceChoise){
			        		voiceChoise = false;
			        		voiceNowCheck = true;        		
			        		voiceSelect.css('display', 'block');
			        		voiceClose.css('display', 'none');
			        		voiceChoice.css('display', 'none');
			        		voicePlay.css('display', 'none');
			        		voiceStop.css('display', 'block');
			        		soundAnis.css('height', '40px');
			        		soundAnis.css('margin-top', '0px');
			        		pdfText(p);
			        	}
			    	 });

				}
				
			}
			
		});
		
	});
	
	// 책갈피 있는지 확인
	function checkBookMark(pageCheck){
		$.ajax({
			type : "get",
			url : "/myHaru/checkBookRecode",
			data: {
				ae_id:name,
				book_no:bookNo,
				er_page:pageCheck
			},
			beforeSend : function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(res){
				if(res=='OK'){
					bookMark.css('display', 'block');
					bookMark.css('width', '30px');
					bookMark.css('opacity', '100');
					bookmarkInput.css('display', 'none');
					bookmarkOut.css('display', 'block');
				}else{
					bookmarkInput.css('display', 'block');
					bookmarkOut.css('display', 'none');
					bookMark.css('display', 'none');					
				}
         	},
         	error: function(ex){
         		console.log("error", ex);
         	}
		});	
	}
	
	// 왼쪽 키 오른쪽 키 눌렀을 때 각각 다음페이지 이전페이지로 이동
	$(document).keydown(function(e){
		if (e.target && e.target.tagName.toLowerCase()!='input'){
			if (e.keyCode==37){
				$('.flip_book').turn('previous');
			} else if (e.keyCode==39) {
				$('.flip_book').turn('next');
			}
		}
	});
	
	// 버튼을 눌렀을 때도 각각 다음페이지 이전페이지로 이동
	next.on('click', function(){
		$('.flip_book').turn('next');
	})
	prev.on('click', function(){
		$('.flip_book').turn('previous');
	})
	
	// pdf.js로 페이지를 가져온 후 설정된 크기 설정을 토대로 표시
	function renderPage(num) {

		pdf.getPage(num).then(function(page) {
			viewport = page.getViewport({scale : scale});

			var canvasID = 'canv' + num;
			var canvas = $('#' + canvasID)[0];

			if (canvas == null){
				return;
			}

			var context = canvas.getContext('2d');

		    // PDF 사이즈를 고정된 값으로 설정
		    var fixedWidth = 450; // 고정할 가로 크기
		    var fixedHeight = 650; // 고정할 세로 크기
		    canvas.width = fixedWidth;
		    canvas.height = fixedHeight;

			var renderContext = {
				canvasContext: context,
				viewport: viewport
			};

			page.render(renderContext);

			// rendering 여부 확인
			var renderTask = page.render(renderContext);
			renderTask.promise.then(function () {	
				console.log(canvasID+'Page rendered');
			});
			window.onresize = function() {
				  window.resizeTo(1500, 900+70);
			};
				  
		    // 새 창을 고정
			window.onbeforeunload = function() {
				window.scrollTo(0, 0);
			};	
			
			// 플립북 pdf사이즈에 맞게 재조절
			$('.flip_book').turn('size',(canvas.width * 2), canvas.height)
		});
	}

	
	pdfjsLib.GlobalWorkerOptions.workerSrc = 'https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.6.347/pdf.worker.min.js';
</script>
</body>

</html>
