<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="/resources/assets/css/myPage.css">
		<link rel="stylesheet" href="/resources/assets/css/prod-order.css">
        <title>Insert title here</title>

    </head>

    <body>
        <div style="display: flex; flex-direction: column;width: 60%; margin: 0 auto;">
            <div style="margin-top: 60px;border-bottom: 1px solid #d5d5d5;">
                <p style="font-size: 24px; font-weight: bold;">공지사항</p>
            </div>
            <div id="noticeContent">

            </div>
        </div>
        <div id="modalWrap"style="display: none;">
        <div id="modalBody" style="width: 60%;" >
        	<div style="width: 100%;">
				<span id="closeBtn">&times;</span>
			</div>
			<div class="table-responsive pt-3">
				<table class="table table-bordered" style="font-size: 0.875rem;">
					<thead>
						<tr>
							<th class="table-primary" style="width: 10%;">번호</th>
							<td id="notice_no"></td>
							<th class="table-primary" style="width: 10%;">작성자</th>
							<td id="ae_id">관리자</td>
							<th class="table-primary" style="width: 10%;">작성일</th>
							<td id="notice_writer_ymd"></td>
							<th class="table-primary" style="width: 10%;">조회수</th>
							<td id="notice_inq_cnt"></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th class="table-primary" style="width: 10%;">제목</th>
							<td colspan="7"><input type="text" id="notice_title"
								style="width: 80%;" readonly="readonly"></td>
						</tr>
						<tr>
							<th class="table-primary" style="width: 10%;">내용</th>
							<td colspan="7" style="height: 250px;"><textarea rows="10" readonly="readonly"
									cols="100" id="notice_content"></textarea></td>
						</tr>
						<tr>
							<th class="table-primary" style="width: 10%;">첨부파일</th>
							<td colspan="3" id="ua_no"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
    </body>
    <script>
	let noticeContent = document.querySelector("#noticeContent");

	// 페이지 번호를 클릭하면 공지사항을 가져오는 함수 호출
	function getNoticeList(curPage) {
		noticeListPage(curPage);
	}

	// AJAX로 공지사항 가져오는 함수
	function noticeListPage(curPage) {
		let xhr = new XMLHttpRequest();
		xhr.open("get", "/harubooks/getNotice?curPage="+ curPage, true);
		xhr.setRequestHeader("Content-Type",
				"application/json;charset=utf-8");
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				let res = JSON.parse(xhr.responseText);
				let code = "<table style='width:100%;'>";
				code += "<tr style='height:40px;text-align:center; font-weight:bold;'><td >번호</td><td>제목</td><td>작성일</td><td>조회수</td></tr>";
				for (let i = 0; i < res.noticeList.length; i++) {
					code += `<tr style='height:40px;text-align:center;' class ='noticeTr' data-no=\${res.noticeList[i].notice_no}><td>\${i+1}</td><td>\${res.noticeList[i].notice_title}</td><td>\${res.noticeList[i].notice_writer_ymd}</td><td>\${res.noticeList[i].notice_inq_cnt}</td></tr>`;
				}
				code += "</table><br>";
				code += `<div class="container mt-3" >`;
				code += `<ul class="pagination" style="margin:0px auto;">`;
				code += `<li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>`;
				for (let i = 1; i <= Math.ceil(parseInt(res.noticeCnt) / 10); i++) {
					code += '<li class="page-item currentPage" data-page=' + i + '><a class="page-link">'
							+ i + '</a></li>';
				}
				code += '<li class="page-item" id="qq"><a class="page-link">Next</a></li>';
				code += '</ul>';
				code += '</div>';
				noticeContent.innerHTML = code;

				// 페이지 번호 클릭 이벤트 리스너 등록
				let currentPage = document
						.querySelectorAll(".currentPage");
				for (let i = 0; i < currentPage.length; i++) {
					currentPage[i].addEventListener("click",function() {
						let cPage = currentPage[i].getAttribute("data-page");
						curPage = cPage;
						getNoticeList(curPage); // 페이지 번호 클릭 시 공지사항을 다시 가져오도록 함수 호출
					})
				}

				let noticeTr = document.querySelectorAll('.noticeTr');
				for (let i = 0; i < noticeTr.length; i++) {
					noticeTr[i].addEventListener('click',function() {
						
						let no = noticeTr[i].getAttribute("data-no");
						console.log(no);
						const modal = document.getElementById('modalWrap');
						const closeBtn = document.getElementById('closeBtn');
						document.querySelector("#modalWrap").style.display = "block";
						closeBtn.onclick = function() {
		  					modal.style.display = 'none';
						}
						window.onclick = function(event) {
	  						if (event.target == modal) {
	    						modal.style.display = "none";
	  						}
						}
						let noticeXhr = new XMLHttpRequest();
						let notice_no = document.querySelector('#notice_no');	// 게시판 번호
						let notice_writer_ymd = document.querySelector('#notice_writer_ymd');	// 개시판 작성일자	
						let notice_inq_cnt = document.querySelector('#notice_inq_cnt');	// 조회수
						let notice_title = document.querySelector('#notice_title');	// 제목
						let notice_content = document.querySelector('#notice_content');	// 내용
						let ua_no = document.querySelector('#ua_no');	// 첨부파일
						ua_no.innerHTML="";
						noticeXhr.open("get","/harubooks/noticeDetail?noticeNo="+no,true);
						noticeXhr.setRequestHeader("Content-Type","application/json;charset=utf-8");
						noticeXhr.onreadystatechange = function(){
							if(noticeXhr.readyState == 4 && noticeXhr.status == 200){
								let noticeInfo = JSON.parse(noticeXhr.responseText);
								console.log(noticeInfo);
								notice_content.innerText = noticeInfo.noticeInfo.notice_content;
								notice_no.innerText = no;
								notice_writer_ymd.innerText = noticeInfo.noticeInfo.notice_writer_ymd;
								notice_inq_cnt.innerText = noticeInfo.noticeInfo.notice_inq_cnt;
								notice_title.value = noticeInfo.noticeInfo.notice_title;
								if(noticeInfo.unityFile.ua_no != "0"){
									let aTag = document.createElement("a");
									aTag.innerHTML = noticeInfo.unityFile[0].ua_nm;
									aTag.href = "/upload/files/"+noticeInfo.unityFile[0].ua_stre_nm;
									aTag.download = noticeInfo.unityFile[0].ua_nm;
									ua_no.appendChild(aTag);
									
								}else{
									ua_no.innerText = "첨부된 파일이 없습니다.";
								}
							}
						}
						noticeXhr.send();
				})
			}
			}
		};
		xhr.send();
	}

	// 초기 페이지 로딩 시 공지사항을 가져오는 함수 호출
	getNoticeList(1);
	</script>
    </html>