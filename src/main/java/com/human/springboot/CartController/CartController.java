package com.human.springboot.CartController;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.human.springboot.DetailController.CategoryDAO;
import com.human.springboot.DetailController.CategoryDTO;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class CartController {
   @Autowired
   private CartDAO cartdao;
   
   @GetMapping("/cart")
   public String showCart() {
       return "cart";
   }
//   /* cart 제품 load 하기 */
//   @GetMapping("/cart")
//   public String loadcart(HttpServletRequest req, Model model) {
//      String id = req.getParameter("cart_id");
//      System.out.println(id);
//      ArrayList<CartDTO> load_cart = cartdao.load_cart(id);
//      model.addAttribute("load_cart", load_cart);
//       return "cart";
//   }
   
   // 장바구니 제품 load하기
   @PostMapping("/load_cart")
   @ResponseBody
   public String load_cart(HttpServletRequest req) {
      String id = req.getParameter("id");
      
      ArrayList<CartDTO> alCart = cartdao.load_cart(id);
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
   
   // 카트 제품 count하기
   @PostMapping("/count_cart")
   @ResponseBody
   public int count_cart(HttpServletRequest req) {
      String id = req.getParameter("id");
      
      int count = cartdao.count_cart(id);
      return count;
   }
   
   // cart 제품 delete 하기
   @PostMapping("/delete_cart")
   @ResponseBody
   public String delete_cart(HttpServletRequest req) {
      int cart_num = Integer.parseInt(req.getParameter("cart_num"));
      String deleteval=null;
      try {
         cartdao.delete_cart(cart_num);
         deleteval="ok";
      } catch(Exception e) {
         deleteval="fail";
         e.printStackTrace();
      }
      return deleteval;
   }   
   
   // cart 제품 All delete 하기
   @PostMapping("/Alldelete_cart")
   @ResponseBody
   public String Alldelete_cart(HttpServletRequest req) {
      String id = req.getParameter("id");
      String Alldeleteval=null;
      try {
         cartdao.Alldelete_cart(id);
         Alldeleteval="ok";
      } catch(Exception e) {
         Alldeleteval="fail";
         e.printStackTrace();
      }
      return Alldeleteval;
   }
      
   // cart 수량 변경 하기
   @PostMapping("/modify_cart")
   @ResponseBody
   public String modify_cart(HttpServletRequest req) {
      int qty = Integer.parseInt(req.getParameter("qty"));
      String id = req.getParameter("id");
      int cart_num = Integer.parseInt(req.getParameter("cart_num"));
      
      String modifyval=null;
      try {
         cartdao.modify_cart(qty, id, cart_num);
         modifyval="ok";
      } catch(Exception e) {
         modifyval="fail";
      }
      return modifyval;
   }   
   
   // 상품 클릭 시 상세페이지로 이동
   @PostMapping("/find_book")
   @ResponseBody
   public String find_book(HttpServletRequest req) {
      String book_name = req.getParameter("book_name");
      
      String findval=null;
      try {
         String book_num = cartdao.find_book(book_name);
         return book_num;
      } catch(Exception e) {
         findval="fail";
         return findval;
      }
   }   
}
