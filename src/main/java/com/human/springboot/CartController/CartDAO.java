package com.human.springboot.CartController;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CartDAO {
	/* category 책 가져오기 */
	ArrayList<CartDTO> load_cart(String id);
	
	/* cart count 하기 */
	int count_cart(String id);
	
	/* cart delete 하기 */
	void delete_cart(int cart_num);
	
	/* cart All delete 하기 */
	void Alldelete_cart(String id);
	
	/* cart 수량 변경 */
	void modify_cart(int qty, String id, int cart_num);
	
	/* cart에서 클릭 시 상세페이지 연결 */
	String find_book(String book_name);
}