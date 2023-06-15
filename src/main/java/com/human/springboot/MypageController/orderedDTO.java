package com.human.springboot.MypageController;

import lombok.Data;

@Data
public class orderedDTO {
	
	String id;
	
	// from payment
	String order_date;
	int order_num; 
	int o_qty;
	String status;
	int cart_num;
	String pay_way;
	// from cart
	String qty;
	
	// from book
	String book_num;
	String book_name;
	String book_price;
	String book_cover;
	String author;
	
	String IMG_NAME1;
	
//	String OPTION; // 권 수
	int BPR;
	String CHECK;
	String BOOK;
	
//	String BOOK_NUM;
}
