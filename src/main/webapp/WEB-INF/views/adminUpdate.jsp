<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
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
/* 카테고리 */    
#nav {
	list-style:none;
	height: 40px;
	padding: 5px 1px;
	margin: 0;
	
}
#nav li {
	float:left;
	position:relative;
	margin-top:0.5%;
	padding:0;
}
#nav li a {
	display:block;
	padding:7px 8px;
	margin:0;
	text-decoration: none;
}
#nav ul {
	list-style: none;
	margin:0;
	padding:0;
	position: absolute;
	left:0;
	top:40px;
	text-align: center;
	opacity: 0;
}
#nav ul li {
	float: none;
	margin:0;
	padding:0;
	width: 150px;
	height:40px;
	background-color: white;
}
#nav li:hover ul {
	opacity: 1;
	z-index: 1;
}
#nav li:hover ul li {
	overflow: visible;
	z-index: 1;
}
#nav li ul li:hover > a {
	background-color: #97d4f7;
	color:black;
	margin:0;
	padding:5px;
	z-index: 1;
}
.category {
    width:100%;
    height:60px;
    background-color: white;
}
.category_ul {
    float:right;
}
.category_li {
    float: left;
    margin-right: 10px;
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
    margin-top:2%;
}
.search_img {
    position : absolute;
    width: 17px;
    top: 10px;
    right: 10px;
}
/* ----------------------------------------------*/
.content {
    
	text-align: center;
}
.content_A { 
    width:30%;
/*	 border: 1px solid #bbb;*/
     float:left;
     margin-left:20%;
}
.content_B { 
    width:30%;
	/* border: 1px solid #bbb;*/
     float:right;
     margin-right:20%;
}
.content_C { 
    width:100%;
	/* border: 1px solid #bbb;*/

}


select,
input[type=number],
input[type=file],
input[type=text]:not(.searchBox){
	width:70%;
	border:2px solid #aaa;
	border-radius:4px;
	margin: 8px 0;
	outline: none;
	padding:8px;
	box-sizing: border-box;
	transition:.3s;
}
textarea:focus,
select:focus,
input[type=number]:focus,
input[type=file]:focus,
input[type=text]:focus{
	border-color:dodgerBlue;
	box-shadow:0 0 8px 0 dodgetBlue;
}

label {
color: #467fcf;
font-weight: bold;
display: block;
width: 30%;
margin-left: 15%;
text-align: left;

}
textarea {
    
    height:10em; 
    width:70%;
	border:2px solid #aaa;
	border-radius:4px;
	margin: 8px 0;
	outline: none;
	padding:8px;
	box-sizing: border-box;
	transition:.3s;
}

/* 뉴 버튼 스타일 */
.button {
        text-align: center;
  
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
</style>
<body>
    <div class="main">
        <div class="logo">
    	<a href="/main"><img src="/img/logo.png" class="logoImg"></a>
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
            	
            </li>
             
            <li class="category_li">
            	<div class="search">
                	<input type="text" class="searchBox" placeholder="  검색어를 입력하세요">
                	<img src="/img/search.png" class="search_img">
                </div>
            </li>
		</ul>
	</div>



        
        <div class="content">
       		<h1>상품 수정</h1>
            <hr>
        <div class="content_C">
            <div class="content_A">
             
                <br>
                 <form action="/updatePro" method="post">
                 <label for="label_">상품 번호</label>
                  <input type="text" class="form-control form-control-lg" id="book_num" name="book_num" readonly value="${pro.book_num}"><br>
                   <br>
               
                  <label for="book_name">제목</label>
                  <input type="text" class="form-control form-control-lg" id="book_name" name="book_name" value="${pro.book_name}"><br>
                   <br>
                   
                  <label for="book_price">가격</label>
                  <input type="text" class="form-control form-control-lg" id="book_price" name="book_price" value="${pro.book_price}"><br>
                  <br>
                  
                  <label for="book_genre">장르</label> 
                  <select id="book_genre" name="book_genre" >
					<option value="코미디">코미디</option>
					<option value="로맨스">로맨스</option>
					<option value="판타지">판타지</option>
					<option value="공포/스릴러/추리">공포/스릴러/추리</option>
					<option value="드라마/가족">드라마/가족</option>
					<option selected value="${pro.book_genre}">${pro.book_genre}</option>
					</select> <br>
					
					<br><div class="mb-3">
                  <label for="book_cover">커버 사진</label>
                  <input type="text" id="book_covers" name="book_covers" value="${pro.book_cover}" readonly><br>
                  <input type="file" class="form-control" id="book_cover" name="book_cover" ><br>
                  </div>
                    <br>
                    
                   <label for="book_content">책 소개</label>
                  <textarea class="book_content" id="book_content" name="book_content" >${pro.book_content}</textarea><br>
                   <br>
                </div>
                <div class="content_B">
                    <br>
                  <div class="mb-3">
                  <label for="book_detail">상품 상세</label>
                  <input type="text" id="book_details" name="book_details" value="${pro.book_detail}" readonly><br>
                  <input type="file" class="form-control" id="book_detail" name="book_detail" ><br>
                  </div>
                  <br>
                   
                  <label for="author">작가</label>
                  <input type="text" id="author" name="author"   value="${pro.author}"><br>
                  <br>
                  
                  <label for="publication">출판일</label>
                  <input type="text" id="publication" name="publication"   value="${pro.publication}"><br>
                  <br>
                  
                  <label for="rating">별점</label>
                  <input type="number" class="form-control form-control-lg" id="rating" name="rating"  value="${pro.rating}" max="10" min="0"><br>
                 <br>
          			
          		<label for="emotion">감정</label> 
                  <select id="emotion" name="emotion"  value="${pro.emotion}">
					<option value="슬픔">슬픔</option>
					<option value="사랑">사랑</option>
					<option value="불안">불안</option>
					<option value="분노">분노</option>
					<option value="행복">행복</option>
					<option selected value="${pro.emotion}">${pro.emotion}</option>
					</select> <br>
					<br>
					
					<label for="book_summary">책 요약</label>
                    <textarea class="book_summary" id="book_summary" name="book_summary" >${pro.book_summary}</textarea><br>
                  <br>
                </div>
			</div>

             <div class="button">
                  <input type=submit value='수정' id=btnModify>
                  <input type=button value='삭제' id=btnDelete>
                  <input type=button value='목록' id=btnList>
                  <br><br> 
             </div>
      			  </form>
           
            
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>
$(document)
	.on('click','#btnList',function(){
			document.location='/prolist';
		})
	.on('click','#btnDelete',function(){
		let a=$(book_num).val();
		document.location='/productDelete/'+a;
	})
	 .on('click', '#btnModify', function(){
		 
		 let book_name=$.trim($('#book_name').val());
			if(book_name==''||book_name==null){
				alert('상품명을 입력하시오');
				return false;
			}
			if($('#book_price').val()==''){
				alert('가격을 입력하시오');
				return false;
			}
			if($('#author').val()==''){
				alert('작가를 입력하시오');
				return false;
			}
			if($('#publication').val()==''){
				alert('출판일을 입력하시오');
				return false;
			}
			if($('#rating').val()==''){
				alert('별점을 입력하시오');
				return false;
			}
	        var formData = new FormData();
	        var files = $('#book_cover')[0].files[0];
	        formData.append('file', files);
	
	        var formData2 = new FormData();
	        var prod_content = $('#book_detail')[0].files[0];
	        formData2.append('prod_content_file', prod_content);
	
	        $.ajax({
	            url: '/updatefile',
	            type: 'post',
	            dataType: 'text',
	            data: formData,
	            enctype: 'multipart/form-data',
	            contentType: false,
	            processData: false,
	            success: function(data) {
	                $.ajax({
	                    url: '/updatefile2',
	                    type: 'post',
	                    dataType: 'text',
	                    data: formData2,
	                    enctype: 'multipart/form-data',
	                    contentType: false,
	                    processData: false,
	                    success: function(data) {
	
	                    }
	                });
	            }
	        });
	    });

</script>

</html>