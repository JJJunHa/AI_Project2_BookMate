<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/donation.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<title>북메이트 - 기부앤테이크</title>
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
				<a href="/login">로그인</a>&nbsp;|&nbsp;<a href="/login" onclick="alert('로그인 후 이용해주세요')">장바구니</a>&nbsp;|&nbsp;<a href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
			</div>
		
		<% } %>
    
    <div class="name">지금 어떤 책을 읽어야 할지 고민하는 사용자의 상태에 맞는 책을 추천해주는 서비스</div>
<!--     <div class="category"> -->
<!--     	<ul class="category_ul"  id="nav"> -->
<!-- 			<li class="category_li"><a href="/category1">코미디</a></li> -->
<!-- 			<li class="category_li"><a href="/category2">로맨스</a></li> -->
<!-- 			<li class="category_li"><a href="/category3">판타지</a></li> -->
<!-- 			<li class="category_li"><a href="/category4">공포/스릴러/추리</a></li> -->
<!-- 			<li class="category_li"><a href="/category5">드라마/가족</a></li> -->
<!--             <li class="category_li"><a href="/donation">기부앤테이크<i class='dropDown'></i></a> -->
<!--             </li> -->
             
<!--             <li class="category_li"> -->
<!--             	<div class="search"> -->
<!--                 	<input type="text" class="searchBox" placeholder="  검색어를 입력하세요"> -->
<!--                 	<img src="/img/search.png" class="search_img"> -->
<!--                 </div> -->
<!--             </li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
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
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>

<script>
$(document)
.ready(function(){
	imgslider();
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