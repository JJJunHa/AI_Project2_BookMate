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
}
