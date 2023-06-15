package com.human.springboot.ReviewController;

import lombok.Data;

@Data
public class ReviewDTO {
	int review_num;
	String rev_title;
	String rev_content;
	String rev_create_date;
	String rev_update_date;
	int order_num;
	int book_num;
	String id;
	int rev_rating;
	
	
	// book
	String book_name;
	int book_price;
	String book_cover;
	int rating;
	
	// ordered_cart
	int o_qty;
	
}
