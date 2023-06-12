package com.human.springboot.ReviewController;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewDAO {
	// 책 정보 가져오기
	ArrayList<ReviewDTO> review_book(String id, int order_num);
	
	// review 테이블에 book_num 넣기위해 조회
	String find_book_num(String id, int order_num);
	
	// review insert
	void insert_review(int order_num, String id, String rev_title, int rev_rating, String rev_content, int book_num);
	
	// 리뷰 확인하기
	int check_review(int order_num, String id);
}
