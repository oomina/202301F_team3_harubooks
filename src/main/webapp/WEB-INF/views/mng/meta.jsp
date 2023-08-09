<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
div#div-header{
	display: flex;
	justify-content: space-between;
}
div#searchMeta{
	margin-bottom: 13px;
    margin-right: 4%;
}
div.col-lg-2{
    flex: 35%;
    max-width: 35%;
}
div.col-lg-10{
    flex: 65%;
    max-width: 65%;
    margin-top: 17px;
}
</style>
<div class="content-wrapper" style="padding : 10px;">
	<div class="row" style=" padding : 10px;">
		<div class="col-lg-12 grid-margin stretch-card" >
			<div class="card">
			    <div class="card-body">
			        <div class="card-title-wrapper" style="margin-left:32px">
			        
					    <h4 class="card-title" style="font-size:1.25rem; font-family: 'orbit', sans-serif;">작가와의 만남</h4>
					    <div id="div-header">
						    <div class="card-description">전체4건</div>
	               			<div id="searchMeta" >
		                    	<div class="row dropdown" style="float:right;">
                                    <select style="width: 100px; border: 1px solid #CED4DA;">
                                        <option value="year">년</option>
                                        <option value="month">월</option>
                                        <option value="title">이름</option>
                                    </select>
		                        	<ul class="navbar-nav mr-lg-2">
							          <li class="nav-item nav-search d-none d-lg-block">
							            <div class="input-group">
							              <input type="text" class="form-control" id="navbar-search-input" placeholder="검색" aria-label="search" aria-describedby="search">
							              <div class="input-group-prepend hover-cursor" id="navbar-search-icon">
							                <span class="input-group-text" id="search">
							                  <i class="icon-search"></i>
							                </span>
							              </div>
							            </div>
							          </li>
							        </ul>
		                      	</div>
		                    </div>	
					    </div>
				    </div>
				    <div class="table-responsive">
                        <table class="table table-bordered" style="width : 1035px; margin : auto;">
                               <tr>
                                   <th style="padding : 5px;">
                                   	<div id="div-head">
	                                   	<div>
	                                    	<ul class="nav nav-tabs">
	                                    		<li class="nav-item ">
											    	<a class="nav-link ing active" href="#" onclick="fprgevt()">진행중인 이벤트</a>
											 	</li>
											  	<li class="nav-item">
											   		<a class="nav-link end" href="#" onclick="fendevt()">종료된 이벤트</a>
											  	</li>
											</ul> 
	                                   	</div>
                                   	</div>
                                   </th>
                               </tr>
                               <tr id="prgevt">
                                   <td>
                                       <div style="display : flex;">
                                           <div class="col-lg-2">
                                               <img src="/resources/asset/image/406_author.png" alt="이미지" style="width:100%; height:100%; border-radius: 0%;"/>
                                           </div>
                                           <div class="col-lg-10">
                                               <p>406호와 함께하는 랜선 만남</p>
                                               <p>작가 : 406호 작가들</p>
                                               <p>일시 : 2023-01-02 09:00 ~ 2023-08-17 18:00</p>
                                               <p>참여인원 : 28명</p>
                                               <p>406호</p>
                                           </div>
                                       </div>
                                   </td>
                               </tr>
                               <tr class="endevt" style="display : none;">
                                   <td>
                                       <div style="display : flex;">
                                           <div class="col-lg-2">
                                               <img src="https://post-phinf.pstatic.net/MjAyMTExMDlfMTMz/MDAxNjM2NDE5MTE1MzAz.NC9PF4nkG0pc6qKfLo8WvvCDorr9A19A2C-lM_jDpVog.bBNgUqhROZ5l4Ywe2d9cunMyzN6TdvId8w4-5YiVTf0g.JPEG/%EB%B2%A0%EB%A5%B4%EB%82%98%EB%A5%B4%EB%B2%A0%EB%A5%B4%EB%B2%A0%EB%A5%B4_750x4202x.jpg?type=w1200" alt="이미지" style="width:100%; height:100%; border-radius: 0%;"/>
                                           </div>
                                           <div class="col-lg-10">
                                               <p>베르나르베르베르와 함께하는 랜선 팬사인회</p>
                                               <p>작가 : 베르나르베르베르</p>
                                               <p>일시 : 2023-07-07 19:00 ~ 20:00</p>
                                               <p>참여인원 : 30명</p>
                                               <p>한국인이 사랑하는 프랑스 작가와 팬사인회!!</p>
                                           </div>
                                       </div>
                                   </td>
                               </tr>
                               <tr class="endevt" style="display : none;">
                                   <td>
                                       <div style="display : flex;">
                                           <div class="col-lg-2">
                                               <img src="https://post-phinf.pstatic.net/MjAyMTExMjZfMjA2/MDAxNjM3ODg4ODEyODE5.D-zPtD2dusXFEKwY2baNRf6aJypoEp09kP1PBDpEr7Eg.lEV5ouYT1RG6RQ75orLwciXumYt5VPqB1hHsp-GjPncg.JPEG/%ED%9E%88%EA%B0%80%EC%8B%9C%EB%85%B8_%EA%B2%8C%EC%9D%B4%EA%B3%A0_750x4202x.jpg?type=w1200" alt="이미지" style="width:100%; height:100%; border-radius: 0%;"/>
                                           </div>
                                           <div class="col-lg-10">
                                               <p>히가시노 게이고와 함께하는 랜선 팬사인회</p>
                                               <p>작가 : 히가시노 게이고</p>
                                               <p>일시 : 2023-07-13 12:00 ~ 15:00</p>
                                               <p>참여인원 : 30명</p>
                                               <p>일본추리소설의 대가와 함께하는 팬사인회!!</p>
                                           </div>
                                       </div>
                                   </td>
                               </tr>
                               <tr class="endevt" style="display : none;">
                                   <td>
                                       <div style="display : flex;">
                                           <div class="col-lg-2">
                                               <img src="https://post-phinf.pstatic.net/MjAyMTExMTZfMjMx/MDAxNjM3MDI1NDgwMDQ1.9gsZ-b18-DWsrdx_UqWUQ8VIKOvofku_515MfweM_Wwg.T1XzWli-VbeLdUe1DtmLBpCn7_6gL2hBM6RdMtG4xdMg.JPEG/%EA%B8%B0%EC%9A%A4_%EB%AE%88%EC%86%8C_750x4202x.jpg?type=w1200" alt="이미지" style="width:100%; height:100%; border-radius: 0%;"/>
                                           </div>
                                           <div class="col-lg-10">
                                               <p>기욤 뮈소와 함께하는 미소 가득한 랜선 팬사인회</p>
                                               <p>작가 : 기욤 뮈소</p>
                                               <p>일시 : 2023-07-20 13:00 ~ 17:00</p>
                                               <p>참여인원 : 30명</p>
                                               <p>프랑스를 대표하는 작가 뮈소의 팬사인회!!</p>
                                           </div>
                                       </div>
                                   </td>
                               </tr>
                        </table>
                    </div>
	            </div>
                <div class="row" style="padding-left : 30px; margin-bottom : 20px;">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#metaForm" id="metaBtn">등록</button>
                </div>
		    </div>
	    </div>
    </div>
</div>
<!-- Button trigger modal 
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
    Launch demo modal
  </button> -->
  <!-- 사이즈 조정...???-->
  <!-- Modal -->
  <div class="modal fade" tabindex="-1" id="metaForm" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" >
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="">작가와의 만남 등록</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button><!--x버튼-->
        </div>
        <div class="modal-body">
            <div style="display : flex;">
                <div class="col-lg-2">
                    <img src="/resources/mng/images/harubookslogo1.png" alt="이미지" style="width:100%; height:100%; border-radius: 0%;"/>
                </div>
                <div class="col-lg-10">
                    <p>베르나르베르베르와 함께하는 랜선 팬사인회</p>
                    <p>작가 : 베르나르베르베르</p>
                    <p>일시 : 2023-07-07 19:00 ~ 20:00</p>
                    <p>참여인원 : 30명</p>
                    <p>한국인이 사랑하는 프랑스 작가와 팬사인회!!</p>
                </div>
            </div>    
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary">등록</button>
          <button type="button" class="btn btn-outline-primary" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div>
<script>
	const prgevt = document.querySelector("#prgevt");         // 진행중인 이벤트
    const searchMeta = document.querySelector("#searchMeta"); // 검색창   
    const endevt = document.querySelectorAll(".endevt");         // 종료된 이벤트
    const endevts = document.querySelectorAll(".endevt");         // 종료된 이벤트
    const aTag = document.querySelectorAll(".nav-link");	// 이벤트 탭
    const metaBtn = document.querySelector("#metaBtn");     // metaBtn
	const ing = document.querySelector(".ing");
	const end = document.querySelector(".end");
	
	function fprgevt(){
        event.preventDefault();
        ing.classList.add("active");
		end.classList.remove("active");
        
        /* searchMeta.style.display = 'none'; */
        for (const endevt of endevts){
            endevt.style.display = 'none';
        }
        prgevt.style.display = 'block';
    }
    
    function fendevt(){
        event.preventDefault();
        end.classList.add("active");
        ing.classList.remove("active");
        /* searchMeta.style.display = 'block'; */
        for (const endevt of endevts){
            endevt.style.display = 'block';
        }
        prgevt.style.display = 'none';
    }

    metaBtn.addEventListener("click", function(){
        $(".modal").show();
    });
</script>