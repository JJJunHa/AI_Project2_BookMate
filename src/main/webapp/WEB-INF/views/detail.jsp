<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="css/detail.css"> -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<title>북메이트</title>
</head>
<style>
.main {
    width:100%;
    height:100%;
    /* border: 1px solid black; */
}
.logo {
    width:100%;
    height:100px;
    text-align: center;
}
.logoImg {
    width:20%;
    margin-top:20px;
    /* border: 1px solid black; */
    display: inline-block;
}
/* 로그인, 장바구니, 마이페이지, 고객센터 연결 */
.menu {
    width:100%;
    height:40px;
    background-color: white;
    text-align : right;
}
a {
    text-decoration-line: none;
}
a:link {
    color : gray;
}
/* 색상상자 */
.name{
    width:100%;
    height:20px;
    background-color: #97d4f7;
    color:white;
    text-align : center;
    padding : 20px 0;
}
/* 카테고리 */
#nav {
	list-style:none;
	height: 40px;
	padding: 5px 1px;
	margin: 0 auto;
	text-align: center; /* 가운데 정렬을 위해 추가 */
}
#nav li {
 	display: inline-block; /* 가로로 나열하기 위해 수정 */
/* 	float:left; */
	position:relative;
	margin-top:0.5%;
	padding:0;
}
#nav li a {
	display:block;
	padding:7px 8px;
	margin:0;
	text-decoration: none;
}
#nav ul {
	list-style: none;
	margin:0;
	padding:0;
	position: absolute;
	left:0;
	top:40px;
	text-align: center;
	opacity: 0;
}

.category {
    width:100%;
    height:60px;
    background-color: white;
    text-align: center; /* 가운데 정렬을 위해 추가 */
/*     margin-left:27%; */
}
.category_ul {
/*     float:center; */
 	display: inline-block; /* 가로로 나열하기 위해 수정 */
}
.category_li {
/*     float: left; */
	display: inline-block; /* 가로로 나열하기 위해 수정 */
    margin-right: 10px;
}
a:hover {
        color: #97d4f7;
}
/* 검색창 */
#searchForm {
	border:none;
	height: 30px;
	outline: none;	
/* 	border-radius: 8px; */
	width: 25%;
	margin-right: 1%;
	 cursor: pointer;
}
.search {
    position: relative;
    width: 105%;
    
}
.searchBox {
    width: 220px;
    border: 1px solid #bbb;
    border-radius: 15px;
    padding: 5px 5px;
    font-size: 14px;
    margin-top:2%;
}
.search_img {
    position : absolute;
    width: 17px;
    top: 10px;
    right: 15px;
    cursor: pointer;
}
/* ----------------------------------------------*/
.content-main {
	width:85%;
    border: 2px solid rgb(216, 216, 216);
    text-align: center; 
    margin:0 auto;
    margin-bottom: 5%;
}
.content-sub {
	width:90%;
    height:550px;
/*     border: 2px solid red; */
    margin:0 auto;
}
.content-title {
	width:100%;
	height:80px;
}
#info-title {
	font-size: 25px;
	font-weight: bold;
	margin-top:5%;
}
.content-info {
	width:100%;
	height:450px;
	margin:0 auto;
/*     border: 2px solid red; */
}

.info1 {
   text-align: left;
   float: left;
   height:450px;
   width:30%;
/*    border: 2px solid blue; */
}
.info2 {
   float: left;
   height:450px;
   width:30%;
   margin-left: 4%;
/*    border: 2px solid blue; */
}
.info3 {
   float: left;
   height:450px;
   width:28%;
   margin-left:5%;
/*    border: 2px solid blue; */
}
#info-write {
	font-size: 18px;
	margin-left: 20%;
	font-weight: bold;
}
#info-date {
	font-size: 15px;
	color: gray;
	margin-left: 20%;
}
#info-rating {
	font-size: 20px;
	margin-left: 20%;
	color: red;
	font-weight: bold;
}
/* .info { */
/* 	border: 0.5px solid lightgray; */
/* 	width:80%; */
/* 	height:100px; */
/* 	margin: 0 auto; */
/* 	margin-top: 10%; */
/* } */
.book_img {
	width:310px;
	height:450px;
	box-shadow: 3px 3px 3px 3px lightgray;
	position: relative;
	transition: transform 0.3s;
}
.book_img:hover {
	width:330px;
	height:470px;
	transform: translate(-10px, -10px);
}
#info-price1 {
	font-size: 18px;
	font-weight: bold;
	width:30%;
}
#info-price2 {
	font-size: 15px;
	width:30%;
}
.tblprice {
	width:95%;
	margin: 0 auto;
	margin-top: 5%;
}
.tblprice tr {
	height:50px;
}
.content-coment {
	width: 100%;
	margin-top: 3%;
	margin-bottom: 5%;
}
.info-coment {
	margin-top: 5%;
}
#info-content1 {
	font-weight: bold;
	font-size: 25px;
}
#info-content2 {
	margin-top: 10%;
	line-height: 35px;
	width: 95%;
	margin: 0 auto;
}
/* 고정 메뉴바 만들기 */
.menubar {
	width: 100%;
	height: 70px;
	display:flex;
	position:sticky;
  	top:0px;
}
/* 버튼 누르면 이동 */
.spantrans1, .spantrans2, .spantrans3{
    background-color:#f0f0f0;
/* 	border: 2px solid rgb(216, 216, 216); */
	width:33.33%;
    height:100%;
    font-size:17px;
    display: flex;
    justify-content: center;
    align-items: center;
	margin-bottom:3px;
	float:left;
	overflow:hidden;
}
.divReview {
	margin-top: 5%;

	margin-right: 1%;
/* 	border: 2px solid red; */
}
#info-review {
	font-weight: bold;
	font-size: 25px;
}
.transinfo {
	margin-top: 5%;
/* 	border: 2px solid red; */
	text-align: left;
}
#info-transinfo {
	font-weight: bold;
	font-size: 25px;
	text-align: center;
}

/* 버튼 */
.inputCart {
	width: 150px;
	height:40px;
	background-color: #f7598c;
	border:none;
	color:white;
	cursor: pointer;
}
.inputPay {
	width: 150px;
	height:40px;
	background-color: #f95353;
	border:none;
	color:white;
	cursor: pointer;
}

 /* 수량 버튼 만들기 */
.count-wrap {
	position: relative;
	padding: 0 38px;
	overflow: hidden;
	width: 40px;
}
.count-wrap > button {
	border: 0;
	background: #ddd;
	color: #000;
	width: 33px;
	height: 33px;
	position: absolute;
	top: 0;
	font-size: 20px;
}
.count-wrap > button.minus {left: 0;}
.count-wrap > button.plus {right: 0;}
.count-wrap > button.minus:hover,.count-wrap > button.plus:hover{
cursor:pointer;
}
.count-wrap .inp {
	border: 0;
	height: 33px;
	text-align: center;
	display: block;
	width: 80%;
}

/* 배송문의 */
.transli {
	list-style: none;
	position: relative;
    padding-left: 15px;
    font: 14px/1.7 'SDNeoL', 'notoL';
    color: #999;	
}
.transinfo, .divReview, .transinfo2, .copyright, .footer_new {
	 margin-left:15px;
}
.indoarea {
	color:#585858;
}
.trans1, .trans2, .trans3 {
	margin-left: 2%;
}
/* ---------------------------------------*/
/* 리뷰*/
.tblreview { 
	width: 100%;
	border-collapse: collapse;
	white-space: nowrap;
	text-align: left;
  	line-height: 1.5;
}
.tblreview tr th { 
	height: 50px;
	padding: 10px;
	font-weight: bold;
	color: #369;
	border-bottom: 3px solid #97d4f7;
}
.tblreview tr td { 
	height: 50px;
	padding: 10px;
  	border-bottom: 1px solid #ccc;
  	cursor: pointer;
}
.total {
	text-align:left;
	margin-top: 15%;
	margin-left: 5%;
}
.total {
	text-align: right;
}
#spanPrice {
	font-size:22px;
	font-weight: bold;
}
#spaninfo {
	font-size:18px;
}

a {
 	 text-decoration-line: none;
 	 text-align: center;
  	 color: inherit; /* 링크의 색상 제거 */
	}
	
/* dialog 만들기 */
.dialog-main {
	width: 100%;
}
.dialog-book {
	width: 95%;
	height: 110px;
	margin: 0 auto;
	border:0.5px solid lightgray;
}
.dialog-review {
	width: 100%;
	height: 520px;
	border-top:2px solid black;
/* 	border:1px solid blue; */
}
.view-img {
	float: left;
	width: 15%;
	text-align:center;
	margin-top:1.5%;
}
.view-info {
	float: left;
	width: 84%;
	margin-top: 0.5%;
}
.view_img {
	width: 60px;
	height: 90px;
}
.view-name {
	font-weight: bold;
	font-size: 15px;
}
.view-qty, .view-price {
	font-size: 12px;
}
/* ----------------------------------------*/
/* table css */
.dialog-table {
	width: 100%;
	margin-top: 0.5%;
	border-collapse: collapse;
}
input:focus {outline: none;} /* outline 테두리 없애기 */
.dialog-table tr {
	border:none;
	border-bottom: 1px solid lightgray;
}
.dialog-table th {
	width: 30%;
	height:60px;
}
.dialog-table td {
	width: 70%;
}
.dialog-id {
	width: 30%;
	height: 25px;
	font-size: 15px;
	border: none;
	outline: none;
	padding-left: 10px;
/* 	background-color: #F2F2F2; */
}
.dialog-text {
	width: 80%;
	height: 25px;
	font-size: 15px;
	border: none;
	outline: none;
	padding-left: 10px;
/* 	background-color: #F2F2F2; */
}
.dialog-rating {
	width: 30%;
	height: 25px;
	font-size: 15px;
	border: none;
	outline: none;
	padding-left: 10px;
}
/* -------------------------------------*/
/* 버튼 */
.dialog-btn {
	width: 100%;
	text-align: right;
}
.btn-rev {
	border: 0.5px solid lightgray;
	width: 10%;
	height: 35px;
	margin-bottom: 1%;
	cursor: pointer;
}
.summernote {
	height: 200px;               
    width: 770px;
    border: none;
	outline: none;
	padding-left: 10px;
}

/* ///드롭다운// */
.dropdown {
    position: relative;
    display: inline-block;
}

.dropbtn {
    font-size: medium;
    background-color: inherit;
    color : black;
    padding: 0;
    border: none;
    cursor: pointer;
}
.dropbtn:hover {
    color: #97d4f7;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 150px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    text-align: center;
     transform: translateX(-50%); /* Adjust for centering */
}

.dropdown-content a {
    color : gray;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {
    background-color: #97d4f7;
}

.dropdown:hover .dropdown-content {
    display: block;
    
}
/* 저작권 */
.footer_img {
	width: 15%;
	margin-top:1%;
/* 	height:100px; */
}
footer {
    display: block;
    margin-bottom:10px;
	padding:10px;
}
.footer-layer2 {
	display: flex;
}
.footer_new .footer-layer2 {
    width: 100%;
    height: 170px;
    margin: 30px auto;
    font-size: 12px;
    color: #555;
    line-height: 150%;
}
.footer_new {
    border-top: #ddd solid 2px;
    background: #fff;
}
.footer-1, .footer-2, .footer-3 {
	list-style: none;
	position: relative;
    padding-left: 15px;
    font: 14px/1.7 'SDNeoL', 'notoL';
    color: #999;		
}
.footer-1 {
	width: 25%;
}
.footer-2 {
	width: 45%;
}
.footer-3 {
	width: 30%;
}
.titlename {
	color:#58ACFA;
	margin-left:1%;
}
.provTit {
    margin: 14px 0 5px;
/*     font: 15px/1.5 'SDNeoL', 'notoR'; */
    color: #222;
    }
    
/* 상세페이지에 detetail img */
.book_detail {
	width: 100%;
	margin-top: 3%;
	margin-bottom: 1%;
}    
.detail_img {
	width: 900px;
}
    
</style>
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
				&nbsp;|&nbsp;<a href="/board">고객센터</a>
			</div>
		
		<% } else { %>
		
			<div class="menu">
				<a href="/login">로그인</a>&nbsp;|&nbsp;<a href="/certified">회원가입</a>&nbsp;|&nbsp;<a href="/login" onclick="alert('로그인 후 이용해주세요')">장바구니</a>&nbsp;|&nbsp;<a href="/login" onclick="alert('로그인 후 이용해주세요')">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
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
		</ul>
	</div>
        <div class="content-main">
        	<div class="content-sub">
        		<div class="content-title">
        			<p id="info-title"></p>
        		</div>
        		
        		<div class="content-info">
        			<div class="info1">
        			<input type=hidden id=book_num name=book_num value="${num}">
        				<p id="info-write"></p>
        				<p id="info-date"></p>
        				<p id="info-rating"></p>
        			</div>
        			
					<div class=info2 id= info2>
        			</div>
        			
        			<div class=info3>
        				<table class="tblprice">
        					<tr>
        						<td id=info-price1>가격</td>
        						<td id=info-price2></td>
        					</tr>
        					<tr><td colspan=2><hr></td></tr>
        					<tr><th>수량</th>
								<td class="price">
									<div class="count-wrap _count">
									    <button type="button" class="minus" id=minus>-</button>
									    <input type="text" name="qty" id=qty class="inp" value="1" />
									    <button type="button" class="plus" id=plus>+</button>
									</div>
								</td></tr>
								
        					<tr>
        						<td><br><button type="button" class="inputCart" id=inputCart>카트에 넣기</button></td>
        						<td><br><button type="button" class="inputPay" id=inputPay>바로구매</button></td>
        					</tr>
        				</table>
        				
        				<div class=total>
        					<span id=spaninfo>총 주문금액</span>
        					<span id=spanPrice></span>
        					<span id=spaninfo>원</span>
        				</div>
        			</div>
        		</div>
        	</div>
        	
       		<div class="content-coment">
       			<div class=menubar>
       				<span id=spantrans1 class=spantrans1><a href="#" data-anchor="info-coment">상품상세</a></span>
      				<span id=spantrans2 class=spantrans2><a href="#" data-anchor="divReview">상품리뷰</a></span>
      				<span id=spantrans3 class=spantrans3><a href="#" data-anchor="transinfo">배송/교환/반품 안내</a></span>
       			</div>
        		<div class=info-coment id=info-coment>
        			<p id="info-content1">책 소개</p><br>
        			<p id="info-content2"></p>
        			<div class="book_detail" id=book_detail></div>
        		</div>
        		<div class="divReview" id="divReview">
        			<p id="info-review">책 리뷰</p><br>
        			
        			<table id=tblreview class=tblreview>
        				
        			</table>
        		</div>
        		<div class="transinfo" id="transinfo">
        			<p id="info-transinfo">배송/교환/반품 안내</p><br>
        				<div class=trans1>
				      		<h4 class=indoarea>배송 구매/배송안내</h4>
				      			<ul>
				      			<li class=transli><span class=num>1.</span>
				      				배송지역 : 전국 (도서 산간지역은 배송이 제한될 수 있습니다.)</li>
				      			<li class=transli><span class=num>2.</span>
				      				배송기간 : 주문결제 후 평균 3일 이내 배송(일, 공휴일 제외) 단, 도서/산간지역은 배송일이 추가적으로 소요될 수 있으며, 상품 보유현황에 따라 배송일이 지연될 수 있습니다.</li>
				      			<li class=transli><span class=num>3.</span>
				      				배송방법 : 배송 당일 오전에 SMS로 배송예정을 알리는 문자를 발송해드리며, 스팸 처리 등으로 인해 문자를 받지 못하는 경우가 있으니 주문내역에서 배송 상황을 확인해주시기 바랍니다.</li>		
				      			</ul>
				      	</div>
				      	<div class=trans2>
				      		<h4 class=indoarea>교환/반품 안내</h4>
				      			<ul>
				      			<li class=transli><span class=num>1.</span>
				      				단순변심에 의한 상품의 교환/반품은 실제 상품 등을 수령하신 날부터 7일 이내에 가능합니다.</li>
				      			<li class=transli><span class=num>2.</span>
				      				교환/반품 배송비 : 구매하신 상품의 교환/반품을 하시는 경우에는 상품 등의 반환에 필요한 비용(2,500원)을 고객님이 부담하셔야 합니다. <br>
				      				&nbsp;&nbsp;&nbsp;단, 고객님이 받으신 상품 등의 내용이 표시/광고 내용과 다르거나 제품하자/오배송 등으로 교환/반품하시는 경우에는, 교환/반품 배송비는 무료입니다.</li>
				      			<li class=transli><span class=num>3.</span>
				      				제품을 교환/반품 하기 전 고객센터로 미리 연락을 주셔야 합니다.</li>		
				      			<li class=transli><span class=num>4.</span>
				      				환불지연 배상금 지급 안내 : 대금 환불 및 환불 지연에 따른 배상금 지급 조건, 절차 등은 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 처리합니다.</li>	
				      			</ul>
				      		
				      	</div>
				      	<div class=trans3>
				      		<h4 class=indoarea>기타안내</h4>
				      			<ul>
				      			<li class=transli><span class=num>1.</span>
				      				미성년자 계약 취소에 대한 안내 : 해당 상품 구매 계약자가 미성년자일 경우 법정대리인이 동의하지 아니하면 미성년자 본인 또는 법정대리인은 이 계약을 취소할 수 있습니다.</li>
				      			<li class=transli><span class=num>2.</span>
				      				고객센터 운영시간 : (월~목) 09:00~18:00 , (금) 09:00~17:30 , 토/일/공휴일 휴무</li>		
				      			</ul>
				      	</div>
        		</div>		
       		</div> 	
        </div>
</div>

<!-- dialog -->
<div class="dialog-view" id=dialog-view style="display:none;">
	<div class=dialog-main>
		<p style="font-size:15px; text-align:center;"> <b>상품 후기 작성하기</b></p>
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
					<th>아이디</th><td><input type="text" class=dialog-id id=dialog-id readonly></td>
				</tr>
				<tr>
					<th>제목</th><td><input type="text" class=dialog-text id=dialog-text readonly></td>
				</tr>
				<tr>
					<th>평점</th><td><input type="text" class=dialog-rating id=dialog-rating readonly></td>
				</tr>
				<tr>
					<th style="height:300px;">내용</th><td><textarea id="summernote" name="summernote" class=summernote readonly></textarea></td>
				</tr>
			</table>
			&nbsp;<font id="check_content" size=2></font>
		</div>
		<div class=dialog-btn>
			<button type="button" class="btn-rev" id=modify-rev>수정</button>
			<button type="button" class="btn-rev" id=delete-rev>삭제</button>
			<button type="button" class="btn-rev" id=cancel-rev>닫기</button>
		</div>
	</div>
</div>
<footer id="footer" class="footer_new">
         <h1><a href="/main" class="titlename"><img src="/img/footer_logo.png" class="footer_img"></a></h1>
              
		 
          <div class="footer-layer2">
              <div class="footer-1">
<!--                   <address> -->
                      상호명 및 호스팅 서비스 제공 : BookMATE<br>
                      대표이사 : 김준하<br>
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
                      <span id=emaildiv class=emaildiv>이메일 주소 무단 수집 거부 | </span> <span> 개인정보 보호책임자 정규화 |</span><span> 호스팅 서비스 제공자 ㈜BookMATE <br></span>
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
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@2.4.0/dist/tf.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs-vis"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<c:set var="fruits" value="${prod2}" />
<c:set var="rat" value="${rating}" />
<script>
/* var jsFruits = ["apple", "banana", "orange", "grape", "kiwi", "melon", "strawberry"];

for (var i = 0; i < jsFruits.length; i += 3) {
  slicedArray.push(jsFruits.slice(i, i + 3));
}

console.log(slicedArray[0]); */

var jsFruits = [];
<c:forEach items="${fruits}" var="fruit">
jsFruits.push('${fruit}');

</c:forEach>
// jsFruits는 JavaScript 배열이며, 서버 측의 fruits 값을 가집니다.
// 이 배열을 이용하여 JavaScript 코드를 작성하고 사용할 수 있습니다.
console.log(jsFruits); // 'apple'을 출력
var jsFruits = jsFruits.map(function(fruit) {
	  return parseFloat(fruit);
	});
	
	
var jsR = [];
<c:forEach items="${rat}" var="ra">
jsR.push('${ra}');

</c:forEach>
// jsFruits는 JavaScript 배열이며, 서버 측의 fruits 값을 가집니다.
// 이 배열을 이용하여 JavaScript 코드를 작성하고 사용할 수 있습니다.
console.log(jsR); // 'apple'을 출력
var jsR = jsR.map(function(ra) {
	  return parseFloat(ra);
	});
var slicedArray = [];
for (var i = 0; i < jsFruits.length; i += 3) {
	  slicedArray.push(jsFruits.slice(i, i + 3));
	}
	console.log(slicedArray[0]);
//기존 사용자의 나이와 구매시간을 확인해서 구매한 책과 평점을 확인해서
//유저의 신간에 대한 예상평점을 얻어 4점이상 이면 해당책을 추천해주는 기능구현
//기존유저 (나이)
//책(장르,감정)

const 보스톤_원인 = Array.from({ length: 20 }, () => slicedArray[0]);
 for(var i = 1; i< jsR.length; i++ ){
	보스톤_원인.push(...Array(5).fill([10,1,1]));
	보스톤_원인.push(...Array(5).fill([20,1,1]));
	보스톤_원인.push(...Array(5).fill([30,1,1]));
	보스톤_원인.push(...Array(5).fill([40,1,1]));
	보스톤_원인.push(...Array(5).fill([50,1,1]));
} 
for(var i = 1; i< jsR.length; i++ ){
	보스톤_원인.push(...Array(20).fill(slicedArray[i]));
	보스톤_원인.push(...Array(10).fill([10,1,1]));
	보스톤_원인.push(...Array(20).fill(slicedArray[i]));
	보스톤_원인.push(...Array(10).fill([20,1,1]));
	보스톤_원인.push(...Array(20).fill(slicedArray[i]));
	보스톤_원인.push(...Array(10).fill([30,1,1]));
	보스톤_원인.push(...Array(20).fill(slicedArray[i]));
	보스톤_원인.push(...Array(10).fill([40,1,1]));
	보스톤_원인.push(...Array(20).fill(slicedArray[i]));
	보스톤_원인.push(...Array(10).fill([50,1,1]));
	보스톤_원인.push(...Array(20).fill(slicedArray[i]));
}
  for(var i = 1; i< jsR.length; i++ ){
	보스톤_원인.push(...Array(5).fill([10,1,1]));
	보스톤_원인.push(...Array(5).fill([20,1,1]));
	보스톤_원인.push(...Array(5).fill([30,1,1]));
	보스톤_원인.push(...Array(5).fill([40,1,1]));
	보스톤_원인.push(...Array(5).fill([50,1,1]));
}  

      

//유저가 방문방의 별점
console.log(보스톤_원인);

const 보스톤_결과 = Array.from({ length: 20 }, () => jsR[0]);
for(var i = 1; i< jsR.length; i++ ){
	보스톤_결과.push(...Array(5).fill(0));
	보스톤_결과.push(...Array(5).fill(0));
	보스톤_결과.push(...Array(5).fill(0));
	보스톤_결과.push(...Array(5).fill(0));
	보스톤_결과.push(...Array(5).fill(0));
}
for(var i = 1; i< jsR.length; i++ ){
	보스톤_결과.push(...Array(20).fill(jsR[i]));
	보스톤_결과.push(...Array(10).fill(0));
	보스톤_결과.push(...Array(20).fill(jsR[i]));
	보스톤_결과.push(...Array(10).fill(0));
	보스톤_결과.push(...Array(20).fill(jsR[i]));
	보스톤_결과.push(...Array(10).fill(0));
	보스톤_결과.push(...Array(20).fill(jsR[i]));
	보스톤_결과.push(...Array(10).fill(0));
	보스톤_결과.push(...Array(20).fill(jsR[i]));
	보스톤_결과.push(...Array(10).fill(0));
	보스톤_결과.push(...Array(20).fill(jsR[i]));
}
 for(var i = 1; i< jsR.length; i++ ){
	보스톤_결과.push(...Array(5).fill(0));
	보스톤_결과.push(...Array(5).fill(0));
	보스톤_결과.push(...Array(5).fill(0));
	보스톤_결과.push(...Array(5).fill(0));
	보스톤_결과.push(...Array(5).fill(0));
}  

      

//유저가 구해한 책의 별점
console.log(보스톤_결과);

//도서의 연령별 평점을 구해주세요.
const 질의데이터=[
[10,1,1],
[20,1,1],
[30,1,1],
[40,1,1],
[50,1,1],
];

//제시한 연령 중 추천순위가 된다.     
       
  
       // 1. 과거의 데이터를 준비합니다. 
       var 원인 = tf.tensor(보스톤_원인);
       var 결과 = tf.tensor(보스톤_결과);
	var 질의 =tf.tensor(질의데이터);

       // 2. 모델의 모양을 만듭니다. 
       var X = tf.input({ shape: 3 });
       var H1 = tf.layers.dense({ units: 4, activation:'relu' }).apply(X);
       var H2 = tf.layers.dense({ units:4, activation:'relu' }).apply(H1);
       var Y = tf.layers.dense({ units: 1 }).apply(H2);
       var model = tf.model({ inputs: X, outputs: Y });
       var compileParam = { optimizer: tf.train.adam(), loss: tf.losses.meanSquaredError }
       model.compile(compileParam);
       tfvis.show.modelSummary({name:'요약', tab:'모델'}, model);

       // 3. 데이터로 모델을 학습시킵니다. 
//        var fitParam = {epochs:500}
       var _history = [];
       var fitParam = { 
         epochs: 200, 
         callbacks:{
           onEpochEnd:
             function(epoch, logs){
               console.log('epoch', epoch, logs, 'RMSE=>', Math.sqrt(logs.loss));
               _history.push(logs);
               tfvis.show.history({name:'loss', tab:'역사'}, _history, ['loss']);
             }
         }
       } // loss 추가 예제
       model.fit(원인, 결과, fitParam).then(function (result) {
            
           // 4. 모델을 이용합니다. 
           // 4.1 기존의 데이터를 이용
           var 예측한결과 = model.predict(질의);
           예측한결과.print();
                 var myArray= 예측한결과.dataSync();
                 console.log(myArray);
                 console.log(myArray[0]);
                 var max = Math.max.apply(null, myArray);
                 console.log(max);
                 if (max === myArray[0]) {
                	  alert("10대가 선호하는 도서입니다.");
                	}
                 if (max === myArray[1]) {
                	  alert("20대가 선호하는 도서입니다.");
                	}
                 if (max === myArray[2]) {
                	  alert("30대가 선호하는 도서입니다.");
                	}
                 
                 if (max === myArray[3]) {
                	  alert("40대가 선호하는 도서입니다.");
                	}
                 if (max === myArray[4]) {
               	  alert("50대가 선호하는 도서입니다.");
               	}
       });  



$(document)
.ready(function(){
	loadData();
	loadReview();  
	setInterval(changeText, 1500);
	
	$('#summernote').summernote({
        height: 200,                 
        width: 770,         
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
    
$('#summernote').summernote('disable')  //써머노트 readonly
})


.on('click','#tblreview tr:not(:first-child)', function(){
	let review_num=$(this).find('td:eq(0)').text();
// 	console.log(review_num);
	// dialog 열기
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
		url: '/dialog_review',
		type: 'post',
		data: { review_num: review_num },
		dataType: 'JSON',
		success: function(data) {
			let dialog_id = data[0]['id'];
			$('#dialog-id').val(dialog_id);
			
			let book_name = data[0]['book_name'];
			$('#view-name').text(book_name);
			let o_qty = data[0]['o_qty'];
			$('#view-qty').text(o_qty);
			let book_price = data[0]['book_price'];
			$('#view-price').text(book_price);
			let book_cover = '<img src="' + data[0]['book_cover'] + '" class="view_img" id="view_img">';
			$('#view-img').empty().append(book_cover);
			
			let rev_title = data[0]['rev_title'];
			$('#dialog-text').val(rev_title);
			
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
			
			$('#dialog-rating').val(rev_rating);
			
			let rev_content = data[0]['rev_content'];
// 			$('#summernote').val(rev_content);
			$('#summernote').summernote('code', rev_content);

			// id에 따라 수정, 삭제 버튼 보이기
		      if (dialog_id === '<%=session.getAttribute("id")%>') {
		        $('#modify-rev').show();
		        $('#delete-rev').show();
		      } else {
		        $('#modify-rev').hide();
		        $('#delete-rev').hide();
		      }
		  }
	});
})
// 닫기 버튼 클릭 시 dialog 닫기
.on('click','#cancel-rev',function(){
	$(this).closest('.ui-dialog-content').dialog('close');
})
// 삭제 버튼 클릭시 
.on('click','#delete-rev',function(){
	let confirmval = confirm('리뷰 삭제는 [마이페이지]-[리뷰 보기]에서 삭제가 가능합니다. \n마이페이지로 이동하시겠습니까?');
	if(confirmval) {
		document.location="/mypage";		
	} else {
	}
})
// 삭제 버튼 클릭시 
.on('click','#modify-rev',function(){
	let confirmval = confirm('리뷰 수정은 [마이페이지]-[리뷰 보기]에서 수정이 가능합니다. \n마이페이지로 이동하시겠습니까?');
	if(confirmval) {
		document.location="/mypage";		
	} else {
	}
})

// 수량 변경 시 총액 업데이트
.on('click', '#plus',function(){
	let quantity = parseInt($('#qty').val(), 10); // 수량을 가져와 정수로 변환
	let unitPrice = parseInt($('#info-price2').text(), 10); // 단가를 가져와 정수로 변환
	let totalPrice = quantity * unitPrice; // 수량과 단가를 곱하여 총액 계산
	
	console.log(totalPrice);
  	$('#spanPrice').text(totalPrice);
})
.on('click', '#minus',function(){
	let quantity = parseInt($('#qty').val(), 10); // 수량을 가져와 정수로 변환
	let unitPrice = parseInt($('#info-price2').text(), 10); // 단가를 가져와 정수로 변환
	let totalPrice = quantity * unitPrice; // 수량과 단가를 곱하여 총액 계산
	
	console.log(totalPrice);
  	$('#spanPrice').text(totalPrice);
})

// 카트에 넣기 클릭 시
.on('click','#inputCart', function(){
	let m_id = '<%=session.getAttribute("id")%>';
	let qty = $('#qty').val();
	let book_num = $('#book_num').val();
	console.log(m_id);
	console.log(qty);
	console.log(book_num);
	// 아이디가 없을 때
	if(m_id=='' || m_id==null || m_id=='null') {
		alert('로그인 후 이용해주세요');
		document.location="/login";
	} 
	// 아이디가 있을 때
	else {
		$.ajax({
			url: '/confirm_cart',
			type: 'post',
			data: { m_id: m_id,  qty:qty, book_num:book_num },
			dataType: 'text',
			success: function(data) {
				if(data == "already") {
					$.ajax({
						url: '/update_cart',
						type: 'post',
						data: { m_id: m_id, qty:qty, book_num:book_num },
						dataType: 'text',
						success: function(data) {
							if(data=="ok"){
								var confirmval = confirm('이미 장바구니에 존재하는 상품입니다. 장바구니로 이동하시겠습니까?');
								if(confirmval) {
									document.location="/cart";
								} else {
									
								}
							} else {
								alert("오류로 인해 잠시후에 다시 시도해주세요.");
							}
						}
					})
				} else if(data=="ok"){
							$.ajax({
								url: '/insert_cart',
								type: 'post',
								data: { m_id: m_id, qty:qty, book_num:book_num },
								dataType: 'text',
								success: function(data) {
									if(data=="ok"){
										var confirmval = confirm('장바구니에 상품을 담았습니다. 장바구니로 이동하시겠습니까?');
										if(confirmval) {
											document.location="/cart";
										} else {
											
										}
									} else {
										alert("오류로 인해 잠시후에 다시 시도해주세요.");
									}
								}
							})
				} else {
					alert("오류로 인해 잠시후에 다시 시도해주세요.");
				}
			}
		})
	}
	
	
})
//바로구매 클릭 시
.on('click', '#inputPay', function() {

    	let m_id = '<%=session.getAttribute("id")%>';
    	let qty = $('#qty').val();
    	let book_num = $('#book_num').val();
    	console.log(m_id);
    	console.log(qty);
    	console.log(book_num);

		
        // 아이디가 있을 때
        if(m_id=='' || m_id==null || m_id=='null') {
            alert('로그인 후 이용해주세요');
            document.location="/login";
        } 
        // 아이디가 없을 때
        else {

			var orderType = confirm("장바구니 상품까지 같이 주문하시겠습니까?");
  
			  if (orderType) {
			    $.ajax({
                url: '/confirm_cart',
                type: 'post',
                data: { m_id: m_id,  qty:qty, book_num:book_num },
                dataType: 'text',
                success: function(data) {
                    if(data == "already") {
                        $.ajax({
                            url: '/update_cart',
                            type: 'post',
                            data: { m_id: m_id, qty:qty, book_num:book_num },
                            dataType: 'text',
                            success: function(data) {
                                if(data=="ok"){
                                    
                                        document.location="/payment";
                                    
                                } else {
                                    alert("오류로 인해 잠시후에 다시 시도해주세요.");
                                }
                            }
                        })
                    } else if(data=="ok"){
                        $.ajax({
                            url: '/insert_cart',
                            type: 'post',
                            data: { m_id: m_id, qty:qty, book_num:book_num },
                            dataType: 'text',
                            success: function(data) {
                                if(data=="ok"){
                                   
                                        document.location="/payment";
                                    
                                } else {
                                    alert("오류로 인해 잠시후에 다시 시도해주세요.");
                                }
                            }
                        })
                    } else {
                        alert("오류로 인해 잠시후에 다시 시도해주세요.");
                    }
                }
            })
			    
			  } else {
                        $.ajax({
                            url: '/singleInsert_cart',
                            type: 'post',
                            data: { m_id: m_id, qty:qty, book_num:book_num },
                            dataType: 'text',
                            success: function(data) {
                                if(data=="ok"){
                                   
                                        document.location="/singlePayment";
                                    
                                } else {
                                    alert("오류로 인해 잠시후에 다시 시도해주세요.");
                                }
                            }
                        })
			    alert("단일 결제로 주문됩니다.");
			  }
			
			} 	
    });



// 수량옵션 
$('._count :button').on({
    'click' : function(e){
        e.preventDefault();
        var $count = $(this).parent('._count').find('.inp');
        var now = parseInt($count.val());
        var min = 1;
        var max = 999;
        var num = now;
        if($(this).hasClass('minus')){
            var type = 'm';
        }else{
            var type = 'p';
        }
        if(type=='m'){
            if(now>min){
                num = now - 1;
            }
        }else{
            if(now<max){
                num = now + 1;
            }
        }
        if(num != now){
            $count.val(num);
        }
    }
});
// 버튼 클릭시 스크롤 이동
$('.spantrans1').on('click',function(){
   var anchorId = $(this).find('a').attr('data-anchor');
   scroll_to_anchor_tab(anchorId);
})
$('.spantrans2').on('click',function(){
	var anchorId = $(this).find('a').attr('data-anchor');
   scroll_to_anchor_tab(anchorId);
})
$('.spantrans3').on('click',function(){
	var anchorId = $(this).find('a').attr('data-anchor');
   scroll_to_anchor_tab(anchorId);
})

//footer => dialog
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

// 스크롤 함수
function scroll_to_anchor_tab(anchor_id,speed) {
        if( !speed ) var speed = 'slow';
        var a_tag = $("#"+anchor_id);
        if(a_tag.length > 0){
            $('html, body').animate({
                scrollTop: a_tag.offset().top - $('').height() -  $('').height()
            }, speed);
        }
}

//book_num을 이용해서 책 정보/내용 가져오기
function loadData() {
	let num = $('#book_num').val();
	$.ajax({
		url: '/load_datail',
		type: 'post',
		data: { book_num: num },
		dataType: 'JSON',
		success: function(data) {
			let book_name = data[0]['book_name'];
			$('#info-title').text(book_name);

			let author = data[0]['author'];
			$('#info-write').text(author);

			let publication = data[0]['publication'];
			$('#info-date').text(publication);
			
			let rating = data[0]['rating'];
			if(rating == 0) {
				rating = '';
			} else if(rating == 1) {
				rating = '★';
			} else if(rating == 2) {
				rating = '★★';
			} else if(rating == 3) {
				rating = '★★★';
			} else if(rating == 4) {
				rating = '★★★★';
			} else if(rating == 5) {
				rating = '★★★★★';
			}
			
			$('#info-rating').text(rating);

			let book_cover = '<img src="' + data[0]['book_cover'] + '" class="book_img" id="book_img">';
			$('#info2').empty().append(book_cover);

			let book_price = data[0]['book_price'];
			$('#info-price2').text(book_price);
			$('#spanPrice').text(book_price);

			let book_content = data[0]['book_content'];
			$('#info-content2').text(book_content);
			
			
			console.log(data[0]['book_detail']);
			if(typeof data[0]['book_detail'] === 'undefined' || data[0]['book_detail'] === '' || data[0]['book_detail'] === null) {
				console.log(data[0]['book_detail']);
				let book_detail = '';
// 				console.log(book_detail);
				$('#book_detail').empty().append(book_detail);
			} else {
				let book_detail = '<img src="' + data[0]['book_detail'] + '" class="detail_img" id="detail_img">';
				$('#book_detail').empty().append(book_detail);
			}
			
		}
	});
}
//book_num을 이용해서 리뷰 가져오기
function loadReview() {
	let num = $('#book_num').val();
	$.ajax({
		url: '/load_review',
		type: 'post',
		data: { book_num: num },
		dataType: 'JSON',
		success: function(data) {
			if(data=='' || data==null) {
				$('#tblreview').empty();
	       		 let str="<tr> ";
	    		 str+="<th class=rvinfo1>등록된 리뷰가 없습니다.</th></tr>";
	    		 $('#tblreview').append(str);
			} else {
				
				$('#tblreview').empty();
				$('#tblreview').append('<tr><th style="width:80px;">글 번호</th><th style="width:300px;">제목</th><th style="width:500px;">내용</th><th style="width:200px;">작성일</th><th style="width:200px;">작성자</th></tr>');
				for(let i=0; i<data.length; i++){
		       		 let rev_detail = data[i];
		       		 let str='<tr>';
		       		 
		       		 // 날짜 뒤에 자르기
		       		 let date = rev_detail['rev_create_date'];
		       		 let rev_create = date.substring(0,11);
		       		 
		       		 
		    		 str+="<td id=review_num'>"+rev_detail['review_num']+"</td>";
		    		 str+="<td id=rev_title'>"+rev_detail['rev_title']+"</td>";
		    		 str+="<td id=rev_content>"+rev_detail['rev_content']+"</td>";
		    		 str+="<td id=rev_create_date'>"+rev_create+"</td>";
		    		 str+="<td id=r_writer'>"+rev_detail['id']+"</td></tr>";
		    		 
		    		 $('#tblreview').append(str);
		       	 }
			}
		}
	});
}
</script>
</html>