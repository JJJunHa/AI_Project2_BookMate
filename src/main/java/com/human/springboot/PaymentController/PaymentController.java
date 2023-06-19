package com.human.springboot.PaymentController;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.springboot.CartController.CartDAO;
import com.human.springboot.CartController.CartDTO;


import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class PaymentController {
	@Autowired
	private PaymentDAO pdao;
	@Autowired
	private CartDAO cartdao;
	
	// 결제창
	@GetMapping("/payment")
	public String dopayment(HttpServletRequest req, Model model) {
	HttpSession session = req.getSession();
	if (session == null || session.getAttribute("id") == null) {
        // 아이디 세션이 만료되었을 때 로그인 페이지로 리다이렉트
        return "redirect:/login";
	}
	
	String id=(String)session.getAttribute("id");
	PaymentDTO ship=pdao.selectShip(id);
	String cut[]=ship.getAddress().split("@");
	String cut2[] = cut[1].split("\\)");
	try {
	ship.setAddress1(cut[0]);
	ship.setAddress2(cut2[1]);
	ship.setAddress3(cut2[0].replace("(", ""));
	model.addAttribute("ship",ship);
	} catch(Exception e) { return "payment"; }
	
    
	return "payment";
	}
	
	@GetMapping("/singlePayment")
	public String dosinglePayment(HttpServletRequest req, Model model) {
	HttpSession session = req.getSession();
	if (session == null || session.getAttribute("id") == null) {
        // 아이디 세션이 만료되었을 때 로그인 페이지로 리다이렉트
        return "redirect:/login";
	}
	
	String id=(String)session.getAttribute("id");
	PaymentDTO ship=pdao.selectShip(id);
	String cut[]=ship.getAddress().split("@");
	String cut2[] = cut[1].split("\\)");
	try {
	ship.setAddress1(cut[0]);
	ship.setAddress2(cut2[1]);
	ship.setAddress3(cut2[0].replace("(", ""));
	model.addAttribute("ship",ship);
	} catch(Exception e) { return "payment"; }
	
    
	return "singlePayment";
	}
	
	@PostMapping("/singleInsert_cart")
	@ResponseBody
	public String insert_cart(HttpServletRequest req) {
		String m_id = req.getParameter("m_id");
		int qty = Integer.parseInt(req.getParameter("qty"));
		int book_num = Integer.parseInt(req.getParameter("book_num"));
		
		String insertval=null;
		try {
			pdao.Alldelete_singleCart(m_id);
			pdao.singleInsert_cart(m_id, qty, book_num);
			insertval="ok";
		} catch(Exception e) {
			insertval="fail";
		}
		return insertval;
	}
	 @PostMapping("/load_singleCart")
	   @ResponseBody
	   public String load_singleCart(HttpServletRequest req) {
	      String id = req.getParameter("id");
	      ArrayList<PaymentDTO> alCart = pdao.load_singleCart(id);
	      JSONArray ja = new JSONArray();
	      for(int i=0; i<alCart.size(); i++) {
	         JSONObject jo = new JSONObject();
	         jo.put("cart_num", alCart.get(i).getCart_num());
	         jo.put("book_cover", alCart.get(i).getBook_cover());
	         jo.put("book_name", alCart.get(i).getBook_name());
	         jo.put("book_num", alCart.get(i).getBook_num());
	         jo.put("qty", alCart.get(i).getQty());
	         jo.put("book_price", alCart.get(i).getBook_price());
	         
	         ja.put(jo);
	      }
	      return ja.toString();
	   }
	
	 @PostMapping("/paymentInsert")
	 @ResponseBody
	 public String paymentInsert(HttpServletRequest req) {
	 try {
	 String id=req.getParameter("id");	 
	 ArrayList<CartDTO> alCart = cartdao.load_cart(id);
	 String coment=req.getParameter("coment");
	 String payWay=req.getParameter("payway");
	 String name=req.getParameter("name");
	 String mobile=req.getParameter("mobile");
	 String address=req.getParameter("address");
	 String price=req.getParameter("price");
	 ArrayList<String> nameBox= new ArrayList<String>();
	 ArrayList<Integer> qtyBox= new ArrayList<Integer>();
	 ArrayList<Integer> cartNumBox= new ArrayList<Integer>();
	 ArrayList<Integer> bookNumBox= new ArrayList<Integer>();
	 
	 
	  if(payWay.equals("카카오페이")) {
		  for(int i=0; i<alCart.size(); i++) {
				 
				 String bookName=alCart.get(i).getBook_name();
				 nameBox.add(bookName);
				 int cartNum=alCart.get(i).getCart_num();
				 int qty=alCart.get(i).getQty();
				 int bookNum=alCart.get(i).getBook_num();
				 cartNumBox.add(cartNum);
				 bookNumBox.add(bookNum);
				 qtyBox.add(qty);
					/*
					 * cartdao.delete_cart(cartNum); pdao.insertOrderCart(cartNum,qty,id,bookNum);
					 * pdao.insertPayment(cartNum,id,coment,payWay,address,name,mobile,price);
					 */
		      }			
		 return "kakaoPay"+"#"+nameBox+"#"+price+"#"+qtyBox+"#"+cartNumBox+"#"+bookNumBox+"#"+id+"#"+coment+"#"+address+"#"+payWay+"#"+mobile+"#"+name;
	 }else if(payWay.equals("무통장입금")) {
		 for(int i=0; i<alCart.size(); i++) {
			
			 String bookName=alCart.get(i).getBook_name();
			 nameBox.add(bookName);
			 int cartNum=alCart.get(i).getCart_num();
			 int qty=alCart.get(i).getQty();
			 int bookNum=alCart.get(i).getBook_num();
			 cartNumBox.add(cartNum);
			 bookNumBox.add(bookNum);
			 qtyBox.add(qty);
			 cartdao.delete_cart(cartNum);
			 pdao.insertOrderCart(cartNum,qty,id,bookNum);
			 pdao.insertPayment(cartNum,id,coment,payWay,address,name,mobile,price);
	      }
		
		 return "무통장입금";
	 }
	} catch(Exception e) { return "fail"; }
			
     return "ok";	
	 }
	 @PostMapping("/singlePaymentInsert")
	 @ResponseBody
	 public String singlepaymentInsert(HttpServletRequest req) {
	 try {
	 String id=req.getParameter("id");	 
	 ArrayList<PaymentDTO> alCart = pdao.load_singleCart(id);
	 String coment=req.getParameter("coment");
	 String payWay=req.getParameter("payway");
	 String name=req.getParameter("name");
	 String mobile=req.getParameter("mobile");
	 String address=req.getParameter("address");
	 String price=req.getParameter("price");
	 ArrayList<String> nameBox= new ArrayList<String>();
	 ArrayList<Integer> qtyBox= new ArrayList<Integer>();
	 ArrayList<Integer> cartNumBox= new ArrayList<Integer>();
	 ArrayList<Integer> bookNumBox= new ArrayList<Integer>();
	 
	 
	  if(payWay.equals("카카오페이")) {
		  for(int i=0; i<alCart.size(); i++) {
				 
				 String bookName=alCart.get(i).getBook_name();
				 nameBox.add(bookName);
				 int cartNum=alCart.get(i).getCart_num();
				 int qty=alCart.get(i).getQty();
				 int bookNum=alCart.get(i).getBook_num();
				 cartNumBox.add(cartNum);
				 bookNumBox.add(bookNum);
				 qtyBox.add(qty);
					/*
					 * cartdao.delete_cart(cartNum); pdao.insertOrderCart(cartNum,qty,id,bookNum);
					 * pdao.insertPayment(cartNum,id,coment,payWay,address,name,mobile,price);
					 */
		      }			
		 return "kakaoPay"+"#"+nameBox+"#"+price+"#"+qtyBox+"#"+cartNumBox+"#"+bookNumBox+"#"+id+"#"+coment+"#"+address+"#"+payWay+"#"+mobile+"#"+name;
	 }else if(payWay.equals("무통장입금")) {
		 for(int i=0; i<alCart.size(); i++) {
			 
			 String bookName=alCart.get(i).getBook_name();
			 nameBox.add(bookName);
			 int cartNum=alCart.get(i).getCart_num();
			 int qty=alCart.get(i).getQty();
			 int bookNum=alCart.get(i).getBook_num();
			 cartNumBox.add(cartNum);
			 bookNumBox.add(bookNum);
			 qtyBox.add(qty);
			 pdao.delete_singleCart(cartNum);
			 pdao.insertOrderCart(cartNum,qty,id,bookNum);
			 pdao.insertPayment(cartNum,id,coment,payWay,address,name,mobile,price);
	      }
		
		 return "무통장입금";
	 }
	} catch(Exception e) { return "fail"; }
			
     return "ok";	
	 }
}

