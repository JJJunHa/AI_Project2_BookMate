package com.human.springboot.PaymentController;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.springboot.CartController.CartDAO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import lombok.extern.java.Log;
 
@Log
@Controller
public class SampleController {
	@Autowired
	private PaymentDAO pdao;
	@Autowired
	private CartDAO cartdao;
    
    @Setter(onMethod_ = @Autowired)
    private KakaoPay kakaopay;
    
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
        
    }
    
    @PostMapping("/kakaoPay")
    @ResponseBody
    public String kakaoPay(HttpServletRequest req, HttpSession session) {
        log.info("kakaoPay post............................................");
        
        return kakaopay.kakaoPayReady(req,session);
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpServletRequest req, HttpSession session ) {
    	 	String name = (String) session.getAttribute("name");
    	    String price = (String) session.getAttribute("price");
    	    String qty = (String) session.getAttribute("qty");
    	    String cartN = (String) session.getAttribute("cartN");
    	    String bookN = (String) session.getAttribute("bookN");
    	    String id = (String) session.getAttribute("id");
    	    String coment = (String) session.getAttribute("coment");
    	    String address = (String) session.getAttribute("address");
    	    String payWay = (String) session.getAttribute("payWay");
    	    String mobile = (String) session.getAttribute("mobile");
    	    String nick = (String) session.getAttribute("nick");
    	    String nameBox[]= name.replace("[","").replace("]","").trim().split(",");
    	    String qtyBox[]= qty.replace("[","").replace("]","").trim().split(",");
    	    String cartNBox[]= cartN.replace("[","").replace("]","").trim().split(",");
    	    String bookNNBox[]= bookN.replace("[","").replace("]","").trim().split(",");
    		 
    	   
    	    for(int i=0; i<nameBox.length; i++) {
    	    	 cartdao.delete_cart(Integer.parseInt(cartNBox[i].trim()));
    	    	 pdao.delete_singleCart(Integer.parseInt(cartNBox[i].trim())); 
				 pdao.insertOrderCart(Integer.parseInt(cartNBox[i].trim()),Integer.parseInt(qtyBox[i].trim()),id.trim(),Integer.parseInt(bookNNBox[i].trim()));
				 pdao.insertPayment(Integer.parseInt(cartNBox[i].trim()),id.trim(),coment.trim(),payWay.trim(),address.trim(),nick.trim(),mobile.trim(),price.trim());
					
		      }	
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token,req));
        
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
