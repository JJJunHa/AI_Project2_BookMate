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
			<div class=payment-person>
				<p><b>주문자 정보</b></p>
				<table class=tbl-info>
					<tr>
						<th>주문하시는 분</th>
						<td><input type="text" class="textBox1" id=name></td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td><input type="text" class="textBox1" id=mobile></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" class="textBox1" id=email></td>
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
						<td><input type="text" class="textBox1" id=name1></td>
					</tr>
					<tr>
						<th>받으실 곳</th>
						<td><input type="text" id="postcode" class="textBox2" placeholder="    우편번호" >
							<input type="button" class=btnPostcode onclick="execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="address" class="textBox2" placeholder="    주소"><br>
							<input type="text" id="detailAddress" class="textBox2" placeholder="    상세주소">
							<input type="text" id="extraAddress" class="textBox3" placeholder="    참고항목"></td>
					</tr>
					<tr>
						<th>휴대폰 번호</th>
						<td><input type="text" class="textBox1" id=mobile></td>
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
						<td><input type="text" class="textBox4" id=price placeholder="10000" style="font-weight: bold; font-size:15px;">원</td>
					</tr>
				</table>
			</div>
			
			<div class=payment-pay>
				<p><b>결제수간 선택 / 결제</b></p>
				<table class=tbl-info>
					<tr>
						<td><input type="radio" name="pay" value="normal" id="normal-radio">&nbsp;무통장입금&nbsp;</td>
					</tr>
				</table>
			</div>
			
			
			<button id=order class=btnOrder>결제하기</button>
			
		</div>
			
	</div>
</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)



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