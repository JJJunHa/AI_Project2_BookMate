<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
	crossorigin="anonymous">
<link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon"
	sizes="16x16">
<link rel="stylesheet" href="css/findId.css">
<title>북메이트</title>
</head>
<body>

	<div class="content">

		<div class="content2">
			<div class="logo">
				<a href="/main"><img src="/img/logo.png" class="logoImg"></a>
			</div>

			<div class="container">

				<div class="tab-wrapper">
					<div class="tab" id="idTab" onclick="changeTab('id')">아이디 찾기</div>
					<div class="tab" id="pwdTab" onclick="changeTab('pwd')">비밀번호 찾기</div>
				</div>
				
				<div class="form-wrapper" id="idFormWrapper">
					<div align=center class="radio-wrap minsuk">
						<label><input type="radio" name="find_id_type"
							id="use_email" value="email" checked="checked" /> 이메일</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<label><input type="radio" name="find_id_type"
							id="use_phone" value="mobile" /> 휴대폰</label>
					</div>
					<input type="text" id="name" name="name" placeholder="이름을 입력해주세요."><br>
					<div class="div-idtype" id="find_id_email_wrap">
						<input type="email" id="email" name="email"
							placeholder="이메일을 입력해주세요.">
					</div>
					<div class="div-idtype" id="find_id_mobile_wrap"
						style="display: none;">
						<input type="text" id="mobile" name="mobile"
							placeholder="휴대폰 번호를 입력해주세요.">
					</div>

					<button id="btnFind">아이디 찾기</button>
					
					<input type="hidden" id="findid" style="border: none" placeholder="아이디:">
				</div>

				<div class="form-wrapper" id="pwdFormWrapper">
					<input type="text" id="pwdnm" placeholder="이름을 입력해주세요.">
					<input type="text" id="pwdid" placeholder="아이디를 입력해주세요.">
					<input type="email" id="pwdem" placeholder="이메일을 입력해주세요.">
					<button id="submit">비밀번호 찾기</button>
				</div>

			</div>

		</div>

	<div class="findidDialog" id="findidDialog"></div>
</div>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="script.js"></script>
<script>

$(document)
.ready(function() {
    // 초기 탭 설정
    changeTab('id');
})


$(document)
.on('click','#btnFind',function(){	
	var name = $('#name').val();
    var email = $('#email').val();
    var mobile = $('#mobile').val();
    var checked = $('input[name=find_id_type]:checked').val();

    if (!name) {
        alert('이름을 입력해주세요.');
        return;
    }

    if (checked == 'email' && !email) {
        alert('이메일을 입력해주세요.');
        return;
    }

    if (checked == 'mobile' && !mobile) {
        alert('휴대폰번호를 입력해주세요.');
        return;
    }
    
	if($('#use_email').prop('checked')==true){
		$.ajax({
			url:'/using_email',
			data:{name:$('#name').val(), mail:$('#email').val()},
			type:'post',
			dataType:'text',
			beforesend:function(data){
				$('#findid').val('')
			},
			success:function(data){
				if(data!=""){
				alert("회원님의 아이디는 "+data+"입니다.");
				$('#findid').val('회원님의 아이디는 '+data+'입니다.');	
				$('#name').val('');
			    $('#email').val('');
// 				alert($('#findid').val());
				$('#findidDialog').dialog({
//                     title:'아이디 찾기 결과',
                    modal:true,
                    width:450,
                    height:350,
                    resizable:false,
                    buttons: {
                        '닫기': function() {
                            $(this).dialog('close');
                        }
                    },
                    open:function(){
                        $(this).html('<p>아이디 찾기 결과 </p><p>아이디: '+data+'</p>');
                    }
                });
				}else{
					alert('입력하신 정보에 해당하는 아이디가 없습니다.');
					$('#name').val('');
				    $('#email').val('');
				}
			}
		});
	}else if($('#use_phone').prop('checked')==true){
		console.log('using phone')
		$.ajax({
			url:'/using_phone',
			data:{name:$('#name').val(), phone:$('#mobile').val()},
			type:'post',
			dataType:'text',
			beforesend:function(data){
				$('#findid').val('')
			},
			success:function(data){
				if(data!=""){
					alert("회원님의 아이디는 "+data+"입니다.");
					$('#findid').val("회원님의 아이디는 "+data+"입니다.");
					$('#name').val('');
				    $('#mobile').val('');
					  $('#findidDialog').dialog({
// 	                        title:'아이디 찾기 결과',
	                        modal:true,
	                        width:500,
	                        height:380,
	                        resizable:false,
	                        buttons: {
	                            '닫기': function() {
	                                $(this).dialog('close');
	                            }
	                        },
	                        open:function(){
	                        	 $(this).html('<p>아이디 찾기 결과 </p><p>아이디: '+data+'</p>');
	                        }
	                    });
				}else{
					alert('입력하신 정보에 해당하는 아이디가 없습니다.');
					$('#name').val('');
				    $('#mobile').val('');
				}
			}
		})
	}
})

$('input[name="name"]').attr('placeholder','이름을 입력해주세요.')
$('input[name="email"], input[name="email"]').attr('placeholder','이메일을 입력해주세요.')
$('input[name="mobile"], input[name="mobile"]').attr('placeholder','휴대폰 번호를 입력해주세요.')

$(document)

/// 비밀번호 찾을때 이메일로 전송해주는 ajax 코드
.ready(function() {
    	$('#submit').click(function() {
    		
        var email = $('#pwdem').val();
        var name = $('#pwdnm').val(); 
        var id = $('#pwdid').val();
        var randomPw = generateRandomString(8);
        
        $.ajax({
            url:"/findPw",
            type:"post",
            data:{id:id,name:name,randomPw:randomPw},
            dataType:"text",
            beforeSend:function(){
               if(id==''){
                  alert('아이디를 입력하세요.')
                  return false;
               }else if(email==''){
                  alert('이메일을 입력하세요.')
                  return false;
               }else if(name==''){
                  alert('이름을 입력하세요.')
                  return false;
               }
            },success:function(data){
               if(data!=''){
            	   $('#pwdid').val('')
                   $('#pwdem').val('')
                   $('#pwdnm').val('')
               // 이메일 전송 요청
                    $.ajax({
                        url: '/sendEmail',
                        type: 'post',
                        data:{
                            recipient: email,
                            subject: '비밀번호 찾기',
                            content: '회원님의 임시비밀번호는 ' + data + '입니다.'
                        },
                        success: function(response) {
                            alert(response);
                            $('#pwdid').val('')
                            $('#pwdem').val('')
                            $('#pwdnm').val('')
                        },
                        error: function(xhr, status, error) {
                            alert('이메일 전송에 실패했습니다.');
                        }
                    })   
               }else{
                  alert('가입되어있지 않은 정보입니다.')
                  $('#pwdid').val('')
                  $('#pwdem').val('')
                  $('#pwdnm').val('')
               }
            }
            
         })
    	})
//         e.preventDefault();
})

function changeTab(tab) {
    // 탭 전환 처리
    if (tab === 'id') {
        $('#idTab').addClass('active');
        $('#pwdTab').removeClass('active');
        $('#idFormWrapper').show();
        $('#pwdFormWrapper').hide();
        
        jQuery('input[name=find_id_type]').click(function() {
        	
            switch(jQuery(this).val()) {
                case 'mobile' :
                    jQuery('#find_id_mobile_wrap').show();
                    jQuery('#find_id_email_wrap').hide();
                    $('#findid').val('')
                    break;
                case 'email' : 
                    jQuery('#find_id_mobile_wrap').hide();
                    jQuery('#find_id_email_wrap').show();
                    $('#findid').val('')
                    break;
            }
        })
        
    } else if (tab === 'pwd') {
        $('#idTab').removeClass('active');
        $('#pwdTab').addClass('active');
        $('#idFormWrapper').hide();
        $('#pwdFormWrapper').show();
    }
}

// 이메일로 보내주는 임시비밀번호 생성 코드
function generateRandomString(length) {
	var characters = '0123456789abcdefghijklmnopqrstuvwxyz';
	var randomString = '';

	for (var i = 0; i < length; i++) {
	   var randomNumber = Math.floor(Math.random() * characters.length);
	   randomString += characters.substring(randomNumber, randomNumber + 1);
	}

	return randomString;
	}

</script>
</html>