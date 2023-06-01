<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>이미지 생성기</title>
    <style>
        body {
            background-color: black;
            /* 배경색 검은색으로 설정 */
        }
    </style>
    <script>
        function genImg() {
            var promptText = document.querySelector('input').value;
            var data = {
                "model": "image-alpha-001",
                "prompt": promptText,
                "num_images": 1
            };
            fetch('https://api.openai.com/v1/images/generations', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': 'Bearer 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'
                },
                body: JSON.stringify(data)
            })
                .then(function(response) {
                    return response.json();
                })
                .then(function(data) {
                    console.log(data);
                    document.querySelector('img').src = data.data[0].url;
                });
        }
    </script>
</head>

<body>
    <form>
        <input type="text" placeholder="생성할 이미지를 묘사해주세요"> <!-- 입력박스 생성, 플레이스홀더 추가 -->
        <button type="button" onclick="genImg()">이미지 생성</button> <!-- 버튼 생성, onclick 이벤트로 genImg 함수 실행 -->
    </form>
    <img src="">
    
</body>

</html>