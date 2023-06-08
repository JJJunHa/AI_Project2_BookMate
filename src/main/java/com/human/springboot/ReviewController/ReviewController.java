package com.human.springboot.ReviewController;

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
	
//	@PostMapping("/insert_review")
//	@ResponseBody
//	public String insert_review(HttpServletRequest req) {
//		String id = req.getParameter("id");
//		String rev_title = req.getParameter("rev_title");
//		int rev_rating = Integer.parseInt(req.getParameter("rev_rating"));
//		String rev_content = req.getParameter("rev_content");
//		
//		String insertval=null;
//		try {
//			rdao.insert_review(id, rev_title, rev_rating, rev_content);
//			insertval = "ok";
//
//		} catch(Exception e) {
//			insertval="fail";
//		}
//		return insertval;
//	}	
}
