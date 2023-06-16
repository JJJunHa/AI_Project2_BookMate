<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/payment.css">
<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<title>북메이트 | 결제페이지</title>
</head>
<body>
<div class="main">
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
				&nbsp;|&nbsp;<a href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
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
            <li class="category_li"><a href="/donation">기부앤테이크<i class='dropDown'></i></a></li>
             
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
		</table>
		
		<div class=payment-sub>
			<div class=payment-cart>
				<button type="button" class="movecart" id=movecart>◁ 장바구니 가기</button>
			</div>
			<div class=payment-price>
				<span id=countpay></span>
			</div>
			<div class=pay-agree>
				<p><b>약관동의</b></p>
				<div class=check-agree>
					<form>
					    <p><input type="checkbox" name="all" id="check-all" class="check-all"> <label style="font-size:17px;"><b>모두 동의</b></label></p>
					    <hr>
					    <p><input type="checkbox" name="check1" class="check-1"> <label>(필수) 개인정보 수집 이용에 대한 내용을 확인 하였으며 이에 동의합니다.</label></p>
					    <p><input type="checkbox" name="check2" class="check-1"> <label>(필수) 이용약관에 대한 내용을 확인 하였으며 이에 동의합니다.</label></p>
					    <p><input type="checkbox" name="check3" class="check-1"> <label>(필수) 구매하실 상품의 결제정보를 확인 하였으며, 구매진행 전에 동의합니다.</label></p>
				    </form>
				</div>
			</div>
			<div class=payment-person>
				<p><b>주문자 정보</b></p>
				<table class=tbl-info>
					<tr>
						<th>주문하시는 분</th>
						<td><input type="text" class="textBox1" id="name" value="${ship.name}" readonly></td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td><input type="text" class="textBox1" id="mobile" value="${ship.mobile}" readonly></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" class="textBox1" id="email" value="${ship.email}" readonly></td>
					</tr>
				</table>
			</div>
			
			<div class=payment-trans>
				<p><b>배송 정보</b></p>
				<table class=tbl-info>
					<tr>
						<th>배송지 확인</th>
						<td><input type="radio" name="trans" value="self" id="self-radio">&nbsp;직접 입력&nbsp;
							<input type="radio" name="trans" value="change" id="change-radio">&nbsp;주문자정보와 동일&nbsp;</td>
					</tr>
					<tr>
						<th>받으실 분</th>
						<td><input type="text" class="textBox1 nameBox" id="name1" value="${ship.name}" readonly></td>
					</tr>
					<tr>
						<th>받으실 곳</th>
						<td><input type="text" id="postcode" class="textBox2 postcodeBox" placeholder="    우편번호"  value="${ship.zip_code}" readonly>
							<input type="button" id="zipbutton" class=btnPostcode onclick="execDaumPostcode()" value="우편번호 찾기" readonly><br>
							<input type="text" id="address" class="textBox2 addressBox" placeholder="    주소" value="${ship.address1}" readonly><br>
							<input type="text" id="detailAddress" class="textBox2 detailAddressBox" placeholder="    상세주소" value="${ship.address2}" readonly>
							<input type="text" id="extraAddress" class="textBox3" placeholder="    참고항목" value="${ship.address3}" readonly></td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td><input type="text" class="textBox1 mobileBox" id="mobile2" value="${ship.mobile}"></td>
					</tr>
					<tr>
						<th>남기실 말씀</th>
						<td><input type="text" class="textBox1" id=coment></td>
					</tr>
				</table>
			</div>
			
			<div class=payment-price>
				<p><b>결제 정보</b></p>
				<table class=tbl-info>
					<tr>
						<th>상품 합계 금액</th>
						<td><input type="text" class="textBox4" id=price placeholder="10000" style="font-weight: bold; font-size:15px;">원</td>
					</tr>
					<tr>
						<th>배송비</th>
						<td>0원</td>
					</tr>
					<tr>
						<th>최종 결제 금액</th>
						<td><input type="text" class="textBox4" id=price2 placeholder="10000" style="font-weight: bold; font-size:15px;">원</td>
					</tr>
				</table>
			</div>
			
			<div class="payment-pay payBox">
				<p><b>결제수간 선택 / 결제</b></p>
				<table class=tbl-info>
					<tr>
						<td colspan="2"><input type="radio" name="pay" value="무통장입금" name="payway" id="normal-radio">&nbsp;무통장입금&nbsp;</td>
					</tr>
					<tr>
					    <td>
					      <label>
					        <input type="radio" name="pay" value="카카오페이" name="payway" id="normal-radio2">
					        카카오페이
					      </label>
					    </td>
					    <td style="padding: 0;">
					      <div style="display: flex; align-items: center;">
					        <img src="/img/카카오페이.jpg" style="width: 60px; height: 30px; margin-right: 955px;">
					      </div>
					    </td>
				  </tr>
				</table>
			</div>
			
			
			<button id=order class=btnOrder>결제하기</button>
			
		</div>
			
	</div>
</div>
<footer id="footer" class="footer_new">
         <h1><a href="/main" class="titlename"><img src="/img/footer_logo.png" class="footer_img"></a></h1>
              
		 
          <div class="footer-layer2">
              <div class="footer-1">
<!--                   <address> -->
                      상호명 및 호스팅 서비스 제공 : BookMATE<br>
                      대표이사 : 김준하짱<br>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)
.ready(function(){
	setInterval(changeText, 1500);
	loadCart();
	$('#zipbutton').prop('disabled', true);
	$('#change-radio').prop('checked', true);
	//약관동의
	$('.check-all').click(function() {
	    $('.check-1').prop('checked', this.checked);
	  });

	  $('.check-1').change(function() {
	    if ($('.check-1:checked').length == $('.check-1').length) {
	      $('.check-all').prop('checked', true);
	    } else {
	      $('.check-all').prop('checked', false);
	    }
	  });

})
//결제하기
.on('click','#order', function(){
	if (!$('#check-all').is(":checked")) {
		  alert('모든 약관에 동의를 해주세요');
		  $('#check-all')[0].scrollIntoView({ behavior: 'smooth', block: 'center' });
		  $('.check-agree').css('color', 'red');
		  $(document).on('click', function() {
			    $('.check-agree').css('color', ''); // Remove the 'color' property to revert to the default color
			  });
		  return false;
		}
	if($('#name1').val()===null||$('#name1').val()===''){
		alert('받으실 분을 입력해주세요');
		$('#name1')[0].scrollIntoView({ behavior: 'smooth', block: 'center' });
		  $('.nameBox').css('border', '0.5px solid red');
		  $(document).on('click', function() {
			    $('.nameBox').css('border', '0.5px solid lightgray'); // Remove the 'color' property to revert to the default color
			  });
		return false;
	}
	if($('#postcode').val()===null||$('#postcode').val()===''){
		alert('우편번호를 입력해주세요');
		$('#postcode')[0].scrollIntoView({ behavior: 'smooth', block: 'center' });
		  $('.postcodeBox').css('border', '0.5px solid red');
		  $(document).on('click', function() {
			    $('.postcodeBox').css('border', '0.5px solid lightgray'); // Remove the 'color' property to revert to the default color
			  });
		return false;
	}
	if($('#address').val()===null||$('#address').val()===''){
		alert('주소를 입력해주세요');
		$('#address')[0].scrollIntoView({ behavior: 'smooth', block: 'center' });
		  $('.addressBox').css('border', '0.5px solid red');
		  $(document).on('click', function() {
			    $('.addressBox').css('border', '0.5px solid lightgray'); // Remove the 'color' property to revert to the default color
			  });
		return false;
	}
	if($('#detailAddress').val()===null||$('#detailAddress').val()===''){
		alert('상세주소를 입력해주세요')
		$('#detailAddress')[0].scrollIntoView({ behavior: 'smooth', block: 'center' });
		  $('.detailAddressBox').css('border', '0.5px solid red');
		  $(document).on('click', function() {
			    $('.detailAddressBox').css('border', '0.5px solid lightgray'); // Remove the 'color' property to revert to the default color
			  });
		return false;
	}
	if($('#mobile2').val()===null||$('#mobile2').val()===''){
		alert('받는분 연락처를 입력해주세요')
		$('#mobile2')[0].scrollIntoView({ behavior: 'smooth', block: 'center' });
		  $('.mobileBox').css('border', '0.5px solid red');
		  $(document).on('click', function() {
			    $('.mobileBox').css('border', '0.5px solid lightgray'); // Remove the 'color' property to revert to the default color
			  });
		return false;
	}
	if ($('input[name="pay"]:checked').length === 0) {
	    alert('결제 수단을 선택해주세요.');
	    $('input[name="pay"]')[0].scrollIntoView({ behavior: 'smooth', block: 'center' });
		  $('.payBox').css('color', 'red');
		  $(document).on('click', function() {
			    $('.payBox').css('color', ''); // Remove the 'color' property to revert to the default color
			  });
	    return false;
	}

	let id = '<%=session.getAttribute("id")%>';
		
		$.ajax({
			url: '/paymentInsert',
			type: 'post',
			data: { id: id, coment: $('#coment').val(), payway: $('input[name="pay"]:checked').val(), name: $('#name1').val(), mobile: $('#mobile2').val(), address: $('#address').val()+"@"+$('#detailAddress').val()+"@"+$('#extraAddress').val(), price: $('#price2').val()},
			dataType: 'text',
			success: function(data) {
				if(data=='fail' || data==null) {
					alert('오류가 발생했습니다');
				} else {			
					if(data.includes('kakaoPay')){
						cut=data.split("#");
						
						$.ajax({
							  url: '/kakaoPay',
							  type: 'post',
							  data: $.param({name: cut[1], price: cut[2], qty: cut[3], cartN: cut[4], bookN: cut[5], id: cut[6], coment: cut[7], address: cut[8], payWay: cut[9], mobile: cut[10], nick: cut[11]}),  // 데이터 직렬화
							  dataType: 'text',
							  success: function(data) {
								
								if(data=='fail' || data==null) {
									alert('오류가 발생했습니다');
								} else {
									openPopupWindow(data)
	
								}	
							}
						})
					}else if(data.includes('무통장')){
						alert("3520637887353 김준하 입금후 확인이 되면 배송진행합니다.")
						document.location="/main";
						
					}
				}	
			}
		})
})


// 장바구니 가기 클릭 시
.on('click','#movecart', function(){
	document.location="/cart";
})
.on('click','#self-radio',function(){
	$('#name1').val('');
	$('#postcode').val('');
	$('#address').val('');
	$('#detailAddress').val('');
	$('#mobile2').val('');
	$('#extraAddress').val('');
	$('#name1').prop('readonly', false);
	$('#postcode').prop('readonly', false);
	$('#address').prop('readonly', false);
	$('#detailAddress').prop('readonly', false);
	$('#mobile2').prop('readonly', false);
	$('#zipbutton').prop('disabled', false);
	$('#extraAddress').prop('readonly', false);
	
	
})
.on('click','#change-radio',function(){
	$('#name1').val('${ship.name}');
	$('#postcode').val('${ship.zip_code}');
	$('#address').val('${ship.address1}');
	$('#detailAddress').val('${ship.address2}');
	$('#extraAddress').val('${ship.address3}');
	$('#mobile2').val('${ship.mobile}');
	$('#name1').prop('readonly', true);
	$('#postcode').prop('readonly', true);
	$('#address').prop('readonly', true);
	$('#detailAddress').prop('readonly', true);
	$('#extraAddress').prop('readonly', true);
	$('#mobile2').prop('readonly', true);
	$('#zipbutton').prop('disabled', true);
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

//카카오페이 팝업창 뛰우고 팝업창 종료시 메인페이지 이동
function openPopupWindow(data)
{
	
    document.domain = "localhost"; //document.domain 값이 팝업과 부모창 동일해야 합니다. 

   window.open(data, '_blank', 'toolbar=yes,scrollbars=yes,resizable=yes,top=50,left=200,width=800,height=465');
}


// 장바구니 목록 뛰우기
function loadCart() {
	let id = '<%=session.getAttribute("id")%>';
	$.ajax({
		url: '/load_cart',
		type: 'post',
		data: { id: id },
		dataType: 'JSON',
		success: function(data) {
			
			if(data=='' || data==null) {
				$('#tblPayment').empty();
	       		 let str="<tr> ";
	    		 str+="<th class=cart_empty>장바구니에 담긴 상품이 없습니다.</th></tr>";
	    		 $('#tblPayment').append(str);
			} else {
				$('#tblPayment').empty();
				$('#tblPayment').append('<tr><th colspan="2" style="width:50%;">상품/옵션 정보</th><th style="width:10%;">수량</th><th style="width:15%;">상품금액</th><th style="width:15%;">합계금액</th><th style="width:10%;">배송비</th></tr>');
				 
	    		 let cart = data[0];
	    		 let str = '<tr>';
	    		 str += '<td id="book_cover">' + '<img src="' + cart['book_cover'] + '" class="pay_img" id="pay_img">' + '</td>';
	    		 str += '<td id="book_name">' + cart['book_name'] + '</td>';
	    		 str += '<td id="qty">' + cart['qty'] + '</td>';
	    		 str += '<td id="book_price">' + cart['book_price'] + '</td>';
	    		 str += '<td id="total">' + (parseInt(cart['qty']) * parseInt(cart['book_price'])) + '</td>';
	    		 str += '<td id="fee">무료</td></tr>';
	  
	    		 $('#tblPayment').append(str);
				
				for(let i=1; i<data.length; i++){
		       		 let cart = data[i];   	
		    		 let str = '<tr>';
		    		 str += '<td id="book_cover">' + '<img src="' + cart['book_cover'] + '" class="pay_img" id="pay_img">' + '</td>';
		    		 str += '<td id="book_name">' + cart['book_name'] + '</td>';
		    		 str += '<td id="qty">' + cart['qty'] + '</td>';
		    		 str += '<td id="book_price">' + cart['book_price'] + '</td>';
		    		 str += '<td id="total">' + (parseInt(cart['qty']) * parseInt(cart['book_price'])) + '</td>';
		    		 str += '<td id="fee">무료</td></tr>';
		    		 
		    		 $('#tblPayment').append(str);
		       	 }
// 		    		 $(document)
// 		    		 .on('click','.tblPayment tr td:nth-child(-n+3)', function(){
// 		    			 	let book_num = $(this).attr('id');
// // 		    				console.log(book_num);
// // 		    				console.log('check');
// 		    				document.location="/detail/"+book_num;
// 		    			})
			}
			countCart();
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
				$('#countpay').append(str);
				$('#price').val(0);
				$('#price2').val(totalPrice);
			} else {
				let totalPrice = Total();
				let str = '총 <b>' + data + '</b>개의 상품 금액 <b>' + totalPrice + '원</b>     +  배송비 <b>0</b>원  =   합계 <b>' + totalPrice + '원</b>'; // 'price' 변수 오타 수정
		        $('#countpay').append(str);
				$('#price').val(totalPrice);
				$('#price2').val(totalPrice);
			}	
		}
	})
}
function Total() {
	let total = 0;
  	$('#tblPayment tr').each(function() {
    	$(this).find('td:eq(4)').each(function() {
      		let price = parseInt($(this).text());
      		if (!isNaN(price)) {
        		total += price;
      		}
    	});
  	});
	return total;
}
// 우편번호 찾기
function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
</html>