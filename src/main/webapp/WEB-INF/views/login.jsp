<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/login.css">
    <title>BookMate - 로그인</title>
</head>
<body>
    <div class="main">
        <div class="logo">
            <img src="/img/BookMate Logo2.jpg" class="logoImg">
        </div>
        <div class="menu">
            <a href="/login">로그인</a>&nbsp;|&nbsp;<a href="/cart">장바구니</a>&nbsp;|&nbsp;<a href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/q&a">고객센터</a>
        </div>
        <div class="name">지금 어떤 책을 읽어야 할지 고민하는 사용자의 상태에 맞는 책을 추천해주는 서비스</div>
        <div class="category">
            <ul class="category_ul">
				<li class="category_li"><a href="C:\Users\admin\Desktop\bookstore\category_comedy.html">코미디</a></li>
				<li class="category_li"><a href="/book2">로맨스</a></li>
				<li class="category_li"><a href="/book3">판타지</a></li>
				<li class="category_li"><a href="/book4">공포/스릴러/추리</a></li>
				<li class="category_li"><a href="/book5">드라마/가족</a></li>
                <li class="category_li"><a href="C:\Users\admin\Desktop\bookstore\donation.html">기부앤테이크</a></li>
                <li class="category_li">
                    <div class="search">
                    <input type="text" class="searchBox" placeholder="  검색어를 입력하세요">
                    <img src="/img/Find Logo.png" class="search_img">
                    </div>
                </li>
			</ul>
        </div>

		<div class="container">
			<h2>LOGIN</h2>
			<form action="/doLogin" method="post" id="L_fm">
			<div class="abc">
				<div class="form-group">
					 <input type="text"
						id="id" name="id" placeholder="아이디를 입력해 주세요.">
				</div>
				<div class="form-group">
					 <input type="password"
						id="pwd" name="pwd" placeholder="비밀번호를 입력해 주세요."><img src="/img/free-icon-eye-show.jpg" id="showPwd">
				</div>
				
				<div class="form-group">
					<button type="submit">로그인</button>
				</div>
			</form>
			<div class="form-group1">
				<a href="/findId">아이디/비밀번호 찾기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/certified">회원가입</a>
			</div>
		</div>
		</div>
		
		${guide}
		
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>

$(document)

.on('submit','#L_fm',function(){
   
   let id = $('#id').val();
   if(id == '' || id == null) {
      
      alert('아이디 항목은 필수 입력값입니다.');
      return false;

   } else {
      
      let pwd = $('#pwd').val();
      if(pwd == '' || pwd == null) {
      
         alert('패스워드 항목은 필수 입력값입니다.');
         return false;

      }
   }
})

$(document)

document.getElementById("showPwd").addEventListener("click", function() {
		var passwordInput = document.getElementById("pwd");
		var eyeIcon = document.getElementById("showPwd");
		
		if (passwordInput.type === "password") {
			passwordInput.type = "text";
			eyeIcon.src = "/img/free-icon-eye-hidden.jpg";
		} else {
			passwordInput.type = "password";
			eyeIcon.src = "/img/free-icon-eye-show.jpg";
		}
	});

// .ready(function() {

//   $('#showPwd').on('click', function() {

//     var passwordField = $('#pwd');

//     var passwordFieldType = passwordField.attr('type');

//     if(passwordFieldType == 'password') {

//         passwordField.attr('type', 'text');

//         $(this).val('Hide');
        
//     } else {

//         passwordField.attr('type', 'password');

//         $(this).val('Show');
//     }
    
//   });
// })

</script>
</html>