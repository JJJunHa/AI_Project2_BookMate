<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">
	<link rel="stylesheet" href="css/signin.css">
<title>BookMate - 회원가입</title>
</head>
<body>
		<h2 class=Membership>회원가입</h2>
		<!-- Content -->
		<div class="content">
			<div class="content2"></div>
			<form action="/doInsert" method="post" id=frmInsert>
				<div class="content3">
					<div class="text">

						<div class="text3">
							<div class="form-floating mb-3">
								<input type="text" class="form-control form-control-lg"
									placeholder="아이디" id="j_id" name="j_id"
									style="font-size: 14px;"> <label id="idGuide"
									for="j_id" style="font-size: 14px;">아이디를 입력해주세요</label>
							</div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control" placeholder="비밀번호"
									id="j_pwd" name="j_pwd" style="width: 400px;"> <label
									id="psGuide" for="j_pwd" style="font-size: 14px;">비밀번호를 입력해주세요</label>
								<div style="font-size: 2px;">(영문대소문자/숫자/특수문자, 10~16자)</div>
							</div>
							<div class="form-floating mb-3">
								<input type="password" class="form-control"
									placeholder="비밀번호 확인" id="j_pwdcf" name="j_pwdcf"
									style="width: 400px;"> <label id="psGuide2"
									for="j_pwdcf" style="font-size: 14px;">다시한번 입력해주세요</label>

							</div>
							<div class="form-floating mb-3">
								<input type="text" class="form-control" placeholder="이름"
									id="j_name" name="j_name" style="font-size: 14px;" required>
								<label for="j_name" style="font-size: 14px;">Name</label>
							</div>
							<div class="information5">
								<input type="address" class="address-input" id=zip_code
									name=zip_code placeholder="우편번호" readonly><input
									type="button" onclick="sample6_execDaumPostcode()"
									value="우편번호 찾기"><br> <br> <input
									type="address" id=j_address1 name=j_address1 readonly
									class="address2-input" placeholder="기본주소" required> <br>
								<br>
								<input type="address" id=j_address2 name=j_address2
									class="address2-input" placeholder="상세주소" required>
							</div>
							<div class="information6">
								<select id=j_fisrtphone name=j_firstphone style="width: 80px;"
									class="form-select">
									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select> - <input type="tel" id=j_midphone name=j_midphone
									class="general-number" required> - <input type="tel"
									id=j_lastphone name=j_lastphone class="general-number" required>
									
							</div>
							<div class="form-floating mb-3">
								<input type="email" class="form-control" placeholder="이메일"
									id="j_email" name="j_email" style="width: 500px;" required>
								<label for="floatingPassword" style="font-size: 14px;">E-mail</label>
							</div>
							<div class="information8" style="display: flex; gap: 10px;">
								<label for="year"></label> <select id="j_year" name="j_year"
									style="width: 100px;" class="form-select">
									<!-- 연도 -->
								</select> <label for="month">Year</label> <select id="j_month"
									name="j_month" style="width: 80px;" class="form-select">
									<!-- 월 -->
								</select> <label for="day">Month</label> <select id="j_day" name="j_day"
									style="width: 80px;" class="form-select">
									<!-- 일 -->
								</select> Day
							</div>


						</div>



					</div>
					<br>
					<div class="button">
						<button type="submit" style="border-radius: 30px;">회원가입</button>
						<button id="cancel" type="cancel" style="border-radius: 30px;"padding:50px;>취소</button>
					</div>
			</form>
		</div>

		<div class="content4"></div>

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
    }
  });

  // 비밀번호 입력 필드의 값이 변경될 때마다 정규 표현식 패턴에 맞는지 확인
  pwField.on('change', function() {
    var pw = pwField.val();
    if (!pwPattern.test(pw)) {
      alert('비밀번호는 영어 소문자, 대문자, 숫자, 특수문자(@$!%*#?&) 중 최소 1개 이상을 포함하여 8~22자 이내로 입력해주세요.');
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

.on('blur','#j_id',function(){
   
   $.ajax({url:'/idCheck',
          type:'post', 
          dataType:'text', 
         data:{j_id:$('#j_id').val()},
         
         success:function(data){
            $('#idGuide').text(data);
         }
   })
})

.on('blur','#j_pwdcf',function(){
   
   ps1 = $('#j_pwd').val();
   ps2 = $('#j_pwdcf').val();
   
   if(ps1==''||ps1==null){
      $('#psGuide2').text('비밀번호를 입력해주세요'); return false;
   }
   else if(ps1==ps2){
      $('#psGuide2').text('비밀번호가 일치합니다'); return false;
   } else {
      $('#psGuide2').text('비밀번호가 일치하지않습니다'); return false;
   }
})

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