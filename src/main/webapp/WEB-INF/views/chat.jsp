<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Chat Application</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        .container2 {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
        }

        .chat-content {
            height: 1000px;
            overflow-y: scroll;
            border: 1px solid #ccc;
            padding: 10px;
            background: black;
        }

        .line {
            margin-bottom: 50px;
            word-wrap: break-word;
            text-align: left; /* 우측 정렬 */
        }

        .line2 {
            margin-bottom: 50px;
            word-wrap: break-word;
            text-align: right; /* 우측 정렬 */
        }

        .chat-box {
            background: #eee;
            padding: 10px;
            max-width: 40%;
            border-radius: 5px;

            /* 한 줄 자르기 */
            display: inline-block;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;

            /* 여러 줄 자르기 추가 스타일 */
            white-space: normal;
            line-height: 1.2;
        }

        .mine {
            background: #c5e1a5;
            margin-left: auto;
        }

        .input-container {
            display: flex;
            margin-top: 10px;
        }

        #input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px 0 0 5px;
        }

        #send {
            padding: 10px;
            background: #4caf50;
            color: #fff;
            border: none;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="container2">
    <div class="chat-content" id="chat-content">
        <div class="line">
            <span class="chat-box">안녕?</span>
        </div>
        <div class="line2">
            <span class="chat-box mine">안녕!</span>
        </div>
    </div>
    <div class="input-container">
        <input class="chat-box" id="input" placeholder="메시지 입력">
        <button id="send">전송</button>
    </div>
</div>

<script>
    const chatGPT = async (messages, parameters = {}) => {
        const apikey = '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';
        if (messages[0].constructor === String) return await chatGPT([['user', messages[0]]]);
        messages = messages.map(line => ({ role: line[0],content: line[1].trim() }));
        const response = await fetch('https://api.openai.com/v1/chat/completions', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json', Authorization: "Bearer " + apikey },
            body: JSON.stringify({ model: 'gpt-3.5-turbo', messages, ...parameters }),
        });

        const data = await response.json();

        if (data?.error?.message) throw new Error(data.error.message);

        return data.choices[0].message.content.trim();
    };

    async function sendMessage() {
        const inputElement = document.getElementById("input");
        const message = inputElement.value.trim();

        if (!message) {
            alert("메시지를 입력하세요.");
            return;
        }

        const chatContentElement = document.getElementById("chat-content");

        const userMessageElement = document.createElement("div");
        userMessageElement.classList.add("line");
        const userChatBoxElement = document.createElement("span");
        userChatBoxElement.classList.add("chat-box");
        userChatBoxElement.textContent = message;
        userMessageElement.appendChild(userChatBoxElement);
        chatContentElement.appendChild(userMessageElement);

        const assistantMessageElement = document.createElement("div");
        assistantMessageElement.classList.add("line2");
        const assistantChatBoxElement = document.createElement("span");
        assistantChatBoxElement.classList.add("chat-box", "mine");
        
        assistantChatBoxElement.textContent = await chatGPT([["user", message]]);
        
        emotionbox = await chatGPT([
    	['system', `The assistant's role is to recommend color codes that match what the user describes, and to make the description happy, surprise, fear, anger, disgust, Sad (sad) must choose one out of six things . The response JSONArray is like ["","",...] reasonForRecommendation must be in Korean. Returns only a JSON array. Remove pretext and posttext.`],
        ['user', 'DESC::취업이 됬어'],
        ['assistant', '{"reasonForRecommendation":"축하드려요!","emotion":["행복"],colorlist":["#8977ad","#000000","#000000","#000000","#000000"]}'],
        ['user', 'DESC::물건을 잃어 버렸어'],
        ['assistant', '{"reasonForRecommendation":"더 좋은 일이 생길거에요","emotion":["슬픔"],"colorlist":["#8977ad","#000000","#000000","#000000","#000000"]}'],
        ['user', 'DESC::친구랑 싸웠어'],
        ['assistant', '{"reasonForRecommendation":"진정해봐요",""emotion":["화남"],colorlist":["#8977ad","#000000","#000000","#000000","#000000"]}'],
        ['user', message],
    ], { temperature: 0.8 });
        
        console.log(emotionbox);
        const emotion = JSON.parse(emotionbox);
        console.log(emotion.reasonForRecommendation);
        console.log(emotion.emotion);
        for (let i = 0; i < emotion.colorlist.length; i++) {
            console.log(emotion.colorlist[i]);
        }
        
        
        assistantMessageElement.appendChild(assistantChatBoxElement);
        chatContentElement.appendChild(assistantMessageElement);
		
        const assistantMessageElement2 = document.createElement("div");
        assistantMessageElement2.classList.add("line2");
        const assistantChatBoxElement2 = document.createElement("span");
        assistantChatBoxElement2.classList.add("chat-box", "mine");
        assistantChatBoxElement2.textContent = "기분에 도움이 될만한 책을 추천 해드릴게요";
        assistantMessageElement2.appendChild(assistantChatBoxElement2);
        chatContentElement.appendChild(assistantMessageElement2);
        
        inputElement.value = "";
        chatContentElement.scrollTop = chatContentElement.scrollHeight;
    }

    const sendButton = document.getElementById("send");
    sendButton.addEventListener("click", sendMessage);

    const inputElement = document.getElementById("input");
    inputElement.addEventListener("keydown", function (event) {
        if (event.key === "Enter") {
            event.preventDefault();
            sendMessage();
        }
    });
</script>
</body>
</html>