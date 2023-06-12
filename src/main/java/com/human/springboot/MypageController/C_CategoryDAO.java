package com.human.springboot.MypageController;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.human.springboot.DetailController.CategoryDTO;
import com.human.springboot.DetailController.ReviewDTO;

@Mapper
public interface C_CategoryDAO {
	
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
	
	/* cart에 insert 하기 */
	void insert_cart(String m_id, int qty, int book_num);
	
	int confirm_cart(String m_id, int book_num);
	int confirm_qty(String m_id, int book_num);
	void update_cart(int total_qty, String m_id, int book_num);
	
}
