<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="content-wrapper" style="padding : 10px;">
		<div class="row" style=" padding : 10px;">
            <div class="col-12 grid-margin stretch-card">
                <div class="card">
                    <div class="card-body">
                        <h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">공지사항 등록</h4>
                        <form class="forms-sample" action="/mng/board/notice" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="nTitle">제목</label>
                                <input type="text" class="form-control" id="nTitle" name="notice_title"placeholder="제목을 입력해주세요.">
                            </div>
                            <div class="form-group">
                                <label for="nContent">내용</label>
                                <textarea class="form-control" id="nContent" rows="20" name="notice_content"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="nFile">파일</label><br>
                                <input type="file" id="nFile" name="notice_file">
                            </div>
                            <div style="float : right; ">
	                            <button type="button" id="autoInput" class="btn btn-info mr-2">자동 불러오기</button>
	                            <button type="button" class="btn btn-outline-primary mr-2" onclick="location.href='/mng/notice'">목록</button>
	                            <button type="button" onclick="fNoticeInsert()" class="btn btn-primary">등록</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
const nFile = document.querySelector("#nFile");   // input file
const nFileUpload = document.querySelector("#nFileUpload"); // button file upload
const nTitle = document.querySelector("#nTitle");         // 공지사항 제목
const nContent = document.querySelector("#nContent");    // 공지사항 내용
const nFileName = document.querySelector("#nFileName"); // 첨부파일 이름 뜨는 곳
$(function(){
	let defendTitle = nTitle.value;
	let defendContent = nContent.value;
   
   let escapedUserInput1 = defendTitle.replace(/[&<>"'/]/g, function (x) {
	      return {
	        '&': '&amp;',
	        '<': '&lt;',
	        '>': '&gt;',
	        '"': '&quot;',
	        "'": '&#39;',
	        '/': '&#x2F;'
	      }[x];
	    });
	defendTitle = escapedUserInput1;
	
	let escapedUserInput2 = defendContent.replace(/[&<>"'/]/g, function (x) {
	      return {
	        '&': '&amp;',
	        '<': '&lt;',
	        '>': '&gt;',
	        '"': '&quot;',
	        "'": '&#39;',
	        '/': '&#x2F;'
	      }[x];
	    });
	defendContent = escapedUserInput2;
	
	
	$("#autoInput").on("click", function(){
		nTitle.value = "하루북스 이용 규칙 안내";
		str = "안녕하세요. 하루북스입니다\n\n\n";
		str += "2023년 8월 10일에 새로 개정된 하루북스 이용규칙에 대해서 안내드립니다.\n\n\n";
		str += "회원님께 주요 개정 내용과 적용 일정을 아래와 같이 안내드리오니, 이용에 참고하시기 바랍니다.\n\n\n";
		str += "주요 개정 내용은 첨부된 파일을 참고해주세요.\n\n\n";
		str += "좀 더 편리하고 만족스러운 서비스 제공을 위해 항상 노력하겠습니다.\n\n\n";
		str += "감사합니다.\n\n\n";
		nContent.value = str;
	});
});


function fNoticeInsert(){
	let formData = new FormData();
    formData.append("notice_title", nTitle.value);
    formData.append("notice_content", nContent.value);
      
	if(nFile.files[0] != undefined){
		formData.append("notice_file", nFile.files[0]);
	}
      
    $.ajax({
		type : "post",
		url : "/mng/board/notice",
		beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		data : formData,
		dataType : "text",
		processData : false,
		contentType : false,
		success : function(data){
			if(data == "fail"){
				Swal.fire({
					title : '공지사항 등록 실패하였습니다.',
					text : '다시 시도해주세요', 
					icon : 'error'});
			} else {
				Swal.fire({
					title : '공지사항이 등록되었습니다.', 
					icon : 'success',
					confirmButtonText: '확인'
				}).then(function (result) { 
					if (result.isConfirmed) {
						location.href="/mng/notice";
					}
				});
			}
		}
  	})
}
   
</script>