<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>

function selfCloseSubmit()

{

    var f= document.forms.popupForm;

    document.domain = "localhost"; //document.domain 값이 팝업과 부모창 동일해야 합니다.

    opener.name = "parentPage"; //유니크한 이름이어야 합니다.

    f.target = opener.name;

    f.submit();

    self.close();

}
window.onbeforeunload = function() {
    selfCloseSubmit();
};

</script>
<body>
 
카카오페이 결제가 정상적으로 완료되었습니다.
 
결제일시:     [[${info.approved_at}]]<br/>
상품명:    [[${info.item_name}]]<br/>
결제금액:    [[${info.amount.total}]]<br/>
결제방법:    [[${info.payment_method_type}]]<br/>
 
<!-- 값 보낼때 쓰는거  <a href="javascript:;" onclick="selfCloseSubmit();">부모창으로 서브밋하고 종료</a> -->

<form name="popupForm" action="main">

<!--<input type="text" name="testValue" value=""> -->

</form>
 

 
</body>
</html>
