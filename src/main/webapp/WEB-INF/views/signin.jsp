<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="css/signin.css">
	<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
	
<title>북메이트 | 회원가입</title>
</head>

<body>
	<div class="logo">
		<a href="/main"><img src="/img/logo2.png" class="logoImg"></a>
	</div>
		<!-- Content -->
		<div class="content">
			<h1>회원가입</h1>
			<form action="/doInsert" method="post" id=frmInsert>
			<div class=signin1>
				<h3 style="text-align:left;">&nbsp;&nbsp;로그인 정보</h3>
				<table class=tbllogin>
					<tr>
						<th>아이디</th><td><input type="text" class="form-control form-control-lg"
											placeholder=" 아이디를 입력해주세요" id="j_id" name="j_id"
											style="font-size: 14px;"><br>
										<font id="idGuide" for="j_id"  style="font-size: 10px; font-weight:bold;">[영문대소문자/숫자, 4~20자]</font>
									</td>
					</tr>
					<tr>
						<th>비밀번호</th><td>
										<div class="form-group">
										<input type="password" class="form-control" placeholder=" 비밀번호를 입력해주세요"
											id="j_pwd" name="j_pwd"><img src="/img/free-icon-eye-show.jpg" id="showPwd"><br>
											<font id="psGuide" for="j_pwd" style="font-size: 10px; font-weight:bold;">[영문대소문자/숫자/특수문자(@$!%*#?&), 8~22자]</font>	
										</div>
										</td>
					</tr>
					<tr>
						<th>비밀번호 확인</th><td>
											<div class="form-group">
											<input type="password" class="form-control"
											placeholder=" 비밀번호 확인" id="j_pwdcf" name="j_pwdcf"><img src="/img/free-icon-eye-show.jpg" id="showPwd2"><br>
											<font id="psGuide2" for="j_pwdcf" style="font-size: 10px; font-weight:bold;"></font>
											</div>
											</td>
					</tr>
				</table>
			</div>
			<div class=signin2>
				<h3 style="text-align:left;">&nbsp;&nbsp;회원 정보</h3>
				<table class=tblmember>
					<tr>
						<th>이름</th><td><input type="text" class="form-control" placeholder=" 실명을 입력해주세요"
									id="j_name" name="j_name" style="font-size: 14px;" required></td>
					</tr>
					<tr>
						<th>휴대전화</th><td>
											<div class="information6">
											<select id=j_fisrtphone name=j_firstphone class="form-select">
												<option class=optionnum value="010" selected>010</option>
												<option class=optionnum value="011">011</option>
												<option class=optionnum value="016">016</option>
												<option class=optionnum value="017">017</option>
												<option class=optionnum value="018">018</option>
												<option class=optionnum value="019">019</option>
											</select>&nbsp; - &nbsp;
											<input type="tel" id=j_midphone name=j_midphone class="general-number" required>
												&nbsp; - &nbsp;
												<input type="tel" id=j_lastphone name=j_lastphone class="general-number" required>		
											</div>
									  </td>
						
					</tr>
					<tr>
						<th style="height: 170px;">주소</th><td><div class="information5">
											<input type="address" class="address-input" id=zip_code
												name=zip_code placeholder=" 우편번호" readonly>
											&nbsp;
											<input
												type="button" onclick="sample6_execDaumPostcode()"
												value="우편번호 찾기" id=btn_code><br> <br>
											<input
												type="address" id=j_address1 name=j_address1 readonly
												class="address2-input" placeholder=" 기본주소" required> <br>

											<input type="address" id=j_address2 name=j_address2
												class="address2-input" placeholder=" 상세주소" required>
											</div>
									  </td>
					</tr>
					<tr>
						<th>이메일</th><td>
										<div class="form-floating mb-3">
											<input type="email" class="form-control" placeholder="이메일을 입력해주세요"
												id="j_email" name="j_email"  required>
											<label for="floatingPassword"></label>
										</div>
									  </td>
					</tr>
					<tr>
						<th>생년월일</th><td>
										<div class="information8" style="display: flex;">
											<label for="year"></label>
											<select id="j_year" name="j_year" class="form-select">
												<!-- 연도 -->
											</select> <label for="month">&nbsp;&nbsp;년&nbsp;&nbsp;</label>
											<select id="j_month" name="j_month" class="form-select">
												<!-- 월 -->
											</select> <label for="day">&nbsp;&nbsp;월&nbsp;&nbsp;</label>
											<select id="j_day" name="j_day" class="form-select">
												<!-- 일 -->
											</select> &nbsp;&nbsp;일&nbsp;&nbsp;
										</div>
									  </td>
					</tr>
				</table>
			</div>
			<div class=signin3>
				<button type="submit" id="join">회 원 가 입</button>		
			</div>
			</form>
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

$(document)

let slideIndex = 0;
            const slides = $(".slide");
            slides.hide();

            function showSlides() {
                slides.hide();
                slideIndex++;
                if (slideIndex > slides.length) {slideIndex = 1}
                slides.eq(slideIndex - 1).fadeIn(1000);
                setTimeout(showSlides, 3000); // Change image every 3 seconds
            }
            showSlides();


const yearSelect = document.getElementById("j_year");
const monthSelect = document.getElementById("j_month");
const daySelect = document.getElementById("j_day");

// 연도 옵션 추가
for (let i = 1900; i <= 2023; i++) {
    const option = document.createElement("option");
    option.value = i;
    option.text = i;
    yearSelect.add(option);
}

// 월 옵션 추가
for (let i = 1; i <= 12; i++) {
    const option = document.createElement("option");
    option.value = i;
    option.text = i;
    monthSelect.add(option);
}

// 일 옵션 추가
for (let i = 1; i <= 31; i++) {
    const option = document.createElement("option");
    option.value = i;
    option.text = i;
    daySelect.add(option);
}

//---- 비밀번호 표시 코드 part ---- //
$(document)
document.getElementById("showPwd").addEventListener("click", function() {
	var passwordInput = document.getElementById("j_pwd");
	var eyeIcon = document.getElementById("showPwd");
	
	if (passwordInput.type === "password") {
		passwordInput.type = "text";
		eyeIcon.src = "/img/free-icon-eye-hidden.jpg";
	} else {
		passwordInput.type = "password";
		eyeIcon.src = "/img/free-icon-eye-show.jpg";
	}
})

document.getElementById("showPwd2").addEventListener("click", function() {
	var passwordInput = document.getElementById("j_pwdcf");
	var eyeIcon = document.getElementById("showPwd2");
	
	if (passwordInput.type === "password") {
		passwordInput.type = "text";
		eyeIcon.src = "/img/free-icon-eye-hidden.jpg";
	} else {
		passwordInput.type = "password";
		eyeIcon.src = "/img/free-icon-eye-show.jpg";
	}
})




$(document)

// by ChatGPT
.ready(function() {
  // ID 정규 표현식
  var idPattern = /^[a-zA-Z0-9]{4,20}$/;

  // 비밀번호 정규 표현식
  var pwPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,22}$/;

  // ID 입력 필드
  var idField = $('#j_id');

  // 비밀번호 입력 필드
  var pwField = $('#j_pwd');

  // ID 입력 필드의 값이 변경될 때마다 정규 표현식 패턴에 맞는지 확인
  idField.on('change', function() {
    var id = idField.val();
    if (!idPattern.test(id)) {
      alert('ID는 영어 소문자, 대문자, 숫자만 사용하여 4~20자 이내로 입력해주세요.');
      idField.val('');
      $('#idGuide').text('');
    }
  });

  // 비밀번호 입력 필드의 값이 변경될 때마다 정규 표현식 패턴에 맞는지 확인
  pwField.on('change', function() {
    var pw = pwField.val();
    if (!pwPattern.test(pw)) {
//       alert('비밀번호는 영어 소문자, 대문자, 숫자, 특수문자(@$!%*#?&) 중 최소 1개 이상을 포함하여 8~22자 이내로 입력해주세요.');
      $('#psGuide').attr('color', 'red');
      $('#psGuide').text('영어 소문자, 대문자, 숫자, 특수문자(@$!%*#?&)를 포함하여 8~22자 이내로 입력해주세요.'); return false;
      pwField.val('');
    }
  });
})
.on('click','#cancel',function(){
   
	document.location = '/login';
})


.on('submit','#frmInsert',function(){
   
   let id = $('#j_id').val();
   if(id==''){alert('아이디를 입력해주세요'); return false;}
   
   let ps1 = $('#j_pwd').val(); if(ps1==''){alert('비밀번호를 입력해주세요');return false;}
   let ps2 = $('#j_pwdcf').val();
   
   if(ps1!=ps2){alert('비밀번호가 일치하지 않습니다');return false;}
   
   alert('회원가입이 성공적으로 완료되었습니다.');
})

/* 아이디 입력 */
.on('keyup','#j_id',function(){
   
   $.ajax({url:'/idCheck',
          type:'post', 
          dataType:'text', 
         data:{j_id:$('#j_id').val()},
         
         success:function(data){ 
        	if(data === "사용 가능한 아이디입니다") {
        		$('#idGuide').attr('color', 'green');
                $('#idGuide').text(data);
        	} else {
        		$('#idGuide').attr('color', 'red');
                $('#idGuide').text(data);
        	}
        	
         }
   })
})
.on('blur','#j_id',function(){  
   id = $('#j_id').val();   
   if(id==''||id==null){
	  $('#idGuide').attr('color', 'red');
      $('#idGuide').text('아이디를 입력해주세요'); return false;
   }
})
/* 비밀번호 입력 */
.on('blur','#j_pwd',function(){  
   ps1 = $('#j_pwd').val();   
   if(ps1==''||ps1==null){
	  $('#psGuide').attr('color', 'red');
      $('#psGuide').text('비밀번호를 입력해주세요'); return false;
   }
})
.on('keyup','#j_pwd',function(){
	var pwPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,22}$/;

    ps1 = $('#j_pwd').val();
    if(ps1!=''||ps1!=null){
        $('#psGuide').text(''); return false;
     }
    
    if (!pwPattern.test(pw)) {
    	$('#psGuide').attr('color', 'red');
        $('#psGuide').text('비밀번호를 입력해주세요'); 
    	pwField.val('');
    	return false;
      }
})
/* 비밀번호 확인 입력 */
.on('blur','#j_pwdcf',function(){  
   ps2 = $('#j_pwdcf').val();   
   if(ps2==''||ps2==null){
	  $('#psGuide2').attr('color', 'red');
      $('#psGuide2').text('비밀번호를 확인해주세요'); return false;
   }
})

.on('keyup','#j_pwdcf',function(){
   
   ps1 = $('#j_pwd').val();
   ps2 = $('#j_pwdcf').val();
   
   if(ps1==''||ps1==null){
	   $('#psGuide2').attr('color', 'red');
       $('#psGuide2').text('비밀번호를 입력해주세요'); return false;
   }
   else if(ps1==ps2){
	   $('#psGuide2').attr('color', 'green');
       $('#psGuide2').text('비밀번호가 일치합니다'); return false;
   } else {
	  	$('#psGuide2').attr('color', 'red');
       $('#psGuide2').text('비밀번호가 일치하지않습니다'); return false;
   }
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

    function sample6_execDaumPostcode() {
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
                    document.getElementById("j_address2").value = extraAddr;
                
                } else {
                    document.getElementById("j_address2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip_code').value = data.zonecode;
                document.getElementById("j_address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("j_address2").focus();
            }
        }).open();
        return false;
    }
    
</script>
</html>