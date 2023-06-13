package com.human.springboot.PaymentController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.Setter;
import lombok.extern.java.Log;
 
@Log
@Controller
public class SampleController {
    
    @Setter(onMethod_ = @Autowired)
    private KakaoPay kakaopay;
    
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
    @PostMapping("/kakaoPay")
    public String kakaoPay() {
    	System.out.println("hi");
        log.info("kakaoPay post............................................");
        
        return "redirect:" + kakaopay.kakaoPayReady();
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
    }
    @GetMapping("/kakaoPayCancel")
    public String kakaoPayCancel(Model model, HttpServletRequest request, HttpServletResponse response) {
        return "kakaoPayCancel";
    }
    
    @GetMapping("/kakaoPaySuccessFail")
    public String kakaoPaySuccessFail(Model model, HttpServletRequest request, HttpServletResponse response) {
        return "kakaoPayCancel";
    }
    
}
