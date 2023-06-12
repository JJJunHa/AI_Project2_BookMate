package com.human.springboot.ReviewController;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ReviewController {
	@Autowired
	private ReviewDAO rdao;
	
	@GetMapping("/review-write")
	public String writeReview() {
		 return "review-write";
	}
	
	// 책 정보 가져오기
	@PostMapping("/review_book")
	@ResponseBody
	public String review_book(HttpServletRequest req) {
		String id = req.getParameter("id");
		int order_num = Integer.parseInt(req.getParameter("order_num"));
		
		ArrayList<ReviewDTO> load_personInfo = rdao.review_book(id, order_num);
		JSONArray ja = new JSONArray();
		for(int i=0; i<load_personInfo.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("book_name", load_personInfo.get(i).getBook_name());
			jo.put("book_price", load_personInfo.get(i).getBook_price());
			jo.put("book_cover", load_personInfo.get(i).getBook_cover());
			jo.put("o_qty", load_personInfo.get(i).getO_qty());
			jo.put("dia_order_num", order_num);
			ja.put(jo);
		}
		return ja.toString();
	}

	// review insert;
	@PostMapping("/insert_review")
	@ResponseBody
	public String insert_review(HttpServletRequest req) {
		int order_num = Integer.parseInt(req.getParameter("order_num"));
		String id = req.getParameter("id");
		String rev_title = req.getParameter("rev_title");
		int rev_rating = Integer.parseInt(req.getParameter("rev_rating"));
		String rev_content = req.getParameter("rev_content");
		int book_num = Integer.parseInt(rdao.find_book_num(id, order_num));
		
		
//		System.out.println(order_num);
//		System.out.println(id);
//		System.out.println(book_num);
		
		String insertval=null;
		try {
			rdao.insert_review(order_num, id, rev_title, rev_rating, rev_content, book_num);
			insertval = "ok";

		} catch(Exception e) {
			insertval="fail";
			e.printStackTrace();
		}
		return insertval;
	}	
	
	// 리뷰 확인하기
	@PostMapping("/check_review")
	@ResponseBody
	public String check_review(HttpServletRequest req) {
		
		int orderNum = Integer.parseInt(req.getParameter("orderNum"));
		String id = req.getParameter("id");
		
//		System.out.println(id);
//		System.out.println(orderNum);
//		
		String checkval=null;
		try {
			int check = rdao.check_review(orderNum, id);
			if(check == 1) {
				checkval = "ok";
			} else {
				checkval="fail";
			}
		} catch(Exception e) {
			checkval="fail";
			e.printStackTrace();
		}
		return checkval;
	}	
	
}
