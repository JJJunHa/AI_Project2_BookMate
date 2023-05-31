package com.human.springboot.SigninController;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class SigninController {
	
	@Autowired
	private signinDAO signindao;
	
	@GetMapping("/signin")
	public String dosignin() {
		return "signin";
	}
	
	@GetMapping("/certified")
	public String doView() {
		return "certified";
	}
	
	@PostMapping("/doInsert")
	public String doInsert(HttpServletRequest req) {
		String j_id=req.getParameter("j_id");
		String j_pwd=req.getParameter("j_pwd");
		String j_name=req.getParameter("j_name");
		
		
		// address
		String zip_code=req.getParameter("zip_code");
		String j_address1 =req.getParameter("j_address1");
		String j_address2 =req.getParameter("j_address2");
		String j_address =j_address1+"@"+j_address2;
		
		// mobile
		String j_firstphone =req.getParameter("j_firstphone");
		String j_midphone =req.getParameter("j_midphone");
		String j_lastphone =req.getParameter("j_lastphone");
		String j_mobile = j_firstphone+" "+j_midphone+" "+j_lastphone;
		
		
		String j_email =req.getParameter("j_email");
		String j_year =req.getParameter("j_year");
		String j_month =req.getParameter("j_month");
		String j_day =req.getParameter("j_day");
		String j_birth =j_year+" "+j_month+" "+j_day;
		String j_joinDate = LocalDate.now().toString(); // 현재 날짜를 가져와서 문자열로 변환
		signindao.doInsert(j_id,j_pwd,j_name,j_email,zip_code,j_address,j_mobile,j_birth,j_joinDate);
		
		
		return "login";
	}
		
	@PostMapping("/idCheck")
	@ResponseBody
	public String idCheck(HttpServletRequest req) {
		
		String j_id= req.getParameter("j_id");
		
		if(j_id==null || j_id.equals("")) {
			return "아이디를 입력해주세요";
		}
		
		ArrayList<signinDTO> users = signindao.confirmId();
		for(int i=0;i<users.size();i++) {
			if(j_id.equals(users.get(i).getId())) {
				return "중복된 아이디입니다";
			}
		}
		
		return "사용 가능한 아이디입니다";
	}
	
	
	
	// 회원가입을 위한 본인인증 part (certified.jsp) //
	@RequestMapping("/sendSMS1.do") // jsp 페이지 넘긴 mapping 값
	@ResponseBody
	public String sendSMS(String phoneNumber) {

		Random rand = new Random(); // 랜덤숫자 생성하기 !!
		String numStr = "";
		for (int i = 0; i < 6; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
//	            System.out.println(numStr);
		}

		CoolSmsSendCode.CoolSmsSendCode(phoneNumber, numStr); // 휴대폰 api 쪽으로 가기 !!
		// // 밑에 자세한 설명나옴

		return numStr;
	}

}
