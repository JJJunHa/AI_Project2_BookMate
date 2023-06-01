<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/payment.css">
<title>pay</title>
</head>
<body>
<div class="main">
	<div class="logo">
    	<img src="/img/logo.png" class="logoImg">
    </div>
    <div class="menu">
        <a href="/login">로그인</a>&nbsp;|&nbsp;<a href="/cart">장바구니</a>&nbsp;|&nbsp;<a href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
    	<input type=hidden id=cart_id value="cokezero">
    </div>
    
    <div class="name">지금 어떤 책을 읽어야 할지 고민하는 사용자의 상태에 맞는 책을 추천해주는 서비스</div>
    <div class="category">
    	<ul class="category_ul"  id="nav">
			<li class="category_li"><a href="/category1">코미디</a></li>
			<li class="category_li"><a href="/category2">로맨스</a></li>
			<li class="category_li"><a href="/category3">판타지</a></li>
			<li class="category_li"><a href="/category4">공포/스릴러/추리</a></li>
			<li class="category_li"><a href="/category5">드라마/가족</a></li>
            <li class="category_li"><a href="/donation">기부앤테이크<i class='dropDown'></i></a>
            	<ul>
              		<li class="category_li_sub"><a href="/donation">기부앤테이크 안내</a></li>
              		<li class="category_li_sub"><a href="/donation-submit" id=donation-submit>기부앤테이크 신청</a></li>
              		<li class="category_li_sub"><a href="/donation-state">기부앤테이크 현황</a></li>
              	</ul>
            </li>
             
            <li class="category_li">
            	<div class="search">
                	<input type="text" class="searchBox" placeholder="  검색어를 입력하세요">
                	<img src="/img/search.png" class="search_img">
                </div>
            </li>
		</ul>
	</div>
	
	<div class=content-main>
		<p style="height:50px; font-size:30px;">주문하기</p>
		<table class=tblPayment id=tblPayment>
			<tr>
				<th colspan="2" style="width:50%;">상품/옵션 정보</th>
				<th style="width:10%;">수량</th>
				<th style="width:15%;">상품금액</th>
				<th style="width:15%;">합계금액</th>
				<th style="width:10%;">배송비</th>
			</tr>
			<tr>
		    	<td id=book_cover><img src="/img/코미디 pic3.jpg" class="pay_img" id="pay_img"></td>
		    	<td id=book_name>라바 시즌2 7: 산전수전 코미디</td>
		    	<td id=qty>2</td>
		    	<td id=book_price>9800</td>
		    	<td id=total>19600</td>
		    	<td id=fee>무료</td>
			</tr>
		</table>
		
		<div class=payment-sub>
			<div class=payment-cart>
				<button type="button" class="movecart" id=movecart>◁ 장바구니 가기</button>
			</div>
			<div class=payment-price>
				<span id=countpay>총 <b>1</b>개의 상품금액 <b>19600</b>원 + 배송비 <b>0</b>원 = 합계 <b>19600원</b></span>
			</div>
			<div class=pay-agree>
				<p><b>약관동의</b></p>
				<div class=check-agree>
					<form>
					    <p><input type="checkbox" name="all" class="check-all"> <label style="font-size:17px;"><b>모두 동의</b></label></p>
					    <hr>
					    <p><input type="checkbox" name="check1" class="check-1"> <label>(필수) 개인정보 수집 이용에 대한 내용을 확인 하였으며 이에 동의합니다.</label></p>
					    <p><input type="checkbox" name="check2" class="check-1"> <label>(필수) 이용약관에 대한 내용을 확인 하였으며 이에 동의합니다.</label></p>
					    <p><input type="checkbox" name="check3" class="check-1"> <label>(필수) 구매하실 상품의 결제정보를 확인 하였으며, 구매진행 전에 동의합니다.</label></p>
				    </form>
				</div>
			</div>
		</div>
	</div>
	
	
</div>
</body>
</html>