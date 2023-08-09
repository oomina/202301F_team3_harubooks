<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style type="text/css">
#calendar{
	width: 85%;
	margin : auto;
}
#nav{
	text-align: center;
}
footer h2{
	text-align: center;
}
header h1{
	text-align: center;	
}
.modal, .dmodal{
  position: absolute;
  top: 0;
  left: 0;

  width: 100%;
  height: 100%;

  display: none;
  z-index: 100;
  background-color: rgba(0, 0, 0, 0.4);
}
.modal_body {
  position: absolute;
  top: 50%;
  left: 50%;

  width: 650px;
  height: 450px;

  background-color: rgb(255, 255, 255);
  /* border-radius: 10px; */
  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

  transform: translateX(-50%) translateY(-50%);
}
.m_head{
  height: 10%;
  padding: 5px;
  display: flex;
  justify-content: space-between;
  background-color:#b8d5b3e8;
  /* border-top-left-radius: 10px;
  border-top-right-radius: 10px; */
}
.m_body{
  height: 365px;
  padding: 20px;
}
.m_footer{
  height: 41px;
  padding: 7px;
  background-color: #b8d5b3;
  /* border-bottom-left-radius: 10px;
  border-bottom-right-radius: 10px; */
  display: flex;
  justify-content: end;
}
.modal_title{
  font-size: 18px;
  font-weight: bold;
  color: white;
  font-weight: 500;
  margin-left: 40%;
}
.close_btn{
  margin-right : 5px;
  font-size: 25px;
  color: rgb(102, 175, 127);
  font-weight: 900;
  cursor: pointer;
}
.input_box{
  width: 100%;
  border: 1px solid rgb(189, 189, 189);
  height: 30px;
}
.modal_btn{
  width: 80px;
  height: 28px;
  border-radius: 5px;
  text-align: center;
  font-size: 14px;
  font-weight: bolder;
  padding-top: 5px;
  margin-left: 5px;
  font-family: sans-serif;
}
.m_footer #close_btn{
  background-color: rgb(102, 175, 127);
  cursor: pointer;
}
.cancle{
  color: white;
}
.save, .modify, .delete {
  background-color: rgb(102, 175, 127);
  color: white;
  cursor: pointer;
}
#ta, #dta{
	height: 63%;
    resize: none;
}
.m_date{
	margin-top:10px;
	display: flex;
	justify-content: space-evenly;
}
#Color1{
  color:white;
  background-color: #EB4938; #EB4938
}
#Color2{
  color:white;
  background-color: #3996F6;
}
#Color3{
  color:white;
  background-color: #A1E5A1;
}
#Color4{
  color:white;
  background-color: #F2EC23;
}

#color::selection{
  background-color: none;
  color: black;
}
select#dcolor, select#color{
	cursor: pointer;
	border: 1px solid #00000061;
}
input#start, input#end{
	cursor: pointer;
	border: 1px solid #00000061;
}
input#dstart, input#dend{
	border: 1px solid #00000061;
}
div.modal_label{
	margin-top : 5px;
}
div aria-labelledby="fc-dom-1"{
	height: 567.889px
}
</style>
<br>
<%-- 시큐리티로 ae_id 받는 부분 --%>
<input type="hidden" value="<sec:authentication property="name"/>" id="sec-name">

<%-- 캘린더 생성 --%>
<div id='calendar'></div>

<%-- 모달 창 --%>
<div class="modal" id="modal">
	<div class="modal_body">
		<div class="m_head">
			<div class="modal_title">
				<h2>일정 등록</h2>
			</div>
			<div class="close_btn cancle" id="close_btn">X</div>
		</div>
		<div class="m_body">
			<div class="modal_label">일정</div>
			<input type="text" class="input_box" id="name_box"  value="" placeholder="제목 입력"/>
			<div class="m_date">
				시작일<input type="date" id="start" value="">
				종료일<input type="date" id="end" value="">
        		일정색상 <select name="input_select" id="dcolor">
                <option value="" id=""  selected disabled hidden></option>
                <option value="#EB4938" id="Color1">RED</option>
                <option value="#3996F6" id="Color2">BLUE</option>
                <option value="#A1E5A1" id="Color3">GREEN</option>
                <option value="#F2EC23" id="Color4">YELLOW</option>
              </select>
			</div>
			<div class="modal_label">일정내용</div>
			<textarea id="ta" rows="20" cols="15" class="input_box" placeholder="내용 입력"></textarea>
		</div>
		<div class="m_footer">
			<div class="modal_btn save" id="insert_btn">등록</div>
			<div class="modal_btn cancle" id="close_btn">취소</div>
		</div>
	</div>
</div>
<%-- 상세정보모달 --%>
<div class="dmodal" id="dmodal">
	<div class="modal_body">
		<div class="m_head">
			<div class="modal_title">
				<h2>나의 일정</h2>
			</div>
			<div class="close_btn cancle" id="close_btn">X</div>
		</div>
		<input type="hidden" id='cal-no'>
		<div class="m_body">
			<div class="modal_label">일정</div>
			<input type="text" class="input_box" id="dname_box"  value="" readonly/>
			<div class="m_date">
				<div>
					시작일<input type="date" id="dstart" value="" readonly>
				</div>
				<div>
					종료일<input type="date" id="dend" value="" readonly>
				</div>
			일정색상
			<div class="color" hidden="">
				<select name="input_select" id="color">
					<option value="" id="" selected disabled hidden=""></option>
					<option value="#EB4938" id="Color1">RED</option>
	                <option value="#3996F6" id="Color2">BLUE</option>
	                <option value="#A1E5A1" id="Color3">GREEN</option>
	                <option value="#F2EC23" id="Color4">YELLOW</option>
				</select>
			</div>
			<input type="color" value="" id="inColor" disabled>
			</div>
			<div class="modal_label">일정내용</div>
			<textarea id="dta" rows="20" cols="15" class="input_box" readonly></textarea>
			</div>
		<div class="m_footer">
			<div class="modal_btn modify" id="tomodify_btn">수정</div>
			<div class="modal_btn modify" id="modify_btn" hidden="">수정완료</div>
			<div class="modal_btn delete" id="delete_btn">삭제</div>
			<div class="modal_btn cancle" id="close_btn">취소</div>
		</div>
	</div>
</div>
<script type="text/javascript">
var secName = $("#sec-name").val();
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var modal = $(".modal");
    var dmodal = $(".dmodal");
    var closeBtn = $(".cancle");
    var insertBtn = $("#insert_btn");
    var toModifyBtn = $("#tomodify_btn");
    var modifyBtn = $("#modify_btn");
    var deleteBtn = $("#delete_btn");
    var endDateTemp;         // end date 임시 저장
    
    var today = new Date();
    var month = today.getMonth()+1; // 0번째부터 시작이라 1월 = 0월 + 1
    
    // 닫는 버튼 클릭시 모달닫는 함수 실행
    closeBtn.on('click', function(){
    	modalClose();
    })
    
    // 등록 버튼 클릭
    insertBtn.on('click', function (arg) {
      console.log("click");
		  insertCal(arg);
	})
	
	// 수정 버튼 클릭 > 수정페이지 이동
	toModifyBtn.on('click', function (arg) {
		updateValues();
		
	})
	
	// 수정버튼 클릭
	modifyBtn.on('click', function () {
		updateCal();
	})
	
	// 삭제버튼 클릭
	deleteBtn.on('click', function () {
		deleteCal();
		console.log("click")
	})
	
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
   		locale : 'ko',
   		timeZone: 'Asia/Seoul',
      headerToolbar: {
        left: 'prev',
        center: 'title',
        right: 'next'
      },
      allday:false,
      //navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용..
      
      // 일정 추가 시
      select: function(arg) {
        console.log("일정 클릭", arg);
        insertDataSet(arg)
	    modalOpen();

      },
      
      // 일정 상세 조회
      eventClick: function(reg) {
    	  // 있는 일정 클릭시,
    	  console.log(reg.event);
    	  // 모달 오픈
    	  dmodalOpen();
    	  // 수정 클릭 했을 때 변경했던 속성들 원래대로
    	  reUpdateValues();
    	  // calNo값 저장되는 부분 :reg.event._def.extendedProps.calNo
    	  var calNo = reg.event._def.extendedProps.calNo
    	  var title = $("#dname_box");
    	  var start = $("#dstart");
    	  var end = $("#dend");
    	  var content = $("#dta");
    	  var inColor = $("#inColor");
		  var color = $("#color");
		  var calNoValue = $("#cal-no");
		 
    	  $.ajax({
    	        type: "get",
    	        url:"/myHaru/mydetailcal",
    	        data:{
    	        	cal_no : calNo
    	        },
    			success: function (res){
    				var endDate = new Date(res.cal_end_ymd);
    				endDate.setDate(endDate.getDate() - 1);
    				var formattedEndDate = endDate.toISOString().slice(0, 10);
    				title.val(res.cal_title),
    				start.val(res.cal_start_ymd),
    				end.val(formattedEndDate),
    				content.val(res.cal_content),
    				inColor.val(res.cal_color),
					color.val(res.cal_color),
					calNoValue.val(calNo)
    			}
          })
    	  
       /*  if (confirm('지우슈?')) {
          arg.event.remove() // 일정 화면에서 지우는 이벤트
        } */
      },
      
      // 드래그앤 드롭
      eventDrop: function (arg) {
    	var calNo = arg.event._def.extendedProps.calNo
    	var start  = arg.event._instance.range.start.toISOString().slice(0,10)
    	var end  = arg.event._instance.range.end.toISOString().slice(0,10)
		$.ajax({
			type:"put",
			url:"/myHaru/mycalmove",
			beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			data: JSON.stringify({
				  ae_id:secName
				, cal_start_ymd : start
				, cal_end_ymd : end
				, cal_no : calNo
			}),
			contentType :"application/json"
			,
			success : function (result) {
			},
			error : function (err){
				console.log(err);
			}
		})
		
      },
      
	// 리사이징
	eventResize: function (arg) {
		var calNo = arg.event._def.extendedProps.calNo
		var start  = arg.event._instance.range.start.toISOString().slice(0,10)
		var end  = arg.event._instance.range.end.toISOString().slice(0,10)
		$.ajax({
			type:"put",
			url:"/myHaru/mycalmove",
			beforeSend : function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			data: JSON.stringify({
					ae_id:secName
				, cal_start_ymd : start
				, cal_end_ymd : end
				, cal_no : calNo
			}),
			contentType :"application/json"
			,
			success : function (result) {
			},
			error : function (err){
				console.log(err);
			}
		})
	},
      editable: true, // 드래그앤 드롭, 리사이징 여부
      dayMaxEvents: true, // allow "more" link when too many events
      
      // 사용자 id 확인 후 해당하는 일정 조회
      events: function (info, successCallback, failureCallback) {
            $.ajax({
                type:"get",
                url:"/myHaru/mycals",
                data:{
                	ae_id:secName
                },
                success: function (res) {
                	var events = [];
                    for(var i =0; i < res.length; i++){
                    	 events.push({
                    		   title : res[i].cal_title
                    		 , start : res[i].cal_start_ymd
                    		 , end   : res[i].cal_end_ymd
                    		 , color : res[i].cal_color
                    		 , calNo : res[i].cal_no
                    	 })
                    }            
                	successCallback(events);
				},
				error: function (ex){
					console.log("에러", ex)
				}
            }) 
    	}
  });
    calendar.render();
    
	// 입력된 날짜에 +1 해주는 함수
    $(document).ready(function() {
    	// #dend가 바뀔때마다 실행
    	$('#dend').change(function () {
			var selectedDate = $(this).val();
			$(this).val(selectedDate);
		})
    	$('#end').change(function () {
			var selectedDate = $(this).val();
			$(this).val(selectedDate);
		})
    });
    function addDays(dateString, days) {
   	  // 입력된 날짜를 JavaScript Date 객체로 변환
   	  var date = new Date(dateString);
   	  
   	  // 값을 더해줄 로직을 구현
   	  date.setDate(date.getDate() + days);
   	  
   	  // 변경된 날짜를 원하는 형식으로 포맷팅
   	  var formattedDate = formatDate(date);
   	  
   	  return formattedDate;
   	}
    
	function formatDate(date) {
		// 날짜를 원하는 형식으로 포맷팅
		var year = date.getFullYear();
		var month = padZero(date.getMonth() + 1);
		var day = padZero(date.getDate());
		
		return year + '-' + month + '-' + day;
	}
	function padZero(num) {
	  // 한 자리 숫자 앞에 0을 추가하여 두 자리로 만들어줌
	  return (num < 10 ? '0' : '') + num;
	}
    
    //수정 눌렀을때 속성 변경
	function updateValues() {
		$("#dstart").removeAttr('readonly');
		$("#dend").removeAttr('readonly');
		$("#dname_box").removeAttr('readonly');
		$("#dta").removeAttr('readonly');
		$("#dstart").removeAttr('readonly');
		$("#tomodify_btn").attr('hidden', true);
		$("#delete_btn").attr('hidden', true);
		$("#inColor").attr('hidden', true);
		$(".color").attr('hidden', false);
		$("#modify_btn").attr('hidden', false);
	}
    // 변경된 속성 원래대로
	function reUpdateValues() {
		$("#dstart").attr('readonly', true);
		$("#dend").attr('readonly', true);
		$("#dname_box").attr('readonly', true);
		$("#dta").attr('readonly', true);
		$("#dstart").attr('readonly', true);
		$("#tomodify_btn").attr('hidden', false);
		$("#delete_btn").attr('hidden', false);
		$("#inColor").attr('hidden', false);
		$(".color").attr('hidden', true);
		$("#modify_btn").attr('hidden', true);
	}
	//  작성 모달 오픈
	function modalOpen() {
		document.body.style.overflowY = "hidden";
		var endDate = new Date($("#end").val());
		endDate.setDate(endDate.getDate() - 1);
		var formattedEndDate = endDate.toISOString().slice(0, 10);
		$("#end").val(formattedEndDate);
		
		console.log('전 ' + endDateTemp + " 후" + $("#end").val())
		modal.css("display", "block");
	}
	
	// 상세보기 모달 오픈
	function dmodalOpen() {
		dmodal.css("display", "block");
		document.body.style.overflowY = "hidden";
	}
	
	// 모달 클로즈
	function modalClose() {
		document.body.style.overflowY = "visible";
		modal.css("display", "none");
		dmodal.css("display", "none");
	}
	
  // 일정 범위 선택 후 데이터 입력 전에
  //  start, end 값 받아오고, 이전에 입력 후 취소 눌렀던 값 지워주기
	function insertDataSet(arg) {
	  title = $("#name_box").val("");
   	  content = $("#ta").val("");
 	  color = $("#dcolor").val(null);
	  start = $("#start").val(arg.startStr);
	  end = $("#end").val(arg.endStr);
	  
	}
	
  // 일정 등록
	function insertCal(arg) {
		var title = $("#name_box").val();
		var content = $("#ta").val();
		var start = $("#start").val();
		var end = $("#end").val();
		var color = $("#dcolor").val();
		var nextDay = addDays(end, 1);
		if(title.trim() == ""){
			alert("일정을 입력해주세요");
			return false;
		}
		if(content.trim() == ""){
			alert("내용을 입력을 입력해주세요");
			return false;
		}
		if(color == null){
			alert("색상을 선택해주세요");
			return false;
		}
		if(start > end){
			alert("종료일을 시작일 이후로 설정해주세요")
			return false;
		}
		Swal.fire({
			title: '등록하시겠습니까?',
			text: '',
			icon: 'warning',
			
			showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			confirmButtonText: '승인', // confirm 버튼 텍스트 지정
			cancelButtonText: '취소', // cancel 버튼 텍스트 지정
			
			reverseButtons: false, // 버튼 순서 거꾸로
			
			}).then(result => {
				if (result.isConfirmed) {
						$.ajax({
						type:"post",
						url:"/myHaru/mycal",
						beforeSend : function(xhr){
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						data:{
							ae_id:secName
							, cal_title : title
							, cal_content : content
							, cal_start_ymd : start
							, cal_end_ymd : nextDay
							, cal_color : color
						},
						success: function (result) {
							calendar.refetchEvents();
							if(result == "OK"){
								Swal.fire('일정등록이 완료되었습니다.', '', 'success');
							}
							modalClose();
						},
						error : function (err){
							console.log(err);
						}
					})
				}
			})
	}
    // 일정 업데이트
	function updateCal() {
		var title = $("#dname_box").val();
		var content = $("#dta").val();
		var start = $("#dstart").val();
		var end = $("#dend").val();
		var color = $("#color").val();
		var calNo = $("#cal-no").val();
	  if(title.trim() == ""){
		  alert("일정을 입력해주세요");
		  title.focus();
		  return false; 
	  }
	  if(content.trim() == ""){
		  alert("내용을 입력을 입력해주세요");
		  content.focus();
		  return false;
	  }
	  if(color == null){
		  alert("색상을 선택해주세요");
		  color.focus();
		  return false;
	  }
	  if(start > end){
		  alert("종료일을 시작일 이후로 설정해주세요")
		  end.focus();
		  return false;
	  }
	  callUpdateAjax();
	}
    // 업데이트 ajax
    function callUpdateAjax() {
		Swal.fire({
			title: '정말로 수정하시겠습니까?',
			text: '',
			icon: 'warning',
			
			showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			confirmButtonText: '승인', // confirm 버튼 텍스트 지정
			cancelButtonText: '취소', // cancel 버튼 텍스트 지정
			
			reverseButtons: false, // 버튼 순서 거꾸로
			
		}).then(result => {
			if (result.isConfirmed) {
				var title = $("#dname_box").val();
				var content = $("#dta").val();
				var start = $("#dstart").val();
				var end = $("#dend").val();
				var nextDay = addDays(end, 1);
				var color = $("#color").val();
				var calNo = $("#cal-no").val();
		
				$.ajax({
					type:"put",
					url:"/myHaru/mycal",
					beforeSend : function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					data: JSON.stringify({
						ae_id:secName
						, cal_title : title
						, cal_content : content
						, cal_start_ymd : start
						, cal_end_ymd : nextDay
						, cal_color : color
						, cal_no : calNo
					}),
					contentType :"application/json"
					,
					success : function (result) {
						calendar.refetchEvents();
						if(result == "OK"){
							Swal.fire('수정이 완료되었습니다.', '', 'success');
						}
						modalClose();
					},
					error : function (err){
						console.log(err);
					}
				})
			}
		})
	}
    // 일정삭제
    function deleteCal() {
		Swal.fire({
			title: '정말로 삭제하시겠습니까?',
			text: '',
			icon: 'warning',
			
			showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
			confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			confirmButtonText: '확인', // confirm 버튼 텍스트 지정
			cancelButtonText: '취소', // cancel 버튼 텍스트 지정
			
			reverseButtons: false, // 버튼 순서 거꾸로
			
		}).then(result => {
			if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
     			 Swal.fire('삭제가 완료되었습니다.', '', 'success');
				var calNo = $("#cal-no").val();
				console.log(calNo)
				$.ajax({
					type:"delete",
					url:"/myHaru/mycal/"+calNo,
					beforeSend : function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					contentType :"application/json"
					,
					success : function (result) {
						calendar.refetchEvents();
						if(result == "OK"){
						}
						modalClose();
					},
					error : function (err){
						console.log(err);
					}
				})
			}
		});
	}

});
</script>
