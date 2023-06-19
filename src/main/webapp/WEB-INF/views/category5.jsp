<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/category.css">
<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
<title>북메이트 | 드라마</title>
</head>
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
				&nbsp;|&nbsp;<a href="/board">고객센터</a>
			</div>
		
		<% } else { %>
		
			<div class="menu">
				<a href="/login">로그인</a>&nbsp;|&nbsp;<a href="/certified">회원가입</a>&nbsp;|&nbsp;<a href="/login" onclick="alert('로그인 후 이용해주세요')">장바구니</a>&nbsp;|&nbsp;<a href="/login" onclick="alert('로그인 후 이용해주세요')">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
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
            		<select name="type" id="searchForm">
							<option value="book_name||AUTHOR">전체검색</option>
							<option value="book_name">제목</option>
							<option value="AUTHOR">저자</option>
					</select> 
                	<input type="text" id="keyword" name="keyword" class="searchBox" placeholder="  검색어를 입력하세요">
                	<img src="/img/search.png" class="search_img" id=Submit alt="Submit" type="submit">
                </div>
            </li>
		</ul>
	</div>
        <div class="category-All1">
        	<div class="category1-All">
	        	<p class="bookCate">드라마/가족</p>
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
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
$(document)
.ready(function(){
	$('span[name=page]:eq(0)').trigger('click')
	setInterval(changeText, 1500);
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

// 검색어 기능 구현
.on('click','#Submit',function(){
	let selectVal = $('#searchForm').val();
// 	console.log(selectVal);
	let keyword = $('#keyword').val().trim();
// 	console.log(keyword);
	if(keyword==='') {
		alert('검색어를 입력해주세요.');
		$('#keyword').val('');
		return false;
	} else {
		$.ajax({
			url:"/search",
			data:{selectVal:selectVal, keyword:keyword},
			type:"post",
			dataType:"json",
			success:function(data){
				$('.divbody_r_footer').empty();
				$('.book').empty();
				for(i=0; i<data.length; i++){		
						let Prod_img = '<img src="'+data[i]['book_cover']+'" class="book_img" alt="" picname="'+data[i]['book_num']+'">'
						let str = "<p id=name>"+data[i]['book_name']+"</p>" + "<p id=write>"+data[i]['author']+"</p>" + "<p id=date>"+data[i]['publication']+"</p>" + "<p id=price>"+data[i]['book_price']+"</p>"  
						let div ='<div class="a"><div class="bookImg">'+Prod_img+'</div><div class="bookName">'+str+'</div></div>'
						$('.book').append(div);
// 						console.log(div);
						}
				
			}})
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

function loaddata(pageNum){
	$.ajax({
		url:"/load_category5",
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