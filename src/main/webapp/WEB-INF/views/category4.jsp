<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/category.css">
<title>Thriller/Mystery</title>
</head>
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
        <div class="category-All1">
        	<div class="category1-All">
	        	<p class="bookCate">공포/스릴러/추리</p>
		        	<div class="book1-All">
	        			<div class="book">
		        		</div>
					</div>
					<div class=divbody_r_footer>
								<span name="page">1</span>
								<span name="page">2</span>
					</div>
       		</div>	
		</div>
</div>
</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)
.ready(function(){
	$('span[name=page]:eq(0)').trigger('click')
})
.on('click','span[name=page]',function(){
	var pageNum = parseInt($(this).text())
	$('span[name=page]').css({'background-color':'#fff','color':'#000'})
	$(this).css({'background-color':'#000','color':'#fff'})
	loaddata(pageNum);
})


.on('click','.book_img',function(){
	let imgval = $(this).attr("picname");
// 	console.log(imgval);
	document.location='/detail/'+imgval;
})



function loaddata(pageNum){
	$.ajax({
		url:"/load_category4",
		data:{pageNum:pageNum},
		type:"post",
		dataType:"json",
		success:function(data){
			let i=0
			let endPage = parseInt(data[0]['howmany'])
			var pageStr=''
			$('.divbody_r_footer').empty()
			for(i=1; i<=endPage; i++){
				pageStr=pageStr+ '&nbsp;<span name=page>'+i+'</span>&nbsp;'
			}
			$('.divbody_r_footer').append(pageStr)
			$('.book').empty()
			for(i=1; i<data.length; i++){		
					let Prod_img = '<img src="'+data[i]['book_cover']+'" class="book_img" alt="" picname="'+data[i]['book_num']+'">'
					let str = "<p id=name>"+data[i]['book_name']+"</p>" + "<p id=write>"+data[i]['author']+"</p>" + "<p id=date>"+data[i]['publication']+"</p>" + "<p id=price>"+data[i]['book_price']+"</p>"  
					let div ='<div class="a"><div class="bookImg">'+Prod_img+'</div><div class="bookName">'+str+'</div></div>'
					$('.book').append(div)
					}
			
		}})
}
</script>
</html>