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
    <div class="main">
       <div class="logo">
    	<a href="/main"><img src="/img/logo.png" class="logoImg"></a>
    </div>
    <% if(session.getAttribute("id")!=null){ %>
    
    <div class="menu">
        <a href="/logout">로그아웃</a>&nbsp;|&nbsp;<a href="/cart">장바구니</a>&nbsp;|&nbsp;<a href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
    </div>
   
   <% } else {%>
   
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
                	<input type="text" class="searchBox" placeholder="  검색어를 입력하세요">
                	<img src="/img/search.png" class="search_img">
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
                        <div id="bestSeller-tab" class="tab-item" onclick="changeTab('bestSeller')">추천 베스트셀러</div>
                        <div id="donation-tab" class="tab-item active" onclick="changeTab('donation')">기부하기</div>
                        <div id="notification-tab" class="tab-item" onclick="changeTab('notification')">공지사항</div>
                    </div>
                    <div id="bestSeller" class="content-container">
                        <div class="grid-container" id="grid-container">
                        
                    </div>


                    <div id="donation" class="content-container active">
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




                    </div>
                    <div id="notification" class="content-container">
							 

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

</body>

</html>