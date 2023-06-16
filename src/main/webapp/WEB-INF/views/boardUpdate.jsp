<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
	<link rel="stylesheet" href="css/board.css">
	<title>BookMate</title>
</head>
<style>

.main {
    width:100%;
    height:100%;
    /* border: 1px solid black; */
}
.logo {
    width:100%;
    height:100px;
    text-align: center;
}
.logoImg {
    width:20%;
    margin-top:20px;
    /* border: 1px solid black; */
    display: inline-block;
}
/* 로그인, 장바구니, 마이페이지, 고객센터 연결 */
.menu {
    width:100%;
    height:40px;
    background-color: white;
    text-align : right;
}
a {
    text-decoration-line: none;
}
a:link {
    color : gray;
}
/* 색상상자 */
.name{
    width:100%;
    height:20px;
    background-color: #97d4f7;
    color:white;
    text-align : center;
    padding : 20px 0;
}

/* 마우스 호버 효과 */
.board tr:hover {
	background-color: #ebedf3;
}

/* 제목 링크에 언더라인 및 호버 효과 */
.board a.title-link {
	text-decoration: underline;
}

.board a.title-link:hover {
	text-decoration: none;
}
/* 페이지네이션 */
.off-screen {
	display: none;
}



#nav a {
	display: inline-block;
	padding: 3px 5px;
	margin-right: 10px;
	margin-left: 1px;
	margin-right: 5px;
	font-family: Tahoma;
/* 	background: #ccc; */
	color: #000;
	text-decoration: none;
}

#nav a.active {
	background: #c8cfe2;
	color: #000;
}

.btnNew {
	position: relative;
	left: 420px; 
	top: 15px;
	background-color: #7ca8c2;
	padding: 7px 11px;
        border: none;
        border-radius: 10px;
        color: #fff;
        cursor: pointer;
}
    .btnNew:hover {
	background-color: #0056b3;
}


/* ----------- */

  /* 뉴 버튼 스타일 */
    .button {
        text-align: right;
    }
    
    .button input[type="submit"],
    .button input[type="button"] {
        padding: 7px 11px;
        border: none;
        border-radius: 10px;
        color: #fff;
        cursor: pointer;
    }
    
    .button input[type="submit"] {
        background-color: #7ca8c2;
    }
    
    .button input[type="button"] {
        background-color: #7ca8c2;
    }
    .button input[type="button"]:hover {
	background-color: #0056b3;
}
    .button input[type="submit"]:hover {
	background-color: #0056b3;
}

/* 추가부분 */
.content {
    width:100%;
    height:700px;
  
}
.content_A {
    width:100%;
    height:100%;
    text-align: center;
    margin-left: auto;
    margin-right:auto;
}
.content2 {
    width:100%;
    height:400px;
    text-align: left;
   
    /* border: 1px solid red; */
}
.table-striped {
    margin: auto;

}
.hr {
    
    background-color: gray;
   
}
.table-striped {
        width: 60%;
        border-collapse: collapse;
    }
    
    /* 테이블 셀 스타일 */
.table-striped td {
	padding: 10px;
	border-bottom: 1px solid #ccc; 
}

/* 입력 필드 스타일 */
.form-control {
	width: 85%;
	padding: 2px;
	border:none;
	border-radius: 3px;
	margin-left: 60px;
	font-size: 15px; /* Adjust the font size as desired */
    resize: vertical;
}

/* 텍스트 에어리어 스타일 */
textarea.form-control {
	resize: vertical;
}

/* 텍스트 박스 눌렀을 때 */
 .form-control {
            border: none;
            background-color: transparent;
            outline: none;
            cursor: default;
        }
     /* 뉴 버튼 스타일 */
     .button {
        text-align: right;
    }
    
    .button input[type="submit"],
    .button input[type="button"] {
        padding: 7px 11px;
        border: none;
        border-radius: 10px;
        color: #fff;
        cursor: pointer;
    }
    
    .button input[type="submit"] {
        background-color: #7ca8c2;
    }
    
    .button input[type="button"] {
        background-color: #7ca8c2;
    }
  .dropdown {
    position: relative;
    display: inline-block;
}

.dropbtn {
    font-size: medium;
    background-color: inherit;
    color : black;
    padding: 0;
    border: none;
    cursor: pointer;
}
.dropbtn:hover {
    color: #97d4f7;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color : gray;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {
    background-color: #97d4f7;
}

.dropdown:hover .dropdown-content {
    display: block;
}
/* 저작권 */
.footer_img {
	width: 15%;
	margin-top:1%;
/* 	height:100px; */
}
footer {
    display: block;
    margin-bottom:10px;
	padding:10px;
}
.footer-layer2 {
	display: flex;
}
.footer_new .footer-layer2 {
    width: 100%;
    height: 170px;
    margin: 30px auto;
    font-size: 12px;
    color: #555;
    line-height: 150%;
}
.footer_new {
    border-top: #ddd solid 2px;
    background: #fff;
}
.footer-1, .footer-2, .footer-3 {
	list-style: none;
	position: relative;
    padding-left: 15px;
    font: 14px/1.7 'SDNeoL', 'notoL';
    color: #999;		
}
.footer-1 {
	width: 25%;
}
.footer-2 {
	width: 45%;
}
.footer-3 {
	width: 30%;
}
.titlename {
	color:#58ACFA;
	margin-left:1%;
}
.provTit {
    margin: 14px 0 5px;
/*     font: 15px/1.5 'SDNeoL', 'notoR'; */
    color: #222;
    }
</style>
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
				<a href="/login">로그인</a>&nbsp;|&nbsp;<a href="/certified">회원가입</a>&nbsp;|&nbsp;<a href="/login" onclick="alert('로그인 후 이용해주세요')">장바구니</a>&nbsp;|&nbsp;<a href="/login" onclick="alert('로그인 후 이용해주세요')">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
			</div>
		
		<% } %>
		
    <div class="name">지금 어떤 책을 읽어야 할지 고민하는 사용자의 상태에 맞는 책을 추천해주는 서비스</div>
           
       <div class="content">
            
            <div class="content_A">
                <br>
                
                <h1>수정하기</h1>
                
            <hr><br><br>
            <div class="content2">
             <form action="/boardModify" method="post" >
                <table class="table-striped">
                  
							<tr>
								<td>제목</td>
								<td colspan="2"><input type="text" class="form-control"
									id="B_title" name="B_title" value="${bViews.b_TITLE}"></td>
								<td><input type="hidden" id="board_num" name="board_num"
									value="${bViews.board_num}"></td>
							</tr>

							<tr>
								<td>작성자</td>
								<td><input type="text" readonly class="form-control"
									id="ID" name="ID" value="${bViews.ID}"></td>
								<td>등록일</td>
								<td><input type="text" readonly class="form-control"
									id="b_CREATE_DATE" name="b_CREATE_DATE"
									value="${bViews.b_CREATE_DATE}"></td>
							</tr>
							<tr>

								<td colspan="4"><textarea id="summernote" name="summernote">${bViews.b_CONTENT}</textarea></td>
							</tr>


							<tr>

								<td colspan="4" class="button">
								<input type="submit" value="수정" class="btnUpdate" id="btnUpdate"> 
								<input type="button" value="취소" class="btnCancle" id="btnCancle">

								</td>
							</tr>
			</table>
           	</form>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script>
$(document)
.ready(function() {
	setInterval(changeText, 1500);
   $('#summernote').summernote({
        height: 350,                 
        width: 700,         
        focus: true,                  
        lang: "ko-KR",               
        placeholder: '<br>내용을 입력하시오. <br> 최대 2000자까지 입력할 수 있습니다', 
        toolbar: [
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['fontname', ['fontname']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['image',['picture']]
           ],
           fontNames: 
              ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
        
    });  

$(document)
.on('click', '#btnCancle', function() {
    document.location = '/board';
})
.on('click', '#btnUpdate', function() {
    let v_title = $('#B_title').val();
    let v_content = $('#summernote').val();
    // 2. 제목을 입력했는지 확인하기
    if (v_title == '' || v_title == null) {
        alert("제목을 입력하세요");
        return false;
    }
    if (v_content == '' || v_content == null) {
        alert("내용을 입력하세요");
        return false;
    }
});
});

$(document)
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
</script>
</html>