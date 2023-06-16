<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/main.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/main.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <title>북메이트</title>
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
    <div class="category">
    	<ul class="category_ul"  id="nav">
			<li class="category_li"><a href="/category1">코미디</a></li>
			<li class="category_li"><a href="/category2">로맨스</a></li>
			<li class="category_li"><a href="/category3">판타지</a></li>
			<li class="category_li"><a href="/category4">공포/스릴러/추리</a></li>
			<li class="category_li"><a href="/category5">드라마/가족</a></li>
            <li class="category_li"><a href="/donation">기부앤테이크<i class='dropDown'></i></a>
            </li>
             
            <li class="category_li">
            	<div class="search">
            		<select name="type" id="searchForm">
							<option value="book_name||AUTHOR">전체검색</option>
							<option value="book_name">제목</option>
							<option value="AUTHOR">저자</option>
					</select> 
                	<input type="text" id="keyword" name="keyword" class="searchBox" placeholder="  검색어를 입력하세요">
                	<img src="/img/search.png" class="search_img" id=Submit alt="Submit" type="submit">
                </div>
            </li>
		</ul>
	</div>

        <div class="container">
            <div class="column column1">
                <div class="container2">
            <button id="open-modal-btn" style="background-color: #4CAF50; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px;">감정블록 열기</button>
                    <div class="chat-content" id="chat-content">
                        <div class="line">
                            <span class="chat-box">넌 누구니?</span>
                        </div>
                        <div class="line2">
                            <span class="chat-box mine">저는 감정을 분석해서 책을 추천해주는 챗봇입니다. <br><br>"수동모드" 입력시 수동추천모드로 진입합니다.</span>
                        </div>
                    </div>
                    <div class="input-container">
                        <input class="chat-box" id="input" placeholder="메시지 입력">
                        <button id="send">전송</button>
                    </div>
                </div>
            </div>
            <div class="column column2">
                <div>

                    <div class="tab-menu">
                        <div id="bestSeller-tab" class="tab-item active">추천 베스트셀러</div>
                  
                    </div>
                    <div id="bestSeller" class="content-container active">
                        <div class="grid-container" id="grid-container">
                        
                    	</div>

                </div>

            </div>
        </div>
	</div>
</div>

		<div id="loading">
		    <img src="https://studentrights.sen.go.kr/images/common/loading.gif">
		  </div>
			<div id="modal-container">
    <div id="modal-content">
      <h2>감정블록</h2>
      <p>나는 감정블록이에요</p>
      <div id="color-list">
        <div class="color-item" style="background-color: #1E90FF;"></div>
        <div class="color-item" style="background-color: #00BFFF;"></div>
        <div class="color-item" style="background-color: #87CEFA;"></div>
        <div class="color-item" style="background-color: #ADD8E6;"></div>
        <div class="color-item" style="background-color: #B0C4DE;"></div>
      </div>
    </div>
  </div>
	<input id="id" value="<%=session.getAttribute("id")%>" hidden>
	        <div class="footer">
           
        <div class="footer2"> 
                COMPANY HUMAN<br>
                TEL:010-3024-8400<br>
                OWNER: 김준하<br>
                BUSINESS LICENSE: 422-4212-421<br>
                Copyright by BookMate<br>
                ADDRESS: 충청남도 천안시 동남구<br>
                Mail:info@korea.com
                개인정보취급관리자: 김준하
            </div>
            <div class="footer3"> 
                
                <span style="opacity: 0.7;">CS CENTER<br></span>
                
                <span style="color:red; font-weight:bold;">070-4140-0732</span><br>
                <span style="opacity: 0.7;"> MON-FRI AM 10 - PM 6<br></span>
                <span style="opacity: 0.7;"> LUNCH PM1-PM2</span>
                <span style="opacity: 0.7;"> SAT.SUN/HOLIDAY OFF<br><br></span>
                <span style="opacity: 0.7;"> 하나은행 302123131545301</span>
    
    
            
            </div>
            <div class="footer4">
                <span style="color:red; font-weight:bold;">교환/반품 주소</span><br>
                <span style="opacity: 0.7;">충청남도 서북구<br></span>
                <span style="opacity: 0.7;">  CJ대한통운 1588 1255 <br></span>
                <a href="https://www.cjlogistics.com/ko/tool/parcel/tracking">배송위치 조회하기</a><br>
                <span style="opacity: 0.7;">고객님은 안전거래를 위해 결제시 저희 쇼핑몰에게</span>
                <span style="opacity: 0.7;">가입한 KCP 에스그로 구매안전 서비스를 이용할수있습니다.</span>
                <span style="opacity: 0.7;"><button id=submit>서비스가입 사실확인</button> </span><br>            
                <span style="opacity: 0.7;">COPYRIGHT ALL RIGHT RESERVED</span>
               
                
            </div>
        </div>

</body>

</html>