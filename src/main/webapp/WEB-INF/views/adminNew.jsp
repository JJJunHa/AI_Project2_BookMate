<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
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
	margin: 0;
	
}
#nav li {
	float:left;
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
#nav ul li {
	float: none;
	margin:0;
	padding:0;
	width: 150px;
	height:40px;
	background-color: white;
}
#nav li:hover ul {
	opacity: 1;
	z-index: 1;
}
#nav li:hover ul li {
	overflow: visible;
	z-index: 1;
}
#nav li ul li:hover > a {
	background-color: #97d4f7;
	color:black;
	margin:0;
	padding:5px;
	z-index: 1;
}
.category {
    width:100%;
    height:60px;
    background-color: white;
}
.category_ul {
    float:right;
}
.category_li {
    float: left;
    margin-right: 10px;
}
a:hover {
        color: #97d4f7;
}
/* 검색창 */
.search {
    position: relative;
    width: 100%;
}
.searchBox {
    width: 250px;
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
    right: 10px;
}
/* ----------------------------------------------*/
.content {
    
	text-align: center;
}
.content_A { 
    width:30%;
/*	 border: 1px solid #bbb;*/
     float:left;
     margin-left:20%;
}
.content_B { 
    width:30%;
	/* border: 1px solid #bbb;*/
     float:right;
     margin-right:20%;
     margin-top:1.3%;
}
.content_C { 
    width:100%;
	/* border: 1px solid #bbb;*/

}


select,
input[type=number],
input[type=file],
input[type=text]:not(.searchBox){
	width:70%;
	border:2px solid #aaa;
	border-radius:4px;
	margin: 8px 0;
	outline: none;
	padding:8px;
	box-sizing: border-box;
	transition:.3s;
}
textarea:focus,
select:focus,
input[type=number]:focus,
input[type=file]:focus,
input[type=text]:focus{
	border-color:dodgerBlue;
	box-shadow:0 0 8px 0 dodgetBlue;
}

label {
color: #467fcf;
font-weight: bold;
display: block;
width: 30%;
margin-left: 15%;
text-align: left;

}
textarea {
    
    height:10em; 
    width:70%;
	border:2px solid #aaa;
	border-radius:4px;
	margin: 8px 0;
	outline: none;
	padding:8px;
	box-sizing: border-box;
	transition:.3s;
}

/* 뉴 버튼 스타일 */
.button {
        text-align: center;
   		margin-top: 20px;
    }
    
    .button input[type="submit"],
    .button input[type="button"] {
        padding: 7px 11px;
        border: none;
        border-radius: 10px;
        color: #fff;
        cursor: pointer;
    }
    
    .button input[type="submit"] {
        background-color: #7ca8c2;
    }
    
    .button input[type="button"] {
        background-color: #7ca8c2;
    }
    .button input[type="button"]:hover {
	background-color: #0056b3;
}
    .button input[type="submit"]:hover {
	background-color: #0056b3;
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
    
       a {
	 text-decoration-line: none;
	 text-align: center;
 	 color: inherit; /* 링크의 색상 제거 */
}
</style>
<body>
    <div class="main">
        <div class="logo">
    	<a href="/main"><img src="/img/logo2.png" class="logoImg"></a>
    </div>
    
    <% if(session.getAttribute("id") != null && !"".equals(session.getAttribute("id")) && !session.getAttribute("id").equals("bookmate")) { %>
		
			<div class="menu">
				<%= session.getAttribute("id") %> 님, <a href="/logout">로그아웃</a>&nbsp;|&nbsp;<a href="/cart">장바구니</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
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
   



        
        <div class="content">
       		<h1>상품추가</h1>
       		<div class="content_C">
            <div class="content_A">
             
                <br>
              
               
               
                  <label for="book_name">제목:</label>
                  <input type="text" class="form-control form-control-lg" id="book_name" name="book_name"><br>
                   <br>
                   
                  <label for="book_price">가격:</label>
                  <input type="text" class="form-control form-control-lg" id="book_price" name="book_price"><br>
                  <br>
                  
                  <label for="book_genre">장르:</label> 
                  <select id="book_genre" name="book_genre">
					<option value="코미디">코미디</option>
					<option value="로맨스">로맨스</option>
					<option value="판타지">판타지</option>
					<option value="공포/스릴러/추리">공포/스릴러/추리</option>
					<option value="드라마/가족">드라마/가족</option>
					</select> <br>
					
					<br><div class="mb-3">
                  <label for="book_cover">커버 사진:</label>
                  <input type="file" class="form-control" id="book_cover" name="book_cover"><br>
                  </div>
                    <br>
                    
                   <label for="book_content">책 소개:</label>
                  <textarea class="book_content" id="book_content"></textarea><br>
                   <br>
              </div>
                <div class="content_B">
                  <div class="mb-3">
                  <label for="book_detail">상품 상세:</label>
                  <input type="file" class="form-control" id="book_detail" name="book_detail"><br>
                  </div>
                  <br>
                   
                  <label for="author">작가:</label>
                  <input type="text" id="author" name="author" ><br>
                  <br>
                  
                  <label for="publication">출판일:</label>
                  <input type="text" id="publication" name="publication" ><br>
                  <br>
                  
                  <label for="rating">별점:</label>
                  <input type="number" class="form-control form-control-lg" id="rating" name="rating" max="5" min="0"><br>
                 <br>
          			
          		<label for="emotion">감정:</label> 
                  <select id="emotion" name="emotion">
					<option value="슬픔">슬픔</option>
					<option value="사랑">사랑</option>
					<option value="불안">불안</option>
					<option value="분노">분노</option>
					<option value="행복">행복</option>
					</select> <br>
					<br>
					
					<label for="book_summary">책 요약:</label>
                  <input type="text" id="book_summary" name="book_summary" ><br>
                  <br>
                 </div>
			</div>	
				
				<div class="button">
                  <!-- <img src="#" alt="상품 이미지 미리보기"><br> -->
                  <input type=button value='등록' id=btnInsert>
                  <input type=button value='취소' id=btnCancle>
                  <br><br> 
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
    </div>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
.ready(function(){
	setInterval(changeText, 1500);
})
.on('click','#btnInsert',function(){
     var formData = new FormData();   // 자바스크립트에서 폼 데이터를 다루는 객체
    var files = $('#book_cover')[0].files[0];
    formData.append('file', files);
    
    var formData2 = new FormData();
    var book_detail = $('#book_detail')[0].files[0];
    formData2.append('book_detail_file', book_detail);

    	$.ajax({url:'/newProduct',type:'post',
    		data:{book_name:$('#book_name').val(),book_price:$('#book_price').val(),
    			book_genre:$('#book_genre option:selected').val(),book_content:$('#book_content').val()
    			,author:$('#author').val(),publication:$('#publication').val()
    			,rating:$('#rating').val(),emotion:$('#emotion option:selected').val()
    			,book_summary:$('#book_summary').val()},
    		dataType:'text',
    		beforeSend:function(){
    			let book_name=$.trim($('#book_name').val());
    			if(book_name==''||book_name==null){
    				alert('상품명을 입력하시오');
    				return false;
    			}
    			if($('#book_price').val()==''){
    				alert('가격을 입력하시오');
    				return false;
    			}
    			if($('#author').val()==''){
    				alert('작가를 입력하시오');
    				return false;
    			}
    			if($('#publication').val()==''){
    				alert('출판일을 입력하시오');
    				return false;
    			}
    			if($('#rating').val()==''){
    				alert('별점을 입력하시오');
    				return false;
    			}
    		},
    		success:function(data){
    			if(data=="ok"){
    				alert("fileinsert 성공")
//     				$('#btnCancle').trigger('click');
    			} else {
    				alert("fileinsert 실패")
    			}
    			$.ajax({url:'/newfile', type:'post', dataType:'text', data:formData,        
    			      enctype:'multipart/form-data',
    			      contentType:false,
    			        processData:false,
    			      success:function(data) {
    			    	  
    			    	  $.ajax({url:'/newfile2', type:'post', dataType:'text', data:formData2,        
    	    			      enctype:'multipart/form-data',
    	    			      contentType:false,
    	    			        processData:false,
    	    			      success:function(data) {
    	    			      
    	    			      }
    	    			   })
    			      }
    			   })
    		}
    		
    	})
})
 .on('click','#btnCancle',function(){
	document.location='/prolist';
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
</script>

</html>