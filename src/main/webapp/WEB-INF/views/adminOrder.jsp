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
	height: 400px;
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
	padding-right: 50px;
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
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
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
/* 다이얼로그 스타일 */
    #dialog {
      display: none;
      padding: 12px;
      background-color: #f0f0f0;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
</style>
<body>
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

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

$(document)

.ready(function() {
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
	    if(!confirm("정말로 삭제하시겠습니까?")){
			return false;
		}

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


</script>

</html>