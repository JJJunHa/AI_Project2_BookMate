package com.human.springboot.MypageController;

import lombok.Data;

@Data
public class C_CategoryDTO {
	String id;
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
}
