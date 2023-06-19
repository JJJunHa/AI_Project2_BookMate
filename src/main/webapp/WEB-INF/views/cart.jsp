<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/cart.css">
<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<title>북메이트 | 장바구니</title>
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
            <li class="category_li"><a href="/donation">기부앤테이크</a>
            </li>
		</ul>
	</div>
	
	<div class=cart-main>
		<p style="height:50px; font-size:30px; ">장바구니</p>
		<table class=tblCart id=tblCart>
		</table>
		<div class=cart-sub>
			<div class=cart-cate>
				<button type="button" class="movecate1" id=movecate1>◁ 쇼핑 계속하기</button>
			</div>
			<div class=cart-price>
				<span id=countcart></span>
			</div>
			<div class=cart-btn>
			<div class=btn-right>
					<button type="button" class="allDelete" id=allDelete>전체 삭제</button>
					<button type="button" class="allOrder" id=allOrder>상품 주문하기</button>
				</div>
			</div>
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
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)
.ready(function(){
	setInterval(changeText, 1500);
	loadCart();
})
.on('click','.allOrder',function(){
	CartCheck();
})
// 장바구니 개별 삭제
.on('click','.Delete',function(){
// 	let cart_num = $('#cart_num').val();
	let cart_num = $(this).closest('tr').find('td:first').text();
	var confirmval = confirm('장바구니에서 해당 상품을 삭제하시겠습니까?');
	if(confirmval) {
		$.ajax({
			url: '/delete_cart',
			type: 'post',
			data: { cart_num: cart_num },
			dataType: 'text',
			success: function(data) {
				if(data=='ok') {
					alert('장바구니에서 해당 상품을 삭제하였습니다.');
					document.location="/cart";
				} else {
					alert("오류로 인해 잠시후에 다시 시도해주세요.");
					document.location="/cart";
				}	
			}
		})
	} else {
		document.location="/cart";
	}
	
})
// 쇼핑 계속하기 클릭 시
.on('click','#movecate1', function(){
	document.location="/category1";
})
// 전체 삭제 클릭 시
.on('click','#allDelete', function(){
	let id = '<%=session.getAttribute("id")%>';
	$.ajax({
		url: '/Alldelete_cart',
		type: 'post',
		data: { id: id },
		dataType: 'text',
		success: function(data) {
			if(data=='ok') {
				alert('장바구니에서 전체 상품을 삭제하였습니다.');
				document.location="/cart";
			} else {
				alert("오류로 인해 잠시후에 다시 시도해주세요.");
				document.location="/cart";
			}	
		}
	})
})
// 수량 변경 + 클릭시
.on('click','.qtybtnplus', function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
})
// 수량 변경 - 클릭시
.on('click','.qtybtnminus', function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1) {
		$(this).parent("div").find("input").val(--quantity);
	}
})
// 변경 버튼 클릭 시
.on('click','.btnmodify', function(){
	location.reload();
	let qty = $(this).closest('td').find('#qtytext').val();
	let id = '<%=session.getAttribute("id")%>';
	let cart_num = $(this).closest('tr').find('td:first').text();
	console.log(qty);
	console.log(cart_num);
	$.ajax({
		url: '/modify_cart',
		type: 'post',
		data: { qty:qty, id:id, cart_num:cart_num },
		dataType: 'text',
		success: function(data) {
			if(data=='ok') {
				loadCart();
			} else {
				alert("오류로 인해 잠시후에 다시 시도해주세요.");
			}	
		}
	})
})
// cart에서 상품 클릭 시 상세페이지로 연결

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

function CartCheck() {
	let id = '<%=session.getAttribute("id")%>';
	$.ajax({
		url: '/load_cart',
		type: 'post',
		data: { id: id },
		dataType: 'JSON',
		success: function(data) {
			if(data=='' || data==null) {
				alert("장바구니에 담긴 상품이 없습니다.");
			} else {
				document.location="/payment";
			}
		}
	})
}



function loadCart() {
	let id = '<%=session.getAttribute("id")%>';
	$.ajax({
		url: '/load_cart',
		type: 'post',
		data: { id: id },
		dataType: 'JSON',
		success: function(data) {
			if(data=='' || data==null) {
				$('#tblCart').empty();
	       		 let str="<tr> ";
	    		 str+="<th class=cart_empty>장바구니에 담긴 상품이 없습니다.</th></tr>";
	    		 $('#tblCart').append(str);
			} else {
				$('#tblCart').empty();
				$('#tblCart').append('<tr><th style="width:10%;">번호</th><th colspan="2" style="width:40%;">상품/옵션 정보</th><th style="width:10%;">수량</th><th style="width:12%;">상품금액</th><th style="width:12%;">합계금액</th><th style="width:9%;">배송비</th><th style="width:7%;">비고</th></tr>');
				
				let cart = data[0];
	       		 let str='<tr>';
	    		 str+="<td id="+cart['book_num']+">"+cart['cart_num']+"</td>";
	    		 str+="<td id="+cart['book_num']+">"+'<img src="' + cart['book_cover'] + '" class="cart_img" id="cart_img">'+"</td>";
	    		 str+="<td id="+cart['book_num']+">"+cart['book_name']+"</td>";
	    		 str+="<td id=qty><div><input type=text name= qtytext calss=qtytext id=qtytext value="+cart['qty']+" readonly><button class='qtybtnminus'>-</button><button class='qtybtnplus'>+</button><div><button class='btnmodify'>변경</button></td>";
	    		 str+="<td id=book_price'>"+cart['book_price']+"</td>";
	    		 str+="<td id=total>"+(parseInt(cart['qty'])*parseInt(cart['book_price']))+"</td><td rowspan="+data.length+">무료</td><td><button type='button' class='Delete' id=Delete>삭제</button></tr>";
	    		 
// 	    		 str+="<td id=qty'>"+'<div class="count-wrap _count"><button type="button" class="minus" id=minus>-</button><input type="text" name="qty" id=qty class="inp" value="'+cart['qty']+'"/><button type="button" class="plus" id=plus>+</button></div></td>';
	    		 
	    		 $('#tblCart').append(str);
				
				for(let i=1; i<data.length; i++){
		       		 let cart = data[i];
		       		 let str='<tr>';
		    		 str+="<td id="+cart['book_num']+">"+cart['cart_num']+"</td>";
		    		 str+="<td id="+cart['book_num']+">"+'<img src="' + cart['book_cover'] + '" class="cart_img" id="cart_img">'+"</td>";
		    		 str+="<td id="+cart['book_num']+">"+cart['book_name']+"</td>";
		    		 str+="<td id=qty><div><input type=text name= qtytext calss=qtytext id=qtytext value="+cart['qty']+" readonly><button class='qtybtnminus'>-</button><button class='qtybtnplus'>+</button><div><button class='btnmodify'>변경</button></td>";
		    		 str+="<td id=book_price'>"+cart['book_price']+"</td>";
		    		 str+="<td id=total>"+(parseInt(cart['qty'])*parseInt(cart['book_price']))+"</td><td><button type='button' class='Delete' id=Delete>삭제</button></tr>";
		    		 
		    		 $('#tblCart').append(str);
		       	 }
		    		 $(document)
		    		 .on('click','.tblCart tr td:nth-child(-n+3)', function(){
		    			 	let book_num = $(this).attr('id');
		    				console.log(book_num);
		    				console.log('check');
		    				document.location="/detail/"+book_num;
		    			})
		    	countCart();
			}
		}
	})
}

function countCart() {
	let id = '<%=session.getAttribute("id")%>';
	$.ajax({
		url: '/count_cart',
		type: 'post',
		data: { id: id },
		dataType: 'text',
		success: function(data) {
			if(data=='' || data==null) {
				let str = '총 <b>'+0+'</b>개의의 상품 금액 <b>0원</b>'
				$('#countcart').append(str);
			} else {
				let totalPrice = Total();
				let str = '총 <b>' + data + '</b>개의 상품 금액 <b>' + totalPrice + '원</b>     +  배송비 <b>0</b>원  =   합계 <b>' + totalPrice + '원</b>'; // 'price' 변수 오타 수정
		        $('#countcart').append(str);
			}	
		}
	})
}
function Total() {
	let total = 0;
  	$('#tblCart tr').each(function() {
    	$(this).find('td:eq(5)').each(function() {
      		let price = parseInt($(this).text());
      		if (!isNaN(price)) {
//       			console.log(price);
        		total += price;
      		}
    	});
  	});
	return total;
}
</script>
</html>