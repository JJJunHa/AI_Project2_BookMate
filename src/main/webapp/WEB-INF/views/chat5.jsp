<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--
   본 소스코드는 GPT API를 활용해보는 간단한 예시코드입니다
   소스코드 상에서 'API-KEY' 부분에 API를 발급받아서 넣어서 GPT API에 요청할 수 있습니다
   API의 발급은 다음 웹페이지에서 가능합니다
   https://platform.openai.com/account/api-keys
   API에 요청에 따른 비용이 과금될 수 있는점과 API키가 노출되지 않도록 유의해주세요.
   프론트엔드 코드는 노출될 수 있으므로 API키를 프론트엔드 코드에 넣지 않도록 유의해주세요.
   본 소스코드는 학습을 위한 예시이므로 실제 서비스 개발시에는 이 예시에서처럼 프론트엔드 코드에 API키를 포함하지 않는것이 좋습니다.
   본 코드는 AI 코딩 어시스턴트 익스텐션인 https://aicodehelper.dev/ 의 도움을 받아 제작되었습니다.
-->
<head>
    <title>색 추천 요청</title>
    <style>
        body {
            background-color: black;
            color: white;
            font-size: 20px;
        }

        #output-text {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid white;
        }
    </style>
</head>

<body>
    <div>
        <textarea id="input-text" rows="5" cols="50" placeholder="한 여름 퇴근길 올려다 본 하늘"></textarea>
    </div>
    <div>
        <button onclick="showOutput()">색 추천 요청</button>
    </div>

    <div id="output-text"></div>

    <script>
         const chatGPT = async (messages, parameters = {}) => {
            const apikey = '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';
            if (messages[0].constructor === String) return await chatGPT([['user', messages[0]]]);
            messages = messages.map(line => ({ role: line[0], content: line[1].trim() }))
            console.log(1)
            const response = await fetch('https://api.openai.com/v1/chat/completions', {
               method: 'POST',
               headers: { 'Content-Type': 'application/json', Authorization: "Bearer " + apikey },
               body: JSON.stringify({ model: 'gpt-3.5-turbo', messages, ...parameters }),
            });
            const data = await response.json();
            if (data?.error?.message) throw new Error(data.error.message);
            return data.choices[0].message.content.trim();
         };
        /*
                호랑이 - 어흥
                강아지 - 멍멍
                닭 - 꼬꼬댁
                고양이 - ?

        */

        async function showOutput() {
            var inputText = document.getElementById("input-text").value.trim();
            if (!inputText) {
                alert('묘사해주세요');
                return;
            }

            inputText = "DESC::" + inputText;
            let response;
            try {
                response = await chatGPT([
                	['system', `The assistant's role is to recommend color codes that match what the user describes, and to make the description happy, surprise, fear, anger, disgust, Sad (sad) must choose one out of six things . The response JSONArray is like ["","",...] reasonForRecommendation must be in Korean. Returns only a JSON array. Remove pretext and posttext.`],
                    ['user', 'DESC::취업이 됬어'],
                    ['assistant', '{"reasonForRecommendation":"축하드려요!","emotion":["행복"],colorlist":["#8977ad","#000000","#000000","#000000","#000000"]}'],
                    ['user', 'DESC::물건을 잃어 버렸어'],
                    ['assistant', '{"reasonForRecommendation":"더 좋은 일이 생길거에요","emotion":["슬픔"],"colorlist":["#8977ad","#000000","#000000","#000000","#000000"]}'],
                    ['user', 'DESC::친구랑 싸웠어'],
                    ['assistant', '{"reasonForRecommendation":"진정해봐요",""emotion":["화남"],colorlist":["#8977ad","#000000","#000000","#000000","#000000"]}'],
                    ['user', inputText],
                ], { temperature: 0.8 });
            } catch (e) {
                console.log(e.message);
                return;
            }

            var outputText = document.getElementById("output-text");
            console.log(response)
            const color = JSON.parse(response);
            for (let i = 0; i < color.colorlist.length; i++) {
                const divElem = document.createElement('div');
                divElem.style.backgroundColor = color.colorlist[i];
                divElem.textContent = color.colorlist[i];
                outputText.appendChild(divElem);
            }

            const divElemReason = document.createElement('div');
            divElemReason.textContent = color.reasonForRecommendation;
            outputText.appendChild(divElemReason);
            
            const divemotion = document.createElement('div');
            divemotion.textContent = color.emotion;
            outputText.appendChild(divemotion);
        }
    </script>
    
   
</body>

</html>