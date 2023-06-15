package com.human.springboot.FindIdController;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class FindIdController {
	
	@Autowired
	private findIdDAO findIddao;
//	@Autowired
//	private EmailService emailservice;
	
	@GetMapping("/findId")
	public String findid() {
		return "findId";
	}

	@PostMapping("/using_email")
	@ResponseBody
	public String using_email(HttpServletRequest req) {
		String val="";
		System.out.println(req.getParameter("name"));
		System.out.println(req.getParameter("mail"));
		
		String name = req.getParameter("name");
		String email = req.getParameter("mail");
		ArrayList<String> findid = findIddao.useemail(name,email);
		
		if(findid.isEmpty()) {
			val = "해당하는 정보가 없습니다.";
		} else {			
			val = findid.toString();
		}
		
		return val;
	}
	
	@PostMapping("/using_phone")
	@ResponseBody
	public String using_phone(HttpServletRequest req, Model model) {
		String val="";
		
		System.out.println(req.getParameter("name"));
		System.out.println(req.getParameter("phone"));
		
		String name = req.getParameter("name");
		String mobile = req.getParameter("phone");
		String mobile1 = mobile.substring(0, 3);
		String mobile2 = mobile.substring(3,7);
		String mobile3 = mobile.substring(7);
		mobile=mobile1+" "+mobile2+" "+mobile3;
		ArrayList<String> findid = findIddao.usephone(name,mobile);
		
		if(findid.isEmpty()) {
			val = "해당하는 정보가 없습니다.";
		} else {			
			val = findid.toString();
		}
		
		return val;
	}
	
//	@PostMapping("/sendEmail")
//    @ResponseBody
//    public String sendEmail(HttpServletRequest req) {
//       String response = "";
//       System.out.println(req.getParameter("recipient"));
//       System.out.println(req.getParameter("subject"));
//       System.out.println(req.getParameter("content"));
//       try {
//          String recipient = req.getParameter("recipient");
//          String subject = req.getParameter("subject");
//          String content = req.getParameter("content");
//
//		emailservice.sendEmail(recipient, subject, content);
//          response = "입력하신 이메일로 임시 비밀번호가 전송되었습니다.";
//       } catch (Exception e) {
//          response = "전송 실패.";
//          e.printStackTrace();
//       }
//       return response;
//    }
//	
//	@PostMapping("/findPw")
//    @ResponseBody
//    public String findPw(HttpServletRequest req) {
//		String val = null;
//		
//		try {
//	        
//			String id = req.getParameter("id");
////			String email = req.getParameter("email");
//			String name = req.getParameter("name");
//			String randomPw = req.getParameter("randomPw");
//			
//			int n = findIddao.find(id, name);
//			if(n!=0) {
//				
//				findIddao.updaterandomPw(id, name, randomPw);
//				val = randomPw;
//			} else {
//				val = "";
//			}
//			
//	       } catch (Exception e) {
//	    	   val = "";
//	       }	
//		
//		return val;
//	}
}
