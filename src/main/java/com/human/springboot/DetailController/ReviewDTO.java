package com.human.springboot.DetailController;

import lombok.Data;

@Data
public class ReviewDTO {
	int review_num;
	String rev_title;
	String rev_content;
	String rev_create_date;
	String rev_update_date;
	String id;
	int order_num;
	int book_num;
}
