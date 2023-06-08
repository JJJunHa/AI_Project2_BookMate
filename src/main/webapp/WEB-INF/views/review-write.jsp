<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/review.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<title>북메이트 - 리뷰작성페이지</title>
</head>
<body>

<input value="<%=session.getAttribute("id")%>" hidden>

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
        <div class="contentBody-main">
        <button id=openRev_btn class="openRev_btn">리뷰작성버튼</button>
        	<div class="dialog-write" id=dialog-write style="display:none;">
        		<div class=dialog-main>
        			<p style="font-size:15px; text-align:center;"> <b>상품 후기 작성하기</b></p>
        			<div class=dialog-book>
        				<div class=book-img>
        					<img src="/img/공포,스릴러,추리 pic1.jpg" class="book_img">
        				</div>
        				<div class=book-info>
        					<p class=book-name>칵테일, 러브, 좀비 리커버</p>
        					<p class=book-qty>1권</p>
        					<p class=book-price>10000원</p>
        				</div>
        			</div>
        			<div class=dialog-review>
        				<table class=dialog-table>
        					<tr>
        						<th>아이디</th><td><input type="text" class=dialog-id id=dialog-id readonly></td>
        					</tr>
        					<tr>
        						<th>제목</th><td><input type="text" class=dialog-text id=dialog-text>&nbsp;&nbsp;&nbsp;<font id="check_title" size=2></font></td>
        					</tr>
        					<tr>
        						<th>평점</th><td><input type="radio" name=rating value=1 id=one>★
        										<input type="radio" name=rating value=2 id=two>★★
        										<input type="radio" name=rating value=3 id=three>★★★
        										<input type="radio" name=rating value=4 id=four>★★★★
        										<input type="radio" name=rating value=5 id=five>★★★★★ &nbsp;&nbsp;&nbsp;<font id="check_rating" size=2></font></td>
        					</tr>
        					<tr>
        						<th style="height:300px;">내용</th><td><textarea id="summernote" name="summernote"></textarea></td>
        					</tr>
<!--         					<tr> -->
<!--         						<th>파일</th><td><input type="file" class="review_img" id="review_img" name="review_img"></td> -->
<!--         					</tr> -->
        				</table>
        				&nbsp;<font id="check_content" size=2></font>
        			</div>
        			<div class=dialog-btn>
        				<button type="button" class="btn-rev" id=submit-rev>등록</button>
        				<button type="button" class="btn-rev" id=cancel-rev>닫기</button>
        			</div>
        			
        		</div>
        	</div>
	    </div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="summernote/summernote-lite.css">
<script>
let fileName = '';
let rev_rating = '';
$(document)
.ready(function() {
	// 별점 하나만 선택 함수
	rev_Selection();
	
	// id 넣기
	let m_id = '<%=session.getAttribute("id")%>';
	$('#dialog-id').val(m_id);
	
	// 리뷰 작성 
   $('#summernote').summernote({
        height: 200,                 
        width: 770,         
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
           callbacks: {
                onKeyup: function(e) {
                    // keyup 이벤트 발생 시 실행할 코드 작성
                	var contentData = $('#summernote').val()
                	if(contentData!=''){
                		$('#check_content').html('');
                	} else if(contentData=='') {
                		$('#check_content').html('내용을 입력하세요.');
                		$('#check_content').attr('color', 'red');
                	}
                      
                }
           }
    })          
 })
 // 리뷰 작성 클릭 시 dialog 열기
.on('click','#openRev_btn', function(){
	$('#dialog-write').dialog({
		 title:'리뷰 작성하기',
			    modal:true,
			    width:900,
			    height:750,
			    resizable:false,
			    show : 'slideDown',
			    hide : 'slideUp'
			});
})
 // 닫기 버튼 클릭 시 dialog 닫기
.on('click','#cancel-rev',function(){
	$(this).closest('.ui-dialog-content').dialog('close');
})
// 등록 버튼 클릭 시 db 저장
.on('click','#submit-rev',function(){
	let id = $('#dialog-id').val();
	let rev_title = $('#dialog-text').val();
// 	let rev_rating = $('input[name="rating"]:checked').val();
	let rev_content = $('#summernote').val();
	// file 값은 fileName 이거임 -> IMG_1097.JPG 이렇게 가져옴.
	
	// 1. 아이디가 null 인지 확인하기
	if(id == '' || id == null) {
		alert("일시적인 오류로 서비스 접속에 실패했습니다. 다시 로그인 해주세요.")
		document.location="/login";
	}
	// 2. 제목을 입력했는지 확인하기
	if(rev_title == '' || rev_title == null) {
		$('#check_title').html('제목을 입력하세요.');
		$('#check_title').attr('color', 'red');
		$('#dialog-text').focus();
// 		return false;
	}
	// 3. 평점을 선택했는지 확인하기
	var radioButtons = document.getElementsByName('rating');
	var selectedButton;

	for (var i = 0; i < radioButtons.length; i++) {
		if (radioButtons[i].checked) {
	    	selectedButton = radioButtons[i];
	    break;
	  }
	}

	if (selectedButton) {
		rev_rating = selectedButton.value;
// 		console.log(rev_rating);

	} else {
		$('#check_rating').html('평점을 선택해주세요.');
		$('#check_rating').attr('color', 'red');
// 		return false;
	}
	
	// 4. 내용을 입력했는지 확인하기
	if(rev_content == '' || rev_content == null) {
		$('#check_content').html('내용을 입력하세요.');
		$('#check_content').attr('color', 'red');
// 		$('#summernote').focus();
// 		return false;
	}
	
// 	// 5. 파일 선택이 없을 시 none-img.png 로 변경
// 	if(fileName == '' || fileName == null) {
// 		fileName = '/img/none-img.png';
// 	}
// 	console.log(fileName);

	// 6. $.ajax로 전송
	// id, rev_title, rev_rating, rev_content, fileName 전송
// 	if(id == '' || rev_title == '' || rev_rating == '' || rev_content == '' || id == null|| rev_title == null || rev_rating == null || rev_content == null) {
		
// 	} else {
// 		let confirmval = confirm('입력 내용으로 리뷰를 작성합니다.');
// 		if(confirmval) {
// 			$.ajax({
// 				url: '/insert_review',
// 				type: 'post',
// 				data: { id:id, rev_title:rev_title, rev_rating:rev_rating,  rev_content:rev_content},
// 				dataType: 'text',
// 				success: function(data) {
// 					if(data=="ok") {
// 							alert("리뷰 작성이 완료되었습니다. \n자세한 내용은 [마이페이지] - [나의 리뷰] 를 확인해주세요.")
// 							document.location="/donation";
// 					} else {
// 						alert("오류로 인해 잠시후에 다시 시도해주세요.")
// 						return false;
// 					}
// 				}
// 			})
// 		} else {
// 			return false;
// 		}	
// 	}
})
	
// 파일 선택 시 이벤트 핸들러
$('#review_img').on('change', function() {
    fileName = $(this).prop('files')[0].name;
//     console.log(fileName);
});

// 제목 입력 시 font 사라지게
$('#dialog-text').on('keyup',function(){
	if($('#dialog-text').val()!=''){
		$('#check_title').html('');
	} else if ($('#dialog-text').val()=='') {
		$('#check_title').html('제목을 입력하세요.');
		$('#check_title').attr('color', 'red');
	}
})

// 내용 입력 시 font 사라지게
/* $('#summernote').on('keyup',function(){
	var contentData = $('#summernote').val()
	if(contentData!=''){
		$('#check_content').html('');
	}
}) */

// 평점 선택시 font 사라지게
$('input[name="rating"]').on('click', function() {
    if ($('input[name="rating"]:checked').length > 0) {
        $('#check_rating').html('');
    }
});

// 별점 하나만 선택
function rev_Selection() {
	var one = document.getElementById("one");
	var two = document.getElementById("two");
	var three = document.getElementById("three");
	var four = document.getElementById("three");
	var five = document.getElementById("three");
	
	if (one.checked) {
		two.checked = false;
		three.checked = false;
		four.checked = false;
		five.checked = false;
	} else if (two.checked) {
		one.checked = false;
		three.checked = false;
		four.checked = false;
		five.checked = false;
	} else if(three.checked) {
		one.checked = false;
		two.checked = false;
		four.checked = false;
		five.checked = false;
	} else if(four.checked) {
		one.checked = false;
		two.checked = false;
		three.checked = false;
		five.checked = false;
	} else if(five.checked) {
		one.checked = false;
		two.checked = false;
		three.checked = false;
		four.checked = false;
	} 
}	
</script>
</html>