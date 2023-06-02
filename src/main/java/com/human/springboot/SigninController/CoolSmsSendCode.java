package com.human.springboot.SigninController;

import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API PHP
 */

public class CoolSmsSendCode {

	public static void CoolSmsSendCode(String phoneNumber, String numStr) {    
		String api_key = "NCSQO7G0MV4AQXTN";
	    String api_secret = "OIYHASL0PFZ65ACGY4MTWOIQIA2RD3BV";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phoneNumber);
	    params.put("from", "01071390573"); //무조건 자기번호 (인증)
	    params.put("type", "SMS");
	    params.put("text", "[북메이트] 회원가입을 위한 본인인증을 위해 인증번호"+"["+numStr+"]" +"를 입력해주세요. ");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	    	//send() 는 메시지를 보내는 함수  
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
    }    
}
