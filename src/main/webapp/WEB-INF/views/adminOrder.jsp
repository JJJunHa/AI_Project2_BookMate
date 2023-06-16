<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
    <title>BookMate</title>
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

#delivery1_btn:hover,
#delivery2_btn:hover,
#delivery3_btn:hover,
#btnDelete:hover{
   background-color: #97d4f7;
}

#delivery1_btn,
#delivery2_btn,
#delivery3_btn,
#btnDelete {
    background-color: fff;
    border:2px solid #97d4f7;

/*    width:9.7%; */
 /*  border:2px solid #aaa;*/
   border-radius:4px;
/*    margin: 2px 0; */
   outline: none;
   padding:5px;
   box-sizing: border-box;
   transition:.3s;
   font-weight: bold;
}




/*oboard 추가 부분*/
.content {
	width: 100%;

}

.content_A {
	width: 95%;
	height: 100%;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

.content2 {
	width: 95%;
/* 	height: 400px; */
	margin: auto;
}

/* 게시판 목록 스타일 */
.oboard {
	width: 100%;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
}

/* 테이블 헤더 스타일 */
.oboard th {
	padding: 12px;
	background-color: #ebedf3;
	border-bottom: 1px solid #c8cfe2;
	font-weight: bold;
	text-align: center;
}

/* 테이블 셀 스타일 */
.oboard td {
	padding: 12px;
	border-bottom: 1px solid #c8cfe2;
	text-align: center;
}

/* 짝수 번째 행 배경색 지정 */
.oboard tr:nth-child(odd) {
	background-color: #f8f9fa;
}

/* 마우스 호버 효과 */
.oboard tr:hover {
	background-color: #ebedf3;
}

/* 제목 링크에 언더라인 및 호버 효과 */
.oboard a.title-link {
	text-decoration: underline;
}

.oboard a.title-link:hover {
	text-decoration: none;
}

.small-text {
        font-size: 14px; /* 작게 표시할 글자 크기 설정 */
    }
/* 페이지네이션 */
.off-screen {
	display: none;
}

#nav1 {
	width: 100%;
/* 	padding-right: 50px; */
	padding-top: 15px;
	padding-bottom: 15px;
	
}

#nav1 a {
	display: inline-block;
	padding: 3px 5px;
	margin-right: 10px;
	margin-left: 1px;
	margin-right: 5px;
	font-family: Tahoma;
/* 	background: #ccc; */
	color: #000;
	text-decoration: none;
}

#nav1 a.active {
	background: #c8cfe2;
	color: #000;
}

.btnNew {
	position: relative;
	left:46%; 
	top: 15px;
	background-color: #7ca8c2;
	padding: 7px 11px;
        border: none;
        border-radius: 10px;
        color: #fff;
        cursor: pointer;
}
    .btnNew:hover {
	background-color: #0056b3;
}


/* ----------- */

  /* 뉴 버튼 스타일 */
    .button {
        text-align: right;
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
/* 검색 */
.mSearch {
	text-align:left;
	margin-left: 2.5%;
	float:left;
/* 	margin-bottom: 20px; /* 추가 */ 
}
.total {
	float:right;
}
.mSearch input[type="submit"] {
	position: relative;

	background-color: #7ca8c2;
	padding: 7px 11px;
        border: none;
        border-radius: 10px;
        color: #fff;
        cursor: pointer;
}
   .mSearch input[type="submit"]:hover {
	background-color: #0056b3;
}

.mSearch select {
 	width: 100px;
    border: 1px solid #bbb;
    border-radius: 15px;
    padding: 5px 5px;
    font-size: 14px;
    margin-top:2%;
}

.mSearch input[type="text"]
 {
	 width: 200px;
    border: 1px solid #bbb;
    border-radius: 15px;
    padding: 5px 5px;
    font-size: 14px;
    margin-top:2%;
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
    
            <div class="content_A">
                <h1>총 주문목록</h1>
				<form method="post" action="/order/search">
					<div class="mSearch">
						<select name="type" id="searchForm">
							<option value="order_num||id||order_date||pay_way||status">전체검색</option>
							<option value="order_num">order No</option>
							<option value="id">ID</option>
							<option value="order_date">주문날짜</option>
							<option value="pay_way">결제수단</option>
							<option value="status">배송상태</option>
						</select> <input type="text" id="keyword" name="keyword"> <input
							type="submit" id="btnsearch" value=검색>
					</div>
				</form>
				<div class="content2">
                    
                    <caption>
						<form action="" id="setRows">
							<p><input type="hidden" name="rowPerPage" value="10"></p>
						</form>
						</caption>
						 
						<div class="total">
					<%-- total price sum --%>
                    <c:set var="totalPriceSum" value="0" />
                    <c:forEach items="${ol}" var="orlist">
                      <c:set var="totalPriceSum" value="${totalPriceSum + orlist.price}" />
                    </c:forEach>
                     <h3>누적 주문금액: ${totalPriceSum} <i class="fa-solid fa-won-sign"></i></h3>
					</div>
				<table class="oboard" id="oboard">
						<thead>

							<tr>
								<th>order NO</th>
								<th>cart No</th>
								<th>ID</th>
								<th>합계</th>
								<th>주문날짜</th>
								<th>결제수단</th>
								<th>배송상태</th>
								<th colspan='3'>배송진행변경</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach items="${ol}" var="orlist">
								<tr>
									<td>${orlist.order_num}</td>
									<td>${orlist.cart_num}</td>
									<td>${orlist.id}</td>
									<td>${orlist.price}</td>
									<td>${orlist.order_date}</td>
									<td>${orlist.pay_way}</td>
									<td>${orlist.status}</td>
									<td colspan='3' >
										<input type="button" id="delivery1_btn" name="${orlist.order_num}" value="배송준비">
				                        <input type="button" id="delivery2_btn" name="${orlist.order_num}" value="배송중">
				                        <input type="button" id="delivery3_btn" name="${orlist.order_num}" value="배송완료"></td>
                        			<td>
                        				<input type="button" id="btnDelete" name="${orlist.order_num}" value="삭제"></td>
								</tr>
							</c:forEach>
					
						</tbody>
					</table>
                </div>
		<!--              	주문 상세 정보                  -->
				<div id="dialog" title="주문 상세 정보" style="display:none;">
					.
					
					<p>
						<strong>주문 ID:</strong> <span id="id"></span>
					</p>
					<p>
						<strong>받으시는 분:</strong> <span id="name"></span>
					</p>
					<p>
						<strong>주문 수량:</strong> <span id="o_qty"></span>
					</p>
					<p>
						<strong>도서 이름:</strong> <span id="book_name"></span>
					</p>
					<p>
						<strong>총 가격:</strong> <span id="price"></span>
					</p>
					<p>
						<strong>주문 날짜:</strong> <span id="order_date"></span>
					</p>
					<p>
						<strong>받으실 주소:</strong> <span id="address"></span>
					</p>
					<p>
						<strong>받으실 분 연락처:</strong> <span id="mobile"></span>
					</p>
					<p>
						<strong>배송 메시지:</strong> <span id="deli_message"></span>
					</p>
					<p>
						<strong>주문 상태:</strong> <span id="status"></span>
					</p>
					
				</div>

			</div>
		</div>
            <footer id="footer" class="footer_new">
         <h1><a href="/main" class="titlename"><img src="/img/footer_logo.png" class="footer_img"></a></h1>
              
		 
          <div class="footer-layer2">
              <div class="footer-1">
                      상호명 및 호스팅 서비스 제공 : BookMATE<br>
                      대표이사 : 김준하짱<br>
                      충남 천안시 동남구 대흥로 215 7층, 8층 <br>
                      사업자 등록번호 : 422-4212-421    
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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

$(document)

.ready(function() {
	setInterval(changeText, 1500);
  // 다이얼로그 초기화
  $("#dialog").dialog({
    autoOpen: false, // 자동으로 열리지 않도록 설정
    modal: true, // 모달 다이얼로그로 설정
    width: 700,
    height: 550,
    buttons: {
      Close: function() {
        $(this).dialog("close");
      }
    }
  });

  $("#oboard tbody tr td:nth-child(-n+7)").click(function() {
	  var id = $(this).closest('tr').find("td:nth-child(3)").text();
	  var price = $(this).closest('tr').find("td:nth-child(4)").text();

    $.ajax({
      url: "/dorder", // 요청을 처리할 서버의 URL
      type: "GET", // GET 요청 방식
      data: { // 전달할 파라미터
        id: id,
        price: price
      },
      success: function(response) {
        // 서버로부터 받은 응답 처리
        // 예를 들어, 검색 결과를 화면에 표시하거나 다른 작업을 수행할 수 있습니다.
        var o_qty = response[0].o_qty;
        var book_name = response[0].book_name;
        showDialog(response[0].name, response[0].id, response[0].price, response[0].order_date, response[0].address, response[0].mobile, response[0].deli_message, response[0].status, o_qty, book_name);
      },
      error: function(xhr) {
        // 오류 처리
      }
    });
  });

  function showDialog(name, id, price, order_date, address, mobile, deli_message, status, o_qty, book_name) {
    // 다이얼로그 내용 업데이트
    $("#dialog #name").text(name);
    $("#dialog #id").text(id);
    $("#dialog #price").text(price);
    $("#dialog #order_date").text(order_date);
    $("#dialog #address").text(address);
    $("#dialog #mobile").text(mobile);
    $("#dialog #deli_message").text(deli_message);
    $("#dialog #status").text(status);
    $("#dialog #o_qty").text(o_qty);
    $("#dialog #book_name").text(book_name);

    // 다이얼로그 열기
    $("#dialog").dialog("open");
  }

  $(document).on('click', '#delivery1_btn, #delivery2_btn, #delivery3_btn', function() {
    let status = $(this).val();
    let id = $(this).closest('tr').find("td:nth-child(3)").text();
    let order_num = $(this).closest('tr').find("td:nth-child(1)").text();
    console.log(status);
    console.log(id);
    console.log(order_num);

    // 여기에서 status, id, order_num 값을 사용하여 필요한 작업을 수행할 수 있습니다.
    $.ajax({
      url: '/delivery',
      type: 'post',
      data: {
        status: status,
        id: id,
        order_num: order_num
      },
      dataType: 'text',
      beforeSend: function() {
        // 다이얼로그 닫기
        $("#dialog").dialog("close");
      },
      success: function(data) {
        alert("배송정보가 변경되었습니다.");
        location.reload(); // 화면 새로고침
      },
      error: function(xhr) {
        // 오류 처리
      }
    });
  })
  .on('click', '#btnDelete', function() {
	    let id = $(this).closest('tr').find("td:nth-child(3)").text();
	    let order_num = $(this).closest('tr').find("td:nth-child(1)").text();

	    console.log(id);
	    console.log(order_num);


	     $.ajax({
	       url: '/ordel',
	       type: 'post',
	       data: {
	         id: id,
	         order_num: order_num
	       },
	       dataType: 'text',
	       beforeSend: function() {
	         // 다이얼로그 닫기
	         $("#dialog").dialog("close");
	       },
	       success: function(data) {
	         alert("주문을 삭제했습니다.");
	         location.reload(); // 화면 새로고침
	       },
	       error: function(xhr) {
	         // 오류 처리
	       }
	     });
	  });
});
$(document)
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
/*  페이지네이션  */
var $setRows = $('#setRows');

$setRows.submit(function (e) {
	e.preventDefault();
	var rowPerPage = $('[name="rowPerPage"]').val() * 1;// 1 을  곱하여 문자열을 숫자형로 변환

//		console.log(typeof rowPerPage);

	var zeroWarning = 'Sorry, but we cat\'t display "0" rows page. + \nPlease try again.'
	if (!rowPerPage) {
		alert(zeroWarning);
		return;
	}
	$('#nav1').remove();
	var $oboard = $('#oboard');

	$('#oboard').after(' <div id="nav1">');


	var $tr = $('tbody tr');
	var rowTotals = $tr.length;
//	console.log(rowTotals);

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
			return;
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