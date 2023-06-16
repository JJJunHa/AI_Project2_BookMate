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



/*board 추가 부분*/
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
.board {
	width: 100%;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
}

/* 테이블 헤더 스타일 */
.board th {
	padding: 12px;
	background-color: #ebedf3;
	border-bottom: 1px solid #c8cfe2;
	font-weight: bold;
	text-align: center;
}

/* 테이블 셀 스타일 */
.board td {
	padding: 12px;
	border-bottom: 1px solid #c8cfe2;
	text-align: center;
}

/* 짝수 번째 행 배경색 지정 */
.board tr:nth-child(odd) {
	background-color: #f8f9fa;
}

/* 마우스 호버 효과 */
.board tr:hover {
	background-color: #ebedf3;
}

/* 제목 링크에 언더라인 및 호버 효과 */
.board a.title-link {
	text-decoration: underline;
}

.board a.title-link:hover {
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
/* 	PADDING-RIGHT: 160PX; */
	padding-top: 15px;
	padding-bottom: 15px;

	
}

#nav1 a {
	display: inline-block;
	padding: 3px 5px;
	margin-right: 2px;
	margin-left: 3px;

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
.pSearch {
	text-align:left;
	margin-left: 2.5%;
/* 	margin-bottom: 20px; /* 추가 */ 
}
.pSearch input[type="submit"] {
	position: relative;

	background-color: #7ca8c2;
	padding: 7px 11px;
        border: none;
        border-radius: 10px;
        color: #fff;
        cursor: pointer;
}
   .pSearch input[type="submit"]:hover {
	background-color: #0056b3;
}

.pSearch select {
 	width: 100px;
    border: 1px solid #bbb;
    border-radius: 15px;
    padding: 5px 5px;
    font-size: 14px;
    margin-top:2%;
}

.pSearch input[type="text"]
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
                <h1>상품목록</h1>
                <form method="post" action="/book/search">
					<div class="pSearch">
						<select name="type" id="searchForm">
							<option value="book_name||author||book_price||book_genre||emotion||rating">전체검색</option>
							<option value="book_name">제목</option>
							<option value="author">작가</option>
							<option value="book_price">가격</option>
							<option value="book_genre">장르</option>
							<option value="emotion">감정</option>
							<option value="rating">별점</option>
						</select> <input type="text" id="keyword" name="keyword"> <input
							type="submit" id="btnsearch" value=검색>
						</div>
					</form>
						<div class="content2">
							<table class="board" id="board">
								<caption>
									<form action="" id="setRows">
										<p>
											<input type="hidden" name="rowPerPage" value="15">
										</p>
									</form>
								</caption>



								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작가</th>
										<th>가격</th>
										<th>장르</th>
										<th>감정</th>
										<th>별점</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${pl}" var="plist">
										<tr>
											<td>${plist.book_num}</td>
											<td>${plist.book_name}</td>
											<td>${plist.author}</td>
											<td>${plist.book_price}</td>
											<td>${plist.book_genre}</td>
											<td>${plist.emotion}</td>
											<td>${plist.rating}</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>

					</div></div>
		
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
$(document)
//새글쓰기
.on('click','#btnNew',function(){
	document.location='/adminNew';
	return false;
})
//수정페이지로
.on('click','#board tr:gt(0)',function(){
	   let a=$(this).find('td:eq(0)').text();
	   document.location='adminUpdate/'+a;
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
	var $board = $('#board');

	$('#board').after('<input type="button" value="상품등록" class="btnNew" id="btnNew">  <div id="nav1">');


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