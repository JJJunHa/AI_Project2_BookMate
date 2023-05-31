<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookMate - 회원가입 본인 인증</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link rel="stylesheet" href="css/certified.css">
</head>
<body>
	<div class="logo">
		<img src="/img/BookMate Logo2.jpg" class="logoImg">
	</div>
	<div class="container">
		<h2>회원가입 본인 인증</h2>

		<div class="form-group">
			<input class="signin_pass" id="phoneNumber" type="text"
				name="phoneNumber" title="전화번호 입력" placeholder="휴대폰 번호를 입력해주세요">
			<input class="signin_pass" type="button" value="전송" id="phoneChk">
		</div>

		<div class="form-group">
			<input class="signin_pass" id="phone2" type="text" name="phone"
				title="전화번호 입력" placeholder="인증번호를 입력해주세요"> <input
				class="signin_pass" type="button" value="인증확인" id="phoneChk2">
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>

$(document)

	var code2 = "";
	$("#phoneChk").click(function() {
		if($("#phoneNumber").val()==""){
			alert("휴대폰 번호를 입력하셔야 합니다.");
		} else {
			alert('인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.');
			var phone = $("#phoneNumber").val();
			$.ajax({
				type : "POST", // post 형식으로 발송
				url : "/sendSMS1.do", // controller 위치
				data : {
					phoneNumber : phone
				}, // 전송할 ㅔ이터값
				cache : false,
				success : function(data) {
					if (data == "error") { //실패시 
						alert("휴대폰 번호가 올바르지 않습니다.")
					} else { //성공시        
						code2 = data; // 성공하면 데이터저장
					}
				}
	
			});		
		}
	})

	//휴대폰 인증번호 대조
	$("#phoneChk2").click(function() {
		if ($("#phone2").val() == code2) { // 위에서 저장한값을 비교함
			alert('인증성공')
			document.location = '/signin';
		} else if(code2 == "") {
			alert("인증번호를 제대로 입력해주세요.");
		} else {
			alert('인증실패');			
		}
	})

// $("#phoneChk2").click(function() {
//   if ($("#phone2").val() === code2 || !code2) {
//     alert('인증실패');
//   } else {
//     alert('인증성공');
//     document.location = '/signin';
//   }
// })

</script>
</html>