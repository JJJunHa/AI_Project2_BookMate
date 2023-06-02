<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/main.css">
	<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="js/main.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <title>북메이트 | 책과 아름다운 동행 </title>
</head>

<body>

	<input value="<%=session.getAttribute("id")%>" hidden>

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
                        <div id="bestSeller-tab" class="tab-item active" onclick="changeTab('bestSeller')">추천 베스트셀러</div>
                        <div id="donation-tab" class="tab-item" onclick="changeTab('donation')">기부하기</div>
                        <div id="notification-tab" class="tab-item" onclick="changeTab('notification')">공지사항</div>
                    </div>
					
                    <div id="bestSeller" class="content-container active">
                        <div class="grid-container" id="grid-container">
                        
                    </div>


                    <div id="donation" class="content-container">




                    </div>
                    <div id="notification" class="content-container">


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
	

</body>

</html>