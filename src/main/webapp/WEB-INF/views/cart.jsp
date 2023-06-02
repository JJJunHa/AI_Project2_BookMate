<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/cart.css">
<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<title>북메이트 - 장바구니</title>
</head>
<body>

<input value="<%=session.getAttribute("id")%>" hidden>

<div class="main">
	<div class="logo">
    	<a href="/main"><img src="/img/logo.png" class="logoImg"></a>
    </div>
    <div class="menu">
        <a href="/logout">로그아웃</a>&nbsp;|&nbsp;<a href="/cart">장바구니</a>&nbsp;|&nbsp;<a href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
<!--     	<input type=hidden id=cart_id value="cokezero"> -->
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
            </li>
             
            <li class="category_li">
            	<div class="search">
                	<input type="text" class="searchBox" placeholder="  검색어를 입력하세요">
                	<img src="/img/search.png" class="search_img">
                </div>
            </li>
		</ul>
	</div>
	
	<div class=cart-main>
		<p style="height:50px; font-size:30px;">장바구니</p>
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
					<button type="button" class="allOrder">상품 주문하기</button>
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
	loadCart();
	countCart();
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
.on('click','.tblCart tr td:nth-child(-n+3)', function(){
	let book_name = $(this).find('td:nth-child(3)').text();
	console.log(book_name);
	$.ajax({
		url: '/find_book',
		type: 'post',
		data: { book_name: book_name },
		dataType: 'text',
		success: function(data) {
			if(data=='' || data==null || data=='fail') {
				alert("오류로 인해 잠시후에 다시 시도해주세요.");
			} else {
				document.location="/detail/"+data;
			}	
		}
	})
})





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
	    		 str+="<td id=cart_num>"+cart['cart_num']+"</td>";
	    		 str+="<td id=book_cover'>"+'<img src="' + cart['book_cover'] + '" class="cart_img" id="cart_img">'+"</td>";
	    		 str+="<td id=book_name>"+cart['book_name']+"</td>";
	    		 str+="<td id=qty><div><input type=text name= qtytext calss=qtytext id=qtytext value="+cart['qty']+" readonly><button class='qtybtnminus'>-</button><button class='qtybtnplus'>+</button><div><button class='btnmodify'>변경</button></td>";
	    		 str+="<td id=book_price'>"+cart['book_price']+"</td>";
	    		 str+="<td id=total>"+(parseInt(cart['qty'])*parseInt(cart['book_price']))+"</td><td rowspan="+data.length+">무료</td><td><button type='button' class='Delete' id=Delete>삭제</button></tr>";
	    		 
// 	    		 str+="<td id=qty'>"+'<div class="count-wrap _count"><button type="button" class="minus" id=minus>-</button><input type="text" name="qty" id=qty class="inp" value="'+cart['qty']+'"/><button type="button" class="plus" id=plus>+</button></div></td>';
	    		 
	    		 $('#tblCart').append(str);
				
				for(let i=1; i<data.length; i++){
		       		 let cart = data[i];
		       		 let str='<tr>';
		    		 str+="<td id=cart_num>"+cart['cart_num']+"</td>";
		    		 str+="<td id=book_cover'>"+'<img src="' + cart['book_cover'] + '" class="cart_img" id="cart_img">'+"</td>";
		    		 str+="<td id=book_name>"+cart['book_name']+"</td>";
		    		 str+="<td id=qty><div><input type=text name= qtytext calss=qtytext id=qtytext value="+cart['qty']+" readonly><button class='qtybtnminus'>-</button><button class='qtybtnplus'>+</button><div><button class='btnmodify'>변경</button></td>";
		    		 str+="<td id=book_price'>"+cart['book_price']+"</td>";
		    		 str+="<td id=total>"+(parseInt(cart['qty'])*parseInt(cart['book_price']))+"</td><td><button type='button' class='Delete' id=Delete>삭제</button></tr>";
		    		 
		    		 $('#tblCart').append(str);
		       	 }
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