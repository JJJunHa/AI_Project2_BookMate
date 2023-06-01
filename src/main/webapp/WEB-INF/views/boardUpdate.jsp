<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="css/board.css">
	<title>BookMate</title>
</head>
<style>

.main {
	width: 100%;
	height: 100%;
	/* border: 1px solid black; */
}

.logo {
	width: 100%;
	height: 100px;
	text-align: center;
}

.logoImg {
	width: 20%;
	margin-top: 20px;
	/* border: 1px solid black; */
	display: inline-block;
}
/* 로그인, 장바구니, 마이페이지, 고객센터 연결 */
.menu {
	width: 100%;
	height: 40px;
	background-color: white;
	text-align: right;
}

a {
	text-decoration-line: none;
}

a:link {
	color: gray;
}
/* 색상상자 */
.name {
	width: 100%;
	height: 20px;
	background-color: #97d4f7;
	color: white;
	text-align: center;
	padding: 20px 0;
}
/* 카테고리 */
.category {
	width: 100%;
	height: 60px;
	background-color: white;
}

.category_ul {
	list-style: none;
	float: right;
}

.category_li {
	float: left;
	margin-right: 20px;
}

a:hover {
	color: #97d4f7;
}
/* 검색창 */
.search {
	position: relative;
	width: 100%;
}

.searchBox {
	width: 250px;
	border: 1px solid #bbb;
	border-radius: 15px;
	padding: 5px 5px;
	font-size: 14px;
}

.search_img {
	position: absolute;
	width: 17px;
	top: 5px;
	right: 10px;
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

#nav {
	width: 1150px;
	padding-right: 160px;
	padding-top: 15px;

	
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
  
</style>
<body>
    <div class="main">
        <div class="logo">
            <img src="/img/logo.png" class="logoImg">
        </div>
        <div class="menu">
            <a href="/login">로그인</a>&nbsp;|&nbsp;<a href="/cart">장바구니</a>&nbsp;|&nbsp;<a href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
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
                    <img src="/img/search.png" class="search_img">
                    </div>
                </li>
			</ul>
        </div>
        
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
								<td><input type="text" id="board_num" name="board_num"
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
        
    })          
 })

.on('click','#btnCancle',function(){
	document.location='/board';
})
</script>
</html>