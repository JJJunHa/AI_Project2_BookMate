<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="icon" href="/img/favicon-16x16.png" type="image/x-icon" sizes="16x16">
    <link rel="stylesheet" href="css/findId.css">
    <title>북메이트</title>
</head>
<body>
    <div class="content">
       
           <div class="content2">
          
           <div id="findId-tab" onclick="changeTab('findId')">아이디 찾기</div>
           <div id="findPwd-tab" onclick="changeTab('findPwd')">비밀번호 찾기</div>
           
           </div>
          <div align=center class="radio-wrap minsuk">
                    <label><input type="radio" name="find_id_type" id="use_email" value="email" checked="checked" /> 이메일</label>
                    <label><input type="radio" name="find_id_type" id="use_phone" value="mobile" /> 휴대폰</label>
                </div>
                <div align=center class="loginInput form-control">
                      &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="name" name="name"  style=width:300px; class="form-control form-control-lg" value="" maxlength="30" title="이름" placeholder=""><br>
                    <div class="div-idtype" id="find_id_email_wrap"><br>
					 <input type="text" id="email" name="email" style=width:300px; class="form-control form-control-lg" value="" maxlength="80" title="이메일 주소" placeholder=""></div>
                    <div class="div-idtype" id="find_id_mobile_wrap" style="display:none;">       
                     <input type="text" id="mobile" name="mobile" style=width:300px; class="form-control form-control-lg" value="" maxlength="20" title="휴대폰번호"></div><br>
                	<div>
                	
                	<div class=hello1>
                	<button id=btnFind class="btn btn-primary">확인</button>
                	 <button id=loggggin class="btn btn-primary">로그인</button>
                	</div>
                	</div>
                       
   				<input type="hidden" id="findid" style="border:none" placeholder="아이디:">
                </div>
               
                </div>
                
           </div>
   				<div class="findidDialog" id="findidDialog">
   				</div>

</body>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>
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
				$('#findid').val('아이디: '+data)	
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
					alert('입력하신 정보에 해당하는 아이디가 없습니다.')
				}
			}
		})
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
					$('#findid').val('아이디: '+data)	
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
					alert('입력하신 정보에 해당하는 아이디가 없습니다.')
				}
			}
		})
	}
})


$('input[name="name"]').attr('placeholder','이름');
$('input[name="email"], input[name="email"]').attr('placeholder','이메일');
$('input[name="mobile"], input[name="mobile"]').attr('placeholder','휴대폰 번호');
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


$(document)

.ready(function() {
    $('#pwdForm').submit(function(e) {
        e.preventDefault();
        var email = $('#email').val();

		$.ajax({
			url : '/sendEmail',
			type : 'post',
			data : {
				recipient : email,
				subject : '비밀번호 찾기',
				content : '회원님의 비밀번호는 ' + data + '입니다.'
			},
			success : function(response) {
				alert(response);
				$('#pwdid').val('')
				$('#pwdem').val('')
				$('#pwdnm').val('')
			},
			error : function(xhr, status, error) {
				alert('이메일 전송에 실패했습니다.');
			}
		});
    });
})

	$(document)

	.on('click', '#loggggin', function() {
		document.location = '/login';
	})
	
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

</script>
</html>