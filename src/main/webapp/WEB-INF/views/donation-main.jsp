<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/donation.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<title>북메이트 | 기부앤테이크</title>
</head>
<body>

<input value="<%=session.getAttribute("id")%>" hidden>

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

        <div class="contentBody-main">
        	<div class="slider" id="contentBanner">
       			<img src="/img/banner1.png" class="banner_img" alt="Image 1">
       			<img src="/img/banner2.png" class="banner_img" alt="Image 2">
	        	
	        	
	        </div>
	        <div class="content_All-main">
	        	<div class="infomation">
	        		<div class="info1">
	        		<h3>이런 자료를 보내주세요!</h3>
	        		<hr>
	        		<ul>
	        			<li>일반도서, 어린이 · 청소년 도서</li>
	        			<li>학술도서, 연구보고서, 세미나 · 회의자료</li>
	        			<li>한국 관련 외국자료</li>
	        			<li>기부앤테이크 제외 자료
	        				<ul>
	        					<li>외국서(한국관련 외국서는 기부앤테이크 가능)</li>
	        					<li>개인복사물</li>
	        					<li>오 · 훼손자료</li>
	        				</ul>
	        			</li>
	        		</ul>
	        		</div>
	        		<div class="info2">
	        		<h3>자료를 보내는 방법은 아래와 같습니다.</h3>
	        		<hr>
	        		<ul>
	        			<li>북메이트에서 기부앤테이크 신청을 합니다.</li>
	        			<li>북메이트에 방문(평일 10:00~18:00), 우체국 택배 등의 방법으로 자료를 보냅니다.</li>
	        			<li>택배 기사님의 노고를 고려하여 가급적 한 번에 담는 책이 20권 내외, 15kg가 넘지 않도록 보내 주시면 감사하겠습니다.</li>
	        			<li>담당자와 상담이 필요한 경우 기부앤테이크 신청서에 체크하거나, 전화, 메일로 연락 주시기 바랍니다.</li>
	        		</ul>
	        		</div>
	        		<div class="info3">
	        		<h3>기부앤테이크를 신청해주신 분께는 이렇게 감사드립니다.</h3>
	        		<hr>
	        		<ul>
	        			<li>북메이트 자료로 등록되는 자료에 기증자명을 표시합니다.</li>
	        			<li>북메이트에서 검토, 확인 후 책이 필요한 정보소외지역(작은도서관, 지역아동센터 등)에 기부 시 기증자명을 표시합니다.</li>
	        			<li>기부앤테이크 신청 후 보내주신 자료 확인 시 [마이페이지] - [기부현황확인] 탭에서 확인하실 수 있습니다.</li>
	        		</ul>
	        		</div>
	        	</div>
	        	<br>
	            <button class="submit_btn" id="submit_btn">기부앤테이크 신청하기</button>
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
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>

<script>
$(document)
.ready(function(){
	imgslider();
	setInterval(changeText, 1500);
})
.on('click','#submit_btn',function(){
	let m_id = '<%=session.getAttribute("id")%>';
	if(m_id=='' || m_id==null || m_id=='null') {
		alert('로그인 후 이용해주세요');
		document.location="/login";
	} else {
		document.location="/donation-submit";
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

// 이미지 슬라이드 함수
function imgslider(){
$('.slider').slick({
       dots: false, // 점 표시
       arrows: false, // 좌우 화살표 표시
       autoplay: true, // 자동 재생
       autoplaySpeed: 2000 // 재생 간격 (ms)
     });
}

</script>
</html>