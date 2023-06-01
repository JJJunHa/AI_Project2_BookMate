<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <title>도서GPT API</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <style>
    /* page-loading */
    #loading {
      width: 100%;
      height: 100%;
      top: 0;
      left: 0;
      position: fixed;
      display: block;
      opacity: 0.6;
      background: #e4e4e4;
      z-index: 99;
      text-align: center;
    }

    #loading>img {
      position: absolute;
      top: 40%;
      left: 45%;
      z-index: 100;
    }

    #loading>p {
      position: absolute;
      top: 57%;
      left: 43%;
      z-index: 101;
    }
    
    .container {
      font-size: 16px;
    }
  </style>
</head>

<body>
  <h1>북메이트 API</h1>
  <div>무엇이든 질문해보세요 !!</div>

  <input type="text" id="keywords" name="keywords" required />
  <button onclick="chatGPT()">입력</button>
  <div id="result" class="container"></div>

  <div id="loading">
    <img src="https://studentrights.sen.go.kr/images/common/loading.gif">
  </div>
  <script>
    $(document).ready(function () {
      
    });

    function chatGPT() {
      const api_key = "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"  // <- API KEY 입력
      const keywords = document.getElementById('keywords').value
      $('#loading').show();

      const messages = [
        { role: 'system', content: 'You are a helpful assistant.' },
        { role: 'user', content: keywords + '에 대하여 최대한 도움이 되는 답변을 해줘.' },
      ]

      const data = {
        model: 'gpt-3.5-turbo',
        temperature: 0.5,
        n: 1,
        messages: messages,
      }

      $.ajax({
        url: "https://api.openai.com/v1/chat/completions",
        method: 'POST',
        headers: {
          Authorization: "Bearer " + api_key,
          'Content-Type': 'application/json',
        },
        data: JSON.stringify(data),
      }).then(function (response) {
        $('#loading').hide();
        console.log(response)
        let result = document.getElementById('result')
        let pre = document.createElement('pre')

        pre.innerHTML = "\n\n" + response.choices[0].message.content
        result.appendChild(pre)

        document.getElementById('keywords').value = ''
      });
    }
  </script>
</body>

</html>