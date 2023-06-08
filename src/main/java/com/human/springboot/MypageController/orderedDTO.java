package com.human.springboot.MypageController;

import lombok.Data;

@Data
public class orderedDTO {
	
	String id;
	
	// from payment
	String order_date;
	String order_num; 
	
	// from cart
	String qty;
	
	// from book
	String book_name;
	String book_price;
	String book_cover;
	
	String IMG_NAME1;
	
	String OPTION;
	int PR;
	String CHECK;
	String BOOK;
	
	String BOOK_NUM;
}
