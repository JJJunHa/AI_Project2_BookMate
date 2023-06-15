package com.human.springboot.AdminController;

import lombok.Data;

@Data
public class AdminDTO {
	//book
	int book_num ;
	String book_name;
	int book_price;
	String book_genre ;
	String book_cover;
	String book_content;
	String publication;
	String author;
	String emotion;
	String book_summary;
	String book_detail;
	int rating;
	//member
	String id;
	String pwd;
	String name;
	String email;
	String zip_code;
	String address;
	String mobile;
	String birth;
	String regdate;
	//review
	int review_num;
	String rev_title;
	String rev_content;
	String rev_create_date;
	String rev_update_date;
	int order_num;
	//payment
	String order_date;
	int cart_num;
	String deli_message;
	String pay_ment;
	//ordered_cart
	int o_cart_num;
	int o_qty;
	String o_id;
	int o_book_num;
}
