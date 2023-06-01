<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/donation.css">
<title>Donation - main</title>
</head>
<body>
<div class="logo">
    	<img src="/img/logo.png" class="logoImg">
    </div>
    <div class="menu">
        <a href="/login">로그인</a>&nbsp;|&nbsp;<a href="/cart">장바구니</a>&nbsp;|&nbsp;<a href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
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
                            <span class="red-text">(필수항목) </span><span>개인정보 수집 및 이용에 동의합니다. <input type="checkbox">동의 <input type="checkbox">비동의 </span> 
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="content_person">
                    <h3>기부앤테이크 기증자 정보</h3>
                    <hr>
                    <table class="table_person">
                        <tr><td colspan="2">* 표시는 필수 입력 항목입니다.</td></tr>
                        <tr><th>* 개인 및 기관명</td><td><input type="text" class="textBox" style="width:500px;"></td></tr>
                        <tr><th>* 휴대폰번호</td><td><input type="text" class="textBox" style="width:200px;"> * 입력 예 : 010-1234-5678</td></tr>
                        <tr><th>* 주소</td>
                            <td>
                                <div class="address_All">
                                    <div class="address_postcode">
                                      <input type="text" 
                                        class="textBox"
                                        style="width:200px; background-color: rgb(250, 250, 250);"
                                        name="postcode" id="postcode"
                                        placeholder="우편번호" readonly />

                                      <button type="button" class="address_postcode_btn" onclick="execDaumPostcode()">우편번호 찾기</button>
                                    </div>

                                    <div class="address_address">
                                      <input
                                        type="text"
                                        class="textBox"
                                        style="width:500px; background-color: rgb(250, 250, 250);"
                                        name="address"
                                        id="address"
                                        placeholder="도로명 주소"
                                        readonly
                                      />
                                    </div>

                                    <div class="address_detailAddress">
                                      <input
                                        type="text"
                                        class="textBox"
                                        style="width:500px; background-color: rgb(250, 250, 250);"
                                        name="detailAddress"
                                        placeholder="상세 주소"
                                        required
                                      />
                                    </div>
                                </div>
                        </td></tr>
                    </table>
                </div>
                <div class="content_info">
                    <h3>기부앤테이크 기증 내용 및 방법</h3>
                    <hr>
                    <table class="table_info">
                        <tr><td colspan="2">* 표시는 필수 입력 항목입니다.</td></tr>
                        <tr><th>* 도서수량</td><td><input type="text" class="textBox" style="width:200px;">  책(점)</td></tr>
                        <tr>
                            <th>* 기증방법</th>
                            <td>
                                <input type="radio">직접방문&nbsp;&nbsp;
                                <input type="radio">택배발송&nbsp;&nbsp;
                                <input type="radio">담당자와 상담   
                            </td>
                        </tr>
                    </table>
                </div>
                <br><br>
                <button class="submit_btn">기부앤테이크 신청하기</button>
            </div>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)
.on('click','#donation-submit',function(){
	document.location="/donation-submit";
})

</script>
</html>