<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="css/detail.css"> -->
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
}
.search_img {
    position : absolute;
    width: 17px;
    top: 5px;
    right: 10px;
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
}
.book_img:hover {
	width:330px;
	height:470px;
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
}
.inputPay {
	width: 150px;
	height:40px;
	background-color: #f95353;
	border:none;
	color:white;
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
</style>
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
<!--         				<div class=info></div> -->
        			</div>
        			
<!--         			<div class=info2 id= info2 onmouseover="mouseover()" onmouseleave="mouseleave()"> -->
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
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)
.ready(function(){
	loadData();
	loadReview();
})
.on('click','#tblreview tr', function(){
	let review_num=$(this).find('td:eq(0)').text();
	console.log(review_num);
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
});



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

			let book_cover = '<img src="' + data[0]['book_cover'] + '" class="book_img" id="book_img">';
			$('#info2').append(book_cover);

			let book_price = data[0]['book_price'];
			$('#info-price2').text(book_price);
			$('#spanPrice').text(book_price);

			let book_content = data[0]['book_content'];
			$('#info-content2').text(book_content);
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
				
		    		 str+="<td id=review_num'>"+rev_detail['review_num']+"</td>";
		    		 str+="<td id=rev_title'>"+rev_detail['rev_title']+"</td>";
		    		 str+="<td id=rev_content>"+rev_detail['rev_content']+"</td>";
		    		 str+="<td id=rev_create_date'>"+rev_detail['rev_create_date']+"</td>";
		    		 str+="<td id=r_writer'>"+rev_detail['id']+"</td></tr>";
		    		 
		    		 $('#tblreview').append(str);
		       	 }
			}
		}
	});
}
</script>
</html>