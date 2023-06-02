$(document).ready(function() {
	$('#loading').hide();
	showBook();//도서 호출
	$('#grid-container').empty();
    // jQuery 코드 작성
    $("#bestSeller-tab").click(function () {
        changeTab("bestSeller");
    });
    $("#donation-tab").click(function () {
        changeTab("donation");
    });

    $("#notification-tab").click(function () {
        changeTab("notification");
    });
    
});

/*---------------------------------------------------------------------------------아작스로 도서 뛰우기*/
function showBook() {
    $.ajax({
        url: '/selectpRe',  // 필요에 따라 URL 수정
        type: 'post',
        data: {},  // prod_num 값 추가하여 서버로 전달
        dataType: 'json',
        beforeSend: function() {},
        success: function(data) {
			console.log(data);
			appendBoxesToGrid(data);
        },
    });
}
function suggestion(emotion) {
	alert(emotion);
	$('#grid-container').empty()
    $.ajax({
        url: '/suggestion',  // 필요에 따라 URL 수정
        type: 'post',
        data: {emotion:emotion+""},  // prod_num 값 추가하여 서버로 전달
        dataType: 'json',
        beforeSend: function() {},
        success: function(data) {
            
			appendBoxesToGrid(data);
        },
    });
}
function appendBoxesToGrid(data) {
	
    for (let i = 0; i < data.length; i++) {
        let box = `
            <div class="grid-cell">
                <div>
                    <img src="${data[i]['BOOK_COVER']}" alt="Main Image" class="main-image">
                </div>
                <div class="parent">
                    <div class="explanation">
                        <div>
                            <div class="title">${data[i]['BOOK_NAME']}</div>
                        </div>
                        <div>
                            <div class="subtitle">${data[i]['AUTHOR']}</div>
                        </div>
                        <div>
                            <a class="button cart" href="#cart">장바구니</a>
                            <a class="button checkout" href="#checkout">바로결제</a>
                            <a class="button dashboard" href="#dashboard">보관함</a>
                        </div>
                    </div>
                </div>
            </div>
        `;
        
        $('#grid-container').append(box);
    }
}









/*---------------------------------------------------------------------------------*/
function changeTab(tab) {
    $(".tab-item").removeClass("active");
    $(".content-container").removeClass("active");

    $("#" + tab + "-tab").addClass("active");
    $("#" + tab).addClass("active");
}
//감정 모달 클릭 시키는 함수
function clickModalButton() {
  var modalBtn = document.getElementById("open-modal-btn");
  modalBtn.click();
}

document.addEventListener('DOMContentLoaded', function() {
	/*감정 모달 이벤트*/
	
	
	document.getElementById("open-modal-btn").addEventListener("click", function() {
      document.getElementById("modal-container").style.display = "flex";
    });

    document.getElementById("modal-container").addEventListener("click", function(event) {
      if (event.target.id === "modal-container") {
        document.getElementById("modal-container").style.display = "none";
      }
    });
    /*감정 모달 이벤트*/
    const chatGPT = async (messages, parameters = {}) => {
        const apikey = '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';
        if (messages[0].constructor === String) return await chatGPT([['user', messages[0]]]);
		console.log(messages);
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
    
	let manualMode = false;
    async function sendMessage() {
		$('#loading').show();
        const inputElement = document.getElementById("input");
        const message = inputElement.value.trim();
        	if (message === "수동모드") {
		        manualMode = true;
		        alert("수동추천모드입니다.");
		    } else if (message === "수동추천모드취소") {
		        manualMode = false;
		        alert("수동추천모드가 취소되었습니다.");
		        $('#loading').hide();
		        inputElement.value = "";
            	return;
		    }
         if(manualMode) {
            
            const chatContentElement = document.getElementById("chat-content");

	        const userMessageElement = document.createElement("div");
	        userMessageElement.classList.add("line");
	        const userChatBoxElement = document.createElement("span");
	        userChatBoxElement.classList.add("chat-box");
	        userChatBoxElement.textContent = message;
	        userMessageElement.appendChild(userChatBoxElement);
	        chatContentElement.appendChild(userMessageElement);
            if(message==="판타지"||message==="로맨스"||message==="공포/스릴러/추리"||message==="드라마"||message==="코미디"){
				$('#grid-container').empty()
				$.ajax({
			        url: '/genreSelection',
			        type: 'post',
			        data: {
			            genre: message
			        },
			        dataType: 'json',
			        beforeSend: function() {
			            
			        },
			        success: function(data) {
						console.log(data);
			        	appendBoxesToGrid(data);
			        }
			    })
				inputElement.value = "";
				$('#loading').hide();
				return
			}
	
	        const assistantMessageElement = document.createElement("div");
	        assistantMessageElement.classList.add("line2");
	        const assistantChatBoxElement = document.createElement("span");
	        assistantChatBoxElement.classList.add("chat-box", "mine");
	        
	        const assistantMessageElement2 = document.createElement("div");
			  assistantMessageElement2.classList.add("line2");
			  const assistantChatBoxElement2 = document.createElement("span");
			  assistantChatBoxElement2.classList.add("chat-box", "mine");
			  assistantChatBoxElement2.textContent = "어떤 장르를 원하시나요? ex(판타지,로맨스)";
			  assistantMessageElement2.appendChild(assistantChatBoxElement2);
			  
			  const assistantMessageElement3 = document.createElement("div");
			  assistantMessageElement3.classList.add("line2");
			  const assistantChatBoxElement3 = document.createElement("span");
			  assistantChatBoxElement3.classList.add("chat-box", "mine");
			  assistantChatBoxElement3.textContent = '▼ 수동모드취소 ▼   "수동추천모드취소"';
			  assistantMessageElement3.appendChild(assistantChatBoxElement3);
			  
			  
			  chatContentElement.appendChild(assistantMessageElement2);
			  chatContentElement.appendChild(assistantMessageElement3);
			  
			  
			  
	        inputElement.value = "";
            $('#loading').hide();
            return;
        }

        if (!message) {
            alert("메시지를 입력하세요.");
            $('#loading').hide();
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
    	['system', `The assistant's job is to recommend color codes that match what user's 설명에 대해 행복, 놀라움, 두려움, 분노, 혐오 또는 슬픔의 여섯 가지 가능한 선택 중 하나를 선택해야 합니다.
    		그리고 분석하는것이 어떤 것이든 무조건 감정과 해당 색상을 반환해야 한다. 
    		Response JSONArray is like ["","",...] reasonForRecommendation must be in Korean. JSON 배열만 반환합니다. 구실과 뒷말을 없애라.`],
        ['user', 'DESC::취업이 됬어 내 감정을 어떤 감정일까?'],
        ['assistant', '{"reasonForRecommendation":[".."],"emotion":["행복"],colorlist":["#000000","#000000","#000000","#000000","#000000"]}'],
        ['user', 'DESC::물건을 잃어 버렸어 내 감정을 어떤 감정일까?'],
        ['assistant', '{"reasonForRecommendation":["..."],"emotion":["슬픔"],"colorlist":["#000000","#000000","#000000","#000000","#000000"]}'],
        ['user', 'DESC::기분이 안좋아 내 감정을 어떤 감정일까?'],
        ['assistant', '{"reasonForRecommendation":["...."],"emotion":["슬픔"],"colorlist":["#000000","#000000","#000000","#000000","#000000"]}'],
        ['user', 'DESC::힘들어 내 감정을 어떤 감정일까?'],
        ['assistant', '{"reasonForRecommendation":["....."],"emotion":["슬픔"],"colorlist":["#000000","#000000","#000000","#000000","#000000"]}'],
        ['user', 'DESC::친구랑 싸웠어 내 감정을 어떤 감정일까?'],
        ['assistant', '{"reasonForRecommendation":["......"],""emotion":["분노"],"colorlist":["#000000","#000000","#000000","#000000","#000000"]}'],
        ['user', 'DESC::걱정돼 내 감정을 어떤 감정일까?'],
        ['assistant', '{"reasonForRecommendation":["......."],"emotion":["불안"],"colorlist":["#000000","#000000","#000000","#000000","#000000"]}'],
        ['user', 'DESC::누구가를 사랑하게 됬어 내 감정을 어떤 감정일까?'],
        ['assistant', '{"reasonForRecommendation":["........"],"emotion":["사랑"],"colorlist":["#000000","#000000","#000000","#000000","#000000"]}'],
        ['user', 'DESC::좋아하는 사람이 생겼어 내 감정을 어떤 감정일까?'],
        ['assistant', '{"reasonForRecommendation":["........."],"emotion":["사랑"],"colorlist":["#000000","#000000","#000000","#000000","#000000"]}'],
        ['user', 'DESC::좋아하는, 관심, 사랑'],
        ['assistant', '{"reasonForRecommendation":[".........."],"emotion":["사랑"],"colorlist":["#000000","#000000","#000000","#000000","#000000"]}'],
        ['user', 'DESC::좋은일이 생겼어 내 감정을 어떤 감정일까?'],
        ['assistant', '{"reasonForRecommendation":["..........."],"emotion":["행복"],"colorlist":["#000000","#000000","#000000","#000000","#000000"]}'],
        ['user', message+" 내 감정을 어떤 감정일까?의 색깔과 감정과 추천 이유"],
    ], { temperature: 0.8 });
        
        assistantMessageElement.appendChild(assistantChatBoxElement);
			chatContentElement.appendChild(assistantMessageElement);
         try {
			  console.log(emotionbox);
			  const emotion = JSON.parse(emotionbox);
			  alert(emotion.reasonForRecommendation);
			  console.log(emotion.emotion);
			  const heading = document.querySelector('h2');
			  heading.textContent = emotion.emotion;
			  const heading2 = document.querySelector('p');
			  heading2.textContent = emotion.reasonForRecommendation;
			  for (let i = 0; i < emotion.colorlist.length; i++) {
			  const color = emotion.colorlist[i];
			
			  // .color-item 요소들을 선택합니다.
			  const colorItems = document.querySelectorAll('.color-item');
			
			  // 현재 색상에 해당하는 .color-item 요소가 있는지 확인합니다.
			  if (colorItems[i]) {
			    // 현재 .color-item 요소의 배경색을 업데이트합니다.
			    colorItems[i].style.backgroundColor = color;
			  }
			}
			  suggestion(emotion.emotion);//도서 호출
			  const assistantMessageElement2 = document.createElement("div");
			  assistantMessageElement2.classList.add("line2");
			  const assistantChatBoxElement2 = document.createElement("span");
			  assistantChatBoxElement2.classList.add("chat-box", "mine");
			  assistantChatBoxElement2.textContent = "기분에 도움이 될만한 책을 추천 해드릴게요";
			  assistantMessageElement2.appendChild(assistantChatBoxElement2);
			  chatContentElement.appendChild(assistantMessageElement2);
			  $('#loading').hide();
			  clickModalButton();
			 
			} catch (error) {
			  const assistantMessageElement2 = document.createElement("div");
			  assistantMessageElement2.classList.add("line2");
			  const assistantChatBoxElement2 = document.createElement("span");
			  assistantChatBoxElement2.classList.add("chat-box", "mine");
			  assistantChatBoxElement2.textContent = "죄송하지만 감정을 분석할 수 없어서 베스트 셀러로 추천해드리겠습니다.";
			  assistantMessageElement2.appendChild(assistantChatBoxElement2);
			  chatContentElement.appendChild(assistantMessageElement2);
			  assistantMessageElement.appendChild(assistantChatBoxElement);
			  chatContentElement.appendChild(assistantMessageElement);
			  $('#loading').hide();
			  clickModalButton();
			  
			}
			
			
        
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
})

