<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/asset/css/myDiary.css">
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
.bt_wrap {
	margin-top: 11px;
    justify-content: center;
}
.board_title p{
	margin-left: 0px;
	margin-bottom: 10px;
}
.board_title {
	display:flex;
	border-bottom: 1px solid #999;
	justify-content: space-between;
}
.board_title #titleP{
	word-break: break-all;
    margin: auto;
    padding: 5px;
	font-size: 2.4rem;
}

.board_title #ymdP{
	margin-right: 7%;
	margin-top: 2%;
}
.board_wrap {
	margin-top: 6%;
}
#strong{
	text-align: center;
	font-family: 'Nanum Pen Script';
	font-size: 40px;
	margin-bottom: 2%;
}
pre{
	font-family: 'Nanum Pen Script';
}
div #cont{
  background-attachment: local;
  background-image:
    linear-gradient(to right, white 10px, transparent 10px),
    linear-gradient(to left, white 10px, transparent 10px),
    repeating-linear-gradient(white, white 41px, #ccc 27px, #ccc 32px, white 46px);
  line-height: 31px;
  padding: 0px 10px;
  -ms-overflow-style: none; 
  scrollbar-width: none;
}
#cont::-webkit-scrollbar {
    display: none; 
} 

</style>
<input type="hidden" value="<sec:authentication property="name"/>" id="secName">
<input type="hidden" name="diary_no" id="diary_no" value="${dvo.diary_no}">
 <div class="board_wrap">
        <div class="board_view_wrap">
        	<div id="strong">
				<strong>나의 일기</strong>
			</div>
            <div class="board_view">
            	<div class="board_title">
            		<p id="titleP"> <c:out value="${dvo.diary_title }"/></p>
            		<p id="ymdP"> 작성일 : ${dvo.diary_ymd }</p>
        		</div>
                <div id="cont">
                   <pre><c:out value="${dvo.diary_content }"/></pre>  
                </div>
            </div>
            <div class="bt_wrap">
                <a href="/myHaru/mydiary" class="on">목록</a>
                <button type="button" class="on" id="modifyBtn">수정</button>
                <button type="button" class="on" id="deleteBtn">삭제</button>
            </div>
        </div>
        <form action="/myHaru/deletediary" method="post" id="diaryForm">
			<input type="hidden" name="diary_no" value="${dvo.diary_no}">
			<sec:csrfInput/>
		</form>
   </div>
<script type="text/javascript">
$(function () {
	var diaryForm = $("#diaryForm");
	var modifyBtn = $("#modifyBtn");
	var deleteBtn = $("#deleteBtn");
	
	modifyBtn.on("click", function () {
		diaryForm.attr("method", "get");
		diaryForm.attr("action", "/myHaru/updateform");
		diaryForm.submit();
	})
	
	deleteBtn.on("click", function () {
		if(confirm("정말 삭제하시겠습니까?")){
			diaryForm.submit();
		}
	})
})
</script>  
  