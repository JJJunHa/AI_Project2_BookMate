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
	
	void delete_review(int review_num);
	void update_review(String id, int review_num, String title, String content, String rating);
	
	// 등록 버튼 클릭 시 book에 평점 넣기
	void book_rating(String rev_rating, int book_num);
	
	// 현재의 평점합 리뷰에서 가져오기
	String sumRating(int book_num);
	// 현재의 리뷰 갯수 가져오기
	int countReview(int book_num);
	// 평점 새로 넣기
	void currentRating_plus(double currentRating_plus, int book_num);
}
