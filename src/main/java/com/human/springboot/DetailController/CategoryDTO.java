package com.human.springboot.DetailController;

import lombok.Data;

@Data
public class CategoryDTO {
	int book_num;
	String book_name;
	int book_price;
	String book_genre;
	String book_cover;
	String book_content;
	String author;
	String publication;
	int rating;
	String book_detail;
	String BOOK_SUMMARY;
	
	
	
	int order_num;
	String id;
}
