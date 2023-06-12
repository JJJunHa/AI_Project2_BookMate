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

<title>북메이트 - 게시판</title>
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



/*board 추가 부분*/
.content {
	width: 100%;
	height: 700px;
}

.content_A {
	width: 95%;
	height: 100%;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
}

.content2 {
	width: 95%;

	margin: auto;

}

/* 게시판 목록 스타일 */
.board {
	width: 80%;
	border-collapse: collapse;
	margin-left: auto;
	margin-right: auto;
}

/* 테이블 헤더 스타일 */
.board th {
	padding: 12px;
	background-color: #ebedf3;
	border-bottom: 1px solid #c8cfe2;
	font-weight: bold;
	text-align: center;
}

/* 테이블 셀 스타일 */
.board td {
	padding: 12px;
	border-bottom: 1px solid #c8cfe2;
	text-align: center;
}

/* 짝수 번째 행 배경색 지정 */
.board tr:nth-child(odd) {
	background-color: #f8f9fa;
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
	width: 100%;
	height: 1500px;
	
}

.content_A {
	width: 95%;
	height: 100%;
	text-align: center;
	margin-left: auto;
	margin-right: auto;

}

.content2 {
	width: 95%;
	height: 400px;
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
	width: 80%;
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
	padding: 5px;
	border: none;
	border-radius: 3px;
	margin-left: 65px;
	font-size: 15px; /* Adjust the font size as desired */
	resize: vertical;
}

/* 텍스트 에어리어 스타일 */
textarea.form-control {
	resize: vertical;
}

/* 텍스트 박스 눌렀을 때 */
.form-control[readonly] {
	border: none;
	background-color: transparent;
	outline: none;
	cursor: default;
}

/* 댓글 */
.comment {
	margin-top: 20px;
	width: 80%;
/* 	border-top: 1px solid #ccc; */
	border-bottom: 1px solid gray;
	border-radius: 5px;
	padding: 10px;
	margin-left: auto;
	margin-right: auto;
	background: #edf1f3
}

.comment .author-name {
	font-weight: bold;
	margin-bottom: 5px;
}

.comment .comment-content {
	margin-bottom: 10px;
}

.comment .comment-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;



}

.comment .comment-date {
	font-size: 12px;
	color: #888;
}

.comment .btnCModify, .comment .reply-btn {
	border: none;
	background: none;
	color: blue;
	cursor: pointer;
	margin-left: 10px;
}

.comment .btnCModify:focus,
.comment .reply-btn:focus {
	outline: none;
}

.comment .reply-btn {
	color: red;
}
/* ////// */
.tblComment {
	margin-top: 20px;
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}

.tblComment textarea {
	width: 100%;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 3px;
	resize: vertical;
}



.tblComment input[type="button"]:hover {
	background-color: #0056b3;
}

.tblComment td.fdfd {
	padding-right: 10px;
}

.hr {
    
    background-color: gray;
   
}

a {
 	 text-decoration-line: none;
 	 text-align: center;
  	 color: inherit; /* 링크의 색상 제거 */
	}

</style>
<body>

<input value="<%=session.getAttribute("id")%>" type=hidden id=hidden>

	<div class="main">
		<div class="logo">
    	<a href="/main"><img src="/img/logo.png" class="logoImg"></a>
    </div>
    
	<% if(session.getAttribute("id")!=null){ %>
    
    <div class="menu">
        <a href="/logout">로그아웃</a>&nbsp;|&nbsp;<a href="/cart">장바구니</a>&nbsp;|&nbsp;<a href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
    </div>
   
	<% } else {%>
	
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




		<div class="content">

			<div class="content_A">
				<br>

				<h1>문의사항</h1>


				<div class="content2">
					<table class="table-striped">

						<tr>
							<td>제목</td>
							<td colspan="2"><input type="text" class="form-control"
								name="subject" value="${bView.b_TITLE}" readonly></td>
							<td><input type="hidden" id="board_num" value="${bView.board_num}"></td>
						</tr>

						<tr>
							<td>작성자</td>
							<td colspan="3"><input type="text" readonly
								class="form-control" name="subject" id=id value="${bView.ID}"></td>
						</tr>

						<tr>
							<td>등록일</td>
							<td><input type="text" readonly class="form-control"
								name="subject" value="${bView.b_CREATE_DATE}"></td>
							<td>수정일</td>
							<td><input type="text" readonly class="form-control"
								name="subject" value="${bView.b_UPDATE_DATE}"></td>
						</tr>

					
						<tr class="note"> 
                    
                        <td colspan="4"><textarea id="summernote" name="summernote">${bView.b_CONTENT}</textarea></td>
                    	</tr>
                    		
						<tr>	<td colspan="4" class="button">
						<c:if test="${id == bView.ID || sessionScope.id == 'bookmate'}">
						
							<input type="submit" value="수정" id="btnModify"> 
							<input type="button" value="삭제" id="btnDelete">	
						</c:if>
							<input type="button" value="목록보기" id="btnList"> </td>
						</tr>

					</table>
					<br>
					
					
<!-- 	------------------------댓글입력창----------------------------------------------		----------- -->
					<c:if test="${id == bView.ID || sessionScope.id == 'bookmate'}">
					<div class="content5">
						<table class="tblComment">
							<tr>
								<td class=fdfd><textarea cols="60" rows="5"
										id="BC_content" name=BC_content placeholder="답글을 입력하세요."></textarea></td>
							<td class="button"><input type=button value='등록' id=BC_btnInsert></td>
							</tr>
						</table>
						
					</div>
					</c:if>
<!-- 				------------------------------------------------------------------------------------------ -->
				<!-- ----------------------------------------댓글	------------------------------------------------------ -->
			
					<div id="comment" class="comment">

					
					</div>
<!-- 					------------------------------------------------- -->
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
	showBC();	
	
   $('#summernote').summernote({
        height: 350,                 
        width: 900,         
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
    
$('#summernote').summernote('disable')  //써머노트 readonly

 })
 
//목록보기
.on('click','#btnList',function(){
	document.location='/board';
	return false;
})

	
//게시글 수정
.on('click','#btnModify',function(){
	let a=${bView.board_num}
	document.location='/boardUpdate/'+a
	return false;
})

//게시글 삭제
.on('click','#btnDelete',function(){
	let a=${bView.board_num}
	document.location='/bDelete/'+a;
})
//댓글작성
.on('click','#BC_btnInsert',function(){

	$.ajax({url:'/bcInsert',type:'post',
		data:{BC_content:$('#BC_content').val(), board_num:$('#board_num').val()},
		dataType:'text',
		beforeSend:function(){
			let BC_content = $('#BC_content').val();
	    	if(BC_content == '' || BC_content == null) {
	    		alert("답글을 입력하세요")
				return false
	    	}
		},
		success:function(data){
			
			alert("댓글이 등록되었습니다.");
			$('#BC_content').val("");
			showBC();	
			
		}})
})
//댓글 삭제
	.on('click', '#remove', function() {
	
		$.ajax({url:'/bcdel',
			type:'post',
			data:{num:$(this).val()},
			dataType:'text',
                beforeSend:function(){
                			
                			},
                			success:function(data){
                				alert("댓글이 삭제되었습니다.");
                				showBC();
                			}})
                	  
                	  
                	})


//댓글 목록
function showBC() {

  $.ajax({
    url: '/selectBC',
    type: 'post',
    data: {
      board_num: $('#board_num').val() 
    },
    dataType: 'json',
    beforeSend: function() {               
    	
    },
    success: function(data) {
    	
      $('#comment div').remove();
      $('#comment hr').remove();
      for (let i = 0; i < data.length; i++) {
        let box = 
	'<div id="b_writer2" class="author-name">&nbsp;&nbsp;'
									+ data[i]['id']
									+ '</div>'
									+ '<div class="comment-content">'
									+ '  <pre>&nbsp;&nbsp;'
									+data[i]['bc_content']
									+ '</pre>'
									+ '</div>'
									+ '<div class="comment-footer">'
									+ '  <div>'
									+ '    <span class="comment-date">&nbsp;&nbsp;'
									+data[i]['bc_create_date']
									+ '</span>'
									+ '  </div>'
									;
							let box2 =  '  <div>'
							
							
							+'<button id="remove" value="' + data[i]['bcontent_num'] + '" class="reply-btn">삭제</button>&nbsp;&nbsp'

							let box3 = '</div>'+'</div>'+ '<hr>';
					       box4='';
							if (data[i]['check'] == 'check') {
								box4 = box + box2 + box3;
							} else {
								box4 = box + box3;
								
							}
							$('#comment').append(box4);
							
						}
   
					}
				})
	}

</script>
</html>