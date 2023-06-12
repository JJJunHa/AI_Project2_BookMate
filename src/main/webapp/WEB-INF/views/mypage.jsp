<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="css/mypage.css">
    <link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" 

 integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous"> 
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <title>북메이트 | 마이페이지</title>
</head>
<body>

<input value="<%=session.getAttribute("id")%>" hidden>

<!-- 	<div class="container"> -->
<div class="main">
		<div class="logo">
			<a href="/main"><img src="/img/logo.png" class="logoImg"></a>
		</div>

		<div class="menu">
			<a href="/logout">로그아웃</a>&nbsp;|&nbsp;<a href="/cart">장바구니</a>&nbsp;|&nbsp;<a
				href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
		</div>

		<div class="name">지금 어떤 책을 읽어야 할지 고민하는 사용자의 상태에 맞는 책을 추천해주는 서비스</div>
		<div class="category">
			<ul class="category_ul" id="nav">
				<li class="category_li"><a href="/category1">코미디</a></li>
				<li class="category_li"><a href="/category2">로맨스</a></li>
				<li class="category_li"><a href="/category3">판타지</a></li>
				<li class="category_li"><a href="/category4">공포/스릴러/추리</a></li>
				<li class="category_li"><a href="/category5">드라마/가족</a></li>
				<li class="category_li"><a href="/donation">기부앤테이크<i
						class='dropDown'></i></a></li>

				<li class="category_li">
					<div class="search">
						<input type="text" class="searchBox" placeholder="  검색어를 입력하세요">
						<img src="/img/search.png" class="search_img">
					</div>
				</li>
			</ul>
		</div>
		
		<!-- Content -->
		<div class="content">
		
			<div class="container">
				<h1 class="mypage fst-italic">마이페이지</h1>


				<div class="tab-menu">
					<div id="delivery-tab" class="tab-item active"
						onclick="changeTab('delivery')">나의 주문 내역</div>
					<div id="posts-tab" class="tab-item"
						onclick="changeTab('posts')">나의 게시글</div>
					<div id="comments-tab" class="tab-item"
						onclick="changeTab('comments')">나의 댓글</div>
					<div id="donation-tab" class="tab-item"
						onclick="changeTab('donation')">나의 기부내역</div>
					<div id="membership-tab" class="tab-item"
						onclick="changeTab('membership')">나의 정보 변경</div>
				</div>

				<div id="delivery" class="content-container active">
					<div class="delivery-container">
						<h2 class="mytext fst-italic">주문 내역</h2>

						<c:forEach var="mydelis" items="${mydeli}">
						<div class="hi">
						
							<input type=hidden value="${mydelis.order_num}" id="order_num"> 
							
                            <div class="hi2">
                                <span><h4> ${mydelis.order_date} 주문</h4> </span> <!--  order_date  -->
<!--                                  <span>주문/상세보기</span> -->
                                
                            </div>
                            
                            <div class="hi3">
                            
                                <div class="hi4">
                                 
                                    <div class="hi6"> <h4 class="shipcomplete"></h4> <span style="color:green"></span></div>
                                    
                                    <div class="hi7">
                                        <div class="hi8"> <img src="${mydelis.book_cover}" class=img-resize alt="" picname="${mydelis.book_num}"></div>
                                        <div class="hi9">
                                        	<div id="del_pname">&nbsp;&nbsp;${mydelis.book_name}</div>
                                         	<div class="hi10">&nbsp;&nbsp;${mydelis.BPR}원</div>
                                          	<div id="qty1">&nbsp;&nbsp;${mydelis.o_qty}권</div>
                                         	<span class="bag"></span>
                                        </div>                                       
                                    </div>
                                    
                               </div>
                               
                                <div class="hi5">
                                    <div><button class="btn btn-outline-primary" onclick="window.open('https://www.cjlogistics.com/ko/tool/parcel/tracking', '_blank')">배송조회</button></div>
									<div class="bag">
                       				<button id="btncartIn" class="btn btn-outline-secondary" name="${mydelis.book_num},${mydelis.o_qty}">장바구니 담기</button>
                    				</div>
                                    <div><button type="button" class="btn btn-outline-secondary" id="openRev_btn" name="${mydelis.book_num}"></button></div>
                                </div>
                                
                            </div>                   
                        </div>                        	
						</c:forEach>
					</div>
				</div>



				<div id="posts" class="content-container">
					<div class="posts-container">
						<h2 class="mytext fst-italic">게시글</h2>
						<table class="table table-hover" id="tblBoard">
						
							<thead>
								<tr>
									<th>POST ID</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>

						</table>
					</div>
				</div>
				
				
				
				<div id="comments" class="content-container">
					<div class="comments-container">
						<h2 class="mytext fst-italic">댓글</h2>
						<table class="table table-hover" id="tblBoard2">
						
							<thead>
								<tr>
									<th>POST ID</th>
									<th>댓글내용</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							
						</table>
					</div>
				</div>
				
				
				
				<div id="donation" class="content-container">
					<div class="donation-container">
						<h2 class="mytext fst-italic">기부 내역</h2>
						<table class="table table-hover" id="tblBoard3">
							
							<thead>
								<tr>
									<th>DONATION ID</th>
									<th>기부자</th>
									<th>기부 권 수</th>
									<th>기부 방법</th>
									<th>기부일</th>
								</tr>
							</thead>
							
						</table>
					</div>	
				</div>



				<div id="membership" class="content-container">
					<div class="membership-container">
						<h2 class="mytext fst-italic">정보 변경</h2>
						<div class="text">


							<div class="text2">

								<div class="name1">아이디</div>

								<div class="name2">비밀번호</div>

								<div class="name3">비밀번호 확인</div>

								<div class="name4">이름</div>

								<div class="name5">주소</div>

								<div class="name6">휴대전화</div>

								<div class="name7">이메일</div>

								<div class="name8">생년월일</div>




							</div>

							<c:forEach var="my" items="${selectMy}">
								<div class="text3">

									<div class="information">

										<input type="text" readonly id="j_id" name="j_id"
											value="${my.id}" style="width: 200px;">
										<div style="font-size: 12px;">(영문소문자/숫자,4~16자)</div>

										<label id=idGuide style="font-size: 10px"></label>

									</div>

									<div class="information2">

										<input type=password id=j_pwd name=j_pwd value="${my.pwd}"><img src="/img/free-icon-eye-show.jpg" id="showPwd">
										<div style="font-size: 3px;">(영문대소문자/숫자/특수문자,10~16자)</div>

										<label id=psGuide style="font-size: 10px"></label>

									</div>

									<div class="information3">

										<input type=password id=j_pwdcf name=j_pwdcf><img src="/img/free-icon-eye-show.jpg" id="showPwd2"><br>
										<br> <label id=psGuide2 style="font-size: 10px"></label>

									</div>

									<div class="information4">

										<input type=name id=j_name name=j_name value="${my.name}"
											required>

									</div>

									<div class="information5">

										<input type="address" class="address-input" id=zip_code
											name=zip_code placeholder="우편번호" value="${my.zip_code}"
											readonly><input type="button"
											class="btn btn-secondary"
											onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
											style="width: 130px; height: 30px; margin-left: 10px;"><br>

										<br> <input type="address" id=j_address1 name=j_address1
											readonly class="address2-input" placeholder="기본주소"
											value="${showAdr.address1}" required> <br> <br>
										<input type="address" id=j_address2 name=j_address2
											class="address2-input" placeholder="상세주소"
											value="${showAdr.address2}" required>

									</div>

									<div class="information6">

										<input type="tel" id=j_fisrtphone name=j_firstphone
											style="width: 80px;" value="${showMob.mobile1}"> </select> - <input
											type="tel" id=j_midphone name=j_midphone
											class="general-number" value="${showMob.mobile2}" required>
										- <input type="tel" id=j_lastphone name=j_lastphone
											class="general-number" value="${showMob.mobile3}" required>

									</div>

									<div class="information7">

										<input type="email" id=j_email name=j_email
											value="${my.email}" required>

									</div>
									<br>

									<div class="information8" style="display: flex; gap: 10px;">

										<label for="year"></label> <input type="text" id="j_year"
											name="j_year" style="width: 100px;" value="${showBir.birth1}">

										<!-- 연도 -->




										<label for="month"></label> <input type="text" id="j_month"
											name="j_month" style="width: 80px;" value="${showBir.birth2}">

										<!-- 월 -->




										<label for="day"></label> <input type="text" id="j_day"
											name="j_day" style="width: 80px;" value="${showBir.birth3}">

										<!-- 일 -->

									</div>

								</div>

							</c:forEach>
						</div>
						<br>
						<div class="button">

							<input type="button" id="btnupdate" style="border-radius: 20px;"
								value="회원정보 수정"> <input type="button" id="btncancel"
								style="border-radius: 20px;" padding:50px; value="취소">

						</div>

					</div>
				</div>

			</div>

		</div>
		
		<!-- 리뷰 작성 dialog part -->
		<div class="dialog-write" id=dialog-write style="display:none;">
        		<div class=dialog-main>
        			<p style="font-size:15px; text-align:center;"> <b>상품 후기 작성하기</b></p>
        			<div class=dialog-book>
        				<div class=book-img id=book-img>

        				</div>
        				<div class=book-info>
        					<p class=book-name id=book-name></p><input type=hidden class=dia_order_num id=dia_order_num>
        					<p class=book-qty id=book-qty></p>
        					<p class=book-price id=book-price></p>
        				</div>
        			</div>
        			<div class=dialog-review>
        				<table class=dialog-table>
        				
        					<tr>
        						<th>아이디</th><td><input type="text" class=dialog-id id=dialog-id readonly></td>
        					</tr>
        					<tr>
        						<th>제목</th><td><input type="text" class=dialog-text id=dialog-text>&nbsp;&nbsp;&nbsp;<font id="check_title" size=2></font></td>
        					</tr>
        					<tr>
        						<th>평점</th><td><input type="radio" name=rating value=1 id=one>★
        										<input type="radio" name=rating value=2 id=two>★★
        										<input type="radio" name=rating value=3 id=three>★★★
        										<input type="radio" name=rating value=4 id=four>★★★★
        										<input type="radio" name=rating value=5 id=five>★★★★★ &nbsp;&nbsp;&nbsp;<font id="check_rating" size=2></font></td>
        					</tr>
        					<tr>
        						<th style="height:300px;">내용</th><td><textarea id="summernote" name="summernote"></textarea></td>
        					</tr>
        					
        				</table>
        				&nbsp;<font id="check_content" size=2></font>
        			</div>
        			<div class=dialog-btn>
        				<button type="button" class="btn-rev" id=submit-rev>등록</button>
        				<button type="button" class="btn-rev" id=cancel-rev>닫기</button>
        			</div>
        			
        		</div>
        	</div>
        	
        	<!--------------------------- 리뷰 작성 dialog part ------------------------------------->
        	<!-- dialog -->
		<div class="dialog-view" id=dialog-view style="display: none;">
			<div class=dialog-main>
				<p style="font-size: 15px; text-align: center;">
					<b>상품 후기 작성하기</b>
				</p>
				<div class=dialog-book>
					<div class=view-img id=view-img></div>
					<div class=view-info>
						<p class=view-name id=view-name></p>
						<p class=view-qty id=view-qty></p>
						<p class=view-price id=view-price></p>
					</div>
				</div>
				<div class=dialog-review>
					<table class=dialog-table>
						<tr>
							<th>아이디</th>
							<td><input type="text" class=dialog-id1 id=dialog-id1 readonly></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" class=dialog-text1 id=dialog-text1
								readonly></td>
						</tr>
						<tr>
							<th>평점</th>
							<td><input type="text" class=dialog-rating1 id=dialog-rating1
								readonly></td>
						</tr>
						<tr>
							<th style="height: 300px;">내용</th>
							<td><textarea id="summernote1" name="summernote1"
									class=summernote1 readonly></textarea></td>
						</tr>
					</table>
				</div>
				<div class=dialog-btn>
					<button type="button" class="btn-rev1" id=cancel-rev1>닫기</button>
				</div>

			</div>
		</div>
	</div>

</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="summernote/summernote-lite.css">
<script>

let rev_rating = ''; // 평점 전역변수
// let order_num1 = $('#dia_order_num').val();

$(document)

let slideIndex = 0;

const slides = $(".slide");

slides.hide();

function showSlides() {

slides.hide();

slideIndex++;

if (slideIndex > slides.length) {slideIndex = 1}

slides.eq(slideIndex - 1).fadeIn(1000);

setTimeout(showSlides, 3000); // Change image every 3 seconds

}

showSlides();

const yearSelect = document.getElementById("j_year");

const monthSelect = document.getElementById("j_month");

const daySelect = document.getElementById("j_day");

// ---- 비밀번호 표시 코드 part ---- //
$(document)

document.getElementById("showPwd").addEventListener("click", function() {
		var passwordInput = document.getElementById("j_pwd");
		var eyeIcon = document.getElementById("showPwd");
		
		if (passwordInput.type === "password") {
			passwordInput.type = "text";
			eyeIcon.src = "/img/free-icon-eye-hidden.jpg";
		} else {
			passwordInput.type = "password";
			eyeIcon.src = "/img/free-icon-eye-show.jpg";
		}
	})
	
	document.getElementById("showPwd2").addEventListener("click", function() {
		var passwordInput = document.getElementById("j_pwdcf");
		var eyeIcon = document.getElementById("showPwd2");
		
		if (passwordInput.type === "password") {
			passwordInput.type = "text";
			eyeIcon.src = "/img/free-icon-eye-hidden.jpg";
		} else {
			passwordInput.type = "password";
			eyeIcon.src = "/img/free-icon-eye-show.jpg";
		}
	})


$(document)

// by ChatGPT

.ready(function() {
	find_review();
	
// ---- 평점 관련 dialog part ---- //
	// 별점 하나만 선택 함수
	rev_Selection();
	
	// order_num 넣기
	let order_num = $(this).closest('.hi').find('#order_num').val();
// 	console.log(order_num);
	
	// id 넣기
	let m_id = '<%=session.getAttribute("id")%>';
	$('#dialog-id').val(m_id);
	
	// 리뷰 작성 
   $('#summernote').summernote({
        height: 200,                 
        width: 750,         
        focus: true,                  
        lang: "ko-KR",               
        placeholder: '<br>내용을 입력하시오. <br> 최대 2000자까지 입력할 수 있습니다', 
        toolbar: [
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['image',['picture']]
           ],
           fontNames: 
              ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
           callbacks: {
                onKeyup: function(e) {
                    // keyup 이벤트 발생 시 실행할 코드 작성
                	var contentData = $('#summernote').val()
                	if(contentData!=''){
                		$('#check_content').html('');
                	} else if(contentData=='') {
                		$('#check_content').html('내용을 입력하세요.');
                		$('#check_content').attr('color', 'red');
                	}
                      
                }
           }
    })
    $('#summernote1').summernote({
        height: 200,                 
        width: 750,         
        focus: true,                  
        lang: "ko-KR",               
        placeholder: '<br>내용을 입력하시오. <br> 최대 2000자까지 입력할 수 있습니다', 
        toolbar: [
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['image',['picture']]
           ],
           fontNames: 
              ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
    })          
    
$('#summernote1').summernote('disable')  //써머노트 readonly
	
    
// ID 정규 표현식

// var idPattern = /^[a-zA-Z0-9]{4,20}$/;

// 비밀번호 정규 표현식

var pwPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,22}$/;

// ID 입력 필드

var idField = $('#j_id');

// 비밀번호 입력 필드

var pwField = $('#j_pwd');

// ID 입력 필드의 값이 변경될 때마다 정규 표현식 패턴에 맞는지 확인

// idField.on('change', function() {

// var id = idField.val();

// if (!idPattern.test(id)) {

// alert('ID는 영어 소문자, 대문자, 숫자만 사용하여 4~20자 이내로 입력해주세요.');

// idField.val('');

// }

// })

// 비밀번호 입력 필드의 값이 변경될 때마다 정규 표현식 패턴에 맞는지 확인

pwField.on('change', function() {

var pw = pwField.val();

if (!pwPattern.test(pw)) {

alert('비밀번호는 영어 소문자, 대문자, 숫자, 특수문자(@$!%*#?&) 중 최소 1개 이상을 포함하여 8~22자 이내로 입력해주세요.');

pwField.val('');

}

});

})



// ---- 리뷰 관련 dialog part ---- // 

 // 리뷰 작성 클릭 시 dialog 열기
.on('click','#openRev_btn', function(){
	// id, order_num 넣기
	let c_id = '<%=session.getAttribute("id")%>';
	let order_num = $(this).closest('.hi').find('#order_num').val();
	
	
	// id가 없을 때 로그인 창으로 연결
	if(c_id == '' || c_id == null || c_id == 'null') {
		alert('로그인 후 이용해주세요');
		document.location="/login";
	} else {
		// 리뷰 작성하기 일때
		let buttonval = $(this).text();
		if(buttonval == '리뷰 작성하기') {
			$('#dialog-write').dialog({
				 title:'리뷰 작성하기',
					    modal:true,
					    width:900,
					    height:750,
					    resizable:false,
					    show : 'slideDown',
					    hide : 'slideUp'
					});
		
			// order_num으로 책 정보 가져오기
			$.ajax({
					url: '/review_book',
					type: 'post',
					data: { id:c_id, order_num:order_num},
					dataType: 'JSON',
					success: function(data) {
						let book_name = data[0]['book_name'];
						$('#book-name').text(book_name);
						
						let book_qty = data[0]['o_qty'];
						$('#book-qty').text(book_qty);
						
						let book_price = data[0]['book_price'];
						$('#book-price').text(book_price);
						
						let book_cover = '<img src="' + data[0]['book_cover'] + '" class="book_img" id="book_img">'
						$('#book-img').empty().append(book_cover);
						
						let dia_order_num = data[0]['dia_order_num'];
// 						console.log("값 넣기 :" + dia_order_num);
						$('#dia_order_num').text(dia_order_num);
						
					}
				})
		} else {
			// 리뷰 보기일때
			$('#dialog-view').dialog({
				 title:'리뷰 상세보기',
					    modal:true,
					    width:900,
					    height:750,
					    resizable:false,
					    show : 'slideDown',
					    hide : 'slideUp'
					});
		
		$.ajax({
			url: '/dialog_review1',
			type: 'post',
			data: { id:c_id, order_num:order_num },
			dataType: 'JSON',
			success: function(data) {
				let dialog_id = data[0]['id'];
				$('#dialog-id1').val(dialog_id);
				
				let book_name = data[0]['book_name'];
				$('#view-name').text(book_name);
				let o_qty = data[0]['o_qty'];
				$('#view-qty').text(o_qty);
				let book_price = data[0]['book_price'];
				$('#view-price').text(book_price);
				let book_cover = '<img src="' + data[0]['book_cover'] + '" class="view_img" id="view_img">';
				$('#view-img').empty().append(book_cover);
				let rev_title = data[0]['rev_title'];
				$('#dialog-text1').val(rev_title);
				
				let rev_rating = data[0]['rev_rating'];
				if(rev_rating == 1) {
					rev_rating = '★';
				} else if(rev_rating == 2) {
					rev_rating = '★★';
				} else if(rev_rating == 3) {
					rev_rating = '★★★';
				} else if(rev_rating == 4) {
					rev_rating = '★★★★';
				} else if(rev_rating == 5) {
					rev_rating = '★★★★★';
				}
				$('#dialog-rating1').val(rev_rating);
				
				let rev_content = data[0]['rev_content'];
//	 			$('#summernote').val(rev_content);
				$('#summernote1').summernote('code', rev_content);

			}
		});
		}
		
	}

})

 // 닫기 버튼 클릭 시 dialog 닫기 - 리뷰 작성하기
.on('click','#cancel-rev',function(){
	$(this).closest('.ui-dialog-content').dialog('close');
})
 // 닫기 버튼 클릭 시 dialog 닫기 - 리뷰 보기
.on('click','#cancel-rev1',function(){
	$(this).closest('.ui-dialog-content').dialog('close');
})
// 등록 버튼 클릭 시 db 저장
.on('click','#submit-rev',function(){
	let dia_order_num = $('#dia_order_num').text();
	
	let id = $('#dialog-id').val();
	let rev_title = $('#dialog-text').val();
// 	let rev_rating = $('input[name="rating"]:checked').val();
	let rev_content = $('#summernote').val();
	// file 값은 fileName 이거임 -> IMG_1097.JPG 이렇게 가져옴.
	
	// 1. 아이디가 null 인지 확인하기
	if(id == '' || id == null) {
		alert("일시적인 오류로 서비스 접속에 실패했습니다. 다시 로그인 해주세요.")
		document.location="/login";
	}
	// 2. 제목을 입력했는지 확인하기
	if(rev_title == '' || rev_title == null) {
		$('#check_title').html('제목을 입력하세요.');
		$('#check_title').attr('color', 'red');
		$('#dialog-text').focus();
// 		return false;
	}
	// 3. 평점을 선택했는지 확인하기
	var radioButtons = document.getElementsByName('rating');
	var selectedButton;

	for (var i = 0; i < radioButtons.length; i++) {
		if (radioButtons[i].checked) {
	    	selectedButton = radioButtons[i];
	    break;
	  }
	}

	if (selectedButton) {
		rev_rating = selectedButton.value;
// 		console.log(rev_rating);

	} else {
		$('#check_rating').html('평점을 선택해주세요.');
		$('#check_rating').attr('color', 'red');
// 		return false;
	}
	
	// 4. 내용을 입력했는지 확인하기
	if(rev_content == '' || rev_content == null) {
		$('#check_content').html('내용을 입력하세요.');
		$('#check_content').attr('color', 'red');
// 		$('#summernote').focus();
// 		return false;
	}
	
// 	// 5. 파일 선택이 없을 시 none-img.png 로 변경
// 	if(fileName == '' || fileName == null) {
// 		fileName = '/img/none-img.png';
// 	}
// 	console.log(fileName);

	// 6. $.ajax로 전송
	// id, rev_title, rev_rating, rev_content, fileName 전송
	if(id == '' || rev_title == '' || rev_rating == '' || rev_content == '' || id == null|| rev_title == null || rev_rating == null || rev_content == null) {
		
	} else {
		let confirmval = confirm('입력 내용으로 리뷰를 작성합니다.');
		if(confirmval) {
			
// 			console.log(dia_order_num);
// 			console.log(id);
// 			console.log(rev_title);
// 			console.log(rev_rating);
// 			console.log(rev_content);
			
			$.ajax({
				url: '/insert_review',
				type: 'post',
				data: { order_num:dia_order_num, id:id, rev_title:rev_title, rev_rating:rev_rating, rev_content:rev_content},
				dataType: 'text',
				success: function(data) {
					if(data=="ok") {
							alert("리뷰 작성이 완료되었습니다. \n자세한 내용은 [마이페이지] - [나의 리뷰] 를 확인해주세요.")
							document.location="/mypage";
					} else {
						console.log("오류2")
						alert("오류로 인해 잠시후에 다시 시도해주세요.")
						return false;
					}
				}
			})
		} else {
			console.log("오류3");
			return false;
		}	
	}
})
	
// 파일 선택 시 이벤트 핸들러
$('#review_img').on('change', function() {
    fileName = $(this).prop('files')[0].name;
//     console.log(fileName);
})

// 제목 입력 시 font 사라지게
$('#dialog-text').on('keyup',function(){
	if($('#dialog-text').val()!=''){
		$('#check_title').html('');
	} else if ($('#dialog-text').val()=='') {
		$('#check_title').html('제목을 입력하세요.');
		$('#check_title').attr('color', 'red');
	}
})

// 내용 입력 시 font 사라지게
/* $('#summernote').on('keyup',function(){
	var contentData = $('#summernote').val()
	if(contentData!=''){
		$('#check_content').html('');
	}
}) */

// 평점 선택시 font 사라지게
$('input[name="rating"]').on('click', function() {
    if ($('input[name="rating"]:checked').length > 0) {
        $('#check_rating').html('');
    }
})

// ---- 리뷰 관련 dialog part ---- //





// ---- 나의 주문내역 ---- //
// 이미지 클릭 시 detail로 연결
$('.hi8').on('click', '.img-resize', function() {
    let imgval = $(this).attr("picname");
// 	console.log(imgval);
    if(imgval == '' || imgval == null){
    	alert("오류로 인해 잠시 후 에 다시 시도해주세요.");
    }else {
    	document.location = '/detail/'+imgval;
        return false;
    }
   		
//     }
})

// ---- 마이페이지 주문내역에서 ReCart in code ---- //
	
$('.hi').on('click','#btncartIn',function(){
	var str = $(this).attr('name');
	ar = str.split(',');
	let book_num = ar[0];
	let qty = ar[1];
// 	console.log(book_num);
// 	console.log(qty);
	
	
	if('<%=session.getAttribute("id")%>'!=null) {
		
		$.ajax({url:'/MyPageAddCart', type:'post', dataType:'text', 
			data:{id:'<%=session.getAttribute("id")%>',
				book_num : book_num, qty:qty},
			success : function(data) {

			if (data == "ok") {
				var confirmval = confirm('장바구니에 상품을 담았습니다. 장바구니로 이동하시겠습니까?');
				if(confirmval) {
					document.location="/cart";
				} else {
					
				}
			}
		},

		error : function() {
			alert('로그인 먼저 해주세요.');
			return false;
		}
	});

			} else {

				alert('로그인 먼저 해주세요.');
				return false;

			}

		})

// 			.on('click', '#btnrevIn', function() {

// 				var num = $(this).attr('name');

// 				num = num.split('룸');
// 				if (num[1] == "") {

// 					$.ajax({
// 						url : '/showReview1',
// 						type : 'post',
// 						dataType : 'text',
// 						data : {
// 							prod_num : num[0].replace('상품', '')

// 						},
// 						success : function(data) {

// 							document.location = "/showReview?token=" + data;

// 						}

// 					});
// 				} else {

// 					$.ajax({
// 						url : '/showReview2',
// 						type : 'post',
// 						dataType : 'text',
// 						data : {
// 							room_num : num[1]

// 						},
// 						success : function(data) {

// 							document.location = "/showReview3?token=" + data;

// 						}

// 					})

// 				}

// 			})

	// ---- 마이페이지 주문내역에서 ReCart in code ---- //	

	// })

	// ---- 나의 주문내역 ---- //

	
	// ---- 나의 게시글 load part ---- //
	$(document)

	.ready(function() {
		
		loadData();

	})
	
	
	// ---- 나의 댓글 load part ---- //
	$(document)

	.ready(function() {

		showBC();

	})
	
	
	// ---- 나의 기부 load part ---- //
	$(document)
	
	.ready(function() {
		
		showDN();
		
	})
	
	
	
	

	$(document)
	
	//  게시글 tr 클릭했을때 이벤트 코드
	.on('click', '#tblBoard tr', function() {

		let a = $(this).find('td:eq(0)').text();
		let b = $(this).find('td:eq(2)').text();

		console.log(a);
		console.log(b);
		
		$.ajax({
			url : '/doQview',
			type : 'get',
			data : {
				name : b,
				num : a
			},
			dataType : 'text',
			beforeSend : function() {
// 				console.log("시작");

			},
			success : function(data) {
// 				alert(data);
// 				ar = data.split(',:');
// 				let board_num = ar[6];
// 				document.location = "/boardView/" + board_num + "?token=" + data;
				document.location = "/Qview?token=" + data;
// 				console.log("성공");
			}
		})
	})
	
	// 댓글 tr 클릭했을때 이벤트 코드
	.on('click', '#tblBoard2 tr', function() {

		let a = $(this).find('td:eq(0)').text();
		let b = $(this).find('td:eq(2)').text();

		console.log(a);
		console.log(b);

		$.ajax({
			url : '/doQview2',
			type : 'get',
			data : {
				name : b,
				num : a
			},
			dataType : 'text',
			beforeSend : function() {
				console.log("시작");
			},
			success : function(data) {
				document.location = "/Qview?token=" + data;
				console.log("성공");
			}
		})
	})
	
	// 기부 tr 클릭했을때 이벤트 코드
// 	.on('click', '#tblBoard3 tr', function() {

// 		let a = $(this).find('td:eq(0)').text();
// 		let b = $(this).find('td:eq(2)').text();

// 		console.log(a);
// 		console.log(b);

// 		$.ajax({
// 			url : '/doDonaview',
// 			type : 'get',
// 			data : {
// 				name : b,
// 				num : a
// 			},
// 			dataType : 'text',
// 			beforeSend : function() {

// 			},
// 			success : function(data) {
// 				document.location = "/Qview?token=" + data;
// 			}
// 		})
// 	})
	


	
	
// ---- 회원정보 변경 ---- //
	$(document)

	.on('click', '#btncancel', function() {

		document.location = '/main';

	})

	.on('click', '#btnupdate', function() {

		var address1 = $('#j_address1').val();
		var address2 = $('#j_address2').val();
		var address = address1 + "@" + address2;

		var mobile1 = $('#j_fisrtphone').val();
		var mobile2 = $('#j_midphone').val();
		var mobile3 = $('#j_lastphone').val();
		var mobile = mobile1 + " " + mobile2 + " " + mobile3;

		var birth1 = $('#j_year').val();
		var birth2 = $('#j_month').val();
		var birth3 = $('#j_day').val();
		var birth = birth1 + "-" + birth2 + "-" + birth3;

		$.ajax({
			url : '/updateMy',
			type : 'post',
			dataType : 'text',
			data : {
				id : $('#j_id').val(),
				id2 : '<%=session.getAttribute("id")%>',
        	  pwd:$('#j_pwd').val(),
              name:$('#j_name').val(),
              email:$('#j_email').val(),
              zip_code:$('#zip_code').val(),  
              address:address,         
              mobile:mobile,
              birth:birth},
              
              success:function(data){
                  
                  
                  if(data=="ok") {
                 	 
 					  
                  } else {	
                 	 
 		               alert(data);
                  }
                  
                
          }
              
	});
	
	
	
let id = $('#j_id').val();

if(id==''){alert('아이디를 입력해주세요'); return false;}


let ps1 = $('#j_pwd').val(); if(ps1==''){alert('비밀번호를 입력해주세요');return false;}

let ps2 = $('#j_pwdcf').val();


if(ps1!=ps2){alert('비밀번호가 일치하지 않습니다');return false;}

document.location = '/logout';
return false;

})



.on('blur','#j_id',function(){


$.ajax({url:'/idCheck',

type:'post',

dataType:'text',

data:{j_id:$('#j_id').val()},


success:function(data){

$('#idGuide').text(data);

}

})

})

.on('blur','#j_pwdcf',function(){


ps1 = $('#j_pwd').val();

ps2 = $('#j_pwdcf').val();


if(ps1==''||ps1==null){

$('#psGuide2').text('비밀번호를 입력해주세요'); return false;

}

else if(ps1==ps2){

$('#psGuide2').text('비밀번호가 일치합니다'); return false;

} else {

$('#psGuide2').text('비밀번호가 일치하지않습니다'); return false;

}

})
// ---- 회원정보 변경 ---- //




// ---- 게시글 load ajax ---- //
function loadData(){
	
	$.ajax({url:'/myPlist',type:'get',data:{id:'<%=session.getAttribute("id")%>'}
											,dataType:'json',
		success:function(data){
// 			$('#tblBoard tr:gt(0)').remove();
			for(let i=0; i<data.length; i++){
				
				let str='<tbody><tr>';
				str+='<td>'+data[i]['board_num']+'</td>';
				str+='<td>'+data[i]['B_title']+'</td>';
				str+='<td>'+data[i]['id']+'</td>';
				str+='<td>'+data[i]['B_Create_date']+'</td>';
				str+='<td>'+data[i]['B_rcount']+'</td></tr></tbody>';
				$('#tblBoard').append(str);
				
			}
			
			 rowTotals =$('#tblBoard').find('tr:gt(0)').length;
			console.log(rowTotals);
			 $('#setRows').submit();
		}})
		return false;
}

// ---- 댓글 load ajax ---- //
function showBC() {
	  $.ajax({
	    url: '/showBC',
	    type: 'post',
	    data: {id:'<%=session.getAttribute("id")%>'},
	    	   dataType: 'json',
	    beforeSend: function() {               
	    },
	    success: function(data) {
		for(let i=0; i<data.length; i++){
				
				let str='<tbody><tr>';
				str+='<td>'+data[i]['BC_num']+'</td>';
				str+='<td>'+data[i]['BC_content']+'</td>';
				str+='<td>'+data[i]['id']+'</td>';
				str+='<td>'+data[i]['BC_create']+'</td></tr></tbody>';
				$('#tblBoard2').append(str);
				
			}
	    }
	  });
}

//---- 기부 load ajax ---- //
function showDN() {
	  $.ajax({
	    url: '/showDN',
	    type: 'post',
	    data: {id:'<%=session.getAttribute("id")%>'},
	    	   dataType: 'json',
	    beforeSend: function() {               
	    },
	    success: function(data) {
		for(let i=0; i<data.length; i++){
				
				let str='<tbody><tr>';
				str+='<td>'+data[i]['dona_num']+'</td>';
				str+='<td>'+data[i]['dona_name']+'</td>';
				str+='<td>'+data[i]['dona_qty']+'</td>';
				str+='<td>'+data[i]['dona_way']+'</td>';
				str+='<td>'+data[i]['dona_date']+'</td></tr></tbody>';
				$('#tblBoard3').append(str);
				
			}
	    }
	  });
}

// ---- 우편번호 API 코드 ---- //
function sample6_execDaumPostcode() {
	
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("j_address2").value = extraAddr;
                
                } else {
                    document.getElementById("j_address2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip_code').value = data.zonecode;
                document.getElementById("j_address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("j_address2").focus();
            }
        }).open();
        return false;
    }
    
    
// ---- mypage 상단 탭 변경 코드 ---- //
$("#delivery-tab").click(function () {
    changeTab("delivery");
})

$("#posts-tab").click(function () {
    changeTab("posts");
})

$("#comments-tab").click(function () {
    changeTab("comments");
})

$("#membership-tab").click(function () {
    changeTab("membership");
})

$("#donation-tab").click(function () {
    changeTab("donation");
})

function changeTab(tab) {
    $(".tab-item").removeClass("active");
    $(".content-container").removeClass("active");

    $("#" + tab + "-tab").addClass("active");
    $("#" + tab).addClass("active");
}



// ---- 평점 관련 dialog part ---- //

//별점 하나만 선택
function rev_Selection() {
	var one = document.getElementById("one");
	var two = document.getElementById("two");
	var three = document.getElementById("three");
	var four = document.getElementById("three");
	var five = document.getElementById("three");
	
	if (one.checked) {
		two.checked = false;
		three.checked = false;
		four.checked = false;
		five.checked = false;
	} else if (two.checked) {
		one.checked = false;
		three.checked = false;
		four.checked = false;
		five.checked = false;
	} else if(three.checked) {
		one.checked = false;
		two.checked = false;
		four.checked = false;
		five.checked = false;
	} else if(four.checked) {
		one.checked = false;
		two.checked = false;
		three.checked = false;
		five.checked = false;
	} else if(five.checked) {
		one.checked = false;
		two.checked = false;
		three.checked = false;
		four.checked = false;
	} 
}

// 리뷰 확인하기
function find_review() {
	let id = '<%= session.getAttribute("id") %>';
	
	// 새로고침 시 각 div의 order_num 값 가져오기
    $('.hi').each(function() {
        var orderNum = $(this).find('#order_num').val();
//         console.log(orderNum);
        var openRevBtn = $(this).find('#openRev_btn'); // 현재 hi div 내의 openRev_btn 버튼 선택
        
        // 가져온 order_num 값으로 원하는 처리 수행
        $.ajax({
            url: '/check_review',
            type: 'post',
            data: { orderNum: orderNum, id: id },
            dataType: 'text',
            success: function(data) {
                if (data === 'ok') {
                	 openRevBtn.text('리뷰 보기');
//                     console.log('리뷰보기');
                } else {
                	 openRevBtn.text('리뷰 작성하기');
                }
            },
            error: function() {
                console.log('오류 발생');
            }
        });
    });
}
</script>
</html>