package com.human.springboot.AdminController;

import lombok.Data;

@Data
public class AdminDTO {
	int book_num ;
	String book_name;
	int book_price;
	String book_genre ;
	String book_cover;
	String book_content;
	String PUBLICATION;
	String AUTHOR;
	String EMOTION;
	String BOOK_SUMMARY;
	String BOOK_DETAIL;
	int RATING;
}
