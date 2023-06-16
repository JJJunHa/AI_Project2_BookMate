package com.human.springboot.DetailController;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CategoryDAO {
	/* category 책 가져오기 */
	ArrayList<CategoryDTO> comedy_list();
	ArrayList<CategoryDTO> romance_list();
	ArrayList<CategoryDTO> fantasy_list();
	ArrayList<CategoryDTO> mystery_list();
	ArrayList<CategoryDTO> drama_list();
	
	/* detail 책 정보 가져오기 */
	ArrayList<CategoryDTO> load_detail(int book_num);
	
	/* detail 책 리뷰 가져오기 */
	ArrayList<ReviewDTO> load_review(int book_num);
	/* 리뷰 dialog 만들기 */
	ArrayList<ReviewDTO> dialog_review(int review_num);
	/* 리뷰 dialog 만들기 */
	ArrayList<ReviewDTO> dialog_review1(int order_num, String id);
	
	/* cart에 insert 하기 */
	void insert_cart(String m_id, int qty, int book_num);
	
	int confirm_cart(String m_id, int book_num);
	int confirm_qty(String m_id, int book_num);
	void update_cart(int total_qty, String m_id, int book_num);
	
	/* 검색어 */
	ArrayList<CategoryDTO> search(String a, String b);
}
