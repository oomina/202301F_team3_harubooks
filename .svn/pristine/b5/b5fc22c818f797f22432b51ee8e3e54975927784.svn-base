<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/resources/assets/css/bookDetail.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
     integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/assets/css/myPage.css">
<link rel="stylesheet" href="/resources/assets/css/prod-order.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<meta name="_csrf_header" id="_csrf_header" content="${_csrf.headerName}">
<meta name="_csrf" id="_csrf" content="${_csrf.token }"/>
<style>
#result{
	display:inline;
	color : #33b052;
	font-size: 18px; 
	font-weight: bold;
}
#i1{
	float: left;
	width : 100px;
	height : 154px;
}
#d1{
	float:right;
}
#tr1{
	padding-left : 370px;
	font-size : 18px;
	font-family: 'Orbit', sans-serif;
	padding-top: 230px;
}
#d2{
	margin-bottom: 148px;
	margin-right: 25px;
	margin-top : 10px;
	
}
#d3{
	margin-right : 6px;
	float :right;
	display: inline-block;
}
#d4{
	margin-top : 6px;
	float :right;
	display: inline-block;
}
#d5{
	margin-left : 20px;
}
#delwishBtn{
	border: none; 
	background-color: transparent;
}
#dvi{
	margin-left: 20px;
	margin-top : 28px;
}
#s1{
	border-bottom : 1px solid lightgray;
	padding-bottom: 20px;
}
#s2{
	float: right;
	
}
#style1{
	margin-top: 10px;
}
#sp1{
	color : #33b052;
	font-size: 18px; 
	font-weight: bold; 
	font-family: 'Noto Sans KR', sans-serif;
	display: inline;
}
#ib1{
	border : none;
	background: #2E64FE;
	color : white;
	border-radius: 5px;
	font-size: 15px;
	font-family: 'Noto Sans KR', sans-serif;
	
}
#ib2{
	border: none;
	background: #FE9A2E;
	color : white;
	border-radius: 5px;
	font-size: 15px;
	font-family: 'Noto Sans KR', sans-serif;
}
#title{
	font-weight: bold;
	font-size: 18px;
	font-family: 'Noto Sans KR', sans-serif;
}
#middleTitle{
	font-size: 15px;
	font-family: 'Noto Sans KR', sans-serif;
	color : gray;
}
#bPrice{
	font-size : 14px;
	font-weight: bold;
	color : black;
}
</style>
</head>
<body>

	<div id="container">
		<div id="sidebar">
			<div>
				<p style="font-weight: bold;font-size: 24px;">마이페이지</p>
			</div>
			<div id="myInfo">
				<div class="info" style="display: flex; flex-direction: column;">
					<div style="display: flex;margin: 0 auto; flex-direction: column;">
						<p style="font-size: 18px;color: white;margin: 5px;font-weight: bold;">${userInfo.user_nm }님</p>
						<div style="background-color: #3cb454;height: 24px;border-radius: 15px;"><p style="margin-bottom: 0px;color: white;text-align: center;font-weight: bold;">${userInfo.rank_name }</p></div>
					</div>
					<div id="info-1" style="display: flex;flex-direction: column;width: 90%;margin: 0 auto;margin-top: 20px;">
						<div style="display: flex;justify-content: space-between;align-items: center;">
							<p style="font-size: 13px;color: white;">보유 마일리지</p><p style="font-size: 15px;color: white;font-weight: bold;">${userInfo.mbr_mileage }P</p>
						</div>
						<div style="display: flex;justify-content: space-between;align-items: center;">
							<p style="font-size: 13px;color: white;">찜 목록</p><p style="font-size: 15px;color: white;font-weight: bold;">${wishCnt }개</p>
						</div>
						<div style="display: flex;justify-content: space-between;align-items: center;">
							<p style="font-size: 13px;color: white;">장바구니</p><p style="font-size: 15px;color: white;font-weight: bold;">${cartCnt }개</p>
						</div>
					</div>
				</div>
			</div>
			<div id="category">
				<div class="categoryInfo">
					<p>쇼핑내역</p>
					<a href="/harubooks/myPage/orderList?status=order">주문/배송목록</a>
					<a href="/harubooks/myPage/orderList?status=complete" >구매확정목록</a>
					<a href="/harubooks/myPage/orderList?status=refund">환불내역</a>
					<a href="/wish/list" >찜 목록</a>
					<a href="/harubooks/myCart">장바구니 목록</a>
				</div>
				<div class="categoryInfo">
					<p>문의 내역</p>
					<a href="/inquiry/list" >1:1문의</a>
				</div>
				<div class="categoryInfo">
					<p>나의 정보</p>
					<a href="/mypage/agree" >내 정보 수정</a>
				</div>
			</div>
		</div>
		<div id="content">
			<div>
				<p style="font-size: 18px;font-weight: bold;">찜 목록</p>
			</div>
			<div id="prodInfo">
			<div id="style1">
				<p style="font-size: 18px; font-weight: bold; margin-bottom: -10px;">나의 찜 목록</p>
			</div>
			<div id="inquiryDetail">
					<div style="display: flex; flex-direction: column;">
						<p style="font-size: 28px; font-weight: bold; font-family: 'Noto Sans KR', sans-serif;" class="semi-title">찜 목록 조회</p>
					</div>
<div id="s1">
<input type="checkbox" id="allCheck" name="allCheck" onclick="selectAll(this)"/> <div id="sp1">&nbsp;&nbsp;찜한 상품</div>&nbsp;&nbsp;<div id="result"></div>
<div id="s2">
<input id="ib2" type="button" value="장바구니 담기" onclick="insertValue();">
<input id="ib1" type="button" value="찜 삭제" onclick="deleteValue();">
</div>
</div>
           <!-- Mockup Block -->
         <table>
			<c:set value="${wishList }" var="wishList"/>
			
			<c:choose>
				<c:when test="${empty wishList }">
			<tr>
				<td id="tr1" colspan="5">찜한 상품이 존재하지 않습니다.</td>
			</tr>
				</c:when>

				<c:otherwise>
					<c:forEach items="${wishList }" var="wish" varStatus="status">
						
                      <tr style="border-bottom: 1px solid lightgray;">
                      <td><div id="d2"><input type="checkbox" name="book" id="book" value="${wish.book_no}" onclick="getCheckedCnt()"/></div></td>
                      <td><img id="i1" src="${wish.book_cover }"></td>
                      <td style="width : 900px; padding-bottom: 45px;">
                      <div id="dvi">
                      <div id="title">${wish.book_title }</div>
                      <div id="d3">
                      <a href="#" style="margin-right: 20px;" class="text-uppercase text-dark h-dark font-weight-medium mr-auto addToCartBtn" data-toggle="tooltip" data-placement="right" data-index="${status.index }">
                           <img style="width:25px; height:25px;" src="/resources/assets/img/shopping-bag.png">
                       </a>
                       </div><br/>
                       
                       <div id="middleTitle">${wish.ccg_b003 }·${wish.book_author }</div>
                       <div id="d4">
                       <form action="/wish/delete?bookNo=${wish.book_no }" id="wishBtn" method="post">
						<button type="submit" id="delwishBtn">
							<img style="width:23px; height:23px;" src="/resources/assets/img/heart.png">
						</button>
						
						<input type="hidden" name="book_no" value="${wish.book_no}" id="bookNo${status.index }"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" name="ae_id" value="${userId}" id="secId">
						<input type="hidden" name="book_ntsl_amt" value="${wish.book_ntsl_amt}" id="price${status.index }"/> <!-- 페이퍼북/amt 원 -->
						<input type="hidden" name="price1" value="${wish.book_ntsl_amt}" id="price1"/> <!-- 페이퍼북/amt 원 -->
						<input type="hidden" name="book_cover" value="${wish.book_cover}" id="bookCover${status.index}"/> <!-- 북스/bookcover -->
						<input type="hidden" name="ccg_b002" value="${wish.ccg_b002}" id="ccg_b002${status.index }"/> <!-- 수량. cartVO.cart_cnt-->
						<input type="hidden" name="ccg_b002" value="${wish.ccg_b002}" id="ccgb002"/> <!-- 수량. cartVO.cart_cnt-->
						<input type="hidden" value="${wish.ccg_b001}" id="ccg_b001${status.index }"/> <!-- 수량. cartVO.cart_cnt-->
					  <sec:csrfInput/>
						</form>
						</div><br/>
                      	<div>
                      	<div id="bPrice">${wish.book_amt }원</div>
                      	</div>
                      	</div>
                      	</td>                                         
                      </tr>

						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
			</div>
			</div>
		</div>
	</div>
	
	
	
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function selectAll(selectAll) {
	  const checkboxes = document.querySelectorAll('input[name="book"]');
	  
	  checkboxes.forEach(function(checkbox) {
	    checkbox.checked = selectAll.checked;
	  });
	  
	  getCheckedCnt(); // 선택된 체크박스의 개수 업데이트
	}

	function getCheckedCnt() {
	  const checkboxes = document.querySelectorAll('input[name="book"]');
	  const checkbox = document.querySelector('input[name="book"]');
	  const selectedElements = document.querySelectorAll('input[name="book"]:checked');
	  const selectedElementsCnt = selectedElements.length;
	  const resultElement = document.getElementById('result');
	  
	  // console.log(checkbox);
	  
	  resultElement.innerText = selectedElementsCnt + ' / ' + checkboxes.length;
	} 

	// 페이지가 로드될 때 getCheckedCnt() 함수 호출
	window.addEventListener('DOMContentLoaded', getCheckedCnt);
	
	
	var delwishBtn = document.querySelectorAll("#delwishBtn");
	var wishBtn = document.querySelector("#wishBtn");
	var delBtn = document.querySelector("#delBtn");
    
	
	delwishBtn.forEach(function(btn) {
		  btn.addEventListener('click', function(event) {
			 event.preventDefault();
		    console.log("버튼 : " + btn);
		    Swal.fire({
		      title: '찜을 삭제하시겠습니까?',
		      icon: 'question',
		      showDenyButton: true,
		      confirmButtonText: '네',
		      denyButtonText: '아니요',
		    }).then((result) => {
		      if (result.isConfirmed) {
		        Swal.fire({
		          title: '찜이 삭제되었습니다.',
		          icon: 'success'
		        }).then((result) => {
		          wishBtn.submit();
		        });
		      } else {
		        Swal.fire({
		          title: '찜 삭제가 취소되었습니다.',
		          icon: 'warning'
		        });
		      }
		    });
		  });
		});

	$(function() {
	  var chkObj = document.getElementsByName("book");
	  var rowCnt = chkObj.length;

	  $("input[name='allCheck']").click(function() {
	    var chk_listArr = $("input[name='book']");
	    for (var i = 0; i < chk_listArr.length; i++) {
	      chk_listArr[i].checked = this.checked;
	    }
	  });

	  $("input[name='book']").click(function() {
	    if ($("input[name='book']:checked").length == rowCnt) {
	      $("input[name='allCheck']")[0].checked = true;
	    } else {
	      $("input[name='allCheck']")[0].checked = false;
	    }
	  });
	});
	
	function insertValue() {
		  var url = "/wish/insert";
		  var valueArr = new Array();
		  var token = $("meta[name='_csrf']").attr("content");
		  var header = $("meta[name='_csrf_header']").attr("content");
		  let secId = document.querySelector("#secId").value;
		  let price = document.querySelector("#price1").value;
		  let ccg_b002 = document.querySelector("#ccgb002").value;
		  var list = $("input[name='book']");

		  for (var i = 0; i < list.length; i++) {
		    if (list[i].checked) {
		      valueArr.push(list[i].value);
		    }
		  }

		  if (valueArr.length === 0) {
		    Swal.fire({
		      icon: "warning",
		      title: "선택된 찜이 없습니다."
		    });
		  } else {
		    Swal.fire({
		      title: "찜을 삭제하시겠습니까?",
		      icon: 'question',
		      showDenyButton: true,
		      confirmButtonText: '네',
		      denyButtonText: '아니요',
		    }).then((result) => {
		      if (result.isConfirmed) {
		        $.ajax({
		          url: url,
		          type: "POST",
		          traditional: true,
		          data: {
		            valueArr: valueArr,
		            "cart_cnt": "1",
		            "ae_id": secId,
		            "total_price": price,
		            "ccg_b002": ccg_b002
		          },
		          beforeSend: function (xhr) {
		            xhr.setRequestHeader(header, token);
		          },
		          success: function (jdata) {
		            if (jdata = 1) {
		              Swal.fire({
		                icon: 'success',
		                title: '장바구니에 추가 되었습니다!',
		              }).then(() => {
		                window.location.href = "/wish/list"; // 장바구니 추가 완료 후 이동
		              });
		            } else {
		              Swal.fire({
		                icon: 'error',
		                title: '서버 에러! 다시 작성해주세요',
		              });
		              return false;
		            }
		          },
		        });
		      }
		    });
		  }
		}

	function deleteValue() {
		  var url = "/wish/delete2";
		  var valueArr = new Array();
		  var token = $("meta[name='_csrf']").attr("content");
		  var header = $("meta[name='_csrf_header']").attr("content");
		  let secId = document.querySelector('#secId').value;
		  var list = $("input[name='book']");
		  
		  for (var i = 0; i < list.length; i++) {
		    if (list[i].checked) {
		      valueArr.push(list[i].value);
		    }
		  }

		  if (valueArr.length === 0) {
		    Swal.fire({
		      icon: "warning",
		      title: "선택된 찜이 없습니다."
		    });
		  } else {
		    Swal.fire({
		      title: "찜을 삭제하시겠습니까?",
		      icon: 'question',
		      showDenyButton: true,
		      confirmButtonText: '네',
		      denyButtonText: '아니요',
		    }).then((result) => {
		      if (result.isConfirmed) {
		        $.ajax({
		          url: url,
		          type: 'POST',
		          traditional: true,
		          data: {
		            valueArr: valueArr,
		            "ae_id": secId
		          },
		          beforeSend: function (xhr) {
		            xhr.setRequestHeader(header, token);
		          },
		          success: function (jdata) {
		            if (jdata = 1) {
		              Swal.fire({
		                icon: 'success',
		                title: '찜이 삭제 되었습니다!',
		              }).then(() => {
		                window.location.href = "/wish/list"; // 찜 삭제 완료후 이동
		              });
		            } else {
		              Swal.fire({
		                icon: 'error',
		                title: '서버 에러! 다시 작성해주세요',
		              });
		              return false;
		            }
		          },
		        });
		      }
		    });
		  }
		}
	
	// 장바구니 추가 클릭시 이벤트
    let secId = document.querySelector("#secId").value;
    let basketList = document.querySelectorAll(".addToCartBtn");
    basketList.forEach(function(item){
    	item.addEventListener('click', function () {
	        	let index = item.getAttribute("data-index");
	        	let bookNo = document.querySelector("#bookNo"+index).value;
	        	let price = document.querySelector("#price"+index).value;
	        	console.log(secId)
	        	console.log(bookNo)
	        	console.log(price)
	                if (secId == 'anonymousUser') {
	                    Swal.fire({
	                        title: '장바구니추가는 로그인이 필요합니다',
	                        text: '로그인 하시겠습니까?',
	                        icon: 'question',
	                        iconHtml: '!',
	                        confirmButtonText: '네',
	                        cancelButtonText: '아니요',
	                        showCancelButton: true,
	                        showCloseButton: true
	                    }).then(function (result) {
	                        if (result.isConfirmed) {
	                            // '네' 버튼을 클릭한 경우
	                            window.location.href = '/login/signinForm'; // 장바구니 페이지로 이동
	                        } else {
	                            return false;
	                        }
	                    });
	                }else{
		                Swal.fire({
		                    title: '장바구니에 추가하시겠습니까?',
		                    icon: 'question',
		                    iconHtml: '?',
		                    confirmButtonText: '네',
		                    cancelButtonText: '아니요',
		                    showCancelButton: true,
		                    showCloseButton: true
		                }).then(function (result) {
		                    if (result.isConfirmed) {
		                        // '네' 버튼을 클릭한 경우
		                        let info = {
		                            "cart_cnt": "1",    // 수량
		                            "totalPrice": price,
		                            "book_no": bookNo,
		                            "ae_id" : secId
		                        };
		                        let xhr = new XMLHttpRequest();
		                        xhr.open("post", "/wish/basketList",true);
		                        xhr.setRequestHeader("Content-Type", "application/json;charset=utf-8");
		                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		                        xhr.onreadystatechange = function () {
		                            if (xhr.readyState == 4 && xhr.status == 200) {
		                            	const swalWithBootstrapButtons = Swal.mixin({
		                                    customClass: {
		                                        confirmButton: 'btn btn-success',
		                                        cancelButton: 'btn btn-danger'
		                                    },
		                                    buttonsStyling: false
		                                })
		                                let res = xhr.responseText;
		                                if (res == 'OK') {
		                                	
		                                    Swal.fire({
		                                        title: '장바구니에 추가되었습니다!',
		                                        text: '장바구니로 이동 하시겠습니까?',
		                                        icon: 'success',
		                                        confirmButtonText: '장바구니로 이동',
		                                        cancelButtonText: '아니요',
		                                        showCancelButton: true,
		                                        showCloseButton: true
		                                    }).then(function (result) {
		                                        if (result.isConfirmed) {
		                                            // '네' 버튼을 클릭한 경우
		                                            window.location.href = '/harubooks/myCart'; // 장바구니 페이지로 이동
		                                        } else {
		                                        	window.location.href = '/wish/list';
		                                            return false;
		                                        }
		                                    });
		                                } else if (res == 'EXIST') {
		                                    swalWithBootstrapButtons.fire(
		                                            '이미 장바구니에 존재합니다',
		                                            '',
		                                            'error'
		                                    )
		                                } else {
		                                    return false;
		                                }
		                            }
		                        }
		                        xhr.send(JSON.stringify(info));
		                    } else {
		                        return false;
		                    }
		                });	
	                }     
	            })	
    })
    
    let recent = JSON.parse(localStorage.getItem('recent')) || [];
        let prodItem = document.querySelectorAll('.prodItem');
        prodItem.forEach(function(item){
            item.addEventListener('click',function(){
                let index = item.getAttribute("data-index");
                let bookNo = document.querySelector("#bookNo"+index).value;
    	        let price = document.querySelector("#price"+index).value;
                let bookCover = document.querySelector("#bookCover"+index).value;
                let bookTitle = document.querySelector("#bookTitle"+index).value;
                let ccg_b002 = document.querySelector("#ccg_b002"+index).value;
                let ccg_b001 = document.querySelector("#ccg_b001"+index).value;
               
                recent.push({"bookCover":bookCover,
                             "price":price,
                             "bookTitle":bookTitle,
                             "ccg_b002":ccg_b002,
                             "ccg_b001":ccg_b001,
                             "bookNo" : bookNo});
                if (recent.length > 3) {
                    recent.splice(0, recent.length - 3);
                }
                localStorage.setItem("recent",JSON.stringify(recent));
            })
        })
        let recentList = '';
        recent.forEach((product) => {
        		let wonPrice = parseInt(product.price).toLocaleString('ko-KR');
                recentList += `<div class="mb-5">`;
                recentList += `<div class="media d-md-flex">`;
                recentList += '<a class="d-block" href="/harubooks/detailBook?bookNo='+product.bookNo+'&ccg_b002='+product.ccg_b002+'">';
                recentList += `<img class="img-fluid" src="\${product.bookCover}" alt="Image-Description" style="width:60px;heigth:92;">`;
                recentList += `</a>`;
                recentList += `<div class="media-body ml-3 pl-1">`;
                recentList += `<h6 class="font-size-2 text-lh-md font-weight-normal">`;
                recentList += `<a href="/harubooks/detailBook?bookNo=\${product.bookNo}&ccg_b002=\${product.ccg_b002}">\${product.bookTitle}</a>`;
                recentList += `</h6>`;
                recentList += ` <span class="font-weight-medium">\${wonPrice}원</span>`;
                recentList += `</div>`;
                recentList += `</div>`;
                recentList += `</div>`;
                document.querySelector('#widgetCollapse25').innerHTML = recentList;
        });
    
</script>
</body>