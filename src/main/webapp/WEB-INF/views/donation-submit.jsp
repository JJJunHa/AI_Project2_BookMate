<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/donation.css">
<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<title>북메이트 - 기부앤테이크</title>
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
				&nbsp;|&nbsp;<a href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
			</div>
		
		<% } else { %>
		
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
	<div class="contentBody-submit">
            <div class="content_All-submit">
           		<br>
                <h1>기부앤테이크</h1>
                <div class="content_agree">
                    <h3>기부앤테이크 동의</h3>
                    <hr>
                    <span>귀하께서 기증하시는 자료는 북메이트에서 책의 상태 등을 검토, 확인 후 정보소외기관으로 기증됩니다.<br>
                        그리고 책의 상태에 따라 기증되지 못하는 자료는 북메이트에서 원문 이용 서비스를 위한 디지타이징 자료로 활용될 수 있습니다.<br>
                        다만, 디지타이징에 활용된 자료와 오 · 훼손 등으로 재기증이 어려운 자료는 폐기될 수 있음을 알려드립니다.<br>
                        북메이트의 기증 처리 절차에 동의하시면, 기증 신청하여 주시기 바랍니다.
                    </span>
                    <table class="agreeTable">
                        <tr><th>개인정보 수집 및 이용 동의</th></tr>
                        <tr>
                            <td>
                            <ul>
                                <li>개인정보 수집 및 이용 목적
                                    <ul>
                                        <li>기부앤테이크 자료 기증 신청 접수를 위해 수집된 정보는 관련 업무에만 이용됩니다.</li>
                                    </ul>
                                </li>
                                <li>수집하려는 개인정보 항목
                                    <ul>
                                        <li>(필수) 개인 및 기관명, 휴대폰 번호</li>
                                    </ul>
                                </li>
                                <li>개인정보 보유 및 이용기간
                                    <ul>
                                        <li class = "red-text"><strong>3년</strong></li>
                                    </ul>
                                </li>
                            </ul>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <span>동의를 거부할 권리가 있으며 필수항목 개인정보 수집 및 이용에 동의하지 않을 경우 자료 기증 신청이 되지 않습니다.<br></span>
                            <span class="red-text">(필수항목) </span><span>개인정보 수집 및 이용에 동의합니다. <input type="radio" name="option" value=agree id=agree>동의 <input type="radio" name="option" value=disagree id=disagree>비동의 </span> 
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="content_person">
                    <h3>기부앤테이크 기증자 정보</h3>
                    <hr>
                    <table class="table_person">
                        <tr><td colspan="2">* 표시는 필수 입력 항목입니다.</td></tr>
                        <tr><th>* 개인 및 기관명</th><td><input type="text" class="textBox" id=dona_name style="width:500px;"></td></tr>
                        <tr><th>* 휴대폰번호</th><td><input type="text" class="textBox" id=dona_mobile style="width:200px;" readonly> * 입력 예 : 010-1234-5678</td></tr>
                        <tr><th>* 주소</th>
                            <td>
                                <div class="address_All">
                                    <div class="address_postcode">
                                    	<input type="text" id="postcode" name="postcode" class="dona-textBox"  style="width:200px; background-color: rgb(250, 250, 250);" placeholder=" 우편번호" readonly>
										<input type="button" class=btnPostcode id=btnPostcode value="우편번호 찾기"><br> 
<!-- 										onclick="execDaumPostcode()" -->
										<input type="text" id="address" name="address" class="dona-textBox" style="width:300px; background-color: rgb(250, 250, 250);" placeholder=" 주소" readonly><br>
                                    	<input type="text" id="detailAddress" name="detailAddress" class="dona-textBox" style="width:300px; background-color: rgb(250, 250, 250);" placeholder=" 상세주소" readonly>
										<input type="text" id="extraAddress" name="extraAddress" class="dona-textBox" style="width:300px; background-color: rgb(250, 250, 250);" placeholder=" 참고항목" readonly>
                                    </div>
                                </div>
                                <p style="font-size:12px;">※ 본인확인 시 사용될 수 있으므로 실제 주소를 입력해주세요.</p>
                        </td></tr>
                    </table>
                </div>
                <div class="content_info">
                    <h3>기부앤테이크 기증 내용 및 방법</h3>
                    <hr>
                    <table class="table_info">
                        <tr style="height:50px;"><td colspan="2">* 표시는 필수 입력 항목입니다.</td></tr>
                        <tr><th>* 도서수량</th><td><input type="text" id="dona_book" name="dona_book" class="textBox" style="width:200px;">  책(점)<br>
                        						<p style="font-size:12px;">* 1회 기브앤테이크 신청 권수는 최대 20권 입니다. 그 이상의 신청을 원하시면 <b>최대 수량(20권) 입력 후 담당자와 상담</b>으로 신청해주세요. </p></td></tr>
                        <tr>
                            <th>* 기증방법</th>
                            <td>
                                <input type="radio" name="option1" value=직접방문 id=one>직접방문&nbsp;&nbsp;
                                <input type="radio" name="option1" value=택배발송 id=two>택배발송&nbsp;&nbsp;
                                <input type="radio" name="option1" value=담당자와상담 id=three>담당자와 상담   
                            </td>
                        </tr>
                    </table>
                </div>
                <br><br>
                <button class="submit_btn">기부앤테이크 신청하기</button>
            </div>
            
            <div class=confirmDialog id=confirmDialog style="display:none;">
             	<p align="center"><b>기부앤테이크 신청정보 확인</b></p>
             	<table class="tbl_confirm">
             		<tr><th>개인 및 기관명 : </th><td><input type="text" class=inputText id="inputName" name="inputName" readonly></td></tr>
             		<tr><th>휴대폰번호 : </th><td><input type="text" class=inputText id="inputMobile" name="inputMobile" readonly></td></tr>
             		<tr><th>주소 : </th><td><input type="text" class=inputText id="inputAddress" name="inputAddress" readonly><br>
	            							<input type="text" class=inputText id="inputDetail" name="inputDetail" readonly></td></tr>
           			<tr><th>도서수량 : </th><td><input type="text" class=inputText id="inputBook" name="inputBook" readonly></td></tr>
           			<tr><th>기증방법 : </th><td><input type="text" class=inputText id="inputWay" name="inputWay" readonly></td></tr>
           			<tr><td colspan=2><p style="font-size:12px;">* 택배발송 선택 시 위의 주소로 택배 수거 신청이 진행됩니다.</p></td></tr>
             	</table>
             	<button id=confirm_btn class="confirm_btn">기부앤테이크 신청하기</button>
            </div>
 </div>

</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
// 전역변수 선언
let donation_agree='';
let donation_way='';
let nameVal='';
let IntegerBookVal=0;
$(document)
.ready(function(){
	loadPersonInfo();
	agreeSelection();
	dona_waySelection()
})

// 기부앤테이크 신청하기 버튼 클릭 시
.on('click', '.submit_btn', function(){
	// 1. 개인정보수집 동의 체크했나 확인하기
		var radioButtons = document.getElementsByName('option');
	var selectedButton;

	for (var i = 0; i < radioButtons.length; i++) {
		if (radioButtons[i].checked) {
	    	selectedButton = radioButtons[i];
	    break;
	  }
	}

	if (selectedButton) {
		donation_agree = selectedButton.value;
	} else {
		alert('개인정보 수집 및 이용 동의를 체크해주세요.');
		return false;
	}
	
	// 1-1. 개인정보 동의가 agree인지 체크하기
	if(donation_agree === 'disagree') {
		alert('개인정보 수집 [비동의] 시 기부앤테이크 서비스를 이용하실 수 없음을 확인해주시기 바랍니다.');
		return false;
	}
	
	// 2. 이름, 모바일, 주소 입력했나 확인하기
	nameVal = $('#dona_name').val();
	if(nameVal == '' || nameVal==null) {
		alert('이름을 입력해주세요.');
		return false;
	}
	
	let mobileVal = $('#dona_mobile').val();
	let addressVal = '('+$('#postcode').val()+') '+$('#address').val();
	let detailVal = $('#extraAddress').val() + $('#detailAddress').val();
	
	// 3. 도서수량 입력했나 확인하기
	let bookVal = $('#dona_book').val();
// 	console.log(bookVal);
	if (bookVal == '' || bookVal == null) {
	    alert('도서수량을 입력해주세요.');
	    return false;
	}
	
	// 4. 도서수량이 20권 내외인가 확인하기
	IntegerBookVal = parseInt($('#dona_book').val());
	if(IntegerBookVal < 5 || IntegerBookVal >20) {
		 alert('1회 기부앤테이크 도서수량은 기본 5권 이상 20권 이하입니다.');
		 $('#dona_book').val('');
		    return false;
	}
	
	// 5. 기증방법을 선택했나 확인하기
	var radioButtons_way = document.getElementsByName('option1');
	var selectedButton_way;

	for (var i = 0; i < radioButtons_way.length; i++) {
		if (radioButtons_way[i].checked) {
			selectedButton_way = radioButtons_way[i];
	    break;
	  }
	}

	if (selectedButton_way) {
		donation_way = selectedButton_way.value;
	} else {
		alert('기부앤테이크 기증방법을 체크해주세요.');
		return false;
	}
// 	console.log(donation_way);
	// 신청하기 버튼 클릭 시 dialog창 열기
				$('#confirmDialog').dialog({
			//  title:'아이디 찾기 결과',
				    modal:true,
				    width:550,
				    height:400,
				    resizable:false,
				    show : 'slideDown',
				    hide : 'slideUp',
				});
	$('#inputName').val(nameVal);
	$('#inputMobile').val(mobileVal);
	$('#inputAddress').val(addressVal);
	$('#inputDetail').val(detailVal);
	$('#inputBook').val(IntegerBookVal+' 권');
	$('#inputWay').val(donation_way);
})


// 6. 신청하기 버튼 클릭시 DB에 저장
.on('click','#confirm_btn', function(){
	let id = '<%=session.getAttribute("id")%>';
	console.log(id);
	let confirmval = confirm('해당 정보로 기브앤테이크를 신청하시겠습니까?');
	if(confirmval) {
		$.ajax({
			url: '/insert_donation',
			type: 'post',
			data: { id:id, dona_name:nameVal, dona_qty:IntegerBookVal,  dona_way:donation_way},
			dataType: 'text',
			success: function(data) {
				if(data=="ok") {
						alert("기브앤테이크 신청이 완료되었습니다. \n자세한 내용은 [마이페이지] - [기브앤테이크] 를 확인해주세요.")
						document.location="/donation";
				} else {
					alert("오류로 인해 잠시후에 다시 시도해주세요.")
					return false;
				}
			}
		});	
	} else {
		return false;
	}
})

//  2-1. 모바일, 주소 클릭 시 회원정보 수정으로 가라는 alert 생성
.on('click','#dona_mobile', function(){
	alert('[마이페이지] - [회원정보수정] 에서 수정이 가능합니다.');
	return false;
})
.on('click', '#btnPostcode', function(){
	alert('[마이페이지] - [회원정보수정] 에서 수정이 가능합니다.');
	return false;
})
// 3-1 숫자만 입력하게
.on('blur','#dona_book', function(){
	let bookVal = $('#dona_book').val();
	let check = /^[0-9]+$/;
	
	if (!check.test(bookVal)) {
	    alert('숫자만 입력 가능합니다.');
	    return false;
	}
})
// 개인정보 동의 체크박스 하나만 선택
function agreeSelection() {
            var agree = document.getElementById("agree");
            var disagree = document.getElementById("disagree");

            if (agree.checked) {
            	disagree.checked = false;
            } else if (disagree.checked) {
            	agree.checked = false;
            }
}
// 기증방법 체크박스 하나만 선택
function dona_waySelection() {
            var one = document.getElementById("one");
            var two = document.getElementById("two");
            var three = document.getElementById("three");

            if (one.checked) {
            	two.checked = false;
            	three.checked = false;
            } else if (two.checked) {
            	one.checked = false;
            	three.checked = false;
            } else if(three.checked) {
            	one.checked = false;
            	two.checked = false;
            }
}


// 회원 정보 가져오기
function loadPersonInfo() {
	let m_id = '<%=session.getAttribute("id")%>';
// 	console.log(m_id);
	
	$.ajax({
		url: '/load_personInfo',
		type: 'post',
		data: { m_id : m_id },
		dataType: 'JSON',
		success: function(data) {
			let dona_name = data[0]['name'];
			$('#dona_name').val(dona_name);
			
			let dona_mobile = data[0]['mobile'];
			let dona_mobile1 = dona_mobile.replace(/ /g, '-');
			$('#dona_mobile').val(dona_mobile1);
			
			let dona_code = data[0]['zip_code'];
			$('#postcode').val(dona_code);
			
			let dona_address = data[0]['address'];
			ar = dona_address.split('@');
			let address1 = ar[0];
			let address2 = ar[1];
			
			ar1 = address2.split(')');
			let address3 = (ar1[0] + ')').trim();
			let address4 = (ar1[1]).trim();
			
			$('#address').val(address1);
			$('#detailAddress').val(address4);
			$('#extraAddress').val(address3);
		}
	});
}
//우편번호 찾기
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