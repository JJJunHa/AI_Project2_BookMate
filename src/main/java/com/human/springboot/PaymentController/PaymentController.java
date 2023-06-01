package com.human.springboot.PaymentController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class PaymentController {
	@Autowired
	private PaymentDAO pdao;
	
	// 결제창
	@GetMapping("/payment")
	public String dopayment() {
	return "payment";
	}
	
}
