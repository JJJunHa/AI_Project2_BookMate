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
<!--     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"  -->

<!--  integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">  -->
 <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <title>북메이트 | 마이페이지</title>
</head>
<body>


<input value="<%=session.getAttribute("id")%>" hidden>

<!-- 	<div class="container"> -->
<div class="main">
		<div class="logo">
			<a href="/main"><img src="/img/logo2.png" class="logoImg"></a>
		</div>

		<% if(session.getAttribute("id") != null && !"".equals(session.getAttribute("id")) && !session.getAttribute("id").equals("bookmate")) { %>
		
			<div class="menu">
				<%= session.getAttribute("id") %> 님, <a href="/logout">로그아웃</a>&nbsp;|&nbsp;<a href="/cart">장바구니</a>&nbsp;|&nbsp;<a href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
			</div>
		
		<% } else if (session.getAttribute("id") != null && "bookmate".equals(session.getAttribute("id"))) { %>
		
			<div class="menu">
				<%= session.getAttribute("id") %> 님, <a href="/logout">로그아웃</a>&nbsp;|&nbsp;
				<div class="dropdown">
					<button class="dropbtn">관리자</button>
					<div class="dropdown-content">
						<a href="/memlist">회원관리</a> <a href="/orlist">주문관리</a> <a href="/revlist">리뷰관리</a><a href="/prolist">상품관리</a><a href="/adminNew">상품추가</a>
					</div>
				</div>
				&nbsp;|&nbsp;<a href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
			</div>
		
		<% } else { %>
		
			<div class="menu">
				<a href="/login">로그인</a>&nbsp;|&nbsp;<a href="/certified">회원가입</a>&nbsp;|&nbsp;<a href="/login" onclick="alert('로그인 후 이용해주세요')">장바구니</a>&nbsp;|&nbsp;<a href="/login" onclick="alert('로그인 후 이용해주세요')">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
			</div>
		
		<% } %>

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
						<h2 class='mytext fst-italic'>주문 내역 조회</h2>
						<table class=tblOrder id=tblOrder>
							<thead>
								<tr>
								<th class=tblNum>주문번호</th>
								<th colspan = 2 class=tblProduct>상품정보</th>
								<th class=tblDate>주문일자</th>
								<th class=tblQty>주문금액(수량)</th>
								<th colspan=2 class=tblStatus>주문 상태</th>
								</tr>
							</thead>
						<caption>
							<form action="" id="setRows">
								<p><input type="hidden" name="rowPerPage" value="5"></p>
							</form>
						</caption>
						</table>
						<div class="bSearch">
						
               			</div>    
                	</div>
				</div>	



				<div id="posts" class="content-container">
					<div class="posts-container">
						<h2 class="mytext fst-italic">게시글</h2>
						<table class="table table-hover" id="tblBoard">
							
							<thead>
								<tr>
									<th class=thnum>POST ID</th>
									<th class=thtitle>제목</th>
									<th class=thwrite>작성자</th>
									<th class=thdate>작성일</th>
									<th class=thcount>조회수</th>
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
									<th class=thnum>POST ID</th>
									<th class=thtitle>댓글내용</th>
									<th class=thwrite>작성자</th>
									<th class=thdate>작성일</th>
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
									<th class=thnum>DONATION ID</th>
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
						
						<div class=divpwdcheck>
							<div class=divall>
								<div class=divpwdimg>
									<img src="/img/password_check.png"  class=pwdcheckimg id="pwdcheckimg">
								</div>
								<div class=divpwdinfo>
									<h3>비밀번호 재확인</h3>
									<p>회원 정보를 안전하게 보호하기 위해 회원 비밀번호를 다시 확인합니다.</p>
								</div>
							</div>
							<div class=divcheck>
								<span style="font-size:15px; font-weight: bold;">회원 비밀번호&nbsp;&nbsp;</span>
								<input type=password name=pwdcheck2 id=pwdcheck2 placeholder='  비밀번호'>
								<button id=btncheck2>확인</button>
							</div>
						</div>		
						
						
						<div class="divtext"  style="display:none;">
						<h2 class="mytext fst-italic">정보 변경</h2>
							<table class=tblmodify>
							<c:forEach var="my" items="${selectMy}">
							<tr>
								<th class=tblname4>이름</th>
								<td>
									<input type=text id=j_name name=j_name value="${my.name}" readonly>
								</td>
							</tr>
							<tr>
								<th class=name1>아이디</th>
								<td>
									<input type="text" readonly id="j_id" name="j_id" value="${my.id}">
								</td>
							</tr>
							<tr>
								<th class=name2>비밀번호</th>
								<td>
									<input type=password id=j_pwd name=j_pwd value="${my.pwd}"><img src="/img/free-icon-eye-show.jpg" id="showPwd">
									<div class=divpw style="font-size: 3px;">(영문대소문자/숫자/특수문자,10~16자)</div>
									<label id=psGuide style="font-size: 10px"></label>
									<input type=hidden id=originalpwd value="${my.pwd}">
								</td>
							</tr>
							<tr>
								<th class=name3>비밀번호 확인</th>
								<td>
									<input type=password id=j_pwdcf name=j_pwdcf><img src="/img/free-icon-eye-show.jpg" id="showPwd2"><br>
									<label id=psGuide2 style="font-size: 10px"></label>
								</td>
							</tr>
							
							<tr>
								<th class=name5>주소</th>
								<td>
									<input type="address" class="address-input" id=zip_code
											name=zip_code placeholder="우편번호" value="${my.zip_code}" readonly>
									<input type=hidden id=originalcode value="${my.zip_code}">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
											id=zip_btn>
									<input type="address" id=j_address1 name=j_address1
											readonly class="address2-input" placeholder="기본주소"
											value="${showAdr.address1}" required><br>
									<input type="address" id=j_address2 name=j_address2
											class="address2-input" placeholder="상세주소"
											value="${showAdr.address2}" required>
								</td>
							</tr>
							<tr>
								<th class=name6>휴대전화</th>
								<td>
									<input type="tel" id=j_fisrtphone name=j_firstphone value="${showMob.mobile1}"> - 
									<input type="tel" id=j_midphone name=j_midphone
											class="general-number" value="${showMob.mobile2}" required>
										- <input type="tel" id=j_lastphone name=j_lastphone
											class="general-number" value="${showMob.mobile3}" required>
								</td>
							</tr>
							<tr>
								<th class=name7>이메일</th>
								<td>
									<input type="email" id=j_email name=j_email
											value="${my.email}" required>
									<input type=hidden id=originalEmail value="${my.email}">
								</td>
							</tr>
							<tr>
								<th class=name8>생년월일</th>
								<td>
									<input type="text" id="j_year" name="j_year"  value="${showBir.birth1}">
										<!-- 연도 -->
									<input type="text" id="j_month" name="j_month" value="${showBir.birth2}">
										<!-- 월 -->
									<input type="text" id="j_day" name="j_day" value="${showBir.birth3}">
								</td>
							</tr>
							</c:forEach>
							</table>
							
							<br>
							<div class="divbutton">
	
								<input type="button" id="btnupdate" value="회원정보 수정">
								<input type="button" id="btncancel" value="취소">
	
							</div>
						</div>

					</div>
				</div>
		</div>
		
		<!-- 리뷰 작성 dialog part -->
		<div class="dialog-write" id=dialog-write style="display:none;">
        		<div class=dialog-main>
        			<p style="font-size:18px; text-align:center;"> <b>상품 후기 작성하기</b></p>
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
        	
        	<!--------------------------- 리뷰 보기 dialog part ------------------------------------->
        	<!-- dialog -->
		<div class="dialog-view" id=dialog-view style="display: none;">
			<div class=dialog-main>
				<p style="font-size: 18px; text-align: center;">
					<b>상품 후기 작성하기</b>
				</p>
				<div class=dialog-book>
					<div class=view-img id=view-img>
					</div>
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
							<td><input type="text" class=dialog-id1 id=dialog-id1 readonly><input type="hidden" id=dialog-review_num></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input type="text" class=dialog-text1 id=dialog-text1>&nbsp;&nbsp;&nbsp;<font id="check_text1" size=2></font></td>
						</tr>
						<tr>
							<th style="height:80px;">평점</th>
							<td><input type="text" class=dialog-rating1 id=dialog-rating1><br>
								<input type="radio" name=rating value=1 id=one>★
								<input type="radio" name=rating value=2 id=two>★★
								<input type="radio" name=rating value=3 id=three>★★★
								<input type="radio" name=rating value=4 id=four>★★★★
								<input type="radio" name=rating value=5 id=five>★★★★★</td>
						</tr>
						<tr>
							<th style="height: 300px;">내용</th>
							<td><textarea id="summernote1" name="summernote1"
									class=summernote1></textarea></td>
						</tr>
					</table>
					&nbsp;<font id="check_content1" size=2></font>
				</div>
				<div class=dialog-btn>
					<button type="button" class="btn-rev1" id=modify-rev1>수정</button>
					<button type="button" class="btn-rev1" id=delete-rev1>삭제</button>
					<button type="button" class="btn-rev1" id=cancel-rev1>닫기</button>
				</div>

			</div>
		</div>
	</div>
<footer id="footer" class="footer_new">
         <h1><a href="/main" class="titlename"><img src="/img/footer_logo.png" class="footer_img"></a></h1>
              
		 
          <div class="footer-layer2">
              <div class="footer-1">
<!--                   <address> -->
                      상호명 및 호스팅 서비스 제공 : BookMATE<br>
                      대표이사 : 김준하짱<br>
                      충남 천안시 동남구 대흥로 215 7층, 8층 <br>
                      사업자 등록번호 : 422-4212-421    
<!--                       고객 서비스 센터 이용안내<br> -->
<!--                       <h2>070-4140-0732</h2>(사용자 요금 부담)<br> -->
<!--                       운영시간 AM 09:00 ~ PM 17:30 (주말 및 공휴일 휴무) <br> -->
<!--                       점심시간 PM 12:50 ~ PM 13:40 -->
<!--                   </address> -->
              </div>
              <div class="footer-2">
                      이메일 주소 info@korea.com<br>
                      비즈니스제휴/입점문의 BookMATEBusiness@korea.com<br>
                      <span id=emaildiv class=emaildiv>이메일 주소 무단 수집 거부 | </span> <span> 개인정보 보호책임자 정구화 |</span><span> 호스팅 서비스 제공자 ㈜BookMATE <br></span>
                      <span style="opacity: 0.7;">고객님은 안전거래를 위해 결제시 저희 쇼핑몰에게 가입한 KCP 에스그로 구매안전 서비스를 이용할수있습니다.</span>
                <span style="opacity: 0.7;"><button id=submit>서비스가입 사실확인</button> </span><br> 
                      Copyright © 2023 BookMATE. All Rights Reserved.
                       
              </div>
              <div class="footer-3">
                 <span style="color:red; font-weight:bold;">교환/반품 주소</span><br>
                <span style="opacity: 0.7;">충청남도 서북구<br></span>
                <span style="opacity: 0.7;">  CJ대한통운 1588 1255 <br></span>
                <a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">배송위치 조회하기</a><br>
                <span style="font-size:16px;"><b>고객 서비스 센터 이용안내</b></span><br>
                     070-4140-0732 (사용자 요금 부담)<br>
                      운영시간 AM 09:00 ~ PM 17:30 (주말 및 공휴일 휴무) <br>
                      점심시간 PM 12:50 ~ PM 13:40           
                
               
              </div>
          </div>
      </footer>
 <div class=divemail id="divemail" style="display:none;">
	<div class=divclass>
		<p>주식회사 BookMATE(이하 ‘회사’)은 본 웹사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 금지하며, 이를 위반할 경우 &lt;정보통신망 이용촉진 및 정보보호 등에 관한 법률&gt; 관련규정에 의해 형사 처벌될 수 있습니다.</p>

		<p class="provTit">정보통신망 이용촉진 및 정보보호 등에 관한 법률</p>

		<p class="provTit">제 50 조 (영리목적의 광고성 정보 전송 제한)</p>
		<ul class="list">
			<li>⑤ 전자적 전송 매체를 이용하여 영리목적의 광고성 정보를 전송하는 자는 다음 각 호의 어느 하나에 해당하는 조치를 하여서는 아니 된다.</li>
			<li>3. 영리목적의 광고성 정보를 전송할 목적으로 전화번호 또는 전자우편주소를 자동으로 등록하는 조치</li>
		</ul>

		<p class="provTit">제 74 조 (벌칙)</p>
		<ul class="list">
			<li>① 다음 각 호의 어느 하나에 해당하는 자는 1년 이하의 징역 또는 1천만원 이하의 벌금에 처한다.</li>
			<li>4. 제50조 제5항을 위반하여 조치를 한 자</li>
		</ul>
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
let book_num_review = ''; // 리뷰의 책 제목 전역변수

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
	setInterval(changeText, 1500);
	
	// 주문 목록 불러오기 
	loadOrder();
	
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
              callbacks: {
                  onKeyup: function(e) {
                      // keyup 이벤트 발생 시 실행할 코드 작성
                  	var contentData1 = $('#summernote1').val()
                  	console.log(contentData1);
                  	if(contentData1 !=''){
                  		$('#check_content1').html('');
                  	} else if(contentData1 =='') {
                  		$('#check_content1').html('내용을 입력하세요.');
                  		$('#check_content1').attr('color', 'red');
                  	}
                        
                  }
             }
      })       
    
// $('#summernote1').summernote('disable')  //써머노트 readonly
	
    
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
// 수정 화면에서 라디오버튼 클릭 시
$(document)
.on('change', 'input[name=rating]', function() {
  let ratingValue = $(this).val();
  if(ratingValue == 1) {
	  ratingValue = "★";
  } else if(ratingValue == 2) {
	  ratingValue = "★★";
  } else if(ratingValue == 3) {
	  ratingValue = "★★★";
  } else if(ratingValue == 4) {
	  ratingValue = "★★★★";
  } else if(ratingValue == 5) {
	  ratingValue = "★★★★★";
  }
  $('#dialog-rating1').val(ratingValue);
})


// 수정 버튼 클릭 시
.on('click','#modify-rev1', function(){
	let id = '<%=session.getAttribute("id")%>';
	let review_num = $('#dialog-review_num').val();
	
	let rev_title1 = $('#dialog-text1').val();
	if(rev_title1 == '' || rev_title1 == null) {
		$('#check_text1').html('제목을 입력하세요.');
		$('#check_text1').attr('color', 'red');
	}
	
	let rev_content1 = $('#summernote1').val();
	if(rev_content1 == '' || rev_content1 == null || rev_content1 == '<p><br></p>') {
		$('#check_content1').html('내용을 입력하세요.');
		$('#check_content1').attr('color', 'red');
	}
	
	let rev_rating1 = $('#dialog-rating1').val();
	if(rev_rating1 == "★") {
		rev_rating1 = 1;
	} else if(rev_rating1 == "★★") {
		rev_rating1 = 2;
	} else if(rev_rating1 == "★★★") {
		rev_rating1 = 3;
	} else if(rev_rating1 == "★★★★") {
		rev_rating1 = 4;
	} else if(rev_rating1 == "★★★★★") {
		rev_rating1 = 5;
	}

	$.ajax({
		url: '/update_review',
		type: 'post',
		data: { id:id, review_num:review_num, rev_title1:rev_title1, rev_content1:rev_content1, rev_rating1:rev_rating1},
		dataType: 'text',
		success: function(data) {
			if(data=="ok") {
				$.ajax({
					url: '/book_rating1',
					type: 'post',
					data: {rev_rating:rev_rating1, book_num_review:book_num_review },
					dataType: 'text',
					success: function(data) {
						if(data=="ok") {
							alert("리뷰 수정이 완료되었습니다.");
							document.location="/mypage";
						} else {
							
						}
					}
				})
				
			} else {
				alert("오류가 발생하였습니다. 잠시후에 다시 시도해주세요.");
				return false;
			}
			
		}
	})
	
})
// 주문취소, 배송조회 버튼 클릭 시
.on('click','#order_status', function(){
	let status = $(this).text();
// 	console.log(status);
	if(status === "배송조회") {
		window.open("https://www.cjlogistics.com/ko/tool/parcel/tracking", "_blank");
	} else if(status === "주문취소"){
		let orderNum = $(this).attr('name');
		let id = '<%=session.getAttribute("id")%>';
		
		let confirmval = confirm('주문을 취소하시겠습니까?');
		if(confirmval) {
			$.ajax({
				url: '/order_delete',
				type: 'post',
				data: {orderNum:orderNum, id:id },
				dataType: 'text',
				success: function(data) {
					if(data=="ok") {
						alert("주문을 취소하였습니다.");
						document.location = '/mypage';
					} else {
						alert("오류가 발생하였습니다. 잠시후에 다시 시도해주세요. code 1");
						return false;
					}
				}
			})	
		} else {
			console.log("오류3");
			return false;
		}	
	} else {
		alert("오류가 발생하였습니다. 잠시후에 다시 시도해주세요. code 2");
		return false;
	}
})

// 리뷰 작성 클릭 시 dialog 열기
.on('click','#openRev_btn', function(){
	// id, order_num 넣기
	let c_id = '<%=session.getAttribute("id")%>';
	let orderNum = $(this).attr('name');
	
// 	console.log(orderNum);
	
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
					data: { id:c_id, orderNum:orderNum},
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
						$('#dia_order_num').text(dia_order_num);	
						
						book_num_review = data[0]['book_num'];
// 						console.log("얌 작성 : " + book_num_review);
						
					}
				})
		} else if(buttonval == '리뷰 보기'){
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
			data: { id:c_id, orderNum:orderNum },
			dataType: 'JSON',
			success: function(data) {
				let dialog_id = data[0]['id'];
				$('#dialog-id1').val(dialog_id);
				
				let book_name = data[0]['book_name'];
				$('#view-name').text(book_name);
				
				book_num_review = data[0]['book_num'];
// 				console.log("얌 보기 : " + book_num_review);
				
				let o_qty = data[0]['o_qty'];
				$('#view-qty').text(o_qty);
				let book_price = data[0]['book_price'];
				$('#view-price').text(book_price);
				let book_cover = '<img src="' + data[0]['book_cover'] + '" class="view_img" id="view_img">';
				$('#view-img').empty().append(book_cover);
				let rev_title = data[0]['rev_title'];
				$('#dialog-text1').val(rev_title);
				
				let review_num = data[0]['review_num'];
				$('#dialog-review_num').val(review_num);
				
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
		} else if(buttonval == '문의하기') {
			document.location = "/board";
		} else {
			alert("오류가 발생하였습니다. 잠시후에 다시 시도해주세요.")
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

	// 5. $.ajax로 전송
	// id, rev_title, rev_rating, rev_content, fileName 전송
	if(id == '' || rev_title == '' || rev_rating == '' || rev_content == '' || id == null|| rev_title == null || rev_rating == null || rev_content == null) {
		
	} else {
		let confirmval = confirm('입력 내용으로 리뷰를 작성합니다.');
		if(confirmval) {
			// 등록 버튼 클릭 시 book에 평점 넣기
//	 		console.log("등록 : "+book_num_review);
			$.ajax({
				url: '/book_rating',
				type: 'post',
				data: {rev_rating:rev_rating, book_num_review:book_num_review },
				dataType: 'text',
				success: function(data) {
					if(data=="ok") {
						$.ajax({
							url: '/insert_review',
							type: 'post',
							data: { order_num:dia_order_num, id:id, rev_title:rev_title, rev_rating:rev_rating, rev_content:rev_content},
							dataType: 'text',
							success: function(data) {
								if(data=="ok") {
									alert("리뷰 작성이 완료되었습니다. \n자세한 내용은 [마이페이지] - [나의 주문 내역] - [리뷰 보기] 를 확인해주세요.")
									document.location="/mypage";							
								} else {
									console.log("오류2")
									alert("오류로 인해 잠시후에 다시 시도해주세요.")
									return false;
								}
							}
						})	
					} else {
						
					}
				}
			})					
		} else {
			console.log("오류3");
			return false;
		}	
	}
})
// 마이페이지에서 리뷰 삭제할 때
.on('click','#delete-rev1',function(){
	let review_num = $('#dialog-review_num').val();
	let confirmval = confirm('리뷰를 삭제하시겠습니까?');
	if(confirmval) {
		$.ajax({
			url: '/delete_review',
			type: 'post',
			data: {review_num :review_num},
			dataType: 'text',
			success: function(data) {
				if(data=="ok") {
					$.ajax({
						url: '/book_rating2',
						type: 'post',
						data: {book_num_review:book_num_review },
						dataType: 'text',
						success: function(data) {
							if(data=="ok") {
								alert("리뷰가 삭제되었습니다.")
								document.location="/mypage";
							} else {
								
							}
						}
					})
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
$('#dialog-text1').on('keyup',function(){
	if($('#dialog-text1').val()!=''){
		$('#check_text1').html('');
	} else if ($('#dialog-text1').val()=='') {
		$('#check_text1').html('제목을 입력하세요.');
		$('#check_text1').attr('color', 'red');
	}
})

// 평점 선택시 font 사라지게
$('input[name="rating"]').on('click', function() {
    if ($('input[name="rating"]:checked').length > 0) {
        $('#check_rating').html('');
    }
})

// ---- 리뷰 관련 dialog part ---- //





// ---- 나의 주문내역 ---- //
// 이미지 클릭 시 detail로 연결
$(document)
.on('click', '.img-resize', function() {
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
$(document)	
.on('click','#btncartIn',function(){
	console.log("클릭");
	var str = $(this).attr('name');
	ar = str.split(',');
	let book_num = ar[0];
	let qty = ar[1];
	
// 	console.log(book_num);
// 	console.log(qty);
	
	
	if('<%=session.getAttribute("id")%>'!=null) {
		
		$.ajax({url:'/MyPageCartFind', type:'post', dataType:'text', 
			data:{id:'<%=session.getAttribute("id")%>',
				book_num : book_num},
			success : function(data) {
			if (data == "none") {
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
				} else if (data == "ok") {
					var confirmval = confirm('이미 장바구니에 존재하는 상품입니다. 장바구니로 이동하시겠습니까?');
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

// 		console.log(a);
// 		console.log(b);
		
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

// 		console.log(a);
// 		console.log(b);

		$.ajax({
			url : '/doQview2',
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
				document.location = "/Qview?token=" + data;
// 				console.log("성공");
			}
		})
	})
	
	
// ---- 회원정보 변경 ---- //
	
	$(document)
	.on('click', '#btncancel', function() {
		var confirmval = confirm('회원정보 변경을 취소하시겠습니까?');
		if(confirmval) {
			$('#j_pwd').val($('#originalpwd').val());
			$('#j_pwdcf').val("");
	 		$('#zip_code').val($('#originalcode').val());
			$('#j_address1').val("${showAdr.address1}");
			$('#j_address2').val("${showAdr.address2}");
			$('#j_fisrtphone').val("${showMob.mobile1}");
			$('#j_midphone').val("${showMob.mobile2}");
			$('#j_lastphone').val("${showMob.mobile3}");
			$('#j_email').val($('#originalEmail').val()); // 이메일 원래 값으로 복원
			$('#j_year').val("${showBir.birth1}");
			$('#j_month').val("${showBir.birth2}");
			$('#j_day').val("${showBir.birth3}");
		} else {
			
		}
		
	
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
              beforeSend:function(){
            	  let ps1 = $('#j_pwd').val();
            	  if(ps1==''){alert('비밀번호를 입력해주세요');
            	  return false;
            	  }
            	  let ps2 = $('#j_pwdcf').val();


            	  if(ps1!=ps2) {
            		  alert('비밀번호가 일치하지 않습니다');
            		  return false;
              	  }
              },
              success:function(data){
                  
                  
                  if(data=="ok") {
                 	 alert("회원정보가 성공적으로 변경되었습니다."+"\n"+"다시 로그인해주세요.");
 					 document.location = '/logout';
                  } else {	
                 	 
 		               alert(data);
                  }
                  
                
          }
              
	});
})

// 비밀번호 재확인
.on('click','#btncheck2',function(){
	let enteredPassword = $('#pwdcheck2').val();
	let checkpwd = $('#originalpwd').val();
// 	console.log(enteredPassword);
// 	console.log(checkpwd);
	// 비밀번호 확인 로직 실행
   	if (enteredPassword === checkpwd) { // 비밀번호가 맞는지 확인 (여기서는 임의로 '올바른비밀번호'라고 가정함)
//    		$('#divpwdcheck').hide();
   		$('.divpwdcheck').hide();
   		$('.divtext').show(); // 회원정보 변경 화면 보이기
   	} else if(enteredPassword == '' || enteredPassword == null){
   		alert('비밀번호를 입력해주세요.');
   	} else {
   		alert('비밀번호가 일치하지 않습니다.');
        // 비밀번호가 틀린 경우 알림 메시지 출력
        $('#pwdcheck2').val("");
   	}
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


// footer => dialog
.on('click','#emaildiv',function(){
	 $('#divemail').dialog({
		 title:'이메일 주소 무단 수집 거부',
	     modal:true,
	     width:600,
	     height:400,
	     resizeable : false,
	     show : 'slideDown',
	     hide : 'slideUp'	     
	 })
})

var textArray = [
    "도서 추천 서비스",
    "독서 목록 관리",
    "독서 습관 형성",
    "추천 도서 리뷰",
    "지금 어떤 책을 읽어야 할지 고민하는 사용자의 상태에 맞는 책을 추천해주는 서비스"
  ];

  // 텍스트 변경 함수
  function changeText() {
    var nameElement = $('.name');
    var randomIndex = Math.floor(Math.random() * textArray.length);
    nameElement.text(textArray[randomIndex]);
  }
// ---- 회원정보 변경 ---- //

// ---- mypage 상단 탭 변경 코드 ---- //
function changeTab(tab) {
//     console.log("tab: " + tab);
  
    $(".tab-item").removeClass("active");
    $(".content-container").removeClass("active");
  
    $("#" + tab + "-tab").addClass("active");
    $("#" + tab).addClass("active");
    
    $(".content-container").css("display", "none");  
    $(".content-container.active").css("display", "block");
}


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
// 			console.log(rowTotals);
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
    $('.tblOrder tbody tr').each(function() {
    	var orderNum = $(this).find('#openRev_btn').attr('name'); 	
        var openRevBtn = $(this).find('#openRev_btn'); // 현재 hi div 내의 openRev_btn 버튼 선택
        
//         console.log("num : " + orderNum);
//         console.log(openRevBtn);
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
                console.log('review 오류 발생');
            }
        });
    });
}

//리뷰 확인하기
function find_status() {
	let id = '<%= session.getAttribute("id") %>';

	// 새로고침 시 각 div의 order_num 값 가져오기
    $('.tblOrder tbody tr').each(function() {
    	var orderNum = $(this).find('#openRev_btn').attr('name'); 	
        var order_status = $(this).find('#order_status'); // 현재 hi div 내의 openRev_btn 버튼 선택
        var openRevBtn = $(this).find('#openRev_btn'); // 현재 hi div 내의 openRev_btn 버튼 선택
        
//         console.log("num : " + orderNum);
//         console.log(order_status);
        // 가져온 order_num 값으로 원하는 처리 수행
        $.ajax({
            url:'/check_status',
            type: 'post',
            data: { orderNum: orderNum, id: id },
            dataType: 'text',
            success: function(data) {
                if (data === 'ok1') {
                	order_status.text('주문취소');
                	openRevBtn.text('문의하기');
//                 	openRevBtn.hide();
//                     console.log('리뷰보기');http://localhost:8080/donation
                } else if(data === 'ok2'){
                	order_status.text('배송조회');
                	openRevBtn.text('문의하기');
                } else if(data === 'ok3'){
                	order_status.text('배송조회');
                	openRevBtn.text('문의하기');
                } else if(data === 'ok4'){
                	order_status.text('배송조회');
                } else {
                	console.log('상태 조회 오류 발생 code 1');
                }
            },
            error: function() {
                console.log('상태 조회 오류 발생 code 2');
            }
        });
    });
}

// 주문목록 불러오기
function loadOrder(){
	let id = '<%= session.getAttribute("id") %>';
// 	console.log(id);
	
	$.ajax({
     url: '/load_order',
     type: 'post',
     data: {id: id },
     dataType: 'JSON',
     success: function(data) {
     	if(data=='' || data==null) {
				
			} else {
				 for (let i = 0; i < data.length; i++) {
						let str = "<tbody><tr><td>" + data[i]['order_num'] + "</td>"
						str += "<td><img src='" + data[i]['book_cover'] + "' class='img-resize' alt='' picname='"+ data[i]['book_num'] + "'></td>";
						str += "<td class=tblName><span class='pName'>" + data[i]['book_name'] + "</span><br><span class='pWriter'>" +data[i]['author'] + "</span></td>";
						str += "<td>" + data[i]['order_date'] + "</td>";
						str += "<td class=tblMoney><span class='ptotal'>" + data[i]['total'] + "원</span><br><span>" + data[i]['o_qty'] + "권 </span><br><span class=pay_way>" + data[i]['pay_way'] + "</span></td>";
						str += "<td class = 'tdStatus'><span class='spanStatus'>" + data[i]['status'] +"</span><div><button class='btn btn-outline-primary' id=order_status name=" + data[i]['order_num'] + "></button></div></td>";
						str += "<td  class = 'tdCart'><button id='btncartIn' class='btn btn-outline-secondary' name='" + data[i]['book_num'] + "," + data[i]['o_qty']
		 					+ "'>장바구니 담기</button><button class='btn btn-outline-secondary1' id='openRev_btn' name='"
	 					    + data[i]['order_num'] + "'></button></td></tbody>";
						
					    $('.tblOrder').append(str);
			    
					  }
				 find_review();
				 find_status();
			}
     },
     error: function() {
         console.log('loadOrder 오류 발생');
     }
 });
}
/*  페이지네이션  */
var $setRows = $('#setRows');

$setRows.submit(function (e) {
	e.preventDefault();
	var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

// 	console.log("rowPerPage : " + rowPerPage);

	var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
	if (!rowPerPage) {
		alert(zeroWarning);
		return;
	}
	$('#nav1').remove();
	var $board = $('#tblOrder');

	$('.bSearch').after('  <div id="nav1">');


	var $tr = $('.tblOrder tbody tr');
	var rowTotals = $tr.length;
// 	console.log("rowTotal : " + rowTotals);

	var pageTotal = Math.ceil(rowTotals/ rowPerPage);
	var i = 0;

	for (; i < pageTotal; i++) {
		$('<a href="#"></a>')
				.attr('rel', i)
				.html(i + 1)
				.appendTo('#nav1');
	}

	$tr.addClass('off-screen')
			.slice(0, rowPerPage)
			.removeClass('off-screen');

	var $pagingLink = $('#nav1 a');
	$pagingLink.on('click', function (evt) {
		evt.preventDefault();
		var $this = $(this);
		if ($this.hasClass('active')) {
			return;ㄴ
		}
		$pagingLink.removeClass('active');
		$this.addClass('active');

		// 0 => 0(0*4), 4(0*4+4)
		// 1 => 4(1*4), 8(1*4+4)
		// 2 => 8(2*4), 12(2*4+4)
		// 시작 행 = 페이지 번호 * 페이지당 행수
		// 끝 행 = 시작 행 + 페이지당 행수

		var currPage = $this.attr('rel');
		var startItem = currPage * rowPerPage;
		var endItem = startItem + rowPerPage;

		$tr.css('opacity', '0.0')
				.addClass('off-screen')
				.slice(startItem, endItem)
				.removeClass('off-screen')
				.animate({opacity: 1}, 300);

	});

	$pagingLink.filter(':first').addClass('active');

});

$setRows.submit();	



</script>
</html>