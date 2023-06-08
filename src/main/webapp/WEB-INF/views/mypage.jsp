<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <link rel="stylesheet" href="./style.css"/>
    <link rel="stylesheet" href="css/mypage.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" 

 integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous"> 
    <title>북메이트 | 마이페이지</title>
</head>
<body>

<input value="<%=session.getAttribute("id")%>" hidden>

	<div class="container">

		<div class="logo">
			<a href="/main"><img src="/img/logo.png" class="logoImg"></a>
		</div>

		<div class="menu">
			<a href="/logout">로그아웃</a>&nbsp;|&nbsp;<a href="/cart">장바구니</a>&nbsp;|&nbsp;<a
				href="/mypage">마이페이지</a>&nbsp;|&nbsp;<a href="/board">고객센터</a>
		</div>

		<div class="name">지금 어떤 책을 읽어야 할지 고민하는 사용자의 상태에 맞는 책을 추천해주는 서비스</div>
		<div class="category">
			<ul class="category_ul" id="nav">
				<li class="category_li"><a href="/category1">코미디</a></li>
				<li class="category_li"><a href="/category2">로맨스</a></li>
				<li class="category_li"><a href="/category3">판타지</a></li>
				<li class="category_li"><a href="/category4">공포/스릴러/추리</a></li>
				<li class="category_li"><a href="/category5">드라마/가족</a></li>
				<li class="category_li"><a href="/donation">기부앤테이크<i
						class='dropDown'></i></a></li>

				<li class="category_li">
					<div class="search">
						<input type="text" class="searchBox" placeholder="  검색어를 입력하세요">
						<img src="/img/search.png" class="search_img">
					</div>
				</li>
			</ul>
		</div>
		
		<!-- Content -->
		<div class="content">
			<div class="container">
				<h1 class="mypage fst-italic">마이페이지</h1>


				<div class="tab-menu">
					<div id="delivery-tab" class="tab-item"
						onclick="changeTab('delivery')">주문 내역</div>
					<div id="posts-tab" class="tab-item active"
						onclick="changeTab('posts')">나의 게시글</div>
					<div id="comments-tab" class="tab-item"
						onclick="changeTab('comments')">나의 댓글</div>
					<div id="membership-tab" class="tab-item"
						onclick="changeTab('membership')">회원정보 변경</div>
				</div>

				<div id="delivery" class="content-container">
					<div class="delivery-container">
						<h2 class="mytext fst-italic">주문 내역</h2>



					</div>
				</div>


				<div id="posts" class="content-container active">
					<div class="posts-container">
						<h2 class="mytext fst-italic">게시글</h2>
						<table class="table table-hover" id="tblBoard">
							<thead>
								<tr>
									<th>POST ID</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>

								<tr>

								</tr>

								<tr>

								</tr>

								<tr>

								</tr>

							</tbody>
						</table>
					</div>



				</div>
				<div id="comments" class="content-container">
					<div class="comments-container">
						<h2 class="mytext fst-italic">댓글</h2>
						<table class="table table-hover" id="tblBoard2">
							<thead>
								<tr>
									<th>POST ID</th>
									<th>댓글내용</th>
									<th>작성자</th>
									<th>작성일</th>

								</tr>
							</thead>
							<tbody>

								<tr>

								</tr>

								<tr>

								</tr>

								<tr>

								</tr>

								<tr>

								</tr>

							</tbody>
						</table>
					</div>


				</div>
				<div id="membership" class="content-container">

					<div class="membership-container">
						<div class="text">


							<div class="text2">

								<div class="name">아이디</div>

								<div class="name2">비밀번호</div>

								<div class="name3">비밀번호 확인</div>

								<div class="name4">이름</div>

								<div class="name5">주소</div>

								<div class="name6">휴대전화</div>

								<div class="name7">이메일</div>

								<div class="name8">생년월일</div>




							</div>

							<c:forEach var="my" items="${selectMy}">
								<div class="text3">

									<div class="information">

										<input type="text" readonly id="j_id" name="j_id"
											value="${my.id}" style="width: 200px;">
										<div style="font-size: 12px;">(영문소문자/숫자,4~16자)</div>

										<label id=idGuide style="font-size: 10px"></label>

									</div>

									<div class="information2">

										<input type=password id=j_pwd name=j_pwd value="${my.pwd}">
										<div style="font-size: 3px;">(영문대소문자/숫자/특수문자,10~16자)</div>

										<label id=psGuide style="font-size: 10px"></label>

									</div>

									<div class="information3">

										<input type=password id=j_pwdcf name=j_pwdcf><br>
										<br> <label id=psGuide2 style="font-size: 10px"></label>

									</div>

									<div class="information4">

										<input type=name id=j_name name=j_name value="${my.name}"
											required>

									</div>

									<div class="information5">

										<input type="address" class="address-input" id=zip_code
											name=zip_code placeholder="우편번호" value="${my.zip_code}"
											readonly><input type="button"
											class="btn btn-secondary"
											onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
											style="width: 130px; height: 30px; margin-left: 10px;"><br>

										<br> <input type="address" id=j_address1 name=j_address1
											readonly class="address2-input" placeholder="기본주소"
											value="${showAdr.address1}" required> <br> <br>
										<input type="address" id=j_address2 name=j_address2
											class="address2-input" placeholder="상세주소"
											value="${showAdr.address2}" required>

									</div>

									<div class="information6">

										<input type="tel" id=j_fisrtphone name=j_firstphone
											style="width: 80px;" value="${showMob.mobile1}"> </select> - <input
											type="tel" id=j_midphone name=j_midphone
											class="general-number" value="${showMob.mobile2}" required>
										- <input type="tel" id=j_lastphone name=j_lastphone
											class="general-number" value="${showMob.mobile3}" required>

									</div>

									<div class="information7">

										<input type="email" id=j_email name=j_email
											value="${my.email}" required>

									</div>
									<br>

									<div class="information8" style="display: flex; gap: 10px;">

										<label for="year"></label> <input type="text" id="j_year"
											name="j_year" style="width: 100px;" value="${showBir.birth1}">

										<!-- 연도 -->




										<label for="month"></label> <input type="text" id="j_month"
											name="j_month" style="width: 80px;" value="${showBir.birth2}">

										<!-- 월 -->




										<label for="day"></label> <input type="text" id="j_day"
											name="j_day" style="width: 80px;" value="${showBir.birth3}">

										<!-- 일 -->

									</div>

								</div>

							</c:forEach>
						</div>
						<br>
						<div class="button">

							<input type="button" id="btnupdate" style="border-radius: 30px;"
								value="회원정보 수정"> <input type="button" id="btncancel"
								style="border-radius: 30px;" padding:50px; value="취소">

						</div>

					</div>
				</div>

			</div>

		</div>

	</div>
</body>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

})

// 비밀번호 입력 필드의 값이 변경될 때마다 정규 표현식 패턴에 맞는지 확인

pwField.on('change', function() {

var pw = pwField.val();

if (!pwPattern.test(pw)) {

alert('비밀번호는 영어 소문자, 대문자, 숫자, 특수문자(@$!%*#?&) 중 최소 1개 이상을 포함하여 8~22자 이내로 입력해주세요.');

pwField.val('');

}

});

})


/////////////////////////////////// 나의 주문내역 ///////////////////////////////

.on('click', '#img', function() {
    
    let s_no=$(this).prop('alt');
    if(s_no.includes('상품')){
    	s_no=s_no.replace('상품','');
    document.location = '/pdetail/'+s_no;
    return false;
    }
    if(s_no.includes('룸')){
    	s_no=s_no.replace('룸','');
    document.location = '/rdetail/'+s_no;
    return false;
    }
})

////////////////////////마이페이지 주문내역에서 ReCart in code///////////////////
	
.on('click','#btncartIn',function(){
	var name = $(this).attr('name');
	alert(name);
	
	if('<%=session.getAttribute("id")%>'!=null) {
		
		$.ajax({url:'/MyPageAddCart', type:'post', dataType:'text', 
			data:{id:'<%=session.getAttribute("id")%>
	',
							prod_num : name,

						},
						success : function(data) {

							if (data == "ok") {

								// 					alert('입력이 성공했습니다.');
								document.location = '/ShowCart';
							}
						},

						error : function() {
							alert('로그인 먼저 해주세요.');
							return false;
						}
					});

				} else {

					alert('로그인 먼저 해주세요.');
					return false;

				}

			})

			.on('click', '#btnrevIn', function() {

				var num = $(this).attr('name');

				num = num.split('룸');
				if (num[1] == "") {

					$.ajax({
						url : '/showReview1',
						type : 'post',
						dataType : 'text',
						data : {
							prod_num : num[0].replace('상품', '')

						},
						success : function(data) {

							document.location = "/showReview?token=" + data;

						}

					});
				} else {

					$.ajax({
						url : '/showReview2',
						type : 'post',
						dataType : 'text',
						data : {
							room_num : num[1]

						},
						success : function(data) {

							document.location = "/showReview3?token=" + data;

						}

					})

				}

			})

	////////////////////////마이페이지 주문내역에서 ReCart in code///////////////////	

	// })

	/////////////////////////////////// 나의 주문내역 ///////////////////////////////

	/////////////////////////////////// 나의 게시글 ///////////////////////////////

	$(document)

	.ready(function() {
		$('[name*="팀플넘무좋아"]').hide();
		loadData();

	})

	$(document)

	.on('click', '#tblBoard tr', function() {

		let a = $(this).find('td:eq(0)').text();
		let b = $(this).find('td:eq(2)').text();

		console.log(a);
		console.log(b);

		$.ajax({
			url : '/doQview',
			type : 'get',
			data : {
				name : b,
				num : a
			},
			dataType : 'text',
			beforeSend : function() {

			},
			success : function(data) {
				document.location = "/Qview?token=" + data;
			}
		})
	}).on('click', '#tblBoard2 tr', function() {

		let a = $(this).find('td:eq(0)').text();
		let b = $(this).find('td:eq(2)').text();

		console.log(a);
		console.log(b);

		$.ajax({
			url : '/doQview2',
			type : 'get',
			data : {
				name : b,
				num : a
			},
			dataType : 'text',
			beforeSend : function() {

			},
			success : function(data) {
				document.location = "/Qview?token=" + data;
			}
		})
	})

	///////////////////////////////////나의 게시글///////////////////////////////

	///////////////////////////////////나의 댓글///////////////////////////////

	$(document)

	.ready(function() {

		showBC();

	})

	// $(document)

	// .on('click','#tblBoard tr',function(){

	// 	let a=$(this).find('td:eq(0)').text();
	// 	let b=$(this).find('td:eq(2)').text();

	// 	console.log(a);
	// 	console.log(b);

	// 	$.ajax({url:'/doQview',type:'get',data:{name:b,num:a},dataType:'text',
	// 		beforeSend:function(){

	// 		},
	// 		success:function(data){
	// 			document.location="/Qview?token="+data;
	// 		}})
	// })

	///////////////////////////////////나의 댓글///////////////////////////////

	///////////////////////////////////회원정보 변경/////////////////////////////
	$(document)

	.on('click', '#btncancel', function() {

		document.location = '/login';

	})

	.on('click', '#btnupdate', function() {

		var address1 = $('#j_address1').val();
		var address2 = $('#j_address2').val();
		var address = address1 + "@" + address2;

		var mobile1 = $('#j_fisrtphone').val();
		var mobile2 = $('#j_midphone').val();
		var mobile3 = $('#j_lastphone').val();
		var mobile = mobile1 + " " + mobile2 + " " + mobile3;

		var birth1 = $('#j_year').val();
		var birth2 = $('#j_month').val();
		var birth3 = $('#j_day').val();
		var birth = birth1 + "-" + birth2 + "-" + birth3;

		$.ajax({
			url : '/updateMy',
			type : 'post',
			dataType : 'text',
			data : {
				id : $('#j_id').val(),
				id2 : '
<%=session.getAttribute("id")%>',
        	  pwd:$('#j_pwd').val(),
              name:$('#j_name').val(),
              email:$('#j_email').val(),
              zip_code:$('#zip_code').val(),  
              address:address,         
              mobile:mobile,
              birth:birth},
              
              success:function(data){
                  
                  
                  if(data=="ok") {
                 	 
 					  
                  } else {	
                 	 
 		               alert(data);
                  }
                  
                
          }
              
	});
	
	
	
let id = $('#j_id').val();

if(id==''){alert('아이디를 입력해주세요'); return false;}


let ps1 = $('#j_pwd').val(); if(ps1==''){alert('비밀번호를 입력해주세요');return false;}

let ps2 = $('#j_pwdcf').val();


if(ps1!=ps2){alert('비밀번호가 일치하지 않습니다');return false;}

document.location = '/logout';
return false;

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
///////////////////////////////////회원정보 변경/////////////////////////////



function loadData(){
	
	$.ajax({url:'/myPlist',type:'get',data:{id:'<%=session.getAttribute("id")%>'},dataType:'json',
		success:function(data){
// 			$('#tblBoard tr:gt(0)').remove();
			for(let i=0; i<data.length; i++){
				
				let str='<tbody><tr>';
				str+='<td>'+data[i]['board_num']+'</td>';
				str+='<td>'+data[i]['Btitle']+'</td>';
				str+='<td>'+data[i]['B_writer']+'</td>';
				str+='<td>'+data[i]['B_Create_date']+'</td>';
				str+='<td>'+data[i]['B_rcount']+'</td></tr></tbody>';
				$('#tblBoard').append(str);
				
			}
			
			 rowTotals =$('#tblBoard').find('tr:gt(0)').length;
			console.log(rowTotals);
			 $('#setRows').submit();
		}})
		return false;
}




///////////////////////0410 현영수정//////////////////////
function showBC() {
	  $.ajax({
	    url: '/showBC',
	    type: 'post',
	    data: {id:'<%=session.getAttribute("id")%>'},dataType: 'json',
	    beforeSend: function() {               
	    },
	    success: function(data) {
		for(let i=0; i<data.length; i++){
				
				let str='<tbody><tr>';
				str+='<td>'+data[i]['BC_num']+'</td>';
				str+='<td>'+data[i]['BC_content']+'</td>';
				str+='<td>'+data[i]['BC_writer']+'</td>';
				str+='<td>'+data[i]['BC_create']+'</td></tr></tbody>';
				$('#tblBoard2').append(str);
				
			}
	    }
	  });
	}

///////////////////0410 현영 수정 끝//////////////////////
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

$("#delivery-tab").click(function () {
    changeTab("delivery");
})

$("#posts-tab").click(function () {
    changeTab("posts");
})

$("#comments-tab").click(function () {
    changeTab("comments");
})

$("#membership-tab").click(function () {
    changeTab("membership");
})


function changeTab(tab) {
    $(".tab-item").removeClass("active");
    $(".content-container").removeClass("active");

    $("#" + tab + "-tab").addClass("active");
    $("#" + tab).addClass("active");
}



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$(document).ready(function() {
            $('#submit').click(function() {
                window.open('https://kcp.co.kr/main.do', '_blank', 'width=800, height=600');
            });
        })
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
</script>
</html>