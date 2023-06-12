package com.human.springboot.MypageController;

import lombok.Data;

@Data
public class C_CartDTO {
	int cart_num;
	int qty;
	String id;
	int book_num;
	
	String book_cover;
	String book_name;
	int book_price;
}
