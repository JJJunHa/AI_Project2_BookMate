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
		int order_num = Integer.parseInt(req.getParameter("orderNum"));
		
		ArrayList<ReviewDTO> load_personInfo = rdao.review_book(id, order_num);
		JSONArray ja = new JSONArray();
		for(int i=0; i<load_personInfo.size(); i++) {
			JSONObject jo = new JSONObject();
			jo.put("book_name", load_personInfo.get(i).getBook_name());
			jo.put("book_price", load_personInfo.get(i).getBook_price());
			jo.put("book_cover", load_personInfo.get(i).getBook_cover());
			jo.put("o_qty", load_personInfo.get(i).getO_qty());
			jo.put("dia_order_num", order_num);
			jo.put("book_num", load_personInfo.get(i).getBook_num());
			
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
	
	// review 삭제하기
	@PostMapping("/delete_review")
	@ResponseBody
	public String delete_review(HttpServletRequest req) {
		int review_num = Integer.parseInt(req.getParameter("review_num"));

		String deleteval=null;
		try {
			rdao.delete_review(review_num);
			 deleteval = "ok";
			 
		} catch(Exception e) {
			deleteval="fail";
			e.printStackTrace();
		}
		return deleteval;
	}	
    
	// review 수정하기
	@PostMapping("/update_review")
	@ResponseBody
	public String update_review(HttpServletRequest req) {
	 	String id = req.getParameter("id");
		int review_num = Integer.parseInt(req.getParameter("review_num"));
		String rev_title1 = req.getParameter("rev_title1");
		String rev_content1 = req.getParameter("rev_content1");
		String rev_rating1 = req.getParameter("rev_rating1");
		
		String updateval=null;
		try {
			rdao.update_review(id, review_num, rev_title1, rev_content1, rev_rating1);
			 updateval = "ok";
			 
		} catch(Exception e) {
			updateval="fail";
			e.printStackTrace();
		}
		return updateval;
	}
	
	// 등록 버튼 클릭 시 book에 평점 넣기
		@PostMapping("/book_rating")
		@ResponseBody
		public String book_rating(HttpServletRequest req) {
		 			
			int rev_rating = Integer.parseInt(req.getParameter("rev_rating"));
			int book_num_review = Integer.parseInt(req.getParameter("book_num_review"));			
			
			String sumRating1 = rdao.sumRating(book_num_review);
			
			double ratingSum = (double) ((sumRating1 != null) ? Integer.parseInt(sumRating1) : 0);
			
//			System.out.println("ratingSum : " + ratingSum);
			
			int countReview = rdao.countReview(book_num_review);
//			System.out.println("countReview : " + (countReview+1));
			
			double currentRating_plus = ((ratingSum+rev_rating)/(countReview+1));
			currentRating_plus = Math.round(currentRating_plus * 10) / 10.0; // 소수점 첫째 자리에서 반올림
//			System.out.println("currentRating_plus : " + currentRating_plus);
			
//			System.out.println("------------------------------------");
			
			String ratingval=null;
			try {
				rdao.currentRating_plus(currentRating_plus, book_num_review);
				ratingval = "ok";
				 
			} catch(Exception e) {
				ratingval="fail";
				e.printStackTrace();
			}
			return ratingval;
		}	
		// 수정 버튼 클릭 시 book에 평점 넣기
		@PostMapping("/book_rating1")
		@ResponseBody
		public String book_rating1(HttpServletRequest req) {
		 			
			int rev_rating = Integer.parseInt(req.getParameter("rev_rating"));
			int book_num_review = Integer.parseInt(req.getParameter("book_num_review"));			
			
			int sumRating1 = Integer.parseInt(rdao.sumRating(book_num_review));
			
//			System.out.println("sumRating1 : " + sumRating1);
			
			int countReview = rdao.countReview(book_num_review);
//			System.out.println("countReview : " + (countReview));
			
			double currentRating_plus = 0.0;
			if (countReview != 0) {
			    currentRating_plus = (double) sumRating1 / countReview;
			    currentRating_plus = Math.round(currentRating_plus * 10) / 10.0;
			}
//			System.out.println("currentRating_plus : " + currentRating_plus);
			
//			System.out.println("------------------------------------");
			
			String ratingval=null;
			try {
				rdao.currentRating_plus(currentRating_plus, book_num_review);
				ratingval = "ok";
				 
			} catch(Exception e) {
				ratingval="fail";
				e.printStackTrace();
			}
			return ratingval;
		}
		// 삭제 버튼 클릭 시 book에 평점 넣기
		@PostMapping("/book_rating2")
		@ResponseBody
		public String book_rating2(HttpServletRequest req) {
		 			
			int book_num_review = Integer.parseInt(req.getParameter("book_num_review"));			
			
			int sumRating1 = Integer.parseInt(rdao.sumRating(book_num_review));
			
//			System.out.println("sumRating1 : " + sumRating1);
			
			int countReview = rdao.countReview(book_num_review);
//			System.out.println("countReview : " + (countReview));
			
			double currentRating_plus = 0.0;
			if (countReview != 0) {
			    currentRating_plus = (double) sumRating1 / countReview;
			    currentRating_plus = Math.round(currentRating_plus * 10) / 10.0;
			}
//			System.out.println("currentRating_plus : " + currentRating_plus);
			
//			System.out.println("------------------------------------");
			
			String ratingval=null;
			try {
				rdao.currentRating_plus(currentRating_plus, book_num_review);
				ratingval = "ok";
				 
			} catch(Exception e) {
				ratingval="fail";
				e.printStackTrace();
			}
			return ratingval;
		}
	
}
