<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content-wrapper" style="padding : 10px;">
	<div class="row" style=" padding : 10px;">
		<div class="col-lg-12 grid-margin stretch-card">
			<div class="card">
			    <div class="card-body">
				    <div class="card-title-wrapper">
					    <h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">문의내역</h4>
					    <p class="card-description">
                  			전체 <code id="total"></code>건
                 		</p>	
				    </div>
				    <div class="table-responsive" id="tblDisp">
					</div>
			  	</div>
			  	<div id="pagingArea" style="margin-bottom: 20px;"></div>
			</div>
        </div>
	</div>
</div>
<script>
const tblDisp = document.querySelector("#tblDisp");
const pagingArea = document.querySelector("#pagingArea");	// 페이징 div
let page = 1;

$(function(){
	fInquiryList();
	
	pagingArea.addEventListener("click", function(){	
		if(event.target.tagName === "A") {
			event.preventDefault();
			tblDisp.innerHTML = "";
			console.log(event.target.getAttribute("data-page"));
			page = event.target.getAttribute("data-page");

			fInquiryList();
		}
	});
});

function fInquiryList(){
	let xhr = new XMLHttpRequest();
	let tblstr = "";
	xhr.open("GET", "/mng/board/inquiry?page="+page, true);
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			let inquiryList = JSON.parse(xhr.responseText);
			console.log(inquiryList);
			tblDisp.innerHTML = "";
			tblstr +='<table class="table table-hover">';
			tblstr +="		<thead>";
			tblstr +='          <tr class="table-primary">';
            tblstr +="              <th style='width : 5%;'>번호</th>   ";
            tblstr +="              <th style='width : 10%;'>유형</th>   ";
            tblstr +="              <th>제목</th>   ";
            tblstr +="              <th style='width : 15%;' >작성자</th>  ";
            tblstr +="              <th style='width : 10%;'>작성일</th>  ";
            tblstr +="              <th style='width : 10%;'>답변여부</th>";
            tblstr +="          </tr>              ";
			tblstr +="		</thead>               ";
			tblstr +="		<tbody>              ";
			if(inquiryList.dataList == null || inquiryList.totalRecord == 0){
				tblstr +="<tr><td colspan='6'>문의 내역이 존재하지 않습니다.</td></tr>"
			} else {
				for(let i=0; i<inquiryList.dataList.length; i++){
					tblstr += `<tr onclick="fInquiryDetail('\${inquiryList.dataList[i].inquiry_no}')">`;
					tblstr += 	`<td>\${inquiryList.startRow + i}  </td>`; 
					tblstr += 	`<td>\${inquiryList.dataList[i].ccg_i002}</td>`;
					tblstr += 	`<td>\${inquiryList.dataList[i].inquiry_title}</td>` ;
					tblstr += 	`<td>\${inquiryList.dataList[i].ae_id}</td>`;
					tblstr +=	`<td>\${inquiryList.dataList[i].inquiry_ymd}</td>`;
					if(inquiryList.dataList[i].ccg_i001 == '문의대기'){
						tblstr += `<td><label class="badge badge-warning">\${inquiryList.dataList[i].ccg_i001}</label></td>`;
					} 
					if(inquiryList.dataList[i].ccg_i001 == '문의완료'){
						tblstr += `<td><label class="badge badge-info">\${inquiryList.dataList[i].ccg_i001}</label></td>`;
					}
					tblstr += "</tr>";			
				}	
			}
			tblstr += "</tbody></table>";
			tblDisp.innerHTML = tblstr;
			let total = document.querySelector("#total");
			total.innerText = inquiryList.totalRecord;
			
			pagingArea.innerHTML = inquiryList.pagingHTML;
		}
	}
	xhr.send();
}

function fInquiryDetail(inq_no){
	location.href="/mng/inquiry/" + inq_no;
}
</script>